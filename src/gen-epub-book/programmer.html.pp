<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../common.h"
#include "../fontawesome.h"
#include "../font-mfizz.h"
#include "../devicon.h"
#include "gep.h"


BOILERPLATE(gen-epub-book for programmers, feature sets and links to various gen-epub-book implementations, en-GB, STYLESHEETS SCRIPTS)

<style>
#include "overlay.css"
#include "spacing.css"
#include "fonts.css"
#include "table.css"
#include "code.css"
#include "tag.css"
</style>

<div class="roboto">


<!-- Style based on https://daringfireball.net/projects/markdown/ -->
<p></p>
HEADING(1, main, GEB() For Programmers)

HEADING_S(2, description, style="margin-top: initial;", Description)

<p id="description-paragraph">
GEB() is a loose file to ePub assembly/conversion tool for everyone not afraid of not using Word.
GEB() allows you to assemble ePub e-books using an easy-to-read, easy-to-write plaintext format.
</p>
<p id="description-what-is-it-paragraph">
Thus, "<!--"-->GEB()<!--"-->" is two things:
(1) a plaintext descriptor syntax; and
(2) a (set of) software tool(s), written in a multitude of languages, that assemble that descriptor and files referenced thereby into an ePub e-book.
See the <a href="#getting-the-gist">Getting the gist</a> heading for details pertaining to GEB()'s descriptor syntax. <!--'-->
</p>
<p id="description-inspiration-paragraph">
The "design goal" of GEB()’s descriptor syntax is to make it as consistent and obvious at the first sight as possible.
The idea is that a GEB() descriptor should be writable by any person with <em>minimal</em> technical knowledge.
</p>
<p id="description-license-paragraph">
GEB() is free software, available under the MIT open source license.
See the <a href="#license">License</a> heading for more information.
</p>

HEADING(2, discussion, Discussion)

<p id="discussion-paragraph">
Any topic related to GEB() – both the descriptor syntax and the software –
is fair game for discussion over at the GEB() issue trackers
	<a GEB_HREF(/issues)       class="icon">AWK_ICON()</a>
	<a GEB_HREF(.rs/issues)                >MFIZZ(rust)</a>
	<a GEB_HREF(.cpp/issues)   class="icon">DEVICON(cplusplus)</a>
	<a GEB_HREF(.scala/issues)             >MFIZZ(scala)</a>
and this site's issue tracker <!--'-->
	<a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/issues" class="icon">DEVICON(html5)</a>.
I'<!--'-->ve also set up a <a GEB_HREF(/issues/1)>GitHub issue for simple questions and clarifications</a>.
</p>
<p id="discussion-hopes-paragraph">
I hope that GitHub issue system will lead to good ideas for future improvements to GEB().
</p>

HEADING(2, variants, Variants)

<div id="variants-paragraph">
<p></p>
As mentioned before, GEB() is actually also a <em>set</em> of software tools each of which performing mostly the same function,
but being written in a different language.
Here is the current list of GEB()'s variations, chronologically: <!--'-->
<ul>
	<li>GEB(.awk ​ ​) <a GEB_HREF()>     FA(github)</a>
	    <a GEB_CDN_HREF(/man/gen-epub-book.awk.1.html)>FA(book)</a></li>
	<li>GEB(.rs ​ ​ ​) <a GEB_HREF(.rs)>  FA(github)</a>
	    <a GEB_CDN_HREF(/man/gen-epub-book.rs.1.html)>FA(book)</a>
	    <a GEB_CDN_HREF(.rs/doc/gen_epub_book/index.html) class="overlay-container">
	    	<span class="overlay-target">FA(file-o)</span> <span style="font-size: 0.7em;">FA(cogs)</span></a>
	    <a href="//crates.io/crates/gen-epub-book">FA(archive)</a></li>
	<li>GEB(.cpp ​ ​) <a GEB_HREF(.cpp)>  FA(github)</a>
	    <a GEB_CDN_HREF(/man/gen-epub-book.cpp.1.html)>FA(book)</a></li>
	<li>GEB(.scala) <a GEB_HREF(.scala)>FA(github)</a></li>
