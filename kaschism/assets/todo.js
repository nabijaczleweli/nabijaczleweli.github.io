window.addEventListener("load", function() {
	Array.from(document.getElementsByClassName("todo")).forEach(function(e) {
		e.addEventListener("click", function() {
			e.innerText += " (to be done shortly, worry not)";
		});
	});
});
