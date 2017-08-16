window.addEventListener("load", function() {
	const EXTENSIONS = ["epub", "mobi", "pdf"];
	const URL_FN = window.custom_book_url || function() {
		return document.URL.substr(0, document.URL.lastIndexOf('/'));
	};

	for(let i = 0; i < EXTENSIONS.length; ++i)
		document.getElementById(EXTENSIONS[i] + "_book_link").href = URL_FN() + "." + EXTENSIONS[i];
});
