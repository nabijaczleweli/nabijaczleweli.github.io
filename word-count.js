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


var webpage = require("webpage");
var system  = require("system");
require("./pluralize.js");
require("./syllable.js");


// Based on kourge.net/projects/regexp-unicode-block
// Check for Latin, Latin-1 Supplement, Latin Extended-{A,B}, IPA Extensions and Cyrillic word characters
const WORD_REGEX = /((?:\w|[\u0080-\u02AF\u0400-\u04FF])+)/g;
const CHAR_REGEX = /(?:\w|[\u0080-\u02AF\u0400-\u04FF])/g;

var WORD_TRIGGER      = "WORD_COUNT";
var SYLLABLE_TRIGGER  = "SYLLABLE_COUNT";
var CHARACTER_TRIGGER = "CHARACTER_COUNT";


system.stdin.setEncoding("utf8");
system.stdout.setEncoding("utf8");
var content = system.stdin.read();

var count_words      = content.indexOf(WORD_TRIGGER)      !== -1;
var count_syllables  = content.indexOf(SYLLABLE_TRIGGER)  !== -1;
var count_characters = content.indexOf(CHARACTER_TRIGGER) !== -1;

if(!(count_words || count_syllables || count_characters)) {
	system.stdout.write(content);
	phantom.exit();
}


var url = "data:text/html;encoding=utf-8," + content;
var page = webpage.create();

page.open(url, function(result) {
	if(result != "success") {
		console.error("Failed to open the passed-in file.");
		phantom.exit(1);
	}

	var elements_c = {};

	var writings_texts = page.evaluate(function() {
		var writings = document.getElementsByClassName("writing");

		var writings_texts = [];
		for(var i = 0; i < writings.length; ++i)
			writings_texts.push(writings[i].innerText);
		return writings_texts;
	});

	for(var i = 0; i < writings_texts.length; ++i)
		count_elements(writings_texts[i], count_words, count_syllables, count_characters, elements_c);

	content = content.replace(WORD_TRIGGER,      separated_number(elements_c.word_c));
	content = content.replace(SYLLABLE_TRIGGER,  separated_number(elements_c.syllable_c));
	content = content.replace(CHARACTER_TRIGGER, separated_number(elements_c.character_c));

	system.stdout.write(content);
	phantom.exit();
});

function count_elements(writing, count_words, count_syllables, count_characters, elements_c) {
	elements_c.word_c      = elements_c.word_c      || 0;
	elements_c.syllable_c  = elements_c.syllable_c  || 0;
	elements_c.character_c = elements_c.character_c || 0;

	var words = (count_words || count_syllables) ? writing.match(WORD_REGEX) : null;

	if(count_words)
		elements_c.word_c += words.length;

	if(count_syllables)
		words.forEach(function(w) {
			elements_c.syllable_c += syllable(w);
		});

	if(count_characters)
		elements_c.character_c += writing.match(CHAR_REGEX).length;
}

// Stolen from http://stackoverflow.com/a/2901298/2851815
function separated_number(num) {
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "'");
}