</ul>
<p></p>
</div>
<p id="variants-variations-paragraph">
These variations have mostly the same features, and all differences will be highlighted in this document as they come up.
</p>
<p id="variants-binary-paragraphs">
Binary releases of compiled variants are available for download, for Windows and Ubuntu, on the releases pages
	<a GEB_HREF(.rs/releases)              >MFIZZ(rust)</a>
	<a GEB_HREF(.cpp/releases) class="icon">DEVICON(cplusplus)</a>.
</p>

HEADING(2, installation-and-requirements, Installation and requirements)

<p id="installation-and-requirements-paragraph">
All compiled variations of GEB() are stand-alone in that they don't depend on any files other than themselves. <!--'-->
Some of them, however, require additional software during building/installation.
</p>

HEADING(3, installation-and-requirements-awk, GEB(.awk))

<p id="installation-and-requirements-awk-paragraph">
GEB(.awk) does not require compilation, which makes it require external binary tools.
Here's the list outlining them, their uses, and where to get them: <!--'-->
</p>

<table id="installation-and-requirements-awk-table">
	<tr><th>Tool</th> <th>Use</th> <th>Where</th></tr>
	<tr><td><a href="//curl.haxx.se"><img src="//curl.haxx.se/logo/curl-logo.svg" alt="curl" style="height: 1.25em;"></a></td>
		  <td>Downloading HIGHLIT_CODE(keyword, Network-*) data.<br />
		      Getting random UUID.</td>
		  <td><samp>Linux</samp>: usually shipped with system, package manager, <a href="//curl.haxx.se/download.html">binary releases</a>.<br />
		      Windows:            <a href="//curl.haxx.se/download.html">binary releases</a>.</td></tr>
	<tr><td><code>zip</code></td>
		  <td>Packing ePub.</td>
		  <td><a href="http://info-zip.org/Zip.html#Downloads">Binary releases</a>.</td></tr>
	<tr><td><code>rm</code></td>
		  <td>Pre-generation cleanup.</td>
		  <td><samp>Linux</samp>: shipped with system, package manager.<br />
		      Windows:            <a href="http://gnuwin32.sourceforge.net/packages/coreutils.htm">contained in ported <code>coreutils</code></a>.</td></tr>
	<tr><td><code>cp</code></td>
		  <td>Assembling e-book in temporary directory.</td>
		  <td><samp>Linux</samp>: shipped with system, package manager.<br />
		      Windows:            <a href="http://gnuwin32.sourceforge.net/packages/coreutils.htm">contained in ported <code>coreutils</code></a>.</td></tr>
	<tr><td><code>mkdir</code></td>
		  <td>Creating temporary directories.</td>
		  <td>Available everywhere.</td></tr>
	<tr><td><code>cd</code></td>
		  <td>Proper relative paths for <code>Info-ZIP</code> (no, there'<!--'-->s no way around that).</td>
		  <td>Available everywhere.</td></tr>
</table>

<p id="installation-and-requirements-awk-accessibility-paragraph">
These tools need to be callable as in the first column – in HIGHLIT_CODE(variable, $PATH) or otherwise.
</p>

<p id="installation-and-requirements-awk-compatibility-paragraph">
GEB(.awk), of course, requires an implementation of AWK_ICON().
Each implementation of AWK_ICON() has its own quirks and therefore might not work as well as other implementations.
Here'<!--'-->s the list outlining some tested AWK_ICON() implementations and their support:
</p>

<table id="installation-and-requirements-awk-compatibility-table">
	<tr><th>Variant</th> <th>Support</th> <th>Note</th></tr>
	<tr><td><a href="//gnu.org/software/gawk"><code>gawk</code></a></td>
		  <td>Yes.</td>
		  <td></td></tr>
	<tr><td><a href="//invisible-island.net/mawk/mawk.html"><code>mawk</code></a></td>
		  <td>No.</td>
		  <td>Max supported string length exceeded. <code class="tag tag-white">wontfix</code></td></tr>
