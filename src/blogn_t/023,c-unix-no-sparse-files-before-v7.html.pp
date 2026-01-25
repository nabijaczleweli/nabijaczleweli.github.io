<!--
nabijaczleweli.xyz (c) by nabijaczleweli@nabijaczleweli.xyz
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../writing/writing.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Sun, 25 Jan 2026 23:28:55 +0100" -->
#define POST_DATE      Sun, 25 Jan 2026 23:28:55 +0100
#define POST_POST_DATE

#define DEL      […]


BOILERPLATE(023‚c. UNIX didn't have sparse files before V7 (+ V1 patch) — blogn't, 023‚c. UNIX didnꞌt have sparse files before V7 (+ V1 patch), en-GB, BLOGN_T_STYLESHEETS WORD_COUNT_SCRIPT <link href="/content/assets/prism-twilight.min.css" rel="stylesheet">)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

pre {
	white-space: pre-wrap;
}

tt, pre {
	font-family: "Droid Sans Mono", monospace;
}

ol, ul {
	padding-left: 2em;
}


code[class*="language-"], pre[class*="language-"] {
	white-space: pre-wrap;
}
pre[class*="language-"] {
	margin-top:     0;
	margin-bottom:  0;
	padding-top:    0.5em;
	padding-bottom: 0.5em;
}

small {
	font-size: 0.88em; /* 1/113% */
}
* {
	     tab-size: 8 !important;
	-moz-tab-size: 8 !important;
}
code.language-c, pre.language-c,
code.language-c *, pre.language-c *,
.is-C * {
	     tab-size: 4 !important;
	-moz-tab-size: 4 !important;
}


pre small {
	letter-spacing: 8%;
}
pre small.zero {
	letter-spacing: initial;
}
</style>

#define unix <span class="smallcaps">unix</span>
BLOGN_T_HEADING(023,c. unix didn't<!--'--> have sparse files before V7 (+ V1 patch))

<p class="indented continued">
As we know, the core conceit of sparse files is that when you write to a file,
and the start of the write is past the current file length, that space is filled with <em>synthetic</em> zero bytes,
which (to the precision of some block size) aren't<!--'--> stored on disk.
The definition in the excerpt below agrees with this.
They are first present in V7 unix, in spite of having been described in this form since V1.
</p>

HEADING(3, v1, V1 unix)

<p class="indented continued">
Per
<cite>
	UNIX Programmer'<!--'-->s Manual,
	K. Thompson & D. M. Ritchie,
	November 3, 1971,
	format of file system,
	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=174">p. 3</a>\
</cite>,
</p>
<blockquote class="continuing" style="margin-left: 0;"><tt>\
If block <u>b</u> in a file exists, it is not necessary
that all blocks less than <u>b</u> exist.&nbsp; A zero block
nuimber either in the address words of the i-node
or in an indirect block indicates that the
corresponding block has never been allocated.&nbsp;
Such a missing block reads as if it contained all
zero words.\
</tt></blockquote>
<p class="continuing">
and a picture is worth 861 words, so, filtered for relevant files:
</p>
#include "blogn_t/023,c.01-v1-setup.shell-session.html"
<div id="v1-dump1">
#include "blogn_t/023,c.02-v1-dump1.plaintext.html"
</div>
<div id="v1-cat">
#include "blogn_t/023,c.03-v1-cat.shell-session.html"
</div>
<div id="v1-dump2">
#include "blogn_t/023,c.04-v1-dump2.plaintext.html"
</div>
<p class="continuation">
<a href="//git.sr.ht/~nabijaczleweli/Research_fs_tap_tp_V/commit/d94a79dea35f399aaed69bbab04f0cb23d8bf6e6">Q.E.D.</a>
</p>


HEADING(3, v4, V4 unix)

#include "blogn_t/023,c.05-v4.shell-session.html"
<p class="continuation">
Q.E.D.,
with <a href="//vtree.nabijaczleweli.xyz/?Dennis_v4#./man5/fs.5#L265">same wording</a> in
<cite>
	UNIX Programmer'<!--'-->s Manual, Fourth Edition,
	K. Thompson & D. M. Ritchie,
	November, 1973,
	file system (V)\
