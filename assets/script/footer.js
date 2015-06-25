const request = new XMLHttpRequest();
request.open('GET', function() {
	const links = document.head.getElementsByTagName('link');
	for(var i = 0; i < links.length; ++i) {
		if(links[i].href.contains('footer.html'))
			return links[i].href;
	}
}(), false);  // <-- Synchronous request for document.write(). Smack me
request.send(null);
document.write(request.responseText);
