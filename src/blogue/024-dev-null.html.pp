#define BOILERPLATE_LICENCE <!-- SPDX-license-identifier: --> CC-BY 4.0
<!--
nabijaczleweli.xyz (c) by nabijaczleweli@nabijaczleweli.xyz
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#define BOILERPLATE_ID efb59f77-4d29-11f1-a3a7-94de80ae55d5
#include "../writing/writing.h"
#include "../common.h"
#include "blogue.h"


<!-- TODO -->

   <!-- RSS_PUB_DATE: "Wed, 13 May 2026 15:12:04 +0200" -->
#define POST_DATE      Wed, 13 May 2026 15:12:04 +0200
#define POST_POST_DATE


BOILERPLATE(024. History of /dev/null — blogue, 024. History of /dev/null, en-GB, BLOGN_T_STYLESHEETS <!-- <link href="/content/assets/prism-twilight.min.css" rel="stylesheet"> -->)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

* {
	     tab-size: 8 !important;
	-moz-tab-size: 8 !important;
}

tt, pre {
	font-family: "Droid Sans Mono", monospace;
}

sup {
	line-height: 1;
	font-size: 80%;
}

.ref,
.refs dt {
	font-family: Merriweather;
	font-variant: small-caps;
}
.ref.man {
	letter-spacing: -15%;
}
.ref .sub,
.refs .refs dt,
cite blockquote {
	font-variant: initial;
	font-style:   initial;
}
.ref > a {
	text-decoration: none;
}

.refs dt::after {
	content: ":";
}
.refs dt {
	float: left;
}
.refs dt a {
	color: inherit;
	text-decoration: none;
}
.refs dd {
	height: 100%;
	margin-left: 0;
	padding-left: 4em;
}
.refs dd .refs dd {
	padding-left: 2em;
}
.refs *:target {
	background-color: #80808040;
	border-radius: 0 1em 1em 0;
}

ol, ul {
	padding-left: 1em;
}
.l {
	white-space: nowrap;
}

article:has(.border) {
	margin-inline: auto;
	max-width: fit-content;
}

article > .border {
	display: inline-block;
	padding: 0.5em;
	border-radius: 1em;
	border: 1px solid;
}

h3[id*=v]:after/*, #branches:after*/ {
	content: ":";
	font-weight: lighter;
}
</style>

#define unix <span class="smallcaps">unix</span>
#define pwb_unix <span class="smallcaps">Pwb/unix</span>
BLOGN_T_HEADING(024. History of /dev/null)


#define ARREF(el, linkto, base, suff, ...) __VA_ARGS__<el class="ref"><a href=STR(HASH##linkto)>[base/**/suff]</a></el>
#define RREF(id, sub, ...) ARREF(sup, id##sub, id, <span class="sub">sub</span>, __VA_ARGS__)
#define IRREF(id, sub, ...) ARREF(span, id##sub, id, <span class="sub">sub</span>, __VA_ARGS__)
#define REF(id, ...) ARREF(sup, id, id, , __VA_ARGS__)
#define IREF(id, ...) ARREF(span, id, id, , __VA_ARGS__)
#define R2REF(id, sub1, sub2, ...) ARREF(sup, id##sub1, id, <span class="sub">sub1</span></a><!--"-->,<!--"--><a href=STR(HASH##id##sub2)><span class="sub">sub2</span>, __VA_ARGS__)
#define IR2REF(id, sub1, sub2, ...) ARREF(span, id##sub1, id, <span class="sub">sub1</span></a><!--"-->,<!--"--><a href=STR(HASH##id##sub2)><span class="sub">sub2</span>, __VA_ARGS__)
#define R3REF(id, sub1, sub2, sub3, ...) ARREF(sup, id##sub1, id, <span class="sub">sub1</span></a><!--"-->,<!--"--><a href=STR(HASH##id##sub2)><span class="sub">sub2</span></a><!--"-->,<!--"--><a href=STR(HASH##id##sub3)><span class="sub">sub3</span>, __VA_ARGS__)
#define IR3REF(id, sub1, sub2, sub3, ...) ARREF(span, id##sub1, id, <span class="sub">sub1</span></a><!--"-->,<!--"--><a href=STR(HASH##id##sub2)><span class="sub">sub2</span></a><!--"-->,<!--"--><a href=STR(HASH##id##sub3)><span class="sub">sub3</span>, __VA_ARGS__)
<p class="indented">
In present-day,
opening <tt>/dev/null</tt> for reading and writing is allowed for everyone,
and yields a file descriptor corresponding to a special file where any read returns empty and any write does nothing but return OK.R2REF(xbd2024,,a)R2REF(xrat2024,,a)
This is observed universally now,RREF(Linux7,null)RREF(NetBSD,null)RREF(SORTIX,null)
but wasn't always.
</p>
<!-- <ol>
	<li>filesystem as-shipped (and as-configured)</li>
	<li>userspace conventions</li>
	<li>kernel support</li>
	<li>manual attitude</li>
