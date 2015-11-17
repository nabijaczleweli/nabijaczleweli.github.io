(function() {
	const request = new XMLHttpRequest();
	request.open('GET', '/assets/icons.htm');
	request.onload = function(load) {
		__icon_text = load.target.responseText;

		const elem = document.getElementById('icon-placeholder');
		if(elem)
			elem.outerHTML = __icon_text;
		else
			document.head.innerHTML += __icon_text;
	}
	request.send();
})();
