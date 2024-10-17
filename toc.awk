# The MIT License (MIT)

# Copyright (c) 2024 nabijaczleweli

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


function heading(tok) {
	if(tok[1] > last) {
		for(; tok[1] > last; ++last)
			print "<ol>"
	} else if(tok[1] < last) {
		for(; tok[1] < last; --last)
			print "</ol>"
	}

	# print "tok3=" tok[3]
	while(match(tok[3], /Tn\([^\)]*\)/)) {
		sub(/Tn\([^\)]*\)/, toupper(substr(tok[3], RSTART + 3, RLENGTH - 4)), tok[3])
	}

	print "<li><a href='#" tok[2] "'>" tok[3] "</a></li>"
}


BEGIN {
	last = 1
	print "<div style='position: relative;'><details id='contents'><summary><h2>Contents</h2></summary><ol>"
}

END {
	for(; 1 < last; --last)
		print "</ol>"
	print "</details></div>"
}


# HEADING(2, jpeg, no nooo my nose cam noooooo)
/^HEADING\(([^,]*), ([^,]*), (.*)\)$/ {
	match($0, /^HEADING\(([^,]*), ([^,]*), (.*)\)$/, tok)
	heading(tok)
}

# HEADING_S(2, jailbroke, class="continuing", saved from chromium (chrome os (chromium os(?))))
/^HEADING_S\(([^,]*), ([^,]*), [^,]*, (.*)\)$/ {
	match($0, /^HEADING_S\(([^,]*), ([^,]*), [^,]*, (.*)\)$/, tok)
	heading(tok)
}

# HEADING_CHRULTRA_S(4, installing-making-a-bootable-usb-flashing-with-dd-linux-macos, class="continuing", installing/bootableusb.html#flashing-with-dd-linux-macos, Flashing with dd (Linux/macOS))
/^HEADING_CHRULTRA_S\(([^,]*), ([^,]*), [^,]*, [^,]*, (.*)\)$/ {
	match($0, /^HEADING_CHRULTRA_S\(([^,]*), ([^,]*), [^,]*, [^,]*, (.*)\)$/, tok)
	heading(tok)
}