</ol> -->

<p class="indented continued">
Four axes are of interest when evaluating historical systems like
</p>
HEADING_S(3, v1-3, class="continuation", Versions 1-3 unix)

<ol>
	<li>filesystem as-shipped (and as-configured):
	    —</li>
	<li>userspace conventions:
	    none</li>
	<li>kernel support:
	    N/A</li>
	<li>manual attitude:
	    nothing of <tt>/dev/null</tt>'s<!--'--> sort mentioned</li>
</ol>

HEADING(3, v4, Version 4 unix)

#define A_R  <abbr title="r--r--r--: everyone can read, nobody (save root) can write">a=r</abbr>
#define A_RW <abbr title="rw-rw-rw-: everyone can read, everyone can write"          >a=rw</abbr>
<ol>
	<li>filesystem as-shipped:
	    <tt>/dev/null</tt> is a regular file, size 0, access A_R<!---->REF(null4)
	    </li>
	<li>userspace conventions:
	    only user is <tt>sh</tt> as <code>open("/dev/null", O_RDONLY)</code>REF(sh4)
	    </li>
	<li>kernel support:
	    <q>Memory special file</q> (<code>mem</code>) <q>minor device 2 is EOF/RATHOLE</q> is fully-formed/**/R2REF(kernel4,,b)
	    </li>
	<li>manual attitude:
	    only mentioned in <cite>sh(I)</cite>:REF(upm4)
	    <blockquote class="continuation">
	    <!--
		    Process that are created with a `&' ignore interrupts.    '
		    Also if such a process has not redirected its
		    input with a `<',                                         '
		    its input is automatically redirected to the
		    zero length file /dev/null.
		 -->
		    with a `<',<!--'-->
		    its input is […] redirected to the
		    zero length file <span class=l>/dev/null</span>.
	    </blockquote>
	    <blockquote class="continuation">
		    <h4 class="continuing">FILES</h4>
		    /dev/null as a source of end-of-file.
	    </blockquote>
	    </li>
	<li value=1>… (and as-configured):
	    the distribution kernel is configured without <code>mem</code>RREF(kernel4,a)
	    </li>
</ol>

HEADING(3, v5, Version 5 unix)

<ol>
	<li>filesystem as-shipped (and as-configured):
	    <tt>/dev/null</tt> is a character device major 1 minor 2, access A_RW;REF(null5)
	    distribution kernel configured with <code>mem</code> as character major 1/**/RREF(kernel5,a)
	    </li>
	<li>userspace conventions:
	    same as <cite><a href="#v4">Version 4 unix</a></cite>REF(sh5)
	    </li>
	<li>kernel support:
	    same as <cite><a href="#v4">Version 4 unix</a></cite>,
	    but <code>mem</code> is now mandatory and always major 1/**/R2REF(kernel5,,b)
	    </li>
	<li>manual attitude:
	    same as <cite><a href="#v4">Version 4 unix</a></cite>,
	    <cite>mem(IV)</cite> (<q>core memory</q>) now mentions/**/REF(upm5)
	    <blockquote class="continuation">
		    <h4 class="continuing">FILES</h4>
		    /dev/mem, /dev/kmem, /dev/null
	    </blockquote>
	    and describes
	    <blockquote class="continuation">
		    The file <em>null</em> returns end-of-file on <em>read</em> and ignores <em>write.</em>
		    <!-- V5 doesn't italicise write, but V6 does; clearly wants to be symmetric '-->
	    </blockquote>
	    </li>
</ol>

HEADING(3, v6, Version 6 unix)

<ol>
	<li>filesystem as-shipped (and as-configured):
	    same as <cite><a href="#v5">Version 5 unix</a></cite>REF(null6)RREF(kernel6,a)
	    </li>
	<li>userspace conventions:
	    same as <cite><a href="#v5">Version 5 unix</a></cite>REF(sh6)
	    </li>
	<li>kernel support:
	    same as <cite><a href="#v5">Version 5 unix</a></cite>R2REF(kernel6,,a)
	    </li>
	<li>manual attitude:
	    sh(I) same as <cite><a href="#v5">Version 5 unix</a></cite>,
	    <cite>mem(IV)</cite> is now <q>mem, kmem, null</q>,
	    <cite>speak(VI)</cite> has an example of:REF(upm6)
	    <blockquote class="continuing">
(cat speak.v; echo !w speak.m) ⎪ speak -v <span class=l>/dev/null</span>
	    </blockquote>
	    (<tt>/dev/null</tt> is the <var>vocabulary</var> input).
	    <p class="continued"><cite>Setting Up UNIX − Sixth Edition</cite> affirms the distributed filesystem state:REF(setup6)</p>
	    <blockquote class="continuation">
The files tty8 (console), mem, kmem, null are
already correctly configured.
	    </blockquote>
	    </li>
</ol>

HEADING(3, v7, Version 7 unix)

<ol>
	<li>filesystem as-shipped (and as-configured):
		 <tt>/dev/null</tt> is a character device major 8 minor 2, access A_RW;REF(null7)
		 distribution kernels configured with <code>mem</code> as character major 8/**/R2REF(kernel7,a,b)
	    </li>
	<li>userspace conventions:
	    freely uses <tt class=l>/dev/null</tt> for empty input and to discard output/**/R2REF(userspace7,,a)
	    </li>
	<li>kernel support:
	    same as <cite><a href="#v6">Version 6 unix</a></cite>,
	    but <tt>mem</tt> is always major 8/**/R3REF(kernel7,,a,b)
	    </li>
	<li>manual attitude:
	    the Bourne shell similarly calls <tt class=l>/dev/null</tt> <q>the empty file</q>,REF(upm7)REF(sh7)
	    but
	    <cite>Uucp Implementation Description</cite> documents it as the default for standard input <em>and</em> output/**/REF(uucp7)
	    and
	    dd(1) & <cite>Setting Up UNIX − Seventh Edition</cite> recommend <code>dd of=/dev/null</code> for skipping "files" on tape.RREF(upm7,a)REF(setup7)

	    <p class="continued">
	    The only recommendation for direct usage is in <cite>Typesetting Mathematics — User's<!--'--> Guide</cite> as a USP:REF(eqn7)
	    </p>
	    <blockquote class="continuation">
If you want to check a document before actually printing it
(on unix only),
<pre class="indented continuing"><!--"-->eqn  files >/dev/null<!--"--></pre>
will
throw away the output but print the messages.
	    </blockquote>

	    mem(4) splits into new null(4), reproduced in its entirety below.RREF(upm7,b)
	    </li>
</ol>

<article>
<blockquote class="border" style="margin-left: 0; margin-right: 0;">
<h4 class="continuing">NAME</h4>
<p class="continuation">null − data sink</p>

<h4 class="continuing">DESCRIPTION</h4>
<p class="continuation">
Data written on a null special file is discarded.
</p>
<p>
Reads from a null special file always return 0 bytes.
</p>

<h4 class="continuing">FILES</h4>
/dev/null
</blockquote>
</article>


HEADING(3, branches, The Published Apocrypha)

<p class="indented">
pwb_unix and CB-UNIX kernels say that <q>minor device 2 is EOF/NULL</q> <a href="#v4">instead</a>;REF(kernelPWB)
CB-UNIX's<!--'--> implementation is novel.REF(kernelCB)
They use their respective base distributions'<!--'--> manual pages.REF(upmPWB)REF(upmCB)
</p>


HEADING(3, conclusion, Conclusion)

<style>
table {
	border-collapse: collapse;
}
th, td {
	border: 0.5px dotted;
	padding: 0.25em;
}
</style>
<table>
<caption><tt>/dev/null</tt></caption>
<tr><th>unix   </th><th>acceptable                        </th><th>installed        </th><th>possible                          </th><th>documented                        </th></tr>
<tr><th>1, 2, 3</th><td>any                               </td><td>none             </td><td>empty A_R file                    </td><td>–                                 </td></tr>
<tr><th>4      </th><td rowspan=3>device<br>empty A_R file</td><td>empty A_R file   </td><td rowspan=3>device<br>empty A_R file</td><td>just for sh(I), as readable       </td></tr>
<tr><th>5      </th>                                           <td rowspan=3>A_RW device</td>                                       <td>& under mem(IV) as read-write     </td></tr>
<tr><th>6      </th>                                                                                                                <td>& in setup                        </td></tr>
<tr><th>7      </th><td>A_RW device                       </td>                          <td>device                            </td><td>as read-write in null(4) with global perfusion</td></tr>
</table>


#define XBD2024 \
<cite> \
	IEEE Std 1003.1™-2024, \
	IEEE Standard for Information Technology—Portable Operating System Interface (POSIX™), \
	Base Specifications, Issue 8, \
	Microprocessor Committee of the IEEE Computer Society and The Open Group, \
	14 June 2024, \
	979-8-8557-0793-9, \
	STD26978, \
	Vol. 1: Base Definitions, Issue 8, \
	3.62: Character Special File, \
	p. 40, \
	ll. 1285-1287 \
	<blockquote class="continuation">   \
		A file that refers to a device (such as a terminal device file) or that has special properties \
		(such as <strong>/dev/null</strong>). \
	</blockquote> \
	\
	<DL_REFS> \
		RREFS(xbd2024a, a, ibid., 10.1: Directory Structure and Files, p. 197, ll. 7043-7045 \
		<blockquote class="continuation"> \
			The following files shall exist on conforming systems and shall be both readable and writable: \
			<p class="continued"> \
				<strong class=l style="float: left;">/dev/null</strong> \
				<span style="padding-left: 3em;"> \
					An empty data source and infinite data sink. Data written to <strong class=l>/dev/null</strong> shall be \
					discarded. Reads from <strong class=l>/dev/null</strong> shall always return end-of-file (EOF). \
				</span> \
			</p> \
		</blockquote>) \
	</dl> \
	<!-- TODO link? --> \
</cite>

#define XRAT2024 \
<cite> \
	ibid., \
	Vol. 4: Rationale (Informative), Issue 8, \
	A: Rationale for Base Definitions, \
	A.10.1: Directory Structure and Files, \
	p. 3717 \
	ll. 127679-127680 \
	<blockquote class="continuation"> \
		The standard files <strong>/dev/null</strong> and <strong>/dev/tty</strong> are required to be both readable and writable to allow \
		applications to have the intended historical access to these files. \
	</blockquote> \
	\
	<DL_REFS> \
		RREFS(xrat2024a, a, ibid., C: Rationale for Shell and Utilities, C.2: Shell Command Language, C.2.7: Redirection, p. 3891, ll. 135049 \
			<blockquote class="continuation"> \
				Since <strong>/dev/null</strong> is not a regular file, no error is generated by redirecting to it in <em>noclobber</em> mode. \
			</blockquote>) \
	</dl> \
	<!-- TODO link? --> \
</cite>

#define LINUX7NULL \
<cite> \
	Linux 7.1-rc3, \
	<tt>drivers/char/mem.c</tt>, \
	<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/mem.c?h=v7.1-rc3#n714">ll. 714, 679-692</a> \
</cite>

#define NETBSDNULL \
<cite> \
	NetBSD src 2026-05-11, \
	<tt>sys/sys/conf.h</tt> <a href="//cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/conf.h?rev=1.162#:~:text=DEV_NULL">l. 271</a>, \
	<tt>sys/dev/mm.c</tt> <a href="//cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/mm.c?annotate=1.24.36.1#:~:text=351:">ll. 351-356</a>, \
	<tt>etc/MAKEDEV.tmpl</tt> <a href="//cvsweb.netbsd.org/bsdweb.cgi/src/etc/MAKEDEV.tmpl?rev=1.238#:~:text=c%20%mem_chr%%202">l. 966</a>, \
</cite>

#define SOLARISNULL \
<cite> \
	illumos-gate 2026-05-06, \
	<tt>usr/src/uts/common/io/mem.c</tt> <a href="//github.com/illumos/illumos-gate/blob/d5d34ed4f6349c6a08df33a501add094c69f8fac/usr/src/uts/common/io/mem.c#L161">ll. 161</a>, 471-479, \
	<tt>usr/src/uts/common/sys/mem.h</tt> <a href="//github.com/illumos/illumos-gate/blob/d5d34ed4f6349c6a08df33a501add094c69f8fac/usr/src/uts/common/sys/mem.h#L46">l. 46</a>, \
</cite>

#define SORTIXNULL \
<cite> \
	sortix 2026-05-11, \
	<tt>kernel/kernel.cpp</tt> <a href="//gitlab.com/sortix/sortix/-/blob/d6245d46824a097f66d283e9f34fdc61a6a9223f/kernel/kernel.cpp#L587">ll. 587-593</a>, \
	<tt>kernel/fs/null.{<a href="//gitlab.com/sortix/sortix/-/blob/d6245d46824a097f66d283e9f34fdc61a6a9223f/kernel/fs/null.h">h</a>,<a href="//gitlab.com/sortix/sortix/-/blob/d6245d46824a097f66d283e9f34fdc61a6a9223f/kernel/fs/null.cpp">cpp</tt></a>}</tt> \
</cite>

#define UPM4 \
<cite> \
	UNIX Programmer'<!--'-->s Manual, Fourth Edition, \
	K. Thompson & D. M. Ritchie, \
	November, 1973, \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v4#./man1/sh.1#L294">sh(I)</a> \
	(4/18/73, <q>shell (command interpreter)</q>), \
	ll. 294-297, 302 \
</cite>

#define KERNEL4 \
<cite> \
	<a href="022-Utah_v4.html">UNIX V4 tape from University of Utah (binary tape, rootfs)</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/dmr/mem.c"><tt>/usr/sys/dmr/mem.c</tt></a> \
	<DL_REFS> \
		RREFS(kernel4a, a, ibid., <tt>/usr/sys/conf/conf.c</tt> <a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/conf/conf.c#L13">ll. 13-21</a>) \
		RREFS(kernel4b, b, ibid., <tt>/usr/sys/conf/mkconf.c</tt> <a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/conf/mkconf.c#L188">ll. 188-200</a>) \
	</dl> \
</cite>

#define SH4 \
<cite> \
	ibid., \
	<tt>/usr/source/s2/sh.c</tt>, <a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/source/s2/sh.c#L601">l. 601</a> \
</cite>

#define NULL4 \
<cite> \
	ibid., \
	<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/dev/null"><tt>/dev/null</tt></a> \
</cite>

#define UPM5 \
<cite> \
	UNIX Programmer'<!--'-->s Manual, Fifth Edition, \
	K. Thompson & D. M. Ritchie, \
	June, 1974, \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5man.pdf#page=103">sh(I)</a> \
	(5/15/74, <q>shell (command interpreter)</q>) \
	& \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5man.pdf#page=218">mem(IV)</a> \
	(5/27/74, <q>core memory</q>) \
</cite>

#define KERNEL5 \
<cite> \
	Dennis Ritchie, \
	<tt>v5root.tar.gz</tt>, \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5root.tar.gz">distributed by</a> TUHS, \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v5#./usr/sys/dmr/mem.c"><tt>./usr/sys/dmr/mem.c</tt></a> \
	<DL_REFS> \
		RREFS(kernel5a, a, ibid., <tt>/usr/sys/conf/conf.c</tt> <a href="//vtree.nabijaczleweli.xyz/?Dennis_v5#./usr/sys/conf/conf.c#L11">ll. 11-19</a>) \
		RREFS(kernel5b, b, ibid., <tt>/usr/sys/conf/mkconf.c</tt> <a href="//vtree.nabijaczleweli.xyz/?Dennis_v5#./usr/sys/conf/mkconf.c#L28">ll. 28-34</a>) \
	</dl> \
</cite>

#define SH5 \
<cite> \
	ibid., \
	<tt>./usr/source/s2/sh.c</tt>, <a href="//vtree.nabijaczleweli.xyz/?Dennis_v5#./usr/source/s2/sh.c#L641">l. 641</a> \
</cite>

#define NULL5 \
<cite> \
	Dennis Ritchie, \
	<tt>v5root.gz</tt>, \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5root.gz">distributed by</a> TUHS, \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v5#v5-missing-files"><tt>/dev/null</tt></a> \
</cite>

#define UPM6 \
<cite> \
	UNIX Programmer'<!--'-->s Manual, Sixth Edition, \
	K. Thompson & D. M. Ritchie, \
	May, 1975, \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v6/v6doc#./man/man1/sh.1">sh(I)</a> \
	(5/15/74, <q>shell (command interpreter)</q>) \
	& \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v6/v6doc#./man/man4/mem.4">mem(IV)</a> \
	(5/27/74, <q>mem, kmem, null − core memory</q>) \
	& \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v6/v6doc#./man/man6/speak.6">speak(VI)</a> \
	(4/26/75, <q>word to voice translator</q>) \
</cite>

#define SETUP6 \
<cite> \
	Ken Thompson & Dennis Ritchie, \
	Setting Up UNIX − Sixth Edition, \
	Special Files, \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v6/v6doc#./start/start#L418">para. 4</a> \
</cite>

#define KERNEL6 \
<cite> \
	Dennis Ritchie, \
	<tt>v6root.tar.gz</tt>, \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v6/v6root.tar.gz">distributed by</a> TUHS, \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v6/v6root#./usr/sys/dmr/mem.c"><tt>./usr/sys/dmr/mem.c</tt></a> \
	<DL_REFS> \
		RREFS(kernel6a, a, ibid., <tt>/usr/sys/conf/mkconf.c</tt> <a href="//vtree.nabijaczleweli.xyz/?Dennis_v6/v6root#./usr/sys/conf/mkconf.c#L60">ll. 60-66</a>) \
	</dl> \
</cite>

#define SH6 \
<cite> \
	Dennis Ritchie, \
	<tt>v6src.tar.gz</tt>, \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v6/v6src.tar.gz">distributed by</a> TUHS, \
	<tt>./s2/sh.c</tt>, <a href="//vtree.nabijaczleweli.xyz/?Dennis_v6/v6src#./s2/sh.c#L668">l. 668</a> \
</cite>

#define NULL6 \
<cite> \
	Dennis Ritchie, \
	<tt>v6root.gz</tt>, \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v6/v6root.gz">distributed by</a> TUHS, \
	<a href="//vtree.nabijaczleweli.xyz/?Dennis_v6#v6-missing-files"><tt>/dev/null</tt></a> \
</cite>

#define UPM7 \
<cite> \
	UNIX™ Time-Sharing System: \
	UNIX Programmer'<!--'-->s Manual, Seventh Edition, Volume 1, \
	January, 1979, \
	Bell Telephone Laboratories, Incorporated, \
	Murray Hill, New Jersey, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/man/man1/sh.1#L587">sh(1)</a> \
	(<q>command language</q>) \
	<DL_REFS> \
		RREFS(upm7a, a, ibid., dd(1) (<q>convert and copy a file</q>), <tt>/man/man1/dd.1</tt> <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/man/man1/dd.1#L587">l. 587</a>) \
		RREFS(upm7b, b, ibid., null(4) (<q>data sink</q>), <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/man/man4/null.4"><tt>/man/man4/null.4</tt></a>) \
	</dl> \
</cite>

#define SH7 \
<cite> \
	S. R. Bourne, \
	An Introduction to the UNIX Shell, \
	3.7 Command execution, \
	(<tt>/usr/doc/shell/t3</tt> <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/doc/shell/t3#L727">ll. 727-733</a>) \
</cite>

#define SETUP7 \
<cite> \
	Charles B. Haley & Dennis M. Ritchie, \
	Setting Up UNIX − Seventh Edition, \
	Special Files, \
	(<tt>/usr/doc/setup</tt> <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/doc/setup#L244">l. 244</a>) \
</cite>

#define UUCP7 \
<cite> \
	D. A. Nowitz, \
	Uucp Implementation Description, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/doc/uucp/implement#L448">Standard Input Line</a> & \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/doc/uucp/implement#L458">Standard Output Line</a> \
</cite>

#define EQN7 \
<cite> \
	Brian W. Kernighan and Lorinda L. Cherry, \
	Typesetting Mathematics — User's<!--'--> Guide, \
	(<tt>/usr/doc/eqn/g4</tt> <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/doc/eqn/g4#L210">ll. 205-213</a>) \
</cite>

#define KERNEL7 \
<cite> \
	<a href="//lfs.nabijaczleweli.xyz/0034-Keith_Bostic_v7.tar">Unsullied translation of the TUHS Keith_Bostic_v7 V7 UNIX distribution rootfs and /usr to tar</a>, \
	Keith Bostic, \
	<tt>f6.gz</tt> (<tt>/usr</tt>), \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Keith_Bostic_v7/f6.gz">distributed by</a> TUHS, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/sys/dev/mem.c"><tt>/sys/dev/mem.c</tt></a> \
	<DL_REFS> \
		RREFS(kernel6a, a, ibid., <tt>/sys/conf/mkconf.c</tt> ll. <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/sys/conf/mkconf.c#L35">35</a>, \
		                                                          <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/sys/conf/mkconf.c#L73">73-81</a>, \
		                                                          <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/sys/conf/mkconf.c#L659">659-667</a>) \
		RREFS(kernel6b, b, ibid., <tt>/sys/conf/c.c</tt> l. <a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/sys/conf/c.c#L50">50</a>) \
	</dl> \
</cite>

#define USERSPACE7 \
<cite> \
	ibid., \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/atrun.c"      >/src/cmd/atrun.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/cu.c"         >/src/cmd/cu.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/osh.c"        >/src/cmd/osh.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/refer/inv1.c" >/src/cmd/refer/inv1.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/refer/what3.c">/src/cmd/refer/what3.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/sh/xec.c"     >/src/cmd/sh/xec.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/tk.c"         >/src/cmd/tk.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/uucp/shio.c"  >/src/cmd/uucp/shio.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/uucp/uuxqt.c" >/src/cmd/uucp/uuxqt.c</a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/usr#/src/cmd/uucp/xqt.c"   >/src/cmd/uucp/xqt.c</a>, \
	&c. \
</cite>

#define NULL7 \
<cite> \
	ibid., \
	<tt>f5.gz</tt> (root), \
	<a href="//www.tuhs.org/Archive/Distributions/Research/Keith_Bostic_v7/f5.gz">distributed by</a> TUHS, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/root#/dev/"><tt>/dev/null</tt></a> \
</cite>

#define USERSPACE7A \
<cite> \
	ibid., \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/root#/etc/rc"><tt>/etc/rc</tt></a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/root#/bin/calendar"><tt>/bin/calendar</tt></a>, \
	<a href="//vtree.nabijaczleweli.xyz/?Keith_Bostic_v7/root#/bin/spell"><tt>/bin/spell</tt></a> \
</cite>


#define KERNELPWB \
<cite> \
	pwb_unix 2, \
	<a href="https://vtree.nabijaczleweli.xyz/?bostic_pwb#pwb/pwb.5/pwb/sys/io/mem.c"><tt>/pwb/sys/io/mem.c</tt></a> \
</cite>

#define UPMPWB \
<cite> \
	pwb_unix, Edition 1.0, \
	T. A. Dolotta, R. C. Haight, E. M. Piskorik, eds., \
	May 1977, \
	Bell Telephone Laboratories, Incorporated, \
	<a href="https://vtree.nabijaczleweli.xyz/?bostic_pwb#pwb/pwb.5/pwb.2/usr/man/man4/mem.4">mem(IV)</a> \
	(5/31/77, <q>core memory</q>) \
</cite>


#define KERNELCB \
<cite> \
	CB-UNIX kernel source, \
	<tt>conf.70.c</tt> 2.16, \
	<a href="//lfs.nabijaczleweli.xyz/TUHS/Distributions/USDL/CB_Unix/SourceCode/cbunix4.pdf#page=21">Page 2</a> \
	& \
	<a href="//lfs.nabijaczleweli.xyz/TUHS/Distributions/USDL/CB_Unix/SourceCode/cbunix9.pdf#page=26"><tt>mem.c</tt> 2.7.1.1</a> \
</cite>

#define UPMCB \
<cite> \
	CB-UNIX Programmer'<!--'-->s Manual, Edition 2.3, \
	J. D. Doan, ed., \
	May 1981, \
	Department 59473, \
	Bell Telephone Laboratories, Incorporated, \
	<a href="//lfs.nabijaczleweli.xyz/TUHS/Distributions/USDL/CB_Unix/cbunix_man4.pdf#page=14">null(IV)</a> \
	(November 1979, <q>the null file</q>) \
	[content identical to IREF(upm7) beside the title line] \
</cite>


#define DL_REFS dl class="refs"

#define REFSBODY(name, value, ...) <dt><a href=STR(HASH##name)>value</a></dt><dd>__VA_ARGS__</dd>
#define RREFS(name, value, ...) <div id=STR(name)>REFSBODY(name, value, __VA_ARGS__)</div>
#define REFS(name, ...) RREFS(name, name, __VA_ARGS__)
#define R2FS(name, value, b1, b2) <div id=STR(name)>REFSBODY(name, value, b1)REFSBODY(name, value, b2)</div>
#define REFLIST_POSIX           \
	REFS(Linux7null, LINUX7NULL) \
	REFS(NetBSDnull, NETBSDNULL) \
	REFS(SORTIXnull, SORTIXNULL) \
	REFS(xbd2024,    XBD2024)    \
	REFS(xrat2024,   XRAT2024)   \
	REFS(upm4,       UPM4)       \
	REFS(kernel4,    KERNEL4)    \
	REFS(sh4,        SH4)        \
	REFS(null4,      NULL4)      \
	REFS(upm5,       UPM5)       \
	REFS(kernel5,    KERNEL5)    \
	REFS(sh5,        SH5)        \
	REFS(null5,      NULL5)      \
	REFS(upm6,       UPM6)       \
	REFS(setup6,     SETUP6)     \
	REFS(kernel6,    KERNEL6)    \
	REFS(sh6,        SH6)        \
	REFS(null6,      NULL6)      \
	REFS(upm7,       UPM7)       \
	REFS(sh7,        SH7)        \
	REFS(setup7,     SETUP7)     \
	REFS(uucp7,      UUCP7)      \
	REFS(eqn7,       EQN7)       \
	REFS(kernel7,    KERNEL7)    \
	REFS(userspace7, USERSPACE7) \
	REFS(null7,      NULL7)      \
	REFS(userspace7a,USERSPACE7A)\
	REFS(kernelPWB,  KERNELPWB)  \
	REFS(upmPWB,     UPMPWB)     \
	REFS(kernelCB,   KERNELCB)   \
	REFS(upmCB,      UPMCB)      \


HEADING(3, refs, References)

<DL_REFS>
REFLIST_POSIX
</dl>


#undef unix
BLOGN_T_FOOTER()
BOILERPLATE_END()