</cite>.
</p>


HEADING(3, v5, V5 unix)

#include "blogn_t/023,c.06-v5.shell-session.html"
<p class="continuation">
Q.E.D.,
with unchanged wording on <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5man.pdf#page=238">p. 2</a> of
<cite>
	UNIX Programmer'<!--'-->s Manual, Fifth Edition,
	K. Thompson & D. M. Ritchie,
	June, 1974,
	file system (V)\
</cite>.
</p>


HEADING(3, v6, V6 unix)

#include "blogn_t/023,c.07-v6.shell-session.html"
<p class="continuation">
Q.E.D.,
<a href="//vtree.nabijaczleweli.xyz/?Dennis_v6/v6doc#./man/man5/fs.5#L285">untouched</a> in
<cite>
	UNIX Programmer'<!--'-->s Manual, Sixth Edition,
	K. Thompson & D. M. Ritchie,
	May, 1975,
	file system (V)\
</cite>.
</p>


HEADING(3, v7, V7 unix)

#include "blogn_t/023,c.08-v7.shell-session.html"
<p class="continuation">
which for the first time correctly behaves according to the
<a href="//vtree.nabijaczleweli.xyz/?Henry_Spencer_v7#usr/man/man5/filsys.5#L242">still-intact</a>
paragraph in
<cite>
	UNIX Programmer'<!--'-->s Manual, Sixth Edition,
	K. Thompson & D. M. Ritchie,
	May, 1975,
	file system (V)\
</cite>,
with the corrected behaviour corresponding to
<a href="//vtree.nabijaczleweli.xyz/?Henry_Spencer_v7#usr/sys/sys/rdwri.c#L58">
	<tt>readi()</tt> zeroing an unused I/O buffer if the address of the data block is 0</a>.
</p>


HEADING(3, notes, Notes)

<p class="indented continued">
I noticed this when writing
<a href="//git.sr.ht/~nabijaczleweli/Research_fs_tap_tp_V/tree/d94a79dea35f399aaed69bbab04f0cb23d8bf6e6^/item/v1/fs.cpp#L107">a parser for the V1 filesystem</a>,
because I forgot about this case.
And then I noticed that when writing <a href="022-Utah_v4.html">the parser for V4 filesystems</a> I based it on,
I'd<!--'--> <a href="//git.sr.ht/~nabijaczleweli/Utah_v4/commit/813201026ba07a6dee2e5e14a669354b7e59f705">also forgotten about this case</a>
(the integrity of the <tt>v4root.tar</tt> dump is unaffected: there are no sparse files on the installation tape rootfs).
And then I realised I didn't think I'd seen these branches in
<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L3">V1 <tt>mget</tt></a> when reading it for <a href="023,b-DeFelice-polemic.html">the previous post</a>,
either.
</p>
<p class="indented continuing">
unix file system files contain 8 slots for links to 512-byte disk blocks.
If the file fits within that size, i.e. is no larger than 4KiB, it is "small", and those links point to data blocks directly.
In the samples above, <tt>big.<var>[sc]</var></tt> creates a 4KiB file with data in the first 8 bytes and the last 8 bytes,
so the rest is sparse: we see this in <a href="#v1-dump1"><tt>rf0</tt> dump 1</a>,
where the start of <tt>big</tt>
(file <strong>123</strong> (I didn't renumber these, it's just fortuitous))
is contained in block 300
and the end — in block 302.
The middle un-written-to blocks are 0 (not allocated).
</p>
<p class="indented continuing">
Bigger files are deemed "large" and the 8 slots point to "indirect" blocks, which themselves contain 256 slots for disk block links.
<tt>large.<var>[sc]</var></tt> makes a 64KiB file in the same manner as <tt>big.<var>?</var></tt>,
so we observe that <tt>large</tt> (file <strong>126</strong>)
contains one direct link to block 304, which links to blocks 303 and (appropriately further on) 305.
The contents of those blocks are the same as 300 and 302.
(It's<!--'--> impossible to make a bigger (sparse or otherwise) file in V1 because all file offsets are 16 bits; this is immaterial.
 The maximum theoretical size of a large file is 1MiB, and later unix/**/es allow addressing this in
 <a href="//vtree.nabijaczleweli.xyz/?Dennis_v4#./man2/seek.2">decreasingly</a>
 <a href="//vtree.nabijaczleweli.xyz/?Henry_Spencer_v7#usr/man/man2/lseek.2">hacky</a>
 ways.)
