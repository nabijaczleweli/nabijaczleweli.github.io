window.addEventListener("load", function() {
	const EXTRA_IMAGES = document.getElementsByClassName("alt-logo-img");
	EXTRA_IMAGES[0].classList.toggle("active");
	EXTRA_IMAGES[EXTRA_IMAGES.length - 1].classList.toggle("active");

	var just_switched = false;
	Array.from(EXTRA_IMAGES).forEach(function(img, idx) {
		var next_idx = (idx + 1) % EXTRA_IMAGES.length;

		// Only triggered on active alt images
		img.addEventListener("mouseover", function() {
			if(!just_switched) {
				img.classList.toggle("active");
				EXTRA_IMAGES[next_idx].classList.toggle("active");
				just_switched = true;
			} else
				just_switched = false;
		});
	});
});
