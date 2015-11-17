function documentHeight() {
	return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight,
	                document.documentElement.offsetHeight);
}


window.addEventListener('load', function(event) {
	const anchor = document.createElement('A');
	const image = document.createElement('IMG');
	anchor.setAttribute('class', 'img_up');
	anchor.setAttribute('nodisplay', '');
	anchor.setAttribute('style', 'color: white;');
	image.setAttribute('nodisplay', '');
	image.setAttribute('alt', 'Go up a level');
	image.setAttribute('style', 'color: #5050A0;');
	image.setAttribute('width', documentHeight() * .07);
	image.setAttribute('height', documentHeight() * .07 * .6);
	image.setAttribute('src', '../assets/image/up_level.svg');

	const elements = document.head.getElementsByTagName('link');
	for(var i = 0; i < elements.length; ++i)
		if(elements[i].rel == 'up') {
			image.removeAttribute('nodisplay');
			anchor.removeAttribute('nodisplay');
			anchor.href = elements[i].href
			break;
		}

	anchor.appendChild(image);
	document.body.insertBefore(anchor, document.getElementById('iframe_main'));
});
