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


BEGIN {
	"curl -SsL https://www.uuidgenerator.net/api/version4" | getline uuid
	close("curl")
}

/^Self: / {
	self = gensub(/Self: (.+)/, "\\1", "g")
}

/^Out: / {
	out_file = gensub(/Out: (.+)/, "\\1", "g")
	flat_name = gensub(/.*\/([^.]+)\..*/, "\\1", "g", out_file)
	temp = temp "/nabijaczleweli.xyz-book-gen/" flat_name "/"
}

/^Name: / {
	title = gensub(/Name: (.+)/, "\\1", "g")
}

/^Content: / {
	content_filename = gensub(/Content: (.+)/, "\\1", "g")
	content_file = gensub(/(.+)\/.+/, "\\1/" content_filename, "g", self)
	content_filename = gensub(/\//, "-", "g", content_filename)
	content_name = gensub(/([^.]+)\..*/, "\\1", "g", content_filename)
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
	print("<container version=\"1.0\" xmlns=\"urn:oasis:names:tc:opendocument:xmlns:container\">") >> temp "META-INF/container.xml"
	print("   <rootfiles>") >> temp "META-INF/container.xml"
	print("      <rootfile full-path=\"content.opf\" media-type=\"application/oebps-package+xml\"/>") >> temp "META-INF/container.xml"
	print("   </rootfiles>") >> temp "META-INF/container.xml"
	print("</container>") >> temp "META-INF/container.xml"
	close(temp "META-INF/container.xml")

	print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>") > temp "content.opf"
	print("<package xmlns=\"http://www.idpf.org/2007/opf\" unique-identifier=\"uuid\" version=\"2.0\">") >> temp "content.opf"
	print("  <metadata xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:opf=\"http://www.idpf.org/2007/opf\">") >> temp "content.opf"
	print("    <dc:title>" title "</dc:title>") >> temp "content.opf"
	print("    <dc:creator opf:role=\"aut\">" author "</dc:creator>") >> temp "content.opf"
	print("    <dc:identifier id=\"uuid\" opf:scheme=\"uuid\">" uuid "</dc:identifier>") >> temp "content.opf"
	print("    <dc:date>" date "</dc:date>") >> temp "content.opf"
	print("    <dc:language>" language "</dc:language>") >> temp "content.opf"
	print("  </metadata>") >> temp "content.opf"
	print("  <manifest>") >> temp "content.opf"
	print("    <item href=\"" content_filename "\" id=\"" content_name "\" media-type=\"application/xhtml+xml\"/>") >> temp "content.opf"
	print("  </manifest>") >> temp "content.opf"
	print("  <spine toc=\"ncx\">") >> temp "content.opf"
	print("    <itemref idref=\"" content_name "\"/>") >> temp "content.opf"
	print("  </spine>") >> temp "content.opf"
	print("</package>") >> temp "content.opf"
	close(temp "content.opf")

	system("cp " content_file " " temp content_filename)

	system("cd '" temp "' && rm -f '../" flat_name ".epub' && zip -qr '../" flat_name ".epub' .")
	system("cat '" temp "../" flat_name ".epub'")
}