</p>
<p class="indented continuation">
To wit: a unix file system file consists of sequence of "(read block <var>n</var>) or (insert 512 zero bytes)",
and reading it sequentially consists of traversing that list, in order, until you've<!--'--> read as much data as the file is large.
Small files inline that sequence for performance, large files keep it in chunks on disk
(and if a chunk is missing, that's<!--'--> equivalent to 256× "insert 512 zero bytes").
If implemented this way, our original definition (and description from the manual) is fulfilled.
</p>

<p class="indented continued">
But, as observed above, this is not how unix (before V7) implements this:
in <a href="#v1-cat">the cat log</a>, we can see that just reading the file allocates <em>every</em> formerly-sparse block:
<tt>df</tt> loses 6 (8 − 2) and 126 (also the amount of sparse blocks between 300 and 302 in the indirect block) blocks respectively,
and in <a href="#v1-dump2">the subsequent dump</a> we observe this directly:
every previously-zero block within the bounds of the file was allocated (unsparsed) and now <em>actually</em> links to a block full of zeroes.
</p>
<p class="indented continuing">
To see why, we can trace the
	<tt>sys read (II)</tt>
path through
 	<tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u1#L327">sysread</a></tt>
→	<tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u6#L3">readi</a><small>node</small></tt>
→	<tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u6#L85">dskr</a> <small>(the read routine for non-special files)</small></tt>
→	<tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L3">mget</a></tt>
(noting that <tt>sys write (II)</tt> is <a href="023,b-DeFelice-polemic.html#dskw-C">basically the same</a> but <tt>memcpy</tt>s the other way;
 comments verbatim from
 <cite>
 	<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/PreliminaryUnixImplementationDocument_Jun72.pdf#page=2">
 		Preliminary Release of UNIX Implementation Document</a>,
 	J. DeFelice,
 	6/20/72
 </cite>
 except where [indicated],
 <tt>_</tt>-prefixed names expositional,
 <tt><q>drum</q></tt> is what they sometimes call the small disk containing the rootfs at this time):
</p>
#include "blogn_t/023,c.09-v1-dskr.oldc.html"
#include "blogn_t/023,c.10-v1-mget.oldc.html"
<p class="continuing">
where we see that reading/writing <var>n</var> bytes from/to file <var>f</var> at offset <var>o</var> is equivalent to
</p>
<ol>
	<li>ensuring all blocks in <var>f</var> containing [<var>o</var>, <var>o</var>+<var>n</var>) are allocated, then</li>
	<li>doing the read/write from/to the affected blocks.</li>
</ol>
<p class="continuing">
This is fine for writing, and equivalent to just 2.
But 1. means the interface from the manual isn't fulfilled (thus, unix doesn't have sparse files before V7)
and means this is more-so an implementation detail optimisation that ensures every I/O read completes in 1-3 I/Os
instead of <var>m</var> = blocks(<var>o</var> - <var>f.size</var>).
</p>
<p class="indented continuing">
Unless, of course, you always seek to the same offset before reading.
But that runs counter to unix's<!--'--> file-as-bag-of-bytes model,
and imposes a certain structure to the file and makes it behave differently based on access pattern,
which, again, runs counter to documentation and marketing of the time —
<cite><a href="//www.tuhs.org/Archive/Distributions/Research/McIlroy_v0/UnixEditionZero-OCR.pdf#page=3"
     >DRAFT: The UNIX Time-Sharing System, D. M. Ritchie</a>,
	    <a href="//www.tuhs.org/Archive/Distributions/Research/McIlroy_v0/Readme"><q>mid-1971</q></a></cite>