</table>

<p id="installation-and-requirements-awk-support-paragraph">
Not sure if your preferred implementation's supported? <!--'-->
Drop a question over at one of the issue trackers –
	<a GEB_HREF(/issues) class="icon">AWK_ICON()</a>
	<a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/issues" class="icon">DEVICON(html5)</a>!
</p>

HEADING(3, installation-and-requirements-rs, GEB(.rs))

<div id="installation-and-requirements-rs-paragraph">
<p></p>
GEB(.rs) just requires a roughly modern version of the <a href="//rust-lang.org">Rust</a> compiler.
Since GEB(.rs) is uploaded to <a href="//crates.io">crates.io</a> <a href="//crates.io/crates/gen-epub-book">FA(archive)</a>,
	you need simply run
<kbd><pre class="highlit-code numberise">
CSPAN(punctuation, $) cargo install CSPAN(string, gen-epub-book)
</pre></kbd>
<p>
The resulting executable is fully stand-alone and available in your HIGHLIT_CODE(variable, $PATH) if installed via <kbd>cargo install</kbd>.
</p>
</div>

HEADING(3, installation-and-requirements-cpp, GEB(.cpp))

<div id="installation-and-requirements-cpp-paragraph">
<p></p>
To be built, GEB(.cpp) requires:
<ul>
	<li>a <code>C++14</code>-compliant C++ compiler,</li>
	<li>a <code>C11</code>-compliant C compiler,</li>
	<li><a href="//ninja-build.org"><code>ninja</code></a>,</li>
	<li><a href="//cmake.org">CMake</a> 2.8+,</li>
	<li>a dev installation of <a href="//curl.haxx.se"><code>libcurl</code></a>.</li>
</ul>
The resulting executable is fully stand-alone.
<p></p>
</div>

HEADING(3, installation-and-requirements-scala, GEB(.scala))

<p id="installation-and-requirements-scala-paragraph">
To build, GEB(.scala) requires the <a href="//scala-lang.org">Scala</a> compiler.
The resulting <code>.jar</code>s depend only on the Scala runtime library.

HEADING(2, configuration, Configuration)

<p id="configuration-paragraph">
The same descriptor syntax put into any GEB() variant with any options passed shall produce (functionally) the same e-book
	(if they support a compatible featureset), but some GEB() variants are configurable in their non–e-book output.
Subheadings include links to manpages with more information.
</p>

HEADING(3, configuration-awk, GEB(.awk) <a GEB_CDN_HREF(/man/gen-epub-book.awk.1.html)>FA(book)</a>)

<p id="configuration-awk-paragraph">
A HIGHLIT_CODE(variable, temp) variable passed from the commandline containing the desired temporary directory (usually HIGHLIT_CODE(variable, $TEMP)).
This usually yields for
	<kbd class="highlit-code nowrap">CSPAN(verb, -v) CSPAN(variable, temp)CSPAN(punctuation, ​=)CSPAN(string, "$TEMP")</kbd>
	full argument.
</p>

HEADING(3, configuration-rs, GEB(.rs) <a GEB_CDN_HREF(/man/gen-epub-book.awk.1.html)>FA(book)</a>)

<p id="configuration-rs-paragraph">
The <code>--verbose</code> flag makes GEB(.rs) print information about what it's currently doing. <!--'-->
</p>

<h2 id="getting-the-gist">HEADING_LINK(getting-the-gist)
                          <span class="smallcaps">Getting the gist of</span> GEB()<span class="smallcaps">'s descriptor syntax</span></h2> <!--'-->

<p id="getting-the-gist-paragraph">
This section offers a complete, detailed documentation for the descriptor syntax.
</p>

HEADING(3, getting-the-gist-overview, Overview)

