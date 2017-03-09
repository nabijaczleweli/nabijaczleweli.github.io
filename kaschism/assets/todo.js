window.addEventListener("load", function() {
	Array.from(document.getElementsByClassName("todo")).forEach(function(e) {
		let clicked = false;
		e.addEventListener("click", function() {
			if(!clicked) {
				e.innerText += " (to be done shortly, worry not)";
				clicked = true;
			}
		});
	});
});
