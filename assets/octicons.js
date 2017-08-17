window.addEventListener("load", function() {
	const PLACEHOLDER = document.getElementById("octicons-placeholder");

	const request = new XMLHttpRequest();
	request.open("GET", "/capitalism/assets/octicons/sprite.octicons.svg");
	request.onload = function(load) {
		PLACEHOLDER.outerHTML = load.target.responseText.replace("<svg", "<svg class=\"hidden\"");
	};
	request.send();
});