<div id="getting-the-gist-overview-paragraph">
<p></p>
GEB()'s descriptor syntax can be divided into <em>lines</em>. <!--'-->
Each <em>line</em> is either (a) comprised of three elements:
<kbd><pre class="highlit-code numberise">
CSPAN(keyword, key)CSPAN(punctuation, :) CSPAN(string, value)
CSPAN(comment, # ​ ​^ separator)
</pre></kbd>
or (b) is a comment if that format is not met for the line.
<p></p>
</div>

<p id="getting-the-gist-overview-elements-key-paragraph">
HIGHLIT_CODE(keyword, key) is any sequence of characters up to the HIGHLIT_CODE(punctuation, separator).
</p>

<p id="getting-the-gist-overview-elements-separator-paragraph">
HIGHLIT_CODE(punctuation, separator) is just HIGHLIT_CODE(punctuation, :),
	unless the <a href="#features-custom-separator">custom separator</a> feature is enabled.
</p>

<p id="getting-the-gist-overview-elements-value-paragraph">
HIGHLIT_CODE(string, value) is any sequence of characters till the end of <em>line</em>.
</p>

<p id="getting-the-gist-overview-elements-whitespace-paragraph">
All whitespace before and after every element is stripped (removed).
</p>

<div id="getting-the-gist-overview-elements-examples-paragraph">
<p></p>
Every <em>line</em> in the following descriptor is equivalent:
<kbd><pre class="highlit-code numberise">
CSPAN(keyword, Name)CSPAN(punctuation, :) CSPAN(string, The Taste of MI)
CSPAN(keyword, Name)CSPAN(punctuation, :)CSPAN(string, The Taste of MI)
 ​	​ CSPAN(keyword, Name) ​	​ CSPAN(punctuation, :) CSPAN(string, The Taste of MI) ​	​  ​	​
</pre></kbd>
<p></p>
All these <em>lines</em> are comments:
<kbd><pre class="highlit-code numberise">
CSPAN(comment, # A marked comment (not that it changes much))
CSPAN(comment, An unmarked comment (what))
​
CSPAN(comment, Name The Taste of MI)
CSPAN(comment, ​ ​ ​ ​ ​^ missing separator)
​
CSPAN(comment, Name:)
CSPAN(comment, ​ ​ ​ ​ ​ ​ ​^ missing value)
​
CSPAN(comment,  : The Taste of MI)
CSPAN(comment, ^ missing key)
</pre></kbd>
<p></p>
</div>

HEADING(3, getting-the-gist-elements, Elements)

<p id="getting-the-gist-elements-paragraph">
Each non-HIGHLIT_CODE(comment, comment) <em>line</em> forms is an <em>element</em> –
	a <kbd class="highlit-code nowrap">(CSPAN(keyword, key)CSPAN(punctuation, ,) CSPAN(string, value))</kbd> pair.
</p>

<div id="getting-the-gist-elements-validity-paragraph">
A descriptor is considered valid if the following conditions are met:
<ul>
	<li>all required <em>elements</em> are present,</li>
	<li>all path <em>element</em> HIGHLIT_CODE(string, value)s point to existing files,</li>
	<li>all network <em>element</em> HIGHLIT_CODE(string, value)s are valid URLs,</li>
	<li>all files pointed to by network <em>element</em> HIGHLIT_CODE(string, value)s can be downloaded, and</li>
	<li>all date <em>element</em> HIGHLIT_CODE(string, value)s are valid <a href="//tools.ietf.org/html/rfc3339">RFC3339</a> dates
	    (see the <a href="#features-free-date-format">free date format</a> feature for accepting more date formats).</li>
</ul>
</div>

<p id="getting-the-gist-elements-list-paragraph">
The following table enumerates supported HIGHLIT_CODE(keyword, key)s and their properties:
</p>

<table id="getting-the-gist-elements-table">
	<tr><th>HIGHLIT_CODE(keyword, key)</th> <th>Value type</th> <th>Effect</th> <th>Required</th> <th>Amount</th> <th>Remarks</th></tr>
	<tr><td>HIGHLIT_CODE(keyword, Name)</td>
		  <td>Plain text.</td>
		  <td>Sets book name/title tag.</td>
		  <td>Yes.</td>
		  <td>1</td>
		  <td></td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Author)</td>
		  <td>Plain text.</td>
		  <td>Sets book author tag.</td>
		  <td>Yes.</td>
		  <td>1</td>
		  <td></td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Date)</td>
		  <td><a href="//tools.ietf.org/html/rfc3339">RFC3339</a>-compliant date.</td>
		  <td>Sets book authoring/publishing date.</td>
		  <td>Yes.</td>
		  <td>1</td>
		  <td></td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Language)</td>
		  <td><a href="//tools.ietf.org/html/bcp47">BCP47</a>-compliant language code.</td>
		  <td>Sets book language tag.</td>
		  <td>Yes.</td>
		  <td>1</td>
		  <td></td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Content)</td>
		  <td>Path to HTML file.</td>
		  <td>Includes specified file in e-book.</td>
		  <td>No.</td>
		  <td>Any.</td>
		  <td>See <a href="#getting-the-gist-additional-content-processing-paragraph">additional content processing</a>.</td></tr>
	<tr><td>HIGHLIT_CODE(keyword, String-Content)</td>
		  <td>HTML text.</td>
		  <td>Includes raw HTML in e-book.</td>
		  <td>No.</td>
		  <td>Any.</td>
		  <td></td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Image-Content)</td>
		  <td>Path to image file.</td>
		  <td>Packs specified image file in the e-book and includes centered content therewith.</td>
		  <td>No.</td>
		  <td>Any.</td>
		  <td></td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Network-Image-Content)</td>
		  <td>URL to remote image file.</td>
		  <td>Downloads and packs specified image file in the e-book and adds centered content therewith.</td>
		  <td>No.</td>
		  <td>Any.</td>
		  <td></td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Cover)</td>
		  <td>Path to image file.</td>
		  <td>Packs specified image and sets cover to content pointing thereat.</td>
		  <td>No.</td>
		  <td>0-1</td>
		  <td>Exclusive with HIGHLIT_CODE(keyword, Network-Cover).</td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Network-Cover)</td>
		  <td>URL to remote image file.</td>
		  <td>Downloads and packs specified image and sets cover to content pointing thereat.</td>
		  <td>No.</td>
		  <td>0-1</td>
		  <td>Exclusive with HIGHLIT_CODE(keyword, Cover).</td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Include)</td>
		  <td>File path.</td>
		  <td>Packs specified file.</td>
		  <td>No.</td>
		  <td>Any.</td>
		  <td></td></tr>
	<tr><td>HIGHLIT_CODE(keyword, Network-Include)</td>
		  <td>Remote file URL.</td>
		  <td>Downloads and packs specified file.</td>
		  <td>No.</td>
		  <td>Any.</td>
		  <td></td></tr>
