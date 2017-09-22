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


<!-- RSS_PUB_DATE: "Sun, 30 Aug 2017 03:38:21 +0200" -->


BOILERPLATE(gen-epub-book general, feature sets and links to various gen-epub-book implementations, en-GB, STYLESHEETS SCRIPTS)

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
HEADING(1, main, GEB())

HEADING_S(2, description, style="margin-top: initial;", Description)

<p id="description-paragraph">
GEB() is a loose file to ePub assembly/conversion tool for everyone not afraid of not using Word.
GEB() allows you to assemble ePub e-books using an easy-to-read, easy-to-write plaintext format.
</p>
<p id="description-what-is-it-paragraph">
Thus, "<!--"-->GEB()<!--"-->" is two things:
(1) a plaintext descriptor syntax; and
(2) a software tool, that assembles that descriptor and files referenced thereby into an ePub e-book.
</p>
<p id="description-inspiration-paragraph">
The "design goal" of GEB()’s descriptor syntax is to make it as consistent and obvious at the first sight as possible.
The idea is that a GEB() descriptor should be writable by any person with <em>minimal</em> technical knowledge.
</p>
<p id="description-for-whom-paragraph">
This guide is designated for non-programmers. If you're a programmer, see the more in-depth <a href="programmer.html">programmer's version</a>.
</p>
<p id="description-license-paragraph">
GEB() is free software, available under the MIT open source license.
See the <a href="#license">License</a> heading for more information.
</p>

HEADING(2, discussion, Discussion)

<p id="discussion-paragraph">
Any topic related to GEB() – both the descriptor syntax and the software –
is fair game for discussion over at GEB()'s and this webpage's issue trackers
	<a GEB_HREF(.rs/issues)>MFIZZ(rust)</a>
	<a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/issues" class="icon">DEVICON(html5)</a>.
I'<!--'-->ve also set up a <a GEB_HREF(/issues/1)>GitHub issue for simple questions and clarifications</a>.
If you don'<!--'-->t have a GitHub account, you can <a href="mailto:nabijaczleweli@gmail.com">shoot me an e-mail FA_D(envelope-o)</a>.
</p>
<p id="discussion-hopes-paragraph">
I hope that these facilities will lead to good ideas for future improvements to GEB().
</p>

HEADING(2, installation, Installation)

<p id="installation-paragraph">
If you'<!--'-->re running Ubuntu or Windows, you can simply grab a GEB(.rs) executable from the  <a GEB_HREF(.rs/releases)>releases</a> page.
Those executables should work when ran from anywhere and without any external dependencies.
</p>

HEADING(2, getting-started, Getting started)

HEADING(3, getting-started-syntax, Descriptor)

