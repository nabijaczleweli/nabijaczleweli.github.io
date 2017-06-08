window.addEventListener("load", function() {
	let scans_button = document.getElementById("show-scans");
	let scans = document.getElementById("scans");

	scans_button.addEventListener("click", function() {
		scans.classList.toggle("hidden");
	});
});