</table>

<p id="getting-the-gist-naming-paths-paragraph">
All local paths are relative to the descriptor file.
This can be changed with the <a href="#features-include-dirs"><code>-I</code>nclude dirs</a> feature.
</p>

<div id="getting-the-gist-naming-local-paragraph">
<p></p>
The included local files' packed names are the paths by which they've been included with all instances of
	HIGHLIT_CODE(string, \) replaced with HIGHLIT_CODE(string, /), of
	HIGHLIT_CODE(string, ../) and HIGHLIT_CODE(string, ./) removed, and of
	HIGHLIT_CODE(string, /) replaced with HIGHLIT_CODE(string, -).
Examples:
<kbd><pre class="highlit-code numberise">
CSPAN(string, simple-content.html) ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​CSPAN(punctuation, =>) CSPAN(string, simple-content_html)
CSPAN(string, ../cover.jpg) ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​CSPAN(punctuation, =>) CSPAN(string, cover.jpg)
CSPAN(string, .\../books/../covers/cover.jpg) ​CSPAN(punctuation, =>) CSPAN(string, books-covers-cover.jpg)
</pre></kbd>
<p></p>
</div>

<p id="getting-the-gist-naming-remote-paragraph">
The included remote files' packed names are the last segment (i.e. the filename) of their URL. <!--'-->
</p>

