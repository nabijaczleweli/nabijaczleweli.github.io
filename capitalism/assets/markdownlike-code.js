window.addEventListener("load", function() {
	let body = document.getElementsByTagName("body")[0];

	body.innerHTML = body.innerHTML.replace(/`([^`]*)`/g, "<code>$1</code>");
});
