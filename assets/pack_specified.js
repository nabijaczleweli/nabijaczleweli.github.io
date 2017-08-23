function pack_specified_fileset(file) {
	let dir = file.substr(0, file.lastIndexOf("/")) + "/";
	let fname = file.substr(file.lastIndexOf("/") + 1).replace("json", "zip");

	const file_list_request = new XMLHttpRequest();
	file_list_request.open('GET', file);
	file_list_request.onload = function() {
		file_list = JSON.parse(file_list_request.responseText);
		files = {};
		files_size = 0;

		for(let i = 0; i < file_list.length; ++i) {
			let file_request = new XMLHttpRequest();
			file_request.open("GET", dir + file_list[i], true);
			file_request.responseType = "arraybuffer";
			file_request.onload = function() {
				window[file_list[i]] = file_request;
				files[file_list[i]] = file_request.response;

				if(++files_size == file_list.length) {
					console.log("files", files);
					let packed = new JSZip();
					for(f in files) {
						console.log("f", f, files[f]);
						packed.file(f, files[f]);
					}

					packed.generateAsync({ type: "blob" })
					      .then(function(blob) {
					          saveAs(blob, fname);
					      });
				}
			};
			file_request.send(null);
		}
	}
	file_list_request.send(null);
}
