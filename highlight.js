// The MIT License (MIT)

// Copyright (c) 2019 nabijaczleweli

// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


const fs = require("fs");
const Prism = require("./ext/prism/prism.js");
Prism.loadLanguages = require('./ext/prism/components/');


const LANGUAGE_REMAPS = {js: "javascript"};
const LANGUAGES       = {
	plaintext: {},
	// Based on https://github.com/JohnNilsson/awk-sublime/blob/1ce5f90d444d80b12af41bc051507e914730d4ef/AWK.sublime-syntax
	awk: {
		comment: {
			pattern: /#.*/,
			lookbehind: true
		},

		keyword: /\b(?:break|continue|do|while|exit|for|if|else|return)\b/,
		builtin: /\b(?:next|print|printf|close|getline|delete|system|fflush|nextfile|gensub|strftime)\b/,

		// Stolen from prism-clike.js
		string: {
			pattern: /(["'])(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,
			greedy: true
		},

		// Stolen from prism-javascript.js
		regex: {
			pattern: /\/(?:\[(?:[^\]\\\r\n]|\\.)*]|\\.|[^/\\\[\r\n])+\/[gimyus]{0,6}(?=(?:\s|\/\*[\s\S]*?\*\/)*)/,
			lookbehind: true,
			greedy: true
		}
	}
};


const in_file  = process.argv[2];
const out_file = process.argv[3];
let   language = process.argv[4];

if(!in_file) {
	console.error("Input file unspecified.")
	process.exit(1);
}

if(!out_file) {
	console.error("Output file unspecified.")
	process.exit(2);
}

if(!language) {
	console.error("Language unspecified.")
	process.exit(3);
}


language = LANGUAGE_REMAPS[language] || language;
if(LANGUAGES[language])
	Prism.languages[language] = LANGUAGES[language];
else
	Prism.loadLanguages([language]);

if(!Prism.languages[language]) {
	console.error("Unknown language", language)
	process.exit(4);
}


console.log("Highlighting", in_file, "as", language, "into", out_file);


const content = fs.readFileSync(in_file, {encoding: "utf8"});
const highlit = Prism.highlight(content, Prism.languages[language], language);

const out = fs.createWriteStream(out_file);
out.write(`<pre class="language-${language}"><code class="language-${language}">`);
out.write(highlit.replace(/\n/g, "FORCED_NEWLINE").replace(/\t/g, "TAB_INDENT").replace(/  /g, "  "));
out.write("</pre></code>");
