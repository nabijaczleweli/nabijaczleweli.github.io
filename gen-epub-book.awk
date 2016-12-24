# The MIT License (MIT)

# Copyright (c) 2016 nabijaczleweli

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


function mimetype(fname) {
	ext = gensub(/.+\.(.+)/, "\\1", "g", fname)
	if(ext ~ /ml/) {
		return "application/xhtml+xml"
	} else if(ext == "png") {
		return "image/png"
	} else if(ext ~ /jp(?:e?)g/) {
		return "image/jpeg"
	} else if(ext == "svg") {
		return "image/svg+xml"
	} else {
		return "text/plain"
	}
}

function add_content(filename, idx) {
	content_filename[idx] = gensub(/\.\.-/, "", "g", gensub(/\//, "-", "g", filename))
	content_file[idx] = gensub(/(.+)\/.+/, "\\1/" filename, "g", self)
	content_name[idx] = gensub(/\//, "-", "g", gensub(/([^.]+)\..*/, "\\1", "g", filename))
}


BEGIN {
	"curl -SsL https://www.uuidgenerator.net/api/version4" | getline uuid
	close("curl")

	content_idx = 1
	noncontent_idx = 0
	have_cover = 0
}

/^Self: / {
	self = gensub(/Self: (.+)/, "\\1", "g")
}

/^Out: / {
	out_file = gensub(/Out: (.+)/, "\\1", "g")
	flat_name = gensub(/.*\/([^.]+)\..*/, "\\1", "g", out_file)
	temp = temp "/nabijaczleweli.xyz-book-gen/" flat_name "/"

	system("rm -rf '" temp "../" flat_name "-string-content/' > /dev/null 2>&1")
}

/^Name: / {
	title = gensub(/Name: (.+)/, "\\1", "g")
}

/^Content: / {
	add_content(gensub(/Content: (.+)/, "\\1", "g"), content_idx)
	++content_idx
}

/^String-Content: / {
	system("mkdir -p '" temp "../" flat_name "-string-content/'")

	content_filename[content_idx] = "string-data-" content_idx ".html"
	content_file[content_idx] = temp "../" flat_name "-string-content/data-" content_idx ".html"
	content_name[content_idx] = "string-content-" content_idx

	print(gensub(/String-Content: (.+)/, "\\1", "g")) > content_file[content_idx]
	close(content_file[content_idx])

	++content_idx
}

/^Image-Content: / {
	system("mkdir -p '" temp "../" flat_name "-image-content/'")

	noncontent_filename[noncontent_idx] = gensub(/\.\.-/, "", "g", gensub(/\//, "-", "g", gensub(/Image-Content: (.+)/, "\\1", "g")))
	noncontent_file[noncontent_idx] = gensub(/(.+)\/.+/, "\\1/" gensub(/Image-Content: (.+)/, "\\1", "g"), "g", self)
	noncontent_name[noncontent_idx] = gensub(/\//, "-", "g", gensub(/([^.]+)\..*/, "\\1", "g", gensub(/Image-Content: (.+)/, "\\1", "g")))

	content_filename[content_idx] = "image-data-" content_idx ".html"
	content_file[content_idx] = temp "../" flat_name "-image-content/data-" content_idx ".html"
	content_name[content_idx] = "image-content-" content_idx

	print("<center><img src=\"" noncontent_filename[noncontent_idx] "\"></img></center>") > content_file[content_idx]
	close(content_file[content_idx])

	++content_idx
	++noncontent_idx
}

/^Network-Image-Content: / {
	system("mkdir -p '" temp "../" flat_name "-network-image-content/'")

	noncontent_filename[noncontent_idx] = gensub(/Network-Image-Content: .+\/(.+)/, "\\1", "g")
	noncontent_file[noncontent_idx] = temp "../" flat_name "-network-image-content/" noncontent_filename[noncontent_idx]
	noncontent_name[noncontent_idx] = "network-image-content-" content_idx "-" gensub(/Network-Image-Content: .+\/([^.]+)\..+/, "\\1", "g")

	content_filename[content_idx] = "network-image-data-" content_idx ".html"
	content_file[content_idx] = temp "../" flat_name "-network-image-content/data-" content_idx ".html"
	content_name[content_idx] = "network-image-content-" content_idx

	system("curl -SsL " gensub(/Network-Image-Content: (.+)/, "\\1", "g") " -o '" noncontent_file[noncontent_idx] "'")
	print("<center><img src=\"" noncontent_filename[noncontent_idx] "\"></img></center>") > content_file[content_idx]
	close(content_file[content_idx])

	++content_idx
	++noncontent_idx
}

/^Cover: / {
	add_content(gensub(/Cover: (.+)/, "\\1", "g"), 0)
	have_cover = 1
}

/^Author: / {
	author = gensub(/Author: (.+)/, "\\1", "g")
}

/^Date: / {
	date = gensub(/Date: (.+)/, "\\1", "g")
}

/^Language: / {
	language = gensub(/Language: (.+)/, "\\1", "g")
}

END {
	system("rm -rf '" temp "' > /dev/null 2>&1")
	system("mkdir -p '" temp "' > /dev/null 2>&1")

	printf("application/epub+zip") > temp "mimetype"
	close(temp "mimetype")

	system("mkdir -p '" temp "META-INF' > /dev/null 2>&1")
	print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>") > temp "META-INF/container.xml"
	print("<container version=\"1.0\" xmlns=\"urn:oasis:names:tc:opendocument:xmlns:container\">") > temp "META-INF/container.xml"
	print("   <rootfiles>") > temp "META-INF/container.xml"
	print("      <rootfile full-path=\"content.opf\" media-type=\"application/oebps-package+xml\" />") > temp "META-INF/container.xml"
	print("   </rootfiles>") > temp "META-INF/container.xml"
	print("</container>") > temp "META-INF/container.xml"
	close(temp "META-INF/container.xml")

	print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>") > temp "content.opf"
	print("<package xmlns=\"http://www.idpf.org/2007/opf\" unique-identifier=\"uuid\" version=\"2.0\">") > temp "content.opf"
	print("  <metadata xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:opf=\"http://www.idpf.org/2007/opf\">") > temp "content.opf"
	print("    <dc:title>" title "</dc:title>") > temp "content.opf"
	print("    <dc:creator opf:role=\"aut\">" author "</dc:creator>") > temp "content.opf"
	print("    <dc:identifier id=\"uuid\" opf:scheme=\"uuid\">" uuid "</dc:identifier>") > temp "content.opf"
	print("    <dc:date>" date "</dc:date>") > temp "content.opf"
	print("    <dc:language>" language "</dc:language>") > temp "content.opf"
	if(have_cover == 1)
		print("    <meta name=\"cover\" content=\"" content_name[0] "\" />") > temp "content.opf"
	print("  </metadata>") > temp "content.opf"
	print("  <manifest>") > temp "content.opf"
	for(i = 0; i < content_idx; ++i)
		if((i in content_name) && !(content_name[i] in specified_content_names)) {
			print("    <item href=\"" content_filename[i] "\" id=\"" content_name[i] "\" media-type=\"" mimetype(content_filename[i]) "\" />") > temp "content.opf"
			specified_content_names[content_name[i]] = i
		}
	print("  </manifest>") > temp "content.opf"
	print("  <spine>") > temp "content.opf"
	# Skip Cover
	for(i = 1; i < content_idx; ++i)
		print("    <itemref idref=\"" content_name[i] "\" />") > temp "content.opf"
	print("  </spine>") > temp "content.opf"
	if(have_cover == 1) {
		print("  <guide>") > temp "content.opf"
		print("    <reference xmlns=\"http://www.idpf.org/2007/opf\" href=\"" content_filename[0] "\" title=\"" content_name[0] "\" type=\"cover\" />")> temp "content.opf"
		print("  </guide>") > temp "content.opf"
	}
	print("</package>") > temp "content.opf"
	close(temp "content.opf")

	for(i = 0; i < content_idx; ++i)
		if((i in content_name) && !(content_name[i] in copied_content_names)) {
			system("cp " content_file[i] " " temp content_filename[i])
			copied_content_names[content_name[i]] = i
		}

	for(i = 0; i < noncontent_idx; ++i)
		if((i in noncontent_name) && !(noncontent_name[i] in copied_noncontent_names)) {
			system("cp " noncontent_file[i] " " temp noncontent_filename[i])
			copied_noncontent_names[noncontent_name[i]] = i
		}

	system("cd '" temp "' && rm -f '../" flat_name ".epub' && zip -qr9 '../" flat_name ".epub' .")
	system("cat '" temp "../" flat_name ".epub'")
}
