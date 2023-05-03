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
else ifneq "$(JOB_URL)" ""
	ADDITIONAL_TRAVIS_ARGS := -DJOB_URL=$(JOB_URL)
else
	ADDITIONAL_TRAVIS_ARGS :=
endif

# Args: $<, $@, additional defines
# `cpp` doesn't like Unicode paths so we do some fuckery for it to not choke thereon
preprocess_file = cd $(dir $(1)) && $(CPP) $(notdir $(1)) -pipe -nostdinc -Wno-trigraphs -I$(abspath $(BLDDIR)/highlit) -CC -P -DDATE_TIME="$(shell date "+%d.%m.%Y %H:%M:%S %Z")" -DFILE_NAME="$(1)" -DFILE_NAME_STUB="$(patsubst src/%/,%,$(dir $(1)))" $(ADDITIONAL_TRAVIS_ARGS) $(3) | sed -re "s;COLON_SLASH_SLASH;://;g" -e "s/<!--([[:space:]'\"]*<!--[[:space:]'\"]*)*-->//g" -e "s/FORCED_NEWLINE/\\n/g" -e "s;SLASH_ASTERIX;/*;g" -e "s;/\\*([[:space:]]*(/\\*)*[[:space:]]*)*\\*/;;g" -e "s/​FORCED_SPACER​//g" -e "s/HASH/\#/g" -e "s/[[:space:]]+$$//g" -e "s/TAB_INDENT/  /g" > $(CURDIR)/$(2)

TR := tr
AWK := awk
SED := sed
CPP := $(CC) -E -x c
NPM := npm
NODE := node
GEN_EPUB_BOOK := gen-epub-book
CALIBRE_CONVERT := ebook-convert
OUTDIR := out/
BLDDIR := build/

PREPROCESS_SOURCES := $(sort $(wildcard src/*.pp src/**/*.pp src/**/**/*.pp src/**/**/**/*.pp src/**/**/**/**/*.pp src/**/**/**/**/**/*.pp))
EBOOK_PREPROCESS_SOURCES := $(sort $(wildcard src/*.eppe src/**/*.eppe src/**/**/*.eppe src/**/**/**/*.eppe src/**/**/**/**/*.eppe src/**/**/**/**/**/*.eppe))
COMBINED_PREPROCESS_SOURCES := $(sort $(wildcard src/*.epp src/**/*.epp src/**/**/*.epp src/**/**/**/*.epp src/**/**/**/**/*.epp src/**/**/**/**/**/*.epp))
BOOK_SOURCES := $(sort $(wildcard src/*.epupp src/**/*.epupp src/**/**/*.epupp src/**/**/**/*.epupp src/**/**/**/**/*.epupp src/**/**/**/**/*.epupp))
HIGHLIGHT_SOURCES := $(sort $(wildcard src/*.hlpp src/**/*.hlpp src/**/**/*.hlpp src/**/**/**/*.hlpp src/**/**/**/**/*.hlpp src/**/**/**/**/*.hlpp))
ASSETS := $(sort $(wildcard LICENSE-*)) $(sort $(wildcard assets/*.* assets/**/*.* assets/**/**/*.* assets/**/**/**/*.* assets/**/**/**/**/*.* assets/**/**/**/**/**/*.*))

.PHONY : all clean assets octicons highlight preprocess books rss


all : assets octicons highlight preprocess books rss

clean :
	rm -rf $(OUTDIR) $(BLDDIR)

assets : $(patsubst %,$(OUTDIR)%,$(ASSETS))
octicons : ext/octicons/package.json $(OUTDIR)assets/LICENSE-octicons $(OUTDIR)assets/octicons/sprite.octicons.svg $(OUTDIR)assets/octicons/octicons.min.css
highlight : highlight.js ext/prism/prism.js $(OUTDIR)assets/prism-twilight.min.css $(OUTDIR)assets/LICENSE-prism $(patsubst src/%.hlpp,$(BLDDIR)highlit/%.html,$(HIGHLIGHT_SOURCES))
preprocess : $(patsubst src/%.pp,$(OUTDIR)%,$(PREPROCESS_SOURCES)) $(patsubst src/%.eppe,$(BLDDIR)out/%,$(EBOOK_PREPROCESS_SOURCES)) $(foreach l,$(patsubst src/%.epp,%,$(COMBINED_PREPROCESS_SOURCES)),$(OUTDIR)$(l) $(BLDDIR)out/$(l))
books : $(foreach l,$(patsubst src/%.epupp,%,$(BOOK_SOURCES)),$(foreach m,epub mobi azw3 pdf,$(OUTDIR)$(l).$(m)))
rss : $(OUTDIR)feed.xml


$(BLDDIR)octicons/package.json : ext/octicons/package.json
	@mkdir -p $(dir $@)
	cp -r $(dir $^) $(abspath $(dir $@)..)/

$(BLDDIR)octicons/build/octicons.min.css : $(BLDDIR)octicons/package.json
	@mkdir -p $(dir $@)
	cd $(dir $@) && $(NPM) install --verbose ..

$(OUTDIR)assets/LICENSE-octicons : ext/octicons/LICENSE
	@mkdir -p $(dir $@)
	cp $^ $@

$(OUTDIR)assets/LICENSE-prism : ext/prism/LICENSE
	@mkdir -p $(dir $@)
	cp $^ $@

$(OUTDIR)assets/prism-twilight.min.css : ext/prism/themes/prism-twilight.css
	@mkdir -p $(dir $@)
	$(SED) -r ":a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba" $^ | $(TR) -d "\\n" | $(SED) -r "s/[[:space:]]*([}{;:=+-]|,)[[:space:]]*/\\1/g" > $@

$(OUTDIR)feed.xml : gen-feed.awk $(patsubst src/%.pp,$(OUTDIR)%,$(PREPROCESS_SOURCES))
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

$(BLDDIR)highlit/%.html : highlight.js src/%.hlpp
	@mkdir -p $(dir $@)
	$(NODE) "$<" "$(filter-out $<,$^)" "$@" $(subst .,,$(suffix $(subst $(suffix $@),,$@)))

$(BLDDIR)out/% : src/%.epp
	@mkdir -p $(dir $@)
	$(call preprocess_file,$<,$@,-DEBOOK)

$(BLDDIR)out/% : src/%.eppe
	@mkdir -p $(dir $@)
	$(call preprocess_file,$<,$@,-DEBOOK)

$(OUTDIR)%.epub : src/%.epupp
	@mkdir -p $(dir $@)
	$(GEN_EPUB_BOOK) "$^" "$@" -I. -Iout="$(BLDDIR)out"

$(OUTDIR)%.mobi : $(OUTDIR)%.epub
	@mkdir -p $(dir $@)
	$(CALIBRE_CONVERT) "$^" "$@"

$(OUTDIR)%.azw3 : $(OUTDIR)%.epub
	@mkdir -p $(dir $@)
	$(CALIBRE_CONVERT) "$^" "$@"

$(OUTDIR)%.pdf : $(OUTDIR)%.epub
	@mkdir -p $(dir $@)
	$(CALIBRE_CONVERT) "$^" "$@"

$(OUTDIR)assets/% : assets/%
	@mkdir -p $(dir $@)
	cp $^ $@

$(OUTDIR)LICENSE-% : LICENSE-%
	@mkdir -p $(dir $@)
	cp $^ $@