<div id="getting-started-syntax-paragraph">
<p></p>
GEB()'<!--'-->s descriptor syntax is <em>line-based</em> – each <em>line</em> in the file specifies one element of the e-book.
Here'<!--'-->s an example of how a descriptor for a simple book can look:
<kbd><pre class="highlit-code numberise">
CSPAN(keyword, Name)CSPAN(punctuation, :) CSPAN(string, A Widow'<!--'-->s Trace)
​
CSPAN(keyword, Include)CSPAN(punctuation, :) CSPAN(string, ../indent.css)
CSPAN(keyword, Include)CSPAN(punctuation, :) CSPAN(string, effects.css)
CSPAN(keyword, Content)CSPAN(punctuation, :) CSPAN(string, moments/book.html)
​
CSPAN(keyword, Author)CSPAN(punctuation, :) CSPAN(string, Jędrzej Aleksander Łopaciński)
CSPAN(keyword, Date)CSPAN(punctuation, :) CSPAN(string, 2017-04-23T03:38:52+02:00)
CSPAN(keyword, Language)CSPAN(punctuation, :) CSPAN(string, pl)
</pre></kbd>
And here's another one, but this time with comments explaining what's what:
<kbd><pre class="highlit-code numberise">
CSPAN(comment, # This e-book'<!--'-->s title or name)
CSPAN(keyword, Name)CSPAN(punctuation, :) CSPAN(string, Writing prompt collection)
CSPAN(comment, # Relative path to image file used for cover)
CSPAN(keyword, Cover)CSPAN(punctuation, :) CSPAN(string, writing_prompts/cover.png)
​
CSPAN(comment, # Relative path to image file to put in the e-book on its own)
CSPAN(keyword, Image-Content)CSPAN(punctuation, :) CSPAN(string, writing_prompts/no_the.png)
CSPAN(comment, # HTML file to put in the e-book after the previous line)
CSPAN(keyword, Content)CSPAN(punctuation, :) CSPAN(string, writing_prompts/theless.html)
​
CSPAN(comment, # URL to image file on the internet to put in the e-book on its own)
CSPAN(keyword, Network-Image-Content)CSPAN(punctuation, :) CSPAN(string, httpsCOLON_SLASH_SLASHi.imgur.com/gkevfag.jpg)
CSPAN(comment, # URL to HTML file on the internet to put in the e-book)
CSPAN(keyword, Network-Content)CSPAN(punctuation, :) CSPAN(string, httpsCOLON_SLASH_SLASHnabijaczleweli.xyz/content/writing_prompts/dead_santa.html)
​
CSPAN(comment, # Relative path to a file to pack in the e-book (without displaying it))
CSPAN(keyword, Include)CSPAN(punctuation, :) CSPAN(string, indent.css)
CSPAN(comment, # URL to a file on the internet to pack in the e-book (without displaying it))
CSPAN(keyword, Network-Include)CSPAN(punctuation, :) CSPAN(string, httpsCOLON_SLASH_SLASHnabijaczleweli.xyz/content/assets/common.css)
​
CSPAN(comment, # e-book'<!--'-->s author (that'<!--'-->s you!))
CSPAN(keyword, Author)CSPAN(punctuation, :) CSPAN(string, nabijaczleweli)
CSPAN(comment, # e-book'<!--'-->s publication date (in <a href="//tools.ietf.org/html/rfc3339">RFC3339</a> format, see below))
CSPAN(keyword, Date)CSPAN(punctuation, :) CSPAN(string, 2017-02-02T13:45:47+01:00)
CSPAN(comment, # e-book content'<!--'-->s language (in <a href="//tools.ietf.org/html/bcp47">BCP47</a> format, see below))
CSPAN(keyword, Language)CSPAN(punctuation, :) CSPAN(string, en-GB)
</pre></kbd>
<p></p>
</div>

<p id="getting-started-syntax-explanation-paragraph">
As you can see, there are four required <em>lines</em>:
	HIGHLIT_CODE(keyword, Name), HIGHLIT_CODE(keyword, Author), HIGHLIT_CODE(keyword, Date) and HIGHLIT_CODE(keyword, Language),
	one or none CSPAN(keyword, Cover) <em>line</em>, and any number of CSPAN(keyword, Content) and CSPAN(keyword, Image) keys.
For a complete rundown of all accepted <em>lines</em>, see <a href="programmer.html#getting-the-gist-elements-list-paragraph">this table</a>.
</p>

<div id="getting-started-syntax-explanation-path-paragraph">
<p></p>
All local paths are relative to the descriptor file.
The comments in the following directory tree show the paths to the files, relative to HIGHLIT_CODE(string, gep/special/book.epupp):
<kbd><pre class="highlit-code numberise">
CSPAN(string, first-book)
CSPAN(punctuation, ├──) CSPAN(string, rendered)
CSPAN(punctuation, │ ​ ​ ​└──) CSPAN(string, output)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​├──) CSPAN(string, intro.html) ​ ​ ​ ​ ​ ​CSPAN(comment, # ../../rendered/output/intro.html)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​├──) CSPAN(string, main.html) ​ ​ ​ ​ ​ ​ ​CSPAN(comment, # ../../rendered/output/main.html)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​└──) CSPAN(string, ending.html) ​ ​ ​ ​ ​​CSPAN(comment, # ../../rendered/output/ending.html)
CSPAN(punctuation, ├──) CSPAN(string, previews)
CSPAN(punctuation, │ ​ ​ ​└──) CSPAN(string, generated)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​└──) CSPAN(string, out)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ ├──) CSPAN(string, intro.html) ​ ​CSPAN(comment, # ../../previews/generated/out/intro.html)
CSPAN(punctuation, │ ​ ​ ​ ​ ​ ​ ​ ​ ​ ​ └──) CSPAN(string, main.html) ​ ​ ​CSPAN(comment, # ../../previews/generated/out/main.html)
CSPAN(punctuation, └──) CSPAN(string, gep)
CSPAN(punctuation,  ​ ​ ​ ​└──) CSPAN(string, first)
CSPAN(punctuation,  ​ ​ ​ ​ ​ ​ ​ ​├──) CSPAN(string, intro.html) ​ ​ ​ ​ ​ ​CSPAN(comment, # intro.html)
CSPAN(punctuation,  ​ ​ ​ ​ ​ ​ ​ ​└──) CSPAN(string, book.epupp) ​ ​ ​ ​ ​ ​CSPAN(comment, # book.epupp)
</pre></kbd>
When referenced from HTML, their names must be known.
The specified names are processed and packed under the names resulting from
	<a href="programmer.html#getting-the-gist-naming-local-paragraph">this</a> algorithm.
Packed names of files from the internet is their URL name.
<p></p>
</div>

<p id="getting-started-syntax-explanation-date-paragraph">
The HIGHLIT_CODE(keyword, Date) <em>line</em> must be in the <a href="//tools.ietf.org/html/rfc3339">RFC3339</a> format,
	which, while sounding scary, can be summarised as
	<kbd class="highlit-code nowrap"><!--
 -->CSPAN(string, YYYY)<!--
 -->CSPAN(punctuation, -)<!--
 -->CSPAN(string, MM)<!--
 -->CSPAN(punctuation, -)<!--
 -->CSPAN(string, DD)<!--
 -->CSPAN(punctuation, T)<!--
 -->CSPAN(string, HH)<!--
 -->CSPAN(punctuation, :)<!--
 -->CSPAN(string, MM)<!--
 -->CSPAN(punctuation, :)<!--
 -->CSPAN(string, SS)<!--
 -->CSPAN(punctuation, +/-)<!--
 -->CSPAN(string, TH)<!--
 -->CSPAN(punctuation, :)<!--
 -->CSPAN(string, TM)</kbd>.
Okay, that still looks scary.
You can just use the online <a href="//infobyip.com/epochtimeconverter.php">epoch time converter</a> to convert any date to RFC3339.
</p>

<p id="getting-started-syntax-explanation-date-free-paragraph">
If you specify the <code>--free-date</code> switch as an argument on the command-line, GEB() will also accept
	<a href="//tools.ietf.org/html/rfc2822">RFC2822</a> and
	<kbd class="highlit-code nowrap"><!--
 -->CSPAN(string, Unix timestamp)<!--
 -->CSPAN(punctuation, +)<!--
 -->CSPAN(string, TH)<!--
 -->CSPAN(punctuation, :)<!--
 -->CSPAN(string, TM)<!--
 --></kbd>,
	since these formats might be easier to use,
</p>

<p id="getting-started-syntax-explanation-language-paragraph">
The HIGHLIT_CODE(keyword, Language) <em>line</em> must be in the <a href="//tools.ietf.org/html/bcp47">BCP47</a> format,
	which effectively means a shorthand for the language in lowercase (HIGHLIT_CODE(string, en), HIGHLIT_CODE(string, pl)),
	optionally followed by a hyphen and the language'<!--'-->s variant (HIGHLIT_CODE(string, en-GB)).
</p>

HEADING(3, getting-started-running, Running&amp;assembling)

<div id="getting-started-explanation-language-paragraph">
If you have your descriptor and are ready to assemble it into an e-book open the console and run:
<kbd><pre class="highlit-code numberise">
CSPAN(punctuation, $) gen-epub-book CSPAN(string, first-book.epupp) CSPAN(string, first-book.epub)
</pre></kbd>
After which, if you did everything right and GEP() didn't throw you an error, you should now have a file called <code>first-book.epub</code>. <!--'-->
Congratulations! You can now read, verify and convert it using, e.g., <a href="//calibre-ebook.com/">Calibre</a>.
</div>

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
	why don'<!--'-->t you pop into the <a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/issues" class="icon">issues DEVICON_D(html5)</a>
	or slide <del>into the DMs</del> me an <a href="mailto:nabijaczleweli@gmail.com" class="icon">e-mail FA_D(envelope)</a>?
</p>


</div>

BOILERPLATE_END()