</p>
#define u(...) <u>__VA_ARGS__</u>
<blockquote class="continuing"><pre class="continuing">\
u(3).u(1) u(Ordinary) u(Files)
A file contains whatever information the user places there, for
example symbolic or binary (object) programs. No particular
structuring is expected by the system. DEL
A few user programs generate and expect files with
more structure; DEL
however, the structure of files is controlled solely by the
programs which use them, not by the system.
<!---->
u(3).u(5) u(System) u(I)/u(O) u(Calls)
DEL There
is no distinction between "random" and sequential I/O, nor is any
logical or physical record size imposed by the system. The size
of a file on the disk is determined by the location of the last
piece of information written on it; no predetermination of the
size of a file is necessary.\
</pre></blockquote>
<p class="continuing">
— as well as those going forward
(cf. <cite><a href="//youtu.be/tc4ROCJYbm0">The UNIX™ System: Making Computers More Productive, 1982, Bell Laboratories</a></cite>,
 transcribed in <a href="023,b-DeFelice-polemic.html#Making Computers More Productive">the previous post</a>).
</p>
<p class="indented continuing">
Because the files afflicted by this are valid, just much bigger than they ought to be,
the only way you really could notice this is by examining the filesystem directly trying to look precisely for this behaviour, as I have?
or, on quiet system, check precisely the interaction of this behaviour and <tt>df</tt>?
Being fixed in V7 agrees with this because it implies to me that this facility had started to be used like we'd<!--'--> use sparse files today
— with large <var>nominal file size/filesystem size</var> ratios —
on the huge unix ≤V6 install base, someone filled their disk, and the fix is pretty simple.
</p>


HEADING(3, v1-patch, V1 unix patch)

#include "blogn_t/023,c.11-v1-patch.diff.html"
<center class="continuing"><small>You can also <a href="/content/assets/blogn_t/023,c.01-v1-patch.diff">download</a> this diff directly.</small><br /></center>

<p class="indented">
With the patch, when it encounters a 0 link and <tt>mget0b</tt> is non-zero,
<tt>mget</tt> will return block <tt>mget0b</tt> on <tt>rf0</tt>.
Because <tt>mget</tt> needs to return a block number (on the current device),
this is the least intrusive way of implementing this,
but it means <tt>mget</tt> needs to be careful to maintain the notion of the "current device" to mean "the device containing the current i-node"
outside of this exceptional return,
since the latter will vary when reading a file from the mounted filesystem.
<tt>dskr</tt> sets <tt>mget0b</tt> to 1
— <a href="023,b-DeFelice-polemic.html#2">due to the unique way the V1 unix file system is laid out</a>,
  block 1 on the rootfs can't<!--'--> usefully be anything except full of zeroes —
<tt>dskw</tt> clears <tt>mget0b</tt> to get the old behaviour.
The procedure for building and installing a thusly-updated kernel in a unix72 environment is outlined in post
<a href="023,a-v1-nbuf-benchmark.html"><tt>023,a. V1 unix I/O buffer count vs. performance benchmark</tt></a>.
</p>

<style>
/*.token.keyword, .token.property, .token.selector, .token.constant, .token.symbol, .token.builtin*/ .token.coord {
  color: hsl(53,89%,79%);
}
</style>
#include "blogn_t/023,c.12-v1-patched-cat.shell-session.html"

<p class="indented">
<tt>df</tt> and a direct examination confirm the blocks are unchanged by the read
(and <tt>cdev</tt> is restored properly),
but are not required because the <tt>cat</tt> completes significantly faster.
</p>

<div class="is-C">
#include "blogn_t/023,c.13-v1-patch-c.diff.html"
</div>


BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
