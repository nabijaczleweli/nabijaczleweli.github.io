window.addEventListener("load", function() {
	const URL_FN = window.custom_book_url || function() {
		return document.URL.substr(0, document.URL.lastIndexOf('/'));
	};

	document.getElementById("epub_book_link").href = URL_FN() + ".epub";
	document.getElementById("mobi_book_link").href = URL_FN() + ".mobi";
});
