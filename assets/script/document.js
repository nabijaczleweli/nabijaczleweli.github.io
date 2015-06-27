global_root = location.href.match(/([a-z]{4,5}:\/\/).*[a-z]+\.[a-z]+\.[a-z]+/ig)[0];

function iframe_from(from, name) {
	return '<iframe src="' + global_root + '/assets/' + from + '" ' + (name ? 'name="' + name + '" id="iframe_' + name + '"' : '') + '></iframe>';
}

function anchor_to(to) {
	return '<a target="_top" href="' + global_root + '/' + to + '">';
}
