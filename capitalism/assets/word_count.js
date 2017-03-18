window.addEventListener("load", function() {
	// Based on kourge.net/projects/regexp-unicode-block
	// Check for Latin, Latin-1 Supplement, Latin Extended-{A,B} and Cyrillic word characters
	const WORD_REGEX = /((?:\w|[\u0080-\u024F\u0400-\u04FF])+)/gu;
	const CHAR_REGEX = /(?:\w|[\u0080-\u024F\u0400-\u04FF])/gu;

	const writings = document.getElementsByClassName("writing");
	const word_count = document.getElementById("word_count");
	const syllable_count = document.getElementById("syllable_count");
	const character_count = document.getElementById("character_count");
	const wordcount_wrapper = document.getElementById("wordcount_wrapper");

	let word_c = 0;
	let syllable_c = 0;
	let character_c = 0;

	Array.from(writings).forEach(function(w) {
		let words = w.innerText.match(WORD_REGEX);

		word_c += words.length;
		if(syllable_count)
			words.forEach(function(w) {
				syllable_c += syllable(w);
			});
		character_c += w.innerText.match(CHAR_REGEX).length;
	});

	word_count.innerText = word_c;
	if(syllable_count)
		syllable_count.innerText = syllable_c;
	character_count.innerText = character_c;
	wordcount_wrapper.classList.remove("hidden")
});
