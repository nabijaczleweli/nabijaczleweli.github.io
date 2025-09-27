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

const PATCHES         = {  // matched before remaps!
	// https://github.com/PrismJS/prism/pull/3881
	"hlsl": function(s) {
		return s.replace(/<span class="token directive-hash">#<\/span><span class="token directive keyword">/g, '<span class="token directive keyword">#');
	},
	"oldc": function(s) {
		return s.replace(/<span class="token keyword">const<\/span>/g, '<span class="token function">const</span>');
	},
};
const LANGUAGE_REMAPS = {js: "javascript", sh: "bash", Makefile: "makefile", rs: "rust", mk: "makefile", oldc: "c"};
const LANGUAGES       = {
	plaintext: {},
	// Based on https://github.com/JohnNilsson/awk-sublime/blob/1ce5f90d444d80b12af41bc051507e914730d4ef/AWK.sublime-syntax
	// Better than Prism.js's implementation of AWK!
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
	},
	dts: {
		keyword: /\/dts-v1\//,

		// Stolen from prism-clike.js
		string: {
			pattern: /(["'])(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,
			greedy: true
		},

		number: {
			pattern: /(0x[a-f0-9]+)/,
			greedy: true
		}
	}
};
const LANGUAGES_ADD   = {
	rust: {
		string: /\b_\b/
	},
	hlsl: {
		// "class-name": /\b(?:RW)?StructuredBuffer\b/,
		keyword: [
			/\bSV_(?:(?:DispatchThread|Group|GroupThread|GSInstance|OutputControlPoint)ID)|(?:GroupIndex|DomainLocation|TessFactor|InsideTessFactor)\b/,
			/\b(dot|length|trunc|min|max|any|all|printf|asuint|asfloat)\b/
		]
	}
};


// https://stackoverflow.com/a/71695114
let [metadata, inputs, outputs] =
	process.argv.reduce((r, s, i, a) => {
		if(!i || a[i - 1] === ':')
			r.push([]);
		r[r.length - 1].push(s);
		return r;
	}, []);
[metadata, inputs, outputs] = [metadata, inputs, outputs].map(a => a.filter(e => e !== ':'));

let stampfile = metadata[metadata.length - 1];

let files = [];
let languages = new Set();
for(let i = 0; i != inputs.length; ++i) {
	let [in_file, out_file] = [inputs[i], outputs[i]];
	let [_, language, nohighlight] = in_file.match(/.*\.([^.]+)\.([^.]+)$/);
	nohighlight = nohighlight == "hlhpp";

	let patch = PATCHES[language] || function(s) { return s; };
	language = LANGUAGE_REMAPS[language] || language;
	if(!nohighlight)
		languages.add(language);

	files.push(fs.promises.readFile(in_file, {encoding: "utf8"}).then(p => [p, out_file, language, nohighlight, patch]));
}

for(let language of languages) {
	if(LANGUAGES[language])
		Prism.languages[language] = LANGUAGES[language];
	else
		Prism.loadLanguages([language]);

	if(!Prism.languages[language]) {
		console.error("Unknown language", language)
		process.exit(4);
	}
	for(let k in LANGUAGES_ADD[language]) {
		if(!Array.isArray(Prism.languages[language][k]))
			Prism.languages[language][k] = [Prism.languages[language][k]];

		if(!Array.isArray(LANGUAGES_ADD[language][k]))
			Prism.languages[language][k].push(LANGUAGES_ADD[language][k]);
		else
			Prism.languages[language][k] = Prism.languages[language][k].concat(LANGUAGES_ADD[language][k]);
	}
}

async function main() { // need to be able to await
	let madedirs = {};
	let la = await Promise.all(files.map(f => f.then(async bundle => {
		let [content, out_file, language, nohighlight, patch] = bundle;
		// console.log(out_file, ":", language);

		const highlit = nohighlight ? content : Prism.highlight(content, Prism.languages[language], language);
		{
			let dir = out_file.substring(0, out_file.lastIndexOf("/"));
			if(!madedirs[dir]) {
				await fs.promises.mkdir(dir, {recursive: true});
				madedirs[dir] = true;
			}
		}
		const out = fs.createWriteStream(out_file);
		out.write(`<pre class="language-${language}"><code class="language-${language}">`);
		out.write(patch(highlit)
			               .replace(/'/g,           "'<!--'-->")
			               .replace(/^.*#.*SMALL_START.*#.*\n/gm, "<small style='display: block; line-height: initial;'>").replace(/^.*#.*SMALL_END.*#.*\n/gm, "</small>")
			               .replace(/\n/g,          "FORCED_NEWLINE")
			               .replace(/((  +)|\t)+/g, "<!--\"-->$&<!--\"-->")
			               .replace(/\/\*/g,        "/<!---->*")
			               .replace(/\/\//g,        "/<!---->/"));
		out.write("</code></pre>");
	})));

	fs.writeFileSync(stampfile, `${la.length}`);
}
main();
