window.addEventListener("load", function() {
	const WORD_REGEX = /(\w+)/g;
	const CHAR_REGEX = /\w/g;
	const writings = document.getElementsByClassName("writing");
	const word_count = document.getElementById("word_count");
	const syllable_count = document.getElementById("syllable_count");
	const character_count = document.getElementById("character_count");

	let word_c = 0;
	let syllable_c = 0;
	let character_c = 0;

	Array.from(writings).forEach(function(w) {
		let words = w.innerText.match(WORD_REGEX);

		word_c += words.length;
		words.forEach(function(w) {
			syllable_c += syllable(w);
		});
		character_c += w.innerText.match(CHAR_REGEX).length;
	});

	word_count.innerText = word_c;
	syllable_count.innerText = syllable_c;
	character_count.innerText = character_c;
});