<p id="getting-the-gist-additional-content-processing-paragraph">
In addition, all HIGHLIT_CODE(keyword, Content) files are checked for the
	<kbd class="highlit-code nowrap">CSPAN(comment, <​!​-​-) CSPAN(keyword, ePub title)CSPAN(punctuation, :) CSPAN(string, "TOC_NAME") CSPAN(comment, -​->)</kbd>
	sequence, where HIGHLIT_CODE(string, TOC_NAME) is a sequence of any character except HIGHLIT_CODE(string, "<!--"-->) which is
	the name to give the content in the Table of Contents.
</p>

HEADING(2, features, Features)

<p id="features-paragraph">
Features are extensions to the GEB() descriptor syntax, modifying the behaviour and validity of some <em>lines</em>.
</p>

HEADING(3, features-custom-separator, Custom separator)

<div id="features-custom-separator-paragraph">
<p></p>
This feature allows a custom set of characters to be used as the HIGHLIT_CODE(punctuation, separator). For example:
<kbd><pre class="highlit-code numberise">
CSPAN(keyword, Name)CSPAN(punctuation, :) CSPAN(string, The Taste of MI)
CSPAN(comment, # With custom separator set to "=" becomes)
CSPAN(keyword, Name)CSPAN(punctuation, =) CSPAN(string, The Taste of MI)
CSPAN(comment, # Or, with custom separator set to "INCREDIBLE COMMUNISM" becomes)
CSPAN(keyword, Name) CSPAN(punctuation, INCREDIBLE COMMUNISM) CSPAN(string, The Taste of MI)
</pre></kbd>
<p></p>
</div>

HEADING(3, features-free-date-format, Free date format)

<div id="features-free-date-format-paragraph">
<p></p>
This feature allows a GEB() to accept non-<a href="//tools.ietf.org/html/rfc3339">RFC3339</a> date formats, whichever it can.
For example, with free date format feature on these can become equivalent:
<kbd><pre class="highlit-code numberise">
CSPAN(keyword, Date)CSPAN(punctuation, :) CSPAN(string, 2017-08-19T21:22:31+0200)
CSPAN(keyword, Date)CSPAN(punctuation, :) CSPAN(string, Sat, 19 Aug 2017 21:22:31 +02:00)
CSPAN(keyword, Date)CSPAN(punctuation, :) CSPAN(string, 1503177751)
</pre></kbd>
<p></p>
</div>

HEADING(3, features-include-dirs, <code>-I</code>nclude dirs)

<p id="features-include-dirs-paragraph">
This feature allows for specifying more root directories for finding local files.
</p>

<p id="features-include-dirs-variants-paragraph">
An include directory can be <em>named</em> or <em>unnamed</em>, which affects their packed name:
	<em>unnamed</em> directories act transparently – their packed name is exactly as specified and transformed, while
	<em>named</em> directories put their files in a dedicated subdirectory named themafter, then their specified path transformed.
</p>

<div id="features-include-dirs-examples-paragraph">
<p></p>
For example, given the following directory tree:
<kbd><pre class="highlit-code numberise">
CSPAN(string, special_book)
CSPAN(punctuation, ├──) CSPAN(string, rendered)
CSPAN(punctuation, │ ​ ​ ​└──) CSPAN(string, output)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​├──) CSPAN(string, intro.html)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​├──) CSPAN(string, main.html)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​└──) CSPAN(string, ending.html)
CSPAN(punctuation, ├──) CSPAN(string, previews)
CSPAN(punctuation, │ ​ ​ ​└──) CSPAN(string, generated)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​└──) CSPAN(string, out)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ├──) CSPAN(string, intro.html)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ └──) CSPAN(string, main.html)
CSPAN(punctuation, └──) CSPAN(string, gep)
CSPAN(punctuation,  ​ ​ ​ ​└──) CSPAN(string, special)
CSPAN(punctuation,  ​ ​ ​ ​ ​ ​ ​ ​├──) CSPAN(string, intro.html)
CSPAN(punctuation,  ​ ​ ​ ​ ​ ​ ​ ​└──) CSPAN(string, book.epupp)
</pre></kbd>
If <code>gep/special/book.epupp</code>
<ul>
	<li>specifying <code>intro.html</code>, <code>main.html</code> and <code>ending.html</code> is built with</li>
	<li><em>named</em> include dir "previews" pointing at <code>../../previews/generated/out</code>, then an</li>
	<li><em>unnamed</em> include dir pointing at <code>../../rendered/output</code>,</li>
