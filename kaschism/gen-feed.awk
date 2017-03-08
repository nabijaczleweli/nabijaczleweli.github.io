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
	print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
	print "<rss version=\"2.0\" xmlns:atom=\"https://www.w3.org/2005/Atom\">"
	print "  <channel>"
	print "    <atom:link href=\"https://nabijaczleweli.xyz/kaschism/feed.xml\" rel=\"self\" type=\"application/rss+xml\" />"
	print "    <title>nabijaczleweli's page</title>"
	print "    <link>https://nabijaczleweli.xyz/kaschism</link>"
	print "    <description>Newest articles on nabijaczleweli.xyz</description>"
	print "    <language>en-BR</language>"
	print "    <copyright>Copyright (c) 2016 nabijaczleweli</copyright>"
	print "    <managingEditor>nabijaczleweli@gmail.com (nabijaczleweli)</managingEditor>"
	print "    <webMaster>nabijaczleweli@gmail.com (nabijaczleweli)</webMaster>"

	print "    <pubDate>"
	printf "      "
	system("date -R | cat")
	print "    </pubDate>"

	print "    <lastBuildDate>"
	printf "      "
	system("date -R | cat")
	print "    </lastBuildDate>"

	print "    <generator>"
	printf "      "
	system(awk " -Wversion | head -1")
	print "    </generator>"

	print "    <docs>https://validator.w3.org/feed/docs/rss2.html</docs>"
	print "    <ttl>60</ttl>"
	print "    <image>"
	print "      <url>https://nabijaczleweli.xyz/assets/nabijaczleweli.png</url>"
	print "      <title>nabijaczleweli's page</title>"
	print "      <link>https://nabijaczleweli.xyz/kaschism</link>"
	print "    </image>"
}

{
	name = gensub(/src\/(.*)\.pp/, "\\1", "g")
	name = gensub(/\/?index.html$/, "/", "g", name)
	system("cat " $0 " | " awk " -f gen-feed-item.awk -v awk=\"" awk "\" -v filename=\"" name "\"")
}

END {
	print "  </channel>"
	print "</rss>"
}
