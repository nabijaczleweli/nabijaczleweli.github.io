var __footer_text;
function insert_footer(cls) {
	function __insert_footer(cls) {
		document.getElementsByClassName(cls)[0].innerHTML = __footer_text;
	}

	if(!cls)
		cls = 'footer';

	if(__footer_text)
		__insert_footer(cls)
	else {
		const request = new XMLHttpRequest();
		request.open('GET', '/assets/document/footer.htm');
		request.onload = function(load) {
			__footer_text = load.target.responseText;
			__insert_footer(cls);
		}
		request.send();
	}
}