</ul>
the content inside would be laid out as follows:
<kbd><pre class="highlit-code numberise">
CSPAN(string, book.epub)
CSPAN(punctuation, ├──) CSPAN(string, intro.html) ​ ​ ​ ​ ​CSPAN(comment, # From gep/special/)
CSPAN(punctuation, ├──) CSPAN(string, previews)
CSPAN(punctuation, │ ​ ​ ​└──) CSPAN(string, main.html) ​ ​CSPAN(comment, # From previews/generated/out/)
CSPAN(punctuation, └──) CSPAN(string, ending.html) ​ ​ ​ ​CSPAN(comment, # From rendered/output/)
</pre></kbd>
<p></p>
</div>

HEADING(3, features-support, Support table)

<table id="features-support-table">
	<tr><th></th>
	    <th><center><a GEB_HREF()       class="icon">AWK_ICON()</a></center></th>
	    <th><center><a GEB_HREF(.rs)                >MFIZZ(rust)</a></center></th>
	    <th><center><a GEB_HREF(.cpp)   class="icon">DEVICON(cplusplus)</a></center></th>
	    <th><center><a GEB_HREF(.scala)             >MFIZZ(scala)</a></center></th></tr>
	<tr><td>Custom separator</td>
	    <td>No.</td>
	    <td><a GEB_HREF(.rs/releases/tag/v2.0.0)><code>v2.0.0</code></a></td>
	    <td>No.</td>
	    <td><a GEB_HREF(.scala/releases/tag/v1.1.0)><code>v1.1.0</code></a></td></tr>
	<tr><td>Free date format</td>
	    <td>No.</td>
	    <td><a GEB_HREF(.rs/releases/tag/v2.1.0)><code>v2.1.0</code></a></td>
	    <td><a GEB_HREF(.cpp/releases/tag/v2.0.0)><code>v2.0.0</code></a></td>
	    <td>No.</td></tr>
	<tr><td><code>-I</code>nclude dirs</td>
	    <td>No.</td>
	    <td><a GEB_HREF(.rs/releases/tag/v2.0.0)><code>v2.0.0</code></a></td>
	    <td><a GEB_HREF(.cpp/releases/tag/v2.0.0)><code>v2.0.0</code></a></td>
	    <td><a GEB_HREF(.scala/releases/tag/v1.1.0)><code>v1.1.0</code></a></td></tr>
</table>

HEADING(2, license, License)

<pre id="license-paragraph">
The MIT License (MIT)
​
Copyright (c) 2017 nabijaczleweli
​
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
​
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
​
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
</pre>

HEADING(2, afterword, Afterword)

<p id="afterword-paragraph">
Thank you for making it this far.
I hope that this document is clear and/or informative, if not,
	why don'<!--'-->t you pop into the <a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/issues" class="icon">issues DEVICON(html5)</a> and
	help yourself, others and me?
</p>


</div>

BOILERPLATE_END()
