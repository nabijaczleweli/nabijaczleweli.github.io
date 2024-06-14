<!--
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->

#include "../writing/writing.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Mon, 10 Jun 2024 01:04:14 +0200" -->
#define POST_DATE      Mon, 10 Jun 2024 01:04:14 +0200
#define POST_POST_DATE

#define Tn(...)  <span class="smallcaps">__VA_ARGS__</span>
#define CMT(...) <span class="cmt">__VA_ARGS__</span>

#ifdef linux
#undef linux
#endif
#ifdef unix
#undef unix
#endif


BOILERPLATE(014. PID 0 in V1 UNIX (and V4 nsys, and the PDP-7 proto-UNIX) — blognꞌt, 014. PID 0 in V1 UNIX (and V4 nsys, and the PDP-7 proto-UNIX), en-GB, <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" /> BLOGN_T_STYLESHEETS WORD_COUNT_SCRIPT_NON_ENGLISH)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"


/**/#PreliminaryUnixImplementationDocument_Jun72-toc                   { padding-left: 6em; }
/**/#PreliminaryUnixImplementationDocument_Jun72-toc > li::marker      { font-family: "Droid Sans Mono", monospace;   }
/**/#PreliminaryUnixImplementationDocument_Jun72-toc > li:nth-child(1) { list-style-type: "2: ";      }
/**/#PreliminaryUnixImplementationDocument_Jun72-toc > li:nth-child(2) { list-style-type: "E.0–E.10: "; }
/**/#PreliminaryUnixImplementationDocument_Jun72-toc > li:nth-child(3) { list-style-type: "E.11: ";     }
/**/#PreliminaryUnixImplementationDocument_Jun72-toc > li:nth-child(4) { list-style-type: "E.12: ";     }
/**/#PreliminaryUnixImplementationDocument_Jun72-toc > li:nth-child(5) { list-style-type: "F: ";        }
/**/#PreliminaryUnixImplementationDocument_Jun72-toc > li:nth-child(6) { list-style-type: "G: ";        }
/**/#PreliminaryUnixImplementationDocument_Jun72-toc > li:nth-child(7) { list-style-type: "H.0–H.9: ";  }

.manual {
	border: 0.25em solid;
	padding: 0.25em;
	width: calc(100% - 2.75em);
	margin-right: 1em;
}

.manual, .manual > pre {
	font-family: "Droid Sans Mono", monospace;
}
.manual > a, .manual dt {
	text-transform: uppercase;
}
.manual > a {
	display: block;
	color: inherit;
	text-decoration: none;
}
.manual > a > div {
	float: right;
}
.manual > dl {
	margin: 0.5em 0 0 0;
}
.manual > dl > div {
	margin: 0.25em 0;
}
.manual dt {
	float: left;
}
.manual dd {
	margin-left: 8em;
	white-space: pre-wrap;
}

@media all and (max-device-width: 800px) {
	.manual, .u69 {
		margin-left: 0;
		margin-right: 0 !important;
	}

	.manual {
		width: calc(100% - .75em) !important;
	}

	.u69 {
		width: calc(100% - .25em) !important;
	}
}



.u69 {
	border: 0.25em solid;
	padding-left: 0;
	width: calc(100% - 2.25em);
	margin-right: 1em;
}

.u69, .u69 > pre {
	font-family: "Droid Sans Mono", monospace;
}
.u69 > a {
	display: block;
	color: inherit;
	text-decoration: none;
}
.u69 > a > span, .u69 > a > div {
	font-weight: bold;
}
.u69 > a > span {
	margin-left: 1em;
}
.u69 > a > div {
	left: 35%;
	position: absolute;
	display: inline-block;
}
.u69 > pre {
	margin: 0;
	padding: 0.25em;
	border-top: 0.125em solid;
	background: #80808030;
}

@media (prefers-color-scheme: dark) {
	.u69 > pre {
		background: #00000030;
	}
}


.cmt {
	opacity: 50%;
}
.comment {
	opacity: 80%;
	filter: sepia(70%);
}
@media (prefers-color-scheme: light) {
	.comment {
		opacity: 75%;
	}
}

pre {
	     tab-size: 8;
	-moz-tab-size: 8;
	max-width: 100%;
	overflow-x: auto;
}

.codecontinued > pre {
	margin-top: 0;
	margin-bottom: 0;
}
</style>


BLOGN_T_HEADING(014. PID 0 in V1 UNIX (and V4 nsys, and the PDP-7 proto-UNIX))

HEADING(2, v1, The UNIX Programmer'<!--'-->s Manual (&c.))

<p class="indented continued">
<a href="//blog.dave.tf/post/linux-pid0/">David Anderson'<!--'-->s <cite>What is PID 0?</cite></a>
(on <a href="//hachyderm.io/@danderson/112577183087638679">mastussy</a>)
analyses the popular misconceptions (or, indeed, one guy'<!--'-->s wikipedia edit) of if, and what, PID 0 is,
but stops its retrospective at Version 4 Tn(unix) because it'<!--'-->s the first one written in C.
This, in many ways, is like stopping a retrospective on the Great War when the British joined because they talk weird in Sarajevo.
Thankfully, I talk exactly as weird, and am similarly ready to shoot a prince.
Has this protracted {slavic/english} {unix/war} {franz-ferdinand/englishman} analogy overstayed its welcome yet.
</p>
<p class="indented continuing">
To rectify this, and analyse it forward rather than in reverse, we can take advantage of unix72
(or <a href="//code.google.com/archive/p/unix-jun72/">unix-jun72</a>
 (but the one and only SVN dump tarball calls it <samp>unix72/</samp>,
  as does <a href="//github.com/bambams/unix72">a mirror</a>
  (note that it says it's a fork but it actually appears to have SVN-imported commits exclusively, unlike the "original" which has been damaged; it's all bad));
 the more real mirror is <a href="//www.tuhs.org/"><abbr title="TUHS">The Unix Heritage Society</abbr></a>'<!--'-->s
 (one of them; the <a href="//wiki.tuhs.org/doku.php?id=source:unix_archive">TUHS mirror structure</a> is sociopathic)
 which reproduces said dump as <a href="http://ftp.okass.net/pub/mirror/minnie.tuhs.org/Distributions/Research/Dennis_v1/"><samp>svntree-20081216.tar.gz</samp></a>)
which transcribes
<cite><a href="//bitsavers.org/pdf/att/unix/Early_UNIX/PreliminaryUnixImplementationDocument_Jun72.pdf">Jim DeFelice'<!--'-->s 1972-06-20 <samp>Preliminary Release of UNIX Implementation Document</samp></a></cite>,
which itself includes
</p>
<ol id="PreliminaryUnixImplementationDocument_Jun72-toc">
	<li>a driver (in the form of a patch) for the <a href="//w140.com/tekwiki/wiki/4002">T4002A graphics terminal</a> (2 pgs)</li>
	<li>Tn(unix) (11 segments (<code>u0</code>, …, <code>u<var>n</var></code>, …, <code>u9</code>, <code>ux</code>), described in <code>F</code>; 80 pgs)</li>
	<li><samp>/bin/sh</samp> (7 pgs)</li>
	<li><samp>/etc/init</samp> (4 pgs)</li>
	<li><q>System Overview</q>, which is all the shit they couldn'<!--'-->t stuff elsewhere (17 pgs)</li>
	<li><q>Data Base Item Descriptions</q>, or, in modern parlance, all the kernel variables (12 pgs)</li>
	<li>effectively manual sexion 9 (kernel subroutines) (10 subsexions, internally counted as <samp>U<var>nn</var></samp>, matching the <code>H.<var>nn</var></code> segments; 156 pgs)</li>
</ol>
<p class="continuing">
<code>H.0–H.9</code> is a re-print of
<cite><a href="//bitsavers.org/pdf/att/unix/Early_UNIX/Kernel_Subroutine_Descriptions_Mar72.pdf">our current UNIX documentation</a> as of 1972-04-03, also by Jim DeFelice</cite>.
Both are <a href="http://ftp.okass.net/pub/mirror/minnie.tuhs.org/Distributions/Research/Dennis_v1/">redistributed by the TUHS</a>.
This is a different Jim DeFelice than the famous author
(but I'm basing that entirely off the fact that the author would've been 11 when he started at Bell. maybe americans allow this).
</p>
<p class="indented continuing">
Aptly, <code>F</code>, 1. Overview says that
</p>
<blockquote class="continuing">
There are three major portions of UNIX: the file system, the process control system, and the rest.
</blockquote>
<p class="continuing">and</p>
<blockquote class="continuing">
It has been mentioned parenthetically that UNIX is not very modular.
Its lack of modularity is reflected in this document.
Therefore (to paraphrase Fenichel and McIlroy referring to their description of TMGL) no single order of reading can be recommended;
instead a chimneying technique is suggested, climbing not one wall at a time, but all simultaneously.
</blockquote>
<p class="continuing">
but, besides a truly astounding slew of typos (at best it's the "process wail facility", at worst it's gibberish)
the sexion nevertheless contains relevant information on process lifetime and syscall and scheduler design,
both as a general overview of fundamental Tn(UNIX) semantics <em>and</em> as implementation minutiae.
</p>
<p class="continuing indented">
For our case, the most interesting part of scheduler design is that the document implies there is none:
<q>The system can legitimately be entered only by some sort of trap CMT(…) that is, sys</q>,
further backed up by
<q>\
At sysret, CMT(…) a check is made to determine if the user'<!--'-->s time quantum ran out during his execution in the system.
If so, tswap is called to give another user a chance to run.\
</q>
which implies a per-user quantum-overflow-only (this is a period-accurate way of spelling "time slice") re-scheduling (to another user) only at syscalls,
but there <em>is</em> very much a timer interrupt:
</p>

<blockquote class="u69 continuing" id="#interrupt vectors">
	<a href="#interrupt vectors">
		<span>u0</span>
		<div>interrupt vectors</div>
	</a>
	<pre>\
<!--"-->. = orig+60<!--"-->
<!--"-->       ttyi;240 <span class="comment">/ interrupt vector tty in       ; processor level 5</span><!--"-->
<!--"-->       ttyo;240 <span class="comment">/ interrupt vector tty out</span><!--"-->
<!--"-->       ppti;240 <span class="comment">/                  punch papertape in</span><!--"-->
<!--"-->       ppto;240 <span class="comment">/                  punch papertape out</span><!--"-->
<!--"-->       clock;340 <span class="comment">/ clock interrupt vector       ; processor level 7</span><!--"-->
<!--"--> . = orig+200<!--"-->
<!--"--><span class="comment">/     lpto; 240  line printer interrupt     ; processor level 5 (future)</span><!--"-->
<!--"--> . = orig+204<!--"-->
<!--"-->       drum;300 <span class="comment">/ drum interrupt         ; processor level 6</span><!--"-->\
</pre>
</blockquote>

<blockquote class="u69 continuing" id="#clock">
	<a href="clock">
		<span>u4</span>
		<div>clock:</div>
	</a>
	<pre>\
<!--"-->clock: <span class="comment">/ interrupt from 60 cycle clock<!--"--></span>
<!--"-->       mov     r0,-(sp) <span class="comment">/ save r0<!--"--></span>
<!--"-->       tst     *$lks <span class="comment">/ restart clock?<!--"--></span>
<!--"-->       mov     $s.time+2,r0 <span class="comment">/ increment the time of day<!--"--></span>
<!--"-->       inc     (r0)<!--"-->
CMT(…)
<!--"-->       mov     $uquant,r0 <span class="comment">/ decrement user time quantum<!--"--></span>
<!--"-->       decb    (r0)<!--"-->
<!--"-->       bge     1f <span class="comment">/ if less than 0<!--"--></span>
<!--"-->       clrb    (r0) <span class="comment">/ make it 0<!--"--></span>
<!--"-->1: <span class="comment">/ decrement time out counts return now if priority was not 0<!--"--></span>
<!--"-->       cmp     4(sp),$200 <span class="comment">/ ps greater than or equal to 200<!--"--></span>
<!--"-->       bge     2f <span class="comment">/ yes, check time outs<!--"--></span>
<!--"-->       tstb    (r0) <span class="comment">/ no, user timed out?<!--"--></span>
<!--"-->       bne     1f <span class="comment">/ no<!--"--></span>
<!--"-->       cmpb    sysflg,$-1 <span class="comment">/ yes, are we outside the system?<!--"--></span>
<!--"-->       bne     1f <span class="comment">/ no, 1f<!--"--></span>
<!--"-->       mov     (sp)+,r0 <span class="comment">/ yes, put users r0 in r0<!--"--></span>
<!--"-->       sys     0 / sysrele<!--"-->
<!--"-->       rti<!--"-->\
</pre>
</blockquote>
<p class="indented continuation">
Syntactic informer: addresses in the form <samp>1f</samp>, <samp>2b</samp>, &c.
Indicate the address of "next label 1, forward" and "next label 2, backward".
Also, notice how there'<!--'-->s a <samp>$</samp> sometimes in front of numbers or addresses?
This means "this is a number/pointer, not a variable to dereference".
Usually. This is vibes-based.
Also also, I gave up trying to highlight this shit (sorry).
</p>

<p class="continued">
Which corresponds to <code>sys rele (II)</code> (p. 128) in the <cite><a href="http://ftp.okass.net/pub/mirror/minnie.tuhs.org/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf">UNIX Programmer'<!--'-->s Manual</a></cite>:
</p>
<blockquote class="manual continuing" id="sys rele (ii)">
	<a href="#sys rele (ii)">
		<span>11/3/71</span>
		<div>sys rele (ii)</div>
	</a>
	<dl>
		<div><dt>name</dt>       <dd>rele  --  release processor</dd></div>
		<div><dt>synopsis</dt>   <dd>sys       rele  / rele = 0;  not in assembler</dd></div>
		<div><dt>description</dt><dd>This call causes the process to be swapped out immediately if another process wants to run.<!--"--> <!--"--> \
		                             Its main reason for being is internal to the system, namely to implement timer-runout swaps.<!--"--> <!--"--> \
		                             However, it can be used beneficially by programs which wish to loop for some reason without consuming more processor time than necesary.</dd></div>
	</dl>
</blockquote>
<p class="continuing">
and indeed <code>sysrele</code> just calls <code>tswap</code>, which has little to do with the user (indeed <code>u.uid</code> isn'<!--'-->t mentioned),
and resets the timer thusly:
</p>
<blockquote class="u69 continuing" id="tswap">
	<a href="#tswap">
		<span>u3</span>
		<div>tswap:</div>
	</a>
	<pre>\
<!--"-->       movb    $30.,uquant <span class="comment">/ initialize process time quantum</span><!--"-->
<!--"-->       rts     r0 <span class="comment">/ return</span><!--"-->\
</pre>
</blockquote>
<p class="continuing">
so, a "process time", not a "user time".
Indeed, we can attribute this confusion to the author'<!--'-->s misconstruance of "user" (and the various <code>u.CMT(…)</code> variables) in the comments
as referring to the user (as in a system user) where it'<!--'-->s usually used as <!--"-->"current user-space process Tn(unix) is interrupting"<!--"-->.
</p>
#define BASE(n, ...) <sub __VA_ARGS__>(n)</sub>
<p class="indented continuation">
So, if I'<!--'-->m reading this right, then a normal-priority process (I cut off a lot of other bollocks from <code>clock</code>)
will get to run for around 30 ticks / 60Hz = 500ms without making any syscalls before being considered for swapping out,
while a high-priority process will only be considered for swapping out after it makes a syscall.
</p>

<p class="indented continued">
Now that we've established a bidirexionally-adversarial rapport with the text, it's time to really analyse it.
Note that to assemble the unix72 scans back into files, you can run <code>tools/rebuild</code>, and this will also apply patches from <code>patches/core/</code>;
these wouldn'<!--'-->t materially affect this analysis, but it is nevertheless performed on the unpatched source.
</p>
<p class="indented continuing">
There is one interesting patch, not applied by default: <code>cold.patch</code>.
This, shockingly, sets the <code>cold</code> flag in <code>u0</code>,
which <em>creates the root filesystem on boot</em>.
This is inextricably linked with the
</p>
<blockquote class="manual continuing" id="boot procedures (vii)">
	<a href="#boot procedures (vii)">
		<span>11/3/71</span>
		<div>boot procedures (vii)</div>
	</a>
	<dl>
		<div><dt>name</dt>       <dd>bos, maki, rom, vcboot, msys, et al</dd></div>
		<div><dt>synopsis</dt>   <dd>--</dd></div>
		<div><dt>description</dt><dd>\
On the RF disk CMT(<span class="roboto-unscale roboto">(this is the fixed disk with the root filesystem on it)</span>), the highest 16K words are reserved for stand-alone programs.<!--"-->  <!--"-->\
These 16K words are allocated as follows:
<!---->
<!--"-->bos		(1K)<!--"-->
<!--"-->Warm UNIX	(6K)<!--"-->
<!--"-->Cold UNIX	(6K)<!--"-->
<!--"-->unassigned	(6K)<!--"-->
<!---->
The UNIX read only memory (ROM) is home cut<!---->CMT([?]) with 2 programs of 16 words each.<!--"-->  <!--"-->\
The first CMT(…) reads <u>bos</u> from the RF disk into core CMT([and transfers to it]).
<!---->
CMT(…)
<!---->
The program <u>bos</u> (Bootstrap Operating System) examines the console switchs and executes one of several internal programs CMT(…).<!--"-->  <!--"-->\
The following settings are currently recognized:
<!---->
<!--"-->173700<!--"-->
<!--"-->73700	Will read Warm UNIX from the RF into core location 0 and transfer to 400,<!--"-->
<!---->
<!--"-->1	Will read Cold UNIX from the RF into core location 0 and transfer to 400,<!--"-->
<!---->
<!--"-->2	Will read the unassigned 3K program into core location 0 and transfer to 400,<!--"-->
<!---->
CMT(…)
<!---->
Thus we come to the UNIX warm boot procedure: put 173700 into the switches, push <u>load</u> <u>address</u> and then push <u>start</u>.<!--"-->  <!--"-->\
The alternate switch setting of 73700 that will load warm UNIX is used as a signal to bring up a single user system for special purposes.<!--"-->  <!--"-->\
See /<u>etc</u>/<u>init</u>.
<!---->
Cold boots can be accomplished with the Cold UNIX program, but they'<!--'-->re not.<!--"-->  <!--"-->\
Thus the Cold UNIX slot on the RF may have any program desired.<!--"-->  <!--"-->\
This slot is, however, used during a cold boot.<!--"-->  <!--"-->\
CMT(<span class="roboto-unscale roboto">How to install the "UNIX INIT DECtape", what to press to run it, and what programs are on it, is explained in grueling detail here.</span>)\
</dd></div>
	</dl>
</blockquote>
<p class="continuation">
There is so much more, and it is all genuinely interesting and on page 195.
Also, all programmers being illiterate is clearly not a novel phenomenon.
</p>

<p class="indented">
It <em>was</em> relatively obvious that the entry point was <del><code>400</code></del> just the first bit of code in <code>u0</code>,
but it'<!--'-->s good to know this for sure.
That said: let'<!--'-->s initialise.
</p>

<blockquote class="u69 continued" id="constants">
	<a href="#constants">
		<span>u0</span>
		<div>constants</div>
	</a>
	<pre>\
<!--"-->nproc = 16. <span class="comment">/ number of processes</span><!--"-->
<!--"-->nfiles = 50.<!--"-->
<!--"-->ntty = 8+1<!--"-->
<!--"-->nbuf = 6<!--"-->
<!--"--> .if cold <span class="comment">/ ignored if cold = 0</span><!--"-->
<!--"-->nbuf = 2<!--"-->
<!--"-->.endif<!--"-->
<!---->
<!--"-->core = orig+40000  <span class="comment">/ specifies beginning of user's core</span><!--"-->
<!--"-->ecore = core+20000 <span class="comment">/ specifies end of user's core (4096 words)</span><!--"-->\
</pre>
</blockquote>
<blockquote class="u69 continuation" id="entry point">
	<a href="#entry point">
		<span>u0</span>
		<div>entry point</div>
	</a>
	<pre>\
<!--"-->. = orig+400<!--"-->
<!--"--><span class="comment">/ copy in transfer vectors</span><!--"-->
<!---->
<!--"-->	mov    $ecore,sp <span class="comment">/ put pointer to ecore in the stack pointer</span><!--"-->
<!--"-->	jsr    r0,copyz; 0; 14 <span class="comment">/ clear locations 0 to 14 in core</span><!--"-->
<!--"-->	mov    $4,r0<!--"-->
<!--"-->	clr    r1<!--"-->
<!--"-->	mov    r0,(r1)+ <span class="comment">/ put value of 4 into location 0</span><!--"-->
<!--"-->	mov    r0,(r1)+ <span class="comment">/ put value of 4 into location 2</span><!--"-->\
</pre>
</blockquote>

<p class="indented continued">
Historical and syntactic reminder: nothing is hexadecimal yet.
Numbers that end with a full stop are decimal (there are <code>16</code> processes that can have <code>50</code> file descriptions open),
everything else is octal
(the <q>beginning of user'<!--'-->s core</q> (smallest userspace address) is <code><var>orig</var>+40000<!---->BASE(8, class="roboto")</code> = <code><var>0</var>+16384<!---->BASE(10, class="roboto")</code>,
 and the maximal userspace address is thus <code><var>core</var>+20000<!---->BASE(8, class="roboto")</code> = <code><var>16384(10)</var>+8192<!---->BASE(10, class="roboto")</code>,
 thus the userspace has <var>ecore</var>−<var>core</var> = 8192<!---->BASE(8) bytes = 4096 words,
 which is congruent with the comment).
But there are <code>8+1</code>=9 ttys, even though 8 is not in octal. Wondrous.
</p>
<p class="indented continuation">
This bit doesn'<!--'-->t really do much, except initialise three interrupt vectors (one shown) which are overridden by the a.out header (and thus commented out).
This corresponds to pages in section E.0 in <a href="//bitsavers.org/pdf/att/unix/Early_UNIX/PreliminaryUnixImplementationDocument_Jun72.pdf">the PDF</a>,
which is physical page 6 (and companion section H.0 which is physical page 126).
It'<!--'-->s convenient to follow along (indeed, these tend to be annotated by hand (with a pen) with relevant metatext).
</p>

<blockquote class="u69 continued" id="memory initialisation">
	<a href="#memory initialisation">
		<span>u0</span>
		<div>memory initialisation</div>
	</a>
	<pre>\
<!--"--><span class="comment">/ clear core</span><!--"-->
<!--"-->	.if cold <span class="comment">/ ignored if cold = 0</span><!--"-->
<!--"-->	halt <span class="comment">/ halt before initializing rf file system; user has</span><!--"-->
<!--"-->             <span class="comment">/ last chance to reconsider</span><!--"-->
<!--"-->	.endif<!--"-->
<!---->
<!--"-->	jsr    r0,copyz; systm; ecore <span class="comment">/ clear locations systm to ecore</span><!--"-->
<!--"-->	mov    $s.chrgt+2,clockp <span class="comment">/ intialize clockp</span><!--"-->
<!--"--><span class="comment">/ allocate tty buffers; see H.0 for description</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ allocate disk buffers; see H.0 for description</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ set devices to interrupt</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ set up time out subroutines</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ free all character blocks; see H.0 for description</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ set up drum swap addresses; see H.0 for description</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ free rest of drum</span><!--"-->
<!--"-->	.if cold<!--"-->
CMT(…)
<!--"--><span class="comment">/ zero i list</span><!--"-->
CMT(…)
<!--"-->	.endif<!--"-->\
</pre>
</blockquote>
<p class="continuing">
<code>systm</code> is the start of the kernel variable block (all of which reside in <code>ux</code>, and <code>systm</code> is actually the root filesystem superblock), and is the last thing before <code>core</code>.
</p>
<p class="indented continuing">
Note that <code>s.chrgt</code> is just a variable (symbol) called <var>s.chrgt</var>.
Given the <code><q>$</q></code>,
the <code>mov</code> can be expressed as (in C parlance) "<samp>clockp = (char *)(&s.chrgt) + 2</samp>".
</p>
<p class="indented continuing">
Do not be confused by the convenient naming: <code>r0</code> is just a variable. The PDP-11 has no registers.
</p>
<p class="indented continuing">
<q>The drum</q> refers <em>not</em> to an actual drum but the RF fixed disk where the root filesystem is
(the one from boot procedures (VII) with the kernels and BPP on it).
But they'<!--'-->re <em>really</em> adamant about calling it a "drum" and contrasting it to disks (as in the 2.5MB "RK" removable disk with /usr),
and <em>only</em> doing so in the kernel source and this <cite>Implementation Document</cite> that I deadass thought there was another device,
and not shown to the userspace. The nomenclature is so ancient it's like it's from another dimension.
But yes, the root disk has 1024 512-byte blocks.
The top 64 (32kB) are <q>set aside for storing UNIX itself</q> and this is the bit with the kernels and BPP in it,
then the processes get 17 blocks each (8.5kB; this is congruent with having 8kB of userspace RAM + 1 accounting block consisting of the <var>user</var> label (which includes all <var>u.CMT(…)</var> variables)).
Thus we can eke out the formatting of the fixed disk as <samp>[/: 344kB; swap: 16·8.5kB=136kB; bootloader area: 32kB]</samp>.
</p>
<p class="indented continuation">
The next two bits effectively do <samp>mkfs /dev/rf0 /</samp> (on the cold kernel) by zeroing most of it out and configuring the superblock accordingly,
with user data reaching up to block 687 (which matches <span style="white-space: nowrap;">1024−64−17·(<var>nproc</var>=16)</span> so the entire disk is accounted for).
</p>

<blockquote class="u69 continued" id="magick">
	<a href="#magick">
		<span>u0</span>
		<div>magick</div>
	</a>
	<pre>\
<!--"--><span class="comment">/ make current program a user</span><!--"-->
<!---->
<!--"-->	mov    $41.,r0 <span class="comment">/ rootdir set to 41 and never changed</span><!--"-->
<!--"-->	mov    r0,rootdir <span class="comment">/ rootdir is i-number of root directory</span><!--"-->
<!--"-->	mov    r0,u.cdir <span class="comment">/ u.cdir is i-number of process current directory</span><!--"-->
<!--"-->	mov    $1,r0<!--"-->
<!--"-->	movb   r0,u.uno <span class="comment">/ set process table index for this process to 1</span><!--"-->
<!--"-->	mov    r0,mpid <span class="comment">/ initialize mpid to 1</span><!--"-->
<!--"-->	mov    r0,p.pid <span class="comment">/ p.pid identifies process</span><!--"-->
<!--"-->	movb   r0,p.stat <span class="comment">/ process status = 1 i.e., active</span><!--"-->
<!--"-->                         <span class="comment">/                = 0 free</span><!--"-->
<!--"-->	.if cold         <span class="comment">/                = 2 waiting for a child to die</span><!--"-->
<!--"-->                         <span class="comment">/                = 3 terminated but not yet waited</span><!--"-->
<!--"-->                         <span class="comment">/                  for</span><!--"-->\
</pre>
</blockquote>
<p class="continuing">
This is where the magic happens. This is what you came here for. Let'<!--'-->s prototype this in C for the gamers:
</p>
<div class="codecontinued">
#include "blogn_t/014.01-magick.c.html"
</div>
<p class="continuing">
This means, in order:
</p>
<p class="indented continuing">
<var>rootdir</var> is just a constant, but defined as a symbol.
/ is defined as being i-node 41, and this sets that.
(We have zeroed the whole variable block in the last step.)
</p>
<p class="indented continuing">
<var>u.cdir</var> is the i-node of the process'<!--'-->s working directory,
on device <var>u.cdev</var> (previously zeroed, and 0 = RF),
so the process we are becoming is now in /.
</p>
<p class="indented continuing">
<var>u.uno</var> is the 1-based index into the process table (<var>p.CMT(…)</var>) of the current process, and 0 is used as a sentinel to mean "no process, you <em>must</em> swap me out".
</p>
<p class="indented continuing">
<var>mpid</var> is the global PID counter. On <samp>sys fork</samp> (II), a new process is assigned <samp>p.pid[…] = ++mpid;</samp>.
</p>
<p class="indented continuation">
<var>proc</var> (under which all <var>p.CMT(…)</var> variables are found),
is the process table (though notice how it'<!--'-->s intrusively structured as arrays per-field rather than an array of objects; remember: no objects).
Thus, <var>p.pid[n]</var> and <var>p.status[n]</var> are the PID and status of process <var>n</var>.
</p>

<p class="indented continued">
Thus, we can model the state before as:
</p>
<ul>
	<li>next PID = 1</li>
	<li>process table = {1..=16 = {free}}</li>
	<li>not executing a process</li>
</ul>
<p class="continuing">
and the state after as
</p>
<ul>
	<li>next PID = 2</li>
	<li>process table = {1 = {pid = 1, parent-pid = 0, not on the run queue, status = R}, 2..=16 = {free}}</li>
	<li>executing process 1 in kernel mode</li>
	<li>working directory: /</li>
	<li>UID (and all other parameters you can think of): 0</li>
</ul>
<p class="continuation">
and this is written in the correct order,
so you can't ever really say you're running PID 0
(like would be the case if the <var>p.pid</var> and <var>p.stat</var> assignments were swapped).
Between assigning <var>u.uno</var> and <var>p.stat</var> a <em>destroyed</em> process is running, which is SOP for sys exit (II) &c.
Admittedly, I don'<!--'-->t think the process would survive getting swapped out (or returned to at all), but it doesn't have to because we're in kernel mode.
</p>


<blockquote class="u69 continued" id="superblock">
	<a href="#superblock">
		<span>u0</span>
		<div>superblock</div>
	</a>
	<pre>\
CMT(<!--"-->	.if cold<!--"-->)
<!--"--><span class="comment">/ initialize inodes for special files (inodes 1 to 40.)</span><!--"-->
CMT((we will revisit this))
<!--"-->	.endif<!--"-->
<!---->
<!--"--><span class="comment">/ next 2 instructions not executed during cold boot.</span><!--"-->
<!--"-->	bis    $2000,sb0 <span class="comment">/ sb0 I/O queue entry for superblock on drum;</span><!--"-->
<!--"-->                         <span class="comment">/ set bit 10 to 1</span><!--"-->
<!--"-->	jsr    r0,ppoke <span class="comment">/ read drum superblock</span><!--"-->
<!--"-->1:<!--"-->
<!--"-->	tstb   sb0+1 <span class="comment">/ has I/O request been honored (for drum)?</span><!--"-->
<!--"-->	bne    1b <span class="comment">/ no, continue to idle.</span><!--"-->\
</pre>
</blockquote>
<p class="continuing">
By this time we still haven'<!--'-->t read in the superblock for the rootfs.
It'<!--'-->s always loaded as an invariant, and definitely before we do any filesystem operations.
</p>


<blockquote class="u69 continued" id="init">
	<a href="#init">
		<span>u0</span>
		<div>init</div>
	</a>
	<pre>\
<!--"-->1:<!--"-->
<!--"-->	decb   sysflg <span class="comment">/ mormally sysflag=0, indicates executing in system</span><!--"-->
<!--"-->	sys    exec; 2f; 1f <span class="comment">/ generates trap interrupt; trap vector =</span><!--"-->
<!--"-->                            <span class="comment">/ sysent; 0</span><!--"-->
<!--"-->	br     panic <span class="comment">/ execute file/etc/init</span><!--"-->
<!---->
<!--"-->1:<!--"-->
<!--"-->	2f;0<!--"-->
<!--"-->2:<!--"-->
<!--"-->	&lt;/etc/init\0> <span class="comment">/ UNIX looks for strings term, noted by nul\0</span><!--"-->
<!---->
<!--"-->panic:<!--"-->
<!--"-->	clr    ps<!--"-->
<!--"-->1:<!--"-->
<!--"-->	dec    $0<!--"-->
<!--"-->	bne    1b<!--"-->
<!--"-->	dec    $5<!--"-->
<!--"-->	bne    1b<!--"-->
<!--"-->	jmp    *$173700 <span class="comment">/ rom loader address</span><!--"-->\
</pre>
</blockquote>
<p class="continuing">
and once again for the gamers:
</p>
<div class="codecontinued">
#include "blogn_t/014.02-init.c.html"
</div>

<p class="continuing">
Once more, in order:
</p>
<p class="indented continuing">
<var>sysflg</var> is used as a flag that prevents running syscalls while in the kernel (see below).
This is what realistically delineates running in user and kernel modes
(indeed, some may say it'<!--'-->s a <code>flg</code> what indicates being in <code>sys</code>).
</p>
<p class="indented continuing">
<code>exec()</code> is exactly how you'<!--'-->d run it from userspace (since, well, we are now).
</p>
<p class="indented continuing">
If that fails, then we panic by clearing processor flags (idk) and jumping to the loader that loads the BOS (cf. boot procedures (VII)).
</p>
<p class="indented continuing">
But not before doing something sociopathic with the word at 0 (this would be the address to jump to for interrupt 0(?), and is <code>4</code>)
and the word at 5 (this is an odd address, so this is the high byte of the address for interrupt 1 (<code>unkni</code>/<code>sysent</code>) and the low byte of its processor flags word (0)).
Why?
</p>

<blockquote class="u69 continued" id="sysent">
	<a href="#sysent">
		<span>u1</span>
		<div>sysent:</div>
	</a>
	<pre>\
<!--"-->unkni: <span class="comment">/ used for all system calls</span><!--"-->
<!--"-->sysent:<!--"-->
<!--"-->	incb	sysflg <span class="comment">/ indicate a system routine is</span><!--"-->
<!--"-->	beq	1f <span class="comment">/ in progress</span><!--"-->
<!--"-->	jmp	panic <span class="comment">/ called if trap inside system</span><!--"-->
<!--"-->1:<!--"-->
CMT(<!--"-->	(rest of syscall handling)<!--"-->)\
</pre>
</blockquote>
<div class="codecontinued">
#include "blogn_t/014.03-sysent.c.html"
</div>
<p class="continuation">
(−1 if in userspace, 0 if in kernel, 1 if currently panicking).
</div>

<p class="indented continued">
This clearly demonstrates that in V1 there is <em>no</em> PID 0.
The system runs with no process, then it runs as a syscall of PID 1, then it runs <code>execl("/etc/init", "/etc/init", 0)</code> in PID 1, then it'<!--'-->s normal,
</p>

<blockquote class="u69 continued" id="superblock installation">
	<a href="#superblock installation">
		<span>u0</span>
		<div>superblock installation</div>
	</a>
	<pre>\
CMT(<!--"-->	.if cold<!--"-->)
<!--"--><span class="comment">/ initialize inodes for special files (inodes 1 to 40.)</span><!--"-->
<!---->
<!--"-->	mov    $40.,r1 <span class="comment">/ set r1=i-node-number 40.</span><!--"-->
<!--"-->1:<!--"-->
<!--"-->	jsr    r0,iget <span class="comment">/ read i-node 'r1' from disk into inode area of</span><!--"-->
<!--"-->                       <span class="comment">/ core and write modified inode out (if any)</span><!--"-->
<!--"-->	mov    $100017,i.flgs <span class="comment">/ set flags in core image of inode to indi-</span><!--"-->
<!--"-->                              <span class="comment">/ cate allocated, read (owner, non-owner),</span><!--"-->
<!--"-->                              <span class="comment">/ write (owner, non-owner)</span><!--"-->
<!--"-->	movb   $1,i.nlks <span class="comment">/ set no. of links = 1</span><!--"-->
<!--"-->	movb   $1,i.uid <span class="comment">/ set user id of owner = 1</span><!--"-->
<!--"-->	jsr    r0,setimod <span class="comment">/ set imod=1 to indicate i-node modified, also</span><!--"-->
<!--"-->                          <span class="comment">/ stuff time of modification into i-node</span><!--"-->
<!--"-->	dec    r1 <span class="comment">/ next i-node no. = present i-node no.-1</span><!--"-->
<!--"-->	bgt    1b <span class="comment">/ has i-node 1 been initialized; no, branch</span><!--"-->
<!---->
<!--"--><span class="comment">/ initialize i-nodes r1.,...,47. and write the root device, binary, etc.,</span><!--"-->
<!--"--><span class="comment">/ directories onto fixed head disk. user temporary, initialization prog.</span><!--"-->
<!---->
<!--"-->	mov    $idata,r0 <span class="comment">/ r0=base addr. of assembled directories.</span><!--"-->
<!--"-->	mov    $u.off,u.fofp <span class="comment">/ pointer to u.off in u.fofp (holds file</span><!--"-->
<!--"-->                             <span class="comment">/ offset)</span><!--"-->
<!--"-->1:<!--"-->
<!--"-->	mov    (r0)+,r1<span class="comment">/r1=41.,...,47; "0" in the assembled directory</span><!--"-->
<!--"-->                       <span class="comment">/ header signals last</span><!--"-->
<!--"-->	beq    1f      <span class="comment">/ assembled directory has been written onto drum</span><!--"-->
<!--"-->	jsr    r0,imap <span class="comment">/ locate the inode map bit for i-node 'r1'</span><!--"-->
<!--"-->	bisb   mq,(r2) <span class="comment">/ set the bit to indicate the i-node is not</span><!--"-->
<!--"-->                       <span class="comment">/ available</span><!--"-->
<!--"-->	jsr    r0,iget <span class="comment">/ read inode 'r1' from disk into inode area of</span><!--"-->
<!--"-->                       <span class="comment">/ core and write modified i-node on drum (if any)</span><!--"-->
<!--"-->	mov    (r0)+,i.flgs <span class="comment">/ set flags in core image of inode from</span><!--"-->
<!--"-->                            <span class="comment">/ assembled directories header</span><!--"-->
<!--"-->	movb   (r0)+,i.nlks <span class="comment">/ set no. of links from header</span><!--"-->
<!--"-->	movb   (r0)+,i.uid <span class="comment">/ set user id of owner from header</span><!--"-->
<!--"-->	jsr    r0,setimod <span class="comment">/ set imod=1 to indicate inode modified; also,</span><!--"-->
<!--"-->                          <span class="comment">/ stuff time of modification into i-node</span><!--"-->
<!--"-->	mov    (r0)+,u.count <span class="comment">/ set byte count for write call equal to</span><!--"-->
<!--"-->                             <span class="comment">/ size of directory</span><!--"-->
<!--"-->	mov    r0,u.base <span class="comment">/ set buffer address for write to top of directory</span><!--"-->
<!--"-->	clr    u.off <span class="comment">/ clear file offset used in 'seek' and 'tell'</span><!--"-->
<!--"-->	add    u.count,r0 <span class="comment">/ r0 points to the header of the next directory</span><!--"-->
<!--"-->	jsr    r0,writei <span class="comment">/ write the directory and i-node onto drum</span><!--"-->
<!--"-->	br     1b <span class="comment">/ do next directory</span><!--"-->
<!--"-->	.endif<!--"-->\
</pre>
</blockquote>

<p class="continuing">
Here-in:
</p>
<p class="indented continuing">
The first loop creates files 1–40 owned by UID 1 ("sys"), mode <samp>u=rw,o=rw</samp>
(normal creation semantics apply; there isn'<!--'-->t a "close" or "write",
 because only one i-node can be open at a time and <code>iget</code> will flush the current one before opening a new one).
The first real file is 41 (that'<!--'-->s the root directory), and i-nodes smaller than this are devices,
with the equivalent of the modern <var>maj:min</var> being just the i-node number:
</p>
<blockquote class="u69 continuation" id="iopen">
	<a href="#iopen">
		<span>u5</span>
		<div>iopen:</div>
	</a>
	<pre>\
<!--"-->iopen: <span class="comment">/ open file whose i-number is in r1</span><!--"-->
<!--"-->        tst    r1 <span class="comment">/ write or read access?</span><!--"-->
<!--"-->        blt    2f <span class="comment">/ write, go to 2f</span><!--"-->
<!--"-->        jsr    r0,access; 2 <span class="comment">/ get inode into core with read access</span><!--"-->
<!--"-->        cmp    r1,$40. <span class="comment">/ is it a special file</span><!--"-->
<!--"-->        bgt    3f <span class="comment">/ no. 3f</span><!--"-->
<!--"-->        mov    r1,-(sp) <span class="comment">/ yes, figure out</span><!--"-->
<!--"-->        asl    r1<!--"-->
<!--"-->        jmp    *1f-2(r1) <span class="comment">/ which one and transfer to it</span><!--"-->
<!--"-->1:<!--"-->
<!--"-->        otty   <span class="comment">/ tty</span><!--"-->
<!--"-->        oppt   <span class="comment">/ ppt</span><!--"-->
<!--"-->        sret   <span class="comment">/ mem</span><!--"-->
<!--"-->        sret    <span class="comment">/ rf0</span><!--"-->
<!--"-->        sret   <span class="comment">/ rk0</span><!--"-->
<!--"-->        sret   <span class="comment">/ tap0</span><!--"-->
<!--"-->        <!--"-->CMT(…)
<!--"-->        sret   <span class="comment">/ tap7</span><!--"-->
<!--"-->        ocvt   <span class="comment">/ tty0</span><!--"-->
<!--"-->        <!--"-->CMT(…)
<!--"-->        ocvt   <span class="comment">/ tty7</span><!--"-->
<!--"-->        error <span class="comment">/ crd</span><!--"-->
CMT((this repeats for writes identically, but directories error))\
</pre>
</blockquote>

<p class="indented continued">
The second loop walks <code>idata</code> to exhaustion, creating each given inode, copying the mode, link count, owner, and data.
What could the format <em>possibly</em> be? The uzhe, lest we forget that directories are just files with filenames inside:
</p>
<blockquote class="u69 continuing" id="idata">
	<a href="#idata">
		<span>u0</span>
		<div>idata:</div>
	</a>
	<pre>\
<!--"-->idata:<!--"-->
<!---->
<!--"--><span class="comment">/ root</span><!--"-->
<!---->
<!--"-->	41.<!--"-->
<!--"-->	140016<!--"-->
<!--"-->	.byte 7,1<!--"-->
<!--"-->	9f-.-2<!--"-->
<!--"-->	41.<!--"-->
<!--"-->	&lt;..\0\0\0\0\0\0><!--"-->
<!--"-->	41.<!--"-->
<!--"-->	&lt;.\0\0\0\0\0\0\0><!--"-->
<!--"-->	42.<!--"-->
<!--"-->	&lt;dev\0\0\0\0\0><!--"-->
<!--"-->	43.<!--"-->
<!--"-->	&lt;bin\0\0\0\0\0><!--"-->
<!--"-->	44.<!--"-->
<!--"-->	&lt;etc\0\0\0\0\0><!--"-->
<!--"-->	45.<!--"-->
<!--"-->	&lt;usr\0\0\0\0\0><!--"-->
<!--"-->	46.<!--"-->
<!--"-->	&lt;tmp\0\0\0\0\0><!--"-->
<!--"-->9:<!--"-->
<!---->
<!--"--><span class="comment">/ device directory</span><!--"-->
<!---->
<!--"-->	42.<!--"-->
<!--"-->	140016<!--"-->
<!--"-->	.byte 2,1<!--"-->
<!--"-->	9f-.-2<!--"-->
CMT(…)
<!--"-->	01.<!--"-->
<!--"-->	&lt;tty\0\0\0\0\0><!--"-->
<!--"-->	02.<!--"-->
<!--"-->	&lt;ppt\0\0\0\0\0><!--"-->
<!--"-->	03.<!--"-->
CMT(…)
<!--"-->	01.<!--"-->
<!--"-->	&lt;tty8\0\0\0\0> <span class="comment">/ really tty</span><!--"-->
<!--"-->9:<!--"-->
<!---->
<!--"--><span class="comment">/ etcetra directory</span><!--"-->
<!---->
<!--"-->	44.<!--"-->
<!--"-->	140016<!--"-->
<!--"-->	.byte 2,3<!--"-->
<!--"-->	9f-.-2<!--"-->
CMT(…)
<!--"-->	47.<!--"-->
<!--"-->	&lt;init\0\0\0\0><!--"-->
<!--"-->9:<!--"-->
<!---->
CMT(…)
<!---->
<!--"--><span class="comment">/ initialization program</span><!--"-->
<!---->
<!--"-->	47.<!--"-->
<!--"-->	100036<!--"-->
<!--"-->	.byte 1,3<!--"-->
<!--"-->	9f-.-2<!--"-->
<!--"-->8:<!--"-->
<!--"-->	sys    break; 0<!--"-->
<!--"-->	sys    open; 6f-8b+core; 0<!--"-->
<!--"-->	mov    r0,r1<!--"-->
<!--"-->	sys    seek; 65.; 0<!--"-->
<!--"-->1:<!--"-->
<!--"-->	mov    r1,r0<!--"-->
<!--"-->	sys    read; 9f-8b+core; 512.<!--"-->
<!--"-->	mov    9f,r5            <span class="comment">/ size</span><!--"-->
<!--"-->	beq    1f<!--"-->
<!--"-->	sys    creat; 9f-8b+core+4; 0<!--"-->
<!--"-->	mov    r0,r2<!--"-->
<!--"-->	movb   9f+2,0f<!--"-->
<!--"-->	sys    chmod; 9f-8b+core+4; 0:..<!--"-->
<!--"-->	movb   9f+3,0f<!--"-->
<!--"-->	sys    chown; 9f-8b+core+4; 0:..<!--"-->
<!--"-->2:<!--"-->
<!--"-->	tst    r5<!--"-->
<!--"-->	beq    2f<!--"-->
<!--"-->	mov    r1,r0<!--"-->
<!--"-->	sys    read; 9f-8b+core; 512.<!--"-->
<!--"-->	mov    $512.,0f<!--"-->
<!--"-->	cmp    r5,$512.<!--"-->
<!--"-->	bhi    3f<!--"-->
<!--"-->	mov    r5,0f<!--"-->
<!--"-->3:<!--"-->
<!--"-->	mov    r2,r0<!--"-->
<!--"-->	sys    write; 9f-8b+core; 0:..<!--"-->
<!--"-->	sub    r0,r5<!--"-->
<!--"-->	br     2b<!--"-->
<!--"-->2:<!--"-->
<!--"-->	mov    r2,r0<!--"-->
<!--"-->	sys    close<!--"-->
<!--"-->	br     1b<!--"-->
<!--"-->1:<!--"-->
<!--"-->	mov    r1,r0<!--"-->
<!--"-->	sys    close<!--"-->
<!--"-->	sys    exec; 5f-8b+core; 4f-8b+core<!--"-->
<!--"-->	sys    exit<!--"-->
<!--"-->4:<!--"-->
<!--"-->	5f-8b+core; 0<!--"-->
<!--"-->5:<!--"-->
<!--"-->	&lt;/etc/init\0><!--"-->
<!--"-->6:<!--"-->
<!--"-->	&lt;/dev/tap0\0><!--"-->
<!--"-->	.even<!--"-->
<!--"-->9:<!--"-->
<!---->
<!--"--><span class="comment">/ end of initialization data</span><!--"-->
<!---->
<!--"-->	0<!--"-->
<!---->
<!--"-->	.endif<!--"-->\
</pre>
</blockquote>
<p class="continuing">
And the problem of including an <samp>/etc/init</samp> which we inevitably execute is solved by using the kernel assembler to compile it directly into the faux filesystem image. (Admittedly, with a bit of a fucky <code>-8b+core</code> addressing mode.) Dudes rock moment.
</p>
<div class="codecontinued">
#include "blogn_t/014.04-idata.c.html"
</div>
<p class="continuing">
Thus, knowing that DECtapes are block-addressed, we can deduce the tape has a 65-block header, then alternatingly blocks containing
<samp>[size: 2B; mode: 1B; owner: 1B]</samp>, and data to completion, ending in a file with <samp>size=0</samp>.
Boot procedures (VII) say this init <q>reads the DECtape for initialization files starting from block 33</q>.
It's unclear how one's supposed to reconcile this with the <code>65</code>.
</p>
<p class="indented continuing">
So the filesystem, before loading from tape, consists of (omitting <samp>.</samp> and <samp>..</samp>):
</p>
<pre class="continuing">
<!--"-->41 /          <!--"-->CMT(<!--"-->1 (sys)      [7 links] d-rwr-<!--"-->)
<!--"-->   42 dev     <!--"-->CMT(<!--"-->1 (sys)      [2 links] d-rwr-<!--"-->)
<!--"-->       1 tty      2 ppt      3 mem   <!--"-->CMT(<!--"-->Every file: 1 (sys) [1 link] --rwrw<!--"-->)
<!--"-->       4 rf0      5 rk0      6 tap0<!--"-->
<!--"-->       7 tap1     8 tap2     9 tap3<!--"-->
<!--"-->      10 tap4    11 tap5    12 tap6<!--"-->
<!--"-->      13 tap7    14 tty0    15 tty1<!--"-->
<!--"-->      16 tty2    17 tty3    18 tty4<!--"-->
<!--"-->      19 tty5    20 tty6    21 tty7<!--"-->
<!--"-->      22 lpr      1 tty8             (really tty)<!--"-->
<!--"-->   43 bin      <!--"-->CMT(<!--"-->3 (bin, adm) [2 links] d-rwr-<!--"-->)
<!--"-->   44 etc      <!--"-->CMT(<!--"-->3 (bin, adm) [2 links] d-rwr-<!--"-->)
<!--"-->      47 init  <!--"-->CMT(<!--"-->3 (bin, adm) [1 link ] -xrwr-<!--"-->)
<!--"-->   45 usr      <!--"-->CMT(<!--"-->1 (sys)      [2 links] d-rwr-<!--"-->)
<!--"-->   46 tmp      <!--"-->CMT(<!--"-->1 (sys)      [2 links] d-rwrw<!--"-->)
</pre>

HEADING(2, nsys, nsys <span class="smallcaps">unix</span> (the V4 what isn'<!--'-->t))

<p class="indented continued">
One would be remiss to not properly analyse the next available Tn(unix) as well.
<a href="http://ftp.okass.net/pub/mirror/minnie.tuhs.org/Distributions/Research/Dennis_v2/">V2</a>? no.
<a href="http://ftp.okass.net/pub/mirror/minnie.tuhs.org/Distributions/Research/Dennis_v3/">V3</a>? sure, but this is actually a <em>WIP</em> of V4
(compare <samp>Readme.nsys</samp> and <samp>Changes.txt</samp> and the <a href="//www.tuhs.org/cgi-bin/utree.pl?file=V4">The Unix Tree</a>-for-V4 comments):
it'<!--'-->s in C, sure, and time (II) already returns seconds since 1970,
but <code><q>0, &nosys,			/* 42 = pipe */</q></code> (V3 <a href="//www.tuhs.org/cgi-bin/utree.pl?file=V3/man/man2/pipe.2">already had pipes</a>).
This is the same dump as <a href="//github.com/dspinellis/unix-history-repo/blob/Research-V4/sys/ken/slp.c#L89">what Anderson calls "V4"</a>.
This is obviously wrong (no fault of his, of course, how were he to know), but V4 is one of the two things we know this is definitely not.
That said: probably close enough, given that the bits we care about are identical in V5.
And what would those be?
</p>

<blockquote class="u69 continued" id="nsys-entry">
	<a href="#nsys-entry">
		<span>ken/low.s</span>
		<div>entry</div>
	</a>
	<pre>\
<!--"--><span class="comment">/ low core</span><!--"-->
<!---->
CMT(…)
<!---->
<!--"-->. = 0^.<!--"-->
<!--"-->	4<!--"-->
<!--"-->	br	1f<!--"-->
<!---->
<!--"--><span class="comment">/ trap vectors</span><!--"-->
<!--"-->	trap; br7+0		<span class="comment">/ bus error</span><!--"-->
<!--"-->	trap; br7+1		<span class="comment">/ illegal instruction</span><!--"-->
<!--"-->	trap; br7+2		<span class="comment">/ bpt-trace trap</span><!--"-->
<!--"-->	trap; br7+3		<span class="comment">/ iot trap</span><!--"-->
<!--"-->	trap; br7+4		<span class="comment">/ power fail</span><!--"-->
<!--"-->	trap; br7+5		<span class="comment">/ emulator trap</span><!--"-->
<!--"-->	trap; br7+6		<span class="comment">/ system entry</span><!--"-->
<!---->
<!--"-->. = 040^.<!--"-->
<!--"-->1:	jmp	start<!--"-->\
</pre>
</blockquote>
<p class="continuing">
Loaded at 0, jump to jump to <code>start</code>.
It'<!--'-->s most convenient to follow along with <a href="//www.tuhs.org/cgi-bin/utree.pl?file=V4/nsys">The Unix Tree</a>.
</p>
<blockquote class="u69 continuing" id="nsys-start">
	<a href="#nsys-start">
		<span>ken/45.s</span>
		<div>start:</div>
	</a>
	<pre>\
<!--"--><span class="comment">/ machine language assist</span><!--"-->
<!--"--><span class="comment">/ PDP-11/45</span><!--"-->
<!---->
CMT(…)
<!---->
<!--"-->start:<!--"-->
<!--"-->	bit	$1,SSR0<!--"-->
<!--"-->	bne	start			<span class="comment">/ loop if re-entry</span><!--"-->
<!--"-->	reset<!--"-->
<!---->
<!--"--><span class="comment">/ initialize systems segments</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ initialize user segmant</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ initialize io segment</span><!--"-->
<!--"--><span class="comment">/ set up counts on super segments</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ get a sp and start segmentation</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ clear bss</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ clear user block</span><!--"-->
CMT(…)
<!--"--><span class="comment">/ set up previous mode and call main</span><!--"-->
<!---->
<!--"-->	mov	$30000,PS<!--"-->
<!--"-->	jsr	pc,_main<!--"-->
<!--"-->	mov	$170000,-(sp)<!--"-->
<!--"-->	clr	-(sp)<!--"-->
<!--"-->	rti<!--"-->\
</pre>
</blockquote>
<blockquote class="u69 continuing" id="nsys-main">
	<a href="#nsys-main">
		<span>ken/main.c</span>
		<div>main()</div>
	</a>
	<pre>\
<!--"-->main()<!--"-->
<!--"-->{<!--"-->
CMT(…)
<!--"-->	/*<!--"-->
<!--"-->	 * zero and free all of core<!--"-->
<!--"-->	 */<!--"-->
<!---->
<!--"-->	UISA->r[0] = KISA->r[6] + USIZE;<!--"-->
<!--"-->	UISD->r[0] = 6;<!--"-->
<!--"-->	for(; fubyte(0) >= 0; UISA->r[0]++) {<!--"-->
<!--"-->		clearseg(UISA->r[0]);<!--"-->
<!--"-->		mfree(coremap, 1, UISA->r[0]);<!--"-->
<!--"-->	}<!--"-->
<!--"-->	mfree(swapmap, NSWAP, SWPLO);<!--"-->\
</pre>
</blockquote>
<p class="continuation">
This mirrors almost-verbatim what we saw in V1 setup, except we now have segmented memory
(and thus <code>malloc()</code>/<code>mfree()</code>; also <code>printf()</code> lol).
</p>

<blockquote class="u69 continued" id="nsys-main-prep">
	<a href="#nsys-main-prep">
		<span>ken/main.c</span>
		<div>process prep</div>
	</a>
	<pre>\
<!--"--><span class="comment">	/*<!--"-->
<!--"-->	 * set up system process<!--"-->
<!--"-->	 */</span><!--"-->
<!---->
<!--"-->	proc[0].p_addr = KISA->r[6];<!--"-->
<!--"-->	proc[0].p_size = USIZE;<!--"-->
<!--"-->	proc[0].p_stat = SRUN;<!--"-->
<!--"-->	proc[0].p_flag =| SLOAD|SSYS;<!--"-->
<!--"-->	u.u_procp = &proc[0];<!--"-->
<!---->
<!--"--><span class="comment">	/*<!--"-->
<!--"-->	 * set up 'known' i-nodes<!--"-->
<!--"-->	 */</span><!--"-->
CMT(…)
<!--"-->	rootdir = iget(ROOTDEV, ROOTINO);<!--"-->
<!--"-->	rootdir->i_flag =& ~ILOCK;<!--"-->
<!--"-->	u.u_cdir = iget(ROOTDEV, ROOTINO);<!--"-->
<!--"-->	u.u_cdir->i_flag =& ~ILOCK;<!--"-->\
</pre>
</blockquote>
<p class="continuing">
One last time:
</p>
<p class="indented continuing">
<var>proc[0].p_addr</var> is the base of the process'<!--'--> address space and <var>proc[0].p_size</var> is its size. but idk what the unit is lol
(it's gotta be chunks of <em>some</em> size because the allocator's arena size is a <samp>char</samp>, but fuck knows what;
 <code>USIZE</code> is helpfully <q>8</q>, and I'<!--'-->ve calculated the size of <code>u</code> at 217 (or 228) bytes;
 maybe it's 32 bytes? that's awfully narrow but it fits).
In V1 this was <samp>[core; <var>u.break</var>)</samp> (and also the stack was separate. but close enough),
now it'<!--'-->s <samp>[<var>proc[…].p_addr</var>, <var>proc[…].p_addr</var> + <var>proc[…].p_size</var>)</samp>.
AFAICT, <code>KISA->r[6]</code> is gonna be the Kernel I<!---->CMT(nstruction)-Space Page Address Register #0, register 6
(there's a total of 8, matching the machine's <a href="//gunkies.org/wiki/PDP-11_Memory_Management">8 segments</a>, so this probably means we'<!--'-->ll be executing from kernel instruction bank 6?).
</p>
<p class="indented continuing">
<var>proc[0].p_stat</var> is the same as before (except R is now 4).
</p>
<p class="indented continuing">
<var>proc[0].p_flag</var> is, AFAICT, "loaded" (as in: don'<!--'-->t need to swap in),
and <code>SSYS</code> poisons the scheduler to never consider the process for being swapped out.
</p>
<p class="indented continuing">
<var>rootdir</var> and <var>u.u_cdir</var> mean the same thing as in V1,
but they are now entries into the open-inode table (and <code>iget()</code> opens the given inode, returning a <samp>struct inode *</samp>).
This system has a "filesystem cache"! Revolutionary.
</p>
<p class="indented continuation">
<var>u.u_procp</var> is the equivalent of <var>u.uno</var>, and is the process'<!--'--> index in the scheduler table.
</p>

<p class="indented">
Before we were strictly in kernel mode, now we'<!--'-->re running <em>as PID 0</em>, as an unswappable system process executing kernel code, in /.
</p>


<blockquote class="u69 continued" id="nsys-main-fork">
	<a href="#nsys-main-fork">
		<span>ken/main.c</span>
		<div>the scheduler and also init</div>
	</a>
	<pre>\
<!--"--><span class="comment">	/*<!--"-->
<!--"-->	 * make init process<!--"-->
<!--"-->	 * enter scheduling loop<!--"-->
<!--"-->	 * with system process<!--"-->
<!--"-->	 */</span><!--"-->
<!---->
<!--"-->	if(newproc()) {<!--"-->
<!--"-->		expand(USIZE+1);<!--"-->
<!--"-->		u.u_uisa[0] = USIZE;<!--"-->
<!--"-->		u.u_uisd[0] = 6;<!--"-->
<!--"-->		sureg();<!--"-->
<!--"-->		for(i=0; icode[i] != -1; i++)<!--"-->
<!--"-->			suword(i*2, icode[i]);<!--"-->
<!--"-->		return;<!--"-->
<!--"-->	}<!--"-->
<!--"-->	sched();<!--"-->
<!--"-->}<!--"-->\
</pre>
</blockquote>
<p class="indented continuing">
<code>newproc()</code> is what does the forking in <code>fork()</code>, and returns nonzero in the child.
This is the first known instance of the kernel forking.
Naturally, since <code>mpid</code> was never changed, the new process is PID 1.
The special PID 0 process goes to <code>sched()</code> and now does scheduling.
It will probably schedule our PID 1 instantly.
</p>
<p class="indented continuing">
And PID 1 will first allocate another 1 block (32 bytes?), then…
<var>u.u_uisa[0]</var>&<var>u.u_uisd[0]</var> look awfully like the user instruction and data segments? This matches segment 6 for data?
But there are 8 segments (0–7 and <code>USIZE</code> is 8 so fuck knows. maybe not). <code>sureg()</code> sets user segment registers.
</p>
<p class="indented continuing">
<code>suword()</code>, expectedly, sets words in user memory.
The loop effectively does a memcpy of <code>icode</code> until <samp>-1</samp> to user memory starting at user address 0,
and then we return there.
</p>
<p class="indented continuing">
<code>icode</code> is, unfortunately,
<code><q>\
int	icode[]
{
	0104413,
	0000014,
	0000010,
	0000777,
	0000014,
	0000000,
	0062457,
	0061564,
	0064457,
	0064556,
	0000164,
	-1
};\
</q></code>
so a beautiful methodology has definitely been lost. But a quick <samp>objcopy --dump-section .data=/dev/stdout a.o | od -t o2z -w014</samp> later, this is
</p>
<pre class="continuing" style="margin-left: 1em;"><samp>\
<!--"-->0000000 104413 000014 000010 000777 000014 000000  >............&lt;<!--"-->
<!--"-->0000014 062457 061564 064457 064556 000164 177777  >/etc/init...&lt;<!--"-->
<!--"-->0000030<!--"-->\
</samp></pre>
from which the <samp>0000014</samp> pointer stands out the most, so this can be trivially disassembled to
<pre class="continuation" style="margin-left: 1em;"><samp>\
<!--"-->0000000: sys exec; 0000014; 0000010<!--"-->
<!--"-->0000010: 0000014; 0000000<!--"-->
<!--"-->0000014: &lt;/etc/init\0><!--"-->\
</samp></pre>

<p class="indented">
The <code>return</code> returns to <a href="#nsys-start"><code>start:</code></a>,
which explicitly (<code>clr</code>) returns to address 0 in user mode (<code>rti</code> returns <em>from an interrupr</em>).
</p>

<p class="indented">
Anderson'<!--'-->s analysis is correct, even if by accident: based on nsys source, V4 will have most likely been the first Tn(unix) with a PID 0 scheduler process.
TTBOMK, this corresponds with this being the first system targeting the PDP-11/45 (or at least its memory segmentation features) rather than the PDP-11/20,
and thus a purely-interrupt-driven architecture was no longer possible.
(This hurts less when it'<!--'-->s one process out of a fifty than if it were one process out of sixteen, too.)
</p>


HEADING(2, pdp7, that funny PDP-7 proto-unix)

<p class="indented continued">
Since we're all here already, it'd be a shame to stop at Version 1 Tn(unix).
The scans for this system can be found
<a href="http://ftp.okass.net/pub/mirror/minnie.tuhs.org/Distributions/Research/McIlroy_v0/">at the TUHS as the number-named PDFs</a>.
The accompanying document —
<cite>D. M. Ritchie'<!--'-->s <samp><a href="http://ftp.okass.net/pub/mirror/minnie.tuhs.org/Distributions/Research/McIlroy_v0/UnixEditionZero-Threshold_OCR.pdf">DRAFT of The UNIX Time-Sharing System</a></samp></cite>
— is a delightful 53 short pages (27 if you exclude the manuals (though they are not that yet)) and you should read or at least skim,
is found in the <samp>UnixEditionZero<var>*</var></samp> files. For the PDFs I recommend <samp>Threshold_OCR</samp>, which has text, bookmarks, and not-being-100MB.
An OCR-only text file is also available.
</p>
<p class="indented continuing">
Well, the document says this documents <samp><q>UNIX-11</q></samp>, which is a mildly-redesigned port of <samp><q>UNIX-7</q></samp>. idk. it's the best I've got.
It's also the first and only mention I've ever seen of R. H. Canaday'<!--'-->s involvement.
But this document also contains my favourite lie (it'<!--'-->s honestly all gold, but):
<cite><samp><u>5</u>. <u>The</u> <u>Shell</u>, <u>5</u>.<u>5</u>. <u>Processes</u> <u>and</u> <u>forking</u></samp></cite> (p. 18):
</p>
<blockquote class="continuing">
	<p class="continuation">
		Except while UNIX is bootstrapping itself into operation, a new process can come into existence in only one way: by use of the <u>fork</u> system call.
	</p>
	<pre class="continuing" style="margin-left: 2em;"><code>\
processid = fork(label)\
	</code></pre>
	<p class="continued">
		When fork is executed by a process, it splits into two idependently executing processes.
		The two processes have core images which are copies of each other, but they are not precisely equivalent:
		one of them is considered the parent process.
		In the parent, control does not return directly from the <u>fork</u>, but instead passes to location <u>label</u>;
		in the child process, there is a normal return.
		The <u>processid</u> returned by the <u>fork</u> call is the identification of the other, offspring process.
	</p>
</blockquote>
<p class="continuing">
This
  (a) shows dmr'<!--'-->s hand, since he almost-outright says the first process is produced magically, but also
  (b) is a delightful lie because this is, logically, what fork does, but:
<cite><samp><u>APPENDIX</u> <u>1</u>, <u>A1</u>.<u>2</u> <u>fork</u></samp></cite> (p. A1-2; p. 37):
</p>
<blockquote class="continuing">
	<p class="continuation">
		This is the primitive used to generate new processes.
	</p>
	<pre class="continuing" style="margin-left: 2em;"><code>\
sys fork
(old process return)
(new process return)\
	</code></pre>
	<p>
		There are no input arguments.
		CMT(…)
		R0 contains the process identification of the new proces.
		See also section 5.
	</p>
	<p class="continued">
		The parent process returns immediately after the "sys" call; the new process skips one word.
		(The label argument mentioned in the discussion of <u>fork</u> in section 5.5 was a white lie.)
	</p>
</blockquote>
<p class="indented continuation">
This also looks like the first syscall-type word.
Everything else calls them "system calls", but this is a call to "sys". Give it another year.
</p>

<p class="indented">
The TUHS also distributes a
<a href="http://ftp.okass.net/pub/mirror/minnie.tuhs.org/Distributions/Research/PDP7/pdp7-unix-master.zip">zipped git export with no history</a>,
which claims to be a transcription of the PDFs.
It may well be, and you may even be able to run it!
But the only reliable source is <samp>01-s1.pdf</samp>.
</p>

<blockquote class="u69 continued" id="pdp7-s8-coldentry">
	<a href="#pdp7-s8-coldentry">
		<span>s8, pp. 49–50</span>
		<div>coldentry:</div>
	</a>
	<pre>\
<!--"-->coldentry:<!--"-->
<!--"-->   dzm 0100 <span class="comment">" not re-entrant</span>
<!--"-->   caf<!--"-->
<!--"-->   <!--"-->CMT(…)
<!--"-->   jms dskio; 06000<!--"-->
<!--"-->   jms copy; dskbuf; sysdata; ulist-sysdata<!--"-->
<!--"-->   lac d3<!--"-->
<!--"-->   jms namei; initf<!--"-->
<!--"-->      jms halt<!--"-->
<!--"-->   jms iget<!--"-->
<!--"-->   cls<!--"-->
<!--"-->   jms iread; 4096; 4096<!--"-->
<!--"-->   jmp 4096<!--"-->\
</pre>
</blockquote>
<blockquote class="u69 continuing" id="pdp7-s8-strings">
	<a href="#pdp7-s8-strings">
		<span>s8, p. 48</span>
		<div>"init"</div>
	</a>
	<pre>\
<span class="comment">" Strings</span><!--"-->
initf:
<!--"-->   &lt;i>n;&lt;i>t;&lt; > ;&lt; > <span class="comment">"</span>\
</pre>
</blockquote>
<p class="indented continuation">
Also note the slew of "constants" on p. 48 which are variables in the form
<code>o212: 0212</code>,
<code>d7999: 8999</code>,
<code>dm3: -3</code>.
It'<!--'-->s unclear if this saves space, or.
</p>

<p class="indented continued">
<var>ulist</var> is the process table (funnily enough, object-addressed):
</p>
<blockquote class="u69 continuing" id="pdp7-s8-ulist">
	<a href="#pdp7-s8-ulist">
		<span>s8, p. 50</span>
		<div>ulist:</div>
	</a>
	<pre>\
<!--"-->ulist:<!--"-->
<!--"-->   0131000;1;0;0<!--"-->
<!--"-->   0031040;0;0;0<!--"-->
<!--"-->   0031100;0;0;0<!--"-->
<!--"-->   0031140;0;0;0<!--"-->
<!--"-->   <!--"-->CMT((and so on, there'<!--'-->s 10 total))\
</pre>
</blockquote>
<p class="continuing">
and fuck knows what the fields are, but the first one is very clearly initialised differently.
If I had to guess (and I do), the second field would be <var>pid</var> because that'<!--'-->s congruent with the <code>userdata</code>.
No clue what that high bit being set is.
</p>
<blockquote class="u69 continuation" id="pdp7-s8-userdata">
	<a href="#pdp7-s8-userdata">
		<span>s8, p. 50</span>
		<div>userdata:</div>
	</a>
	<pre>\
<!--"-->userdata:<!--"-->
<!--"-->   u.ac: 0<!--"-->
<!--"-->   u.mq: 0<!--"-->
<!--"-->   u.rg: .=.+9<!--"-->
<!--"-->   u.uid: -1<!--"-->
<!--"-->   u.pid: 1<!--"-->
<!--"-->   <!--"-->CMT((there'<!--'-->s more))\
</pre>
</blockquote>

<p class="indented continuing">
If I <em>were</em> to translate this all to C and adapt it to a modern audience, then I'<!--'-->d say
</p>
<div class="codecontinued">
#include "blogn_t/014.05-coldstart.c.html"
</div>

<p class="indented">
So I'<!--'-->d say this system <em>boots</em> into PID 1 but executing the kernel and with no program data, then reads <samp>init</samp> into the program data
(from the root directory; but there'<!--'-->s barely a hierarchical filesystem here),
and jumps there.
This is as an open-coded sys exec (II).
</p>


BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
