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


NR == 1 {
	print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
	print "<?xml-stylesheet href=\"/content/assets/feed.xsl\" type=\"text/xsl\"?>"
	print "<feed xmlns:atom=\"http://www.w3.org/2005/Atom\" xml:base=\"https://nabijaczleweli.xyz\">"
	print "  <title>nabijaczleweli's page</title>"
	print "  <id>https://nabijaczleweli.xyz/content</id>"
	print "  <icon>https://nabijaczleweli.xyz/assets/nabijaczleweli.png</icon>"
	print "  <link rel=\"alternate\" href=\"https://nabijaczleweli.xyz/content\" type=\"text/html\"/>"
	print "  <link rel=\"self\" href=\"https://nabijaczleweli.xyz/content/feed.xml\" type=\"application/atom+xml\"/>"
	print "  <author>"
	print "    <name>nabijaczleweli</name>"
	print "    <email>nabijaczleweli@nabijaczleweli.xyz</email>"
	print "    <uri>https://nabijaczleweli.xyz</uri>"
	print "  </author>"
	print "  <rights>Copyright (c) 2016 nabijaczleweli</rights>"

	print $1

	print "  <generator>"
	printf "    "
	system(awk " -Wversion | head -1")
	print "  </generator>"
}

{
	fn = $2
	while(getline <fn)
		print $0
}

END {
	print "</feed>"
}
