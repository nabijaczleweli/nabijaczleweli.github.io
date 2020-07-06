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

function rfc822_to_rfc3339(date) {
	date = gensub(/.*, +([^ ]+) +([^ ]+) +([^ ]+) +([^ ]+) +([+-]..)(..)/, "\\3-\\2-\\1T\\4\\5:\\6", 1, date)
	date = gensub(/-([[:digit:]])T/, "-0\\1T", 1, date)

	# https://www.w3.org/Protocols/rfc822/
	date = gensub("Jan", "01", 1, date)
	date = gensub("Feb", "02", 1, date)
	date = gensub("Mar", "03", 1, date)
	date = gensub("Apr", "04", 1, date)
	date = gensub("May", "05", 1, date)
	date = gensub("Jun", "06", 1, date)
	date = gensub("Jul", "07", 1, date)
	date = gensub("Aug", "08", 1, date)
	date = gensub("Sep", "09", 1, date)
	date = gensub("Oct", "10", 1, date)
	date = gensub("Nov", "11", 1, date)
	date = gensub("Dec", "12", 1, date)

	return date
}


BEGIN {
	title = ""
	# description = ""
	# author = ""
	published = ""
	updated = ""
	everything = ""

	# Avoid links ending in "//"
	if(filename == "/")
		filename = ""
}

# / \(c\) by / {
# 	author = gensub(/.* \(c\) by (.*)/, "\\1", "g")
# }

/<title>(.+)<\/title>/ {
	title = gensub(/<title>(.+)<\/title>/, "\\1", "g")
}

# /<meta name="description" content="([^"]+)">/ {
# 	description = gensub(/^[[:space:]]*<meta name="description" content="([^"]+)">/, "\\1", "g")
# }

/<!-- RSS_PUB_DATE: "([^"]+)" -->/ {
	published = gensub(/<!-- RSS_PUB_DATE: "([^"]+)" -->/, "\\1", "g")
}

/<!-- RSS_UPDATE_DATE: "([^"]+)" -->/ {
	updated = gensub(/<!-- RSS_UPDATE_DATE: "([^"]+)" -->/, "\\1", "g")
}

/^[[:space:]]*<body>/,/<!-- CTNT_END -->/ {
	everything = everything $0 "\n"
}

END {
	# published empty, which means that a page is not meant for RSS consumption
	if(published == "")
		exit

	# Atom requires updated but not published, so write published only if entry had ever been updated
	if(updated == "") {
		updated = published
		published = ""
	}

	published = rfc822_to_rfc3339(published)
	updated   = rfc822_to_rfc3339(updated)

	everything = gensub(/^[[:space:]]*<body>/, "", "g", everything)
	everything = gensub(/<!-- CTNT_END -->.*/, "", "g", everything)

	print ""
	print "  <entry>"
	print "    <id>https://nabijaczleweli.xyz/content/" filename "</id>"
	print "    <title>" title "</title>"
	print "    <updated>" updated "</updated>"
	if(published != "")
		print "    <published>" published "</published>"
	print "    <content type=\"html\">" escape_html(everything) "</content>"
	# print "    <author>" author "</author>"
	print "  </entry>"
}
