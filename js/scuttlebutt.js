window.addEventListener("load", function() {
  const SCUTTLEBUTT_BUTTON = document.getElementById("scuttlebutt-button");
  const SCUTTLEBUTT_STATUS = document.getElementById("scuttlebutt-status");
  const SCUTTLEBUTT_CONTAINER = document.getElementById("scuttlebutt-container");
  const SCUTTLEBUTT_INPUT = document.getElementById("scuttlebutt-input");

  SCUTTLEBUTT_CONTAINER.classList.add("height-0");

  SCUTTLEBUTT_BUTTON.addEventListener("click", function() {
  	SCUTTLEBUTT_CONTAINER.classList.remove("height-0");
  	SCUTTLEBUTT_CONTAINER.classList.add("height-1");

    SCUTTLEBUTT_INPUT.click();
  });

  new Clipboard("#scuttlebutt-input")
  	.on("success", function() {
  		SCUTTLEBUTT_STATUS.classList.add("width-1");

  		setTimeout(function() {
	  		SCUTTLEBUTT_STATUS.classList.remove("width-1");
  		}, 2000);
		});
});
