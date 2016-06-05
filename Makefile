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


CPP := cpp
OUTDIR := out/

SOURCES := $(sort $(wildcard src/*.pp src/**/*.pp src/**/**/*.pp src/**/**/**/*.pp))
ASSETS := $(sort $(wildcard assets/*.* assets/**/*.* assets/**/**/*.* assets/**/**/**/*.*))
LICENSES := $(sort $(wildcard LICENSE-*))

.PHONY : all clean assets licenses preprocess


all : assets licenses preprocess

clean :
	rm -rf $(OUTDIR)

assets : $(patsubst %,$(OUTDIR)%,$(ASSETS))
licenses : $(patsubst %,$(OUTDIR)%,$(LICENSES))
preprocess : $(patsubst src/%.pp,$(OUTDIR)%,$(SOURCES))


$(OUTDIR)% : src/%.pp
	@mkdir -p $(dir $@)
	$(CPP) -CC -P -o$@ $^ -DDATE_TIME="$(shell date "+%d.%m.%Y %H:%M:%S %Z")"

$(OUTDIR)assets/% : assets/%
	@mkdir -p $(dir $@)
	cp $^ $@

$(OUTDIR)LICENSE-% : LICENSE-%
	@mkdir -p $(dir $@)
	cp $^ $@
