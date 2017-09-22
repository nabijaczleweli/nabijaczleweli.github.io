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


function escape_html(text) {
	text = gensub("&", "\\&amp;", "g", text)
	text = gensub("<", "\\&lt;", "g", text)
	text = gensub(">", "\\&gt;", "g", text)
	text = gensub("\"", "\\&quot;", "g", text)
	return text
}


BEGIN {
	title = ""
	description = ""
	author = ""
	pubDate = ""
	everything = ""

	# Avoid links ending in "//"
	if(filename == "/")
		filename = ""
}

/ \(c\) by / {
	author = gensub(/.* \(c\) by (.*)/, "\\1", "g")
}

/<title>(.+)<\/title>/ {
	title = gensub(/<title>(.+)<\/title>/, "\\1", "g") " — " author
}

/<meta name="description" content="([^"]+)">/ {
	description = gensub(/^[[:space:]]*<meta name="description" content="([^"]+)">/, "\\1", "g")
}

/<!-- RSS_PUB_DATE: "([^"]+)" -->/ {
	pubDate = gensub(/<!-- RSS_PUB_DATE: "([^"]+)" -->/, "\\1", "g")
}

/^[[:space:]]*<body>/,/<!-- CTNT_END -->/ {
	everything = everything $0 "\n"
}

END {
	# pubDate empty, which means that a page is not meant for RSS consumption
	if(pubDate == "")
		exit

	everything = gensub(/^[[:space:]]*<body>/, "", "g", everything)
	everything = gensub(/<!-- CTNT_END -->.*/, "", "g", everything)

	print ""
	print "    <item>"
	print "      <title>" title "</title>"
	print "      <description>" escape_html(everything) "</description>"
	print "      <author>" author "</author>"
	print "      <pubDate>" pubDate "</pubDate>"
	print "      <guid>https://nabijaczleweli.xyz/content/" filename "</guid>"
	print "      <source url=\"https://nabijaczleweli.xyz/content/feed.xml\">nabijaczleweli's page</source>"
	print "    </item>"
}
