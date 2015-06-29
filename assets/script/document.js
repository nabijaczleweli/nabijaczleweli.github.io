var global_root;
if(global_root === undefined)
	global_root = location.href.match(/([a-z]{4,5}:\/\/).*[a-z]+\.[a-z]+\.[a-z]+/ig)[0];

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
		request.open('GET', global_root + '/assets/document/footer.htm');
		request.onload = function(load) {
			__footer_text = load.target.responseText;
			__insert_footer(cls);
		}
		request.send();
	}
}
