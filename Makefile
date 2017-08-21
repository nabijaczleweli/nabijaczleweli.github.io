# The MIT License (MIT)

# Copyright (c) 2016 nabijaczleweli

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


ifeq "$(TRAVIS)" "true"
	ADDITIONAL_TRAVIS_ARGS := -DBUILD_ID=$(TRAVIS_BUILD_ID) -DREPO_SLUG=$(TRAVIS_REPO_SLUG)
else
	ADDITIONAL_TRAVIS_ARGS :=
endif

ifneq "$(TEMP)" ""
	TEMP_DIR := $(TEMP)
else
	ifneq "$(TMP)" ""
		TEMP_DIR := $(TMP)
	else
		TEMP_DIR := /tmp
	endif
endif

ifeq "$(OS)" "Windows_NT"
	ECHO := /bin/echo -e
else
	ECHO := echo
endif

# Args: $<, $@, additional defines
# `cpp` doesn't like Unicode paths so we do some fuckery for it to not choke thereon
preprocess_file = cd $(dir $(1)) && $(CPP) $(notdir $(1)) -CC -P -DDATE_TIME="$(shell date "+%d.%m.%Y %H:%M:%S %Z")" -DFILE_NAME="$(1)" $(ADDITIONAL_TRAVIS_ARGS) $(3) | sed -re "s;COLON_SLASH_SLASH;://;g" -e "s/<!--([[:space:]'\"]*<!--[[:space:]'\"]*)*-->//g" -e "s/FORCED_NEWLINE/\\n/g" -e "s;SLASH_ASTERIX;/*;g" -e "s;/\\*([[:space:]]*(/\\*)*[[:space:]]*)*\\*/;;g" -e "s/​FORCED_SPACER​//g" -e "s/HASH/\#/g" -e "s/[[:space:]]+^/\\n/g" > $(CURDIR)/$(2)

AWK := awk
SED := sed
CPP := cpp
NPM := npm
CALIBRE_CONVERT := ebook-convert
GEN_EPUB_BOOK := ext/gen-epub-book/gen-epub-book.awk
OUTDIR := out/
BLDDIR := build/

PREPROCESS_SOURCES := $(sort $(wildcard src/*.pp src/**/*.pp src/**/**/*.pp src/**/**/**/*.pp))
EBOOK_PREPROCESS_SOURCES := $(sort $(wildcard src/*.eppe src/**/*.eppe src/**/**/*.eppe src/**/**/**/*.eppe))
COMBINED_PREPROCESS_SOURCES := $(sort $(wildcard src/*.epp src/**/*.epp src/**/**/*.epp src/**/**/**/*.epp))
BOOK_SOURCES := $(sort $(wildcard src/*.epupp src/**/*.epupp src/**/**/*.epupp src/**/**/**/*.epupp))
ASSETS := $(sort $(wildcard LICENSE-*)) $(sort $(wildcard assets/*.* assets/**/*.* assets/**/**/*.* assets/**/**/**/*.*))

.PHONY : all clean assets octicons books preprocess rss


all :  assets octicons preprocess books rss

clean :
	rm -rf $(OUTDIR) $(BLDDIR)

assets : $(patsubst %,$(OUTDIR)%,$(ASSETS))
octicons : ext/octicons/package.json $(OUTDIR)assets/LICENSE-octicons $(OUTDIR)assets/octicons/sprite.octicons.svg $(OUTDIR)assets/octicons/octicons.min.css
preprocess : $(patsubst src/%.pp,$(OUTDIR)%,$(PREPROCESS_SOURCES)) $(patsubst src/%.eppe,$(OUTDIR)%,$(EBOOK_PREPROCESS_SOURCES)) $(patsubst src/%.epp,$(OUTDIR)%,$(COMBINED_PREPROCESS_SOURCES))
books : $(GEN_EPUB_BOOK) $(foreach l,$(patsubst src/%.epupp,%,$(BOOK_SOURCES)),$(foreach m,epub mobi azw3 pdf,$(OUTDIR)$(l).$(m)))
rss : $(OUTDIR)feed.xml


$(BLDDIR)octicons/package.json : ext/octicons/package.json
	@mkdir -p $(dir $@)
	cp -r $(dir $^) $(abspath $(dir $@)..)/

$(BLDDIR)octicons/build/octicons.min.css : $(BLDDIR)octicons/package.json
	@mkdir -p $(dir $@)
	cd $(dir $@) && $(NPM) install ..

$(OUTDIR)assets/LICENSE-octicons : ext/octicons/LICENSE
	@mkdir -p $(dir $@)
	cp $^ $@

$(OUTDIR)feed.xml : gen-feed.awk $(PREPROCESS_SOURCES)
	@mkdir -p $(dir $@)
	echo $(filter-out $<,$^) | $(SED) "s/ /\n/g" | $(AWK) -f $< -v awk="$(AWK)" > $@


$(OUTDIR)assets/octicons/% : $(BLDDIR)octicons/build/octicons.min.css
	@mkdir -p $(dir $@)
	cp $(subst $(OUTDIR)assets/octicons,$(BLDDIR)octicons/build,$@) $@

$(OUTDIR)% : src/%.pp
	@mkdir -p $(dir $@)
	$(call preprocess_file,$<,$@,)

$(OUTDIR)% : src/%.epp
	@mkdir -p $(dir $@)
	$(call preprocess_file,$<,$@,)
	$(call preprocess_file,$<,$(dir $@)ebook-$(notdir $@),-DEBOOK)

$(OUTDIR)% : src/%.eppe
	@mkdir -p $(dir $@)
	$(call preprocess_file,$<,$@,-DEBOOK)

$(OUTDIR)%.epub : $(GEN_EPUB_BOOK) src/%.epupp
	@mkdir -p $(dir $@)
	$(ECHO) "Self: $(filter-out $<,$^)\nOut: $@" | cat - $(filter-out $<,$^) | $(AWK) -f $< -v temp="$(TEMP_DIR)" > $@

$(OUTDIR)%.mobi : $(OUTDIR)%.epub
	@mkdir -p $(dir $@)
	$(CALIBRE_CONVERT) "$^" "$@" > /dev/null 2>&1

$(OUTDIR)%.azw3 : $(OUTDIR)%.epub
	@mkdir -p $(dir $@)
	$(CALIBRE_CONVERT) "$^" "$@" > /dev/null 2>&1

$(OUTDIR)%.pdf : $(OUTDIR)%.epub
	@mkdir -p $(dir $@)
	$(CALIBRE_CONVERT) "$^" "$@" > /dev/null 2>&1

$(OUTDIR)assets/% : assets/%
	@mkdir -p $(dir $@)
	cp $^ $@

$(OUTDIR)LICENSE-% : LICENSE-%
	@mkdir -p $(dir $@)
	cp $^ $@
