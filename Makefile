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
	ADDITIONAL_TRAVIS_ARGS := -DJOB_URL
else
	ADDITIONAL_TRAVIS_ARGS :=
endif

# Args: $<, $@, additional defines
preprocess_file = $(CPP) $(1) -pipe -nostdinc -Wno-trigraphs -Wno-unicode-homoglyph -I$(abspath $(BLDDIR)/highlit) -CC -P -DDATE_TIME="$(shell date "+%d.%m.%Y %H:%M:%S %Z")" -DFILE_NAME="$(1)" -DFILE_NAME_STUB="$(patsubst src/%/,%,$(dir $(1)))" $(ADDITIONAL_TRAVIS_ARGS) $(3) | sed -re 's/\(U\+200B\)/​/g' -e "s;COLON_SLASH_SLASH;://;g" -e "s/<!--([[:space:]'\"]*<!--[[:space:]'\"]*)*-->//g" -e "s/FORCED_NEWLINE/\\n/g" -e "s;SLASH_ASTERIX;/*;g" -e "s;/\\*([[:space:]]*(/\\*)*[[:space:]]*)*\\*/;;g" -e "s/HASH/\#/g" -e "s/\(FORCED_SPACER\)//g" -e "s/[[:space:]]+$$//g" -e 's;"JOB_URL";"$(JOB_URL)";' -e 's/\$$101010\.pl/101010.pl/g' > $(2)

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
HAND_HIGHLIT_SOURCES := $(sort $(wildcard src/*.hlhpp src/**/*.hlhpp src/**/**/*.hlhpp src/**/**/**/*.hlhpp src/**/**/**/**/*.hlhpp src/**/**/**/**/*.hlhpp))
ASSETS := $(sort $(wildcard LICENSE-*)) $(sort $(wildcard assets/*.* assets/**/*.* assets/**/**/*.* assets/**/**/**/*.* assets/**/**/**/**/*.* assets/**/**/**/**/**/*.*))

.PHONY : all clean assets octicons highlight preprocess books rss


all : assets octicons highlight preprocess books rss

clean :
	rm -rf $(OUTDIR) $(BLDDIR)

assets : $(patsubst %,$(OUTDIR)%,$(ASSETS))
octicons : ext/octicons/package.json $(OUTDIR)assets/LICENSE-octicons $(OUTDIR)assets/octicons/sprite.octicons.svg $(OUTDIR)assets/octicons/octicons.min.css
highlight : $(BLDDIR)highlit/.stamp ext/prism/prism.js $(OUTDIR)assets/prism-twilight.min.css $(OUTDIR)assets/LICENSE-prism
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
	ln -f $^ $@ || cp $^ $@

$(OUTDIR)assets/LICENSE-prism : ext/prism/LICENSE
	@mkdir -p $(dir $@)
	ln -f $^ $@ || cp $^ $@

$(OUTDIR)assets/prism-twilight.min.css : ext/prism/themes/prism-twilight.css
	@mkdir -p $(dir $@)
	{ $(SED) -r ":a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba" $^ | $(TR) -d "\\n" | $(SED) -r "s/[[:space:]]*([}{;:=+-]|,)[[:space:]]*/\\1/g"; echo '[class="language-hlsl"] .token.macro.property {color: inherit;}'; } > $@

$(BLDDIR)feed/% : gen-feed-item.awk $(OUTDIR)%
	@mkdir -p $(dir $@)
	$(AWK) -f $< $(filter-out $<,$^) > $@

$(OUTDIR)feed.xml : gen-feed.awk $(patsubst src/%.pp,$(BLDDIR)feed/%,$(PREPROCESS_SOURCES))
	@mkdir -p $(dir $@)
	grep -m1 '<updated>' $(filter-out $<,$^) | $(AWK) '{sub(/:$$/, "", $$1); print $$2 "\t" $$1}' | /usr/bin/sort -r | $(AWK) -f $< -v awk="$(AWK)" > $@


$(OUTDIR)assets/octicons/% : $(BLDDIR)octicons/build/octicons.min.css
	@mkdir -p $(dir $@)
	ln -f $(subst $(OUTDIR)assets/octicons,$(BLDDIR)octicons/build,$@) $@ || cp $(subst $(OUTDIR)assets/octicons,$(BLDDIR)octicons/build,$@) $@

$(OUTDIR)% : src/%.pp
	@mkdir -p $(dir $@)
	$(call preprocess_file,$<,$@,)
	if grep -q '<!--BLOGN_T_TOC_PLACEHOLDER-->' $@ && grep -q '^<!--!!HEADING' $@; then $(AWK) -f toc.awk $@ | sed -i '/^<!--!!HEADING/d;/<!--BLOGN_T_TOC_PLACEHOLDER-->/r /dev/stdin' $@; fi

$(OUTDIR)% : src/%.epp
	@mkdir -p $(dir $@)
	$(call preprocess_file,$<,$@,)

$(BLDDIR)highlit/.stamp : highlight.js $(HIGHLIGHT_SOURCES) $(HAND_HIGHLIT_SOURCES)
	@mkdir -p $(dir $@)
	$(NODE) $< $@ : $(filter-out $<,$^) : $(patsubst src/%.hlpp,$(BLDDIR)highlit/%.html,$(HIGHLIGHT_SOURCES)) $(patsubst src/%.hlhpp,$(BLDDIR)highlit/%.html,$(HAND_HIGHLIT_SOURCES))

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
	ln -f $(subst ',\',$^ $@) || cp $(subst ',\',$^ $@)

$(OUTDIR)LICENSE-% : LICENSE-%
	@mkdir -p $(dir $@)
	ln -f $^ $@ || cp $^ $@
