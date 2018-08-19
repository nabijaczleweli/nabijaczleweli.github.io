window.addEventListener("load", function() {
	const MASTER_LOGO = document.getElementById("logo-img");
	const EXTRA_IMAGES = document.getElementsByClassName("alt-logo-img");
	EXTRA_IMAGES[0].classList.toggle("active");
	EXTRA_IMAGES[EXTRA_IMAGES.length - 1].classList.toggle("active");

	MASTER_LOGO.addEventListener("touchstart", function() {
		EXTRA_IMAGES[0].classList.remove("hidden");
		MASTER_LOGO.classList.remove("forced");
	});

	var just_switched = false;
	var first_round = true;
	Array.from(EXTRA_IMAGES).forEach(function(img, idx) {
		var next_idx = (idx + 1) % EXTRA_IMAGES.length;

		var toggle = function() {
			img.classList.toggle("active");
			EXTRA_IMAGES[next_idx].classList.toggle("active");
			just_switched = true;
		};

		// Only triggered on active alt images
		img.addEventListener("mouseover", function() {
			if(!just_switched)
				toggle();
			else
				just_switched = false;
		});
		img.addEventListener("touchstart", function() {
			toggle();
			if(!first_round) {
				if(next_idx === 0) {
					EXTRA_IMAGES[next_idx].classList.add("hidden");
					MASTER_LOGO.classList.add("forced");
				}
			}
			first_round = false;
		});
	});
});
