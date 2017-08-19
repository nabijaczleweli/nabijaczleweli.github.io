window.addEventListener("load", function() {
	let pres = document.getElementsByClassName("numberise");

	for(let i = 0; i < pres.length; ++i) {
		let line_i = 1;

		pres[i].innerHTML =
			pres[i].innerHTML.replace(/^(<pre[^>]*>)?(.+)$/mg, function(match, before, rest) {
				if(match.includes("</pre>"))
					return match;
				else
					return (before || "") + "<span class=\"code-line code-line-" + line_i++ + "\">" + rest + "</span>";
			});
	}
});
