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


   <!-- RSS_PUB_DATE: "Sun, 28 Sep 2025 01:02:48 +0200" -->
#define POST_DATE      Sun, 28 Sep 2025 01:02:48 +0200
#define POST_POST_DATE Sun, 28 Sep 2025 19:54:03 +0200, <a href="#v4">filled out with information about V4 on Sat, 03 Jan 2026 21:47:26 +0100</a>


#define STYLESHEETS BLOGN_T_STYLESHEETS                                                    FORCED_NEWLINE \
                    <link href="/content/assets/prism-twilight.min.css" rel="stylesheet">
BOILERPLATE(020. Pre-modern-UNIX sizeof division — blognꞌt, 020. Pre-modern-UNIX sizeof division, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

pre kbd {
	font-weight: 600;
}

del {
	opacity: 50%;
}

pre {
	margin: 0;
}

* {
	     tab-size: 8 !important;
	-moz-tab-size: 8 !important;
}

small {
	     tab-size: 9.5 !important;
	-moz-tab-size: 9.5 !important;
}

blockquote {
	margin-left: 0;
}

dl > * {
	display: inline-block;
}

.nowrap {
	white-space: nowrap;
}
</style>

BLOGN_T_HEADING(020. Pre-modern-UNIX sizeof division)

<p class="indented continued">
Similarly to <a href="017-malloc0.html">previous</a>, <a href="mailto:Alejandro Colomar <alx@kernel.org>">acolomar</a> writ:
</p>
<blockquote class="continuation">
I've<!--'--> been wondering why the _Countof() operator was not implemented back in the times of K&R.
That was information certainly available in the compiler, and division was quite expensive, so you wouldn't<!--'--> want to perform a run-time division of sizeof.
[…] what does cc(1) produce for a sizeof division?
</blockquote>


HEADING_S(2, v1, class="continued", <cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf">UNIX Programmer'<!--'-->s Manual</a></cite>)
<p class="continuation">
doesn't<!--'--> have C.
</p>


HEADING_S(2, v2, class="continued", UNIX Programmer'<!--'-->s Manual, <cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v2/v2man.pdf#page=39">Second Edition</a></cite>)
<p class="continuing">
does, and we can observe it directly:
the distributors of
<a href="//code.google.com/archive/p/unix-jun72/">unix</a>\
<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/svntree-20081216.tar.gz">72</a>,
which is for most effects and purposes a V1 system,
include the "last1120c" cc, which, accd'g<!--'--> to
<cite>dmr, <a href="//web.archive.org/web/20080419002944/http://cm.bell-labs.com/cm/cs/who/dmr/primevalC.html">Very early C compilers and language</a></cite>
(or, more tellingly, <code>primevalC.html</code>)
<q>is a saved copy of the compiler preserved just as we were abandoning the PDP-11/20</q>
which puts it in the V2 era. Thus:
</p>
<pre><code>\
$ <kbd>pdp11 simh.cfg</kbd>
PDP-11 simulator V3.8-1
Disabling CR
Disabling XQ
RF: buffering file in memory
TC0: 16b format, buffering file in memory

:login: <kbd>root</kbd>
root
HASH <kbd>chdir /tmp</kbd>
HASH <kbd>cat >a.c
int gaming[20];
size() { return sizeof(gaming) / <del>4#</del>2; }</kbd>
HASH <kbd>cc -c a.c</kbd>
1: External definition syntax
1: _gaming undefined
2: Statement syntax
2: _sizeof undefined
2: _gaming undefined
I
II\
</code></pre>
<p class="indented continuing">
Primeval is right!
</p>

<pre><code>\
HASH <kbd>cat >a.c
gaming[20];
size() { return 012345; }</kbd>
HASH <kbd>cc -c a.c</kbd>
2: Statement syntax
I
II\
</code></pre>
<p class="indented continuing">
So there <em>is</em> a reason the <code>return ()</code> style persists!
</p>

<pre><code>\
HASH <kbd>ed a.c</kbd>
38
<kbd>s/012345/(&)/</kbd>
<kbd>w</kbd>
40
HASH <kbd>cc -c a.c</kbd>
I
II
HASH <kbd>ls -l a.o</kbd>
<!--"-->total    1<!--"-->
<!--"-->134 s-rwrw  1 root     92 Jan  1 00:00:00 a.o<!--"-->
HASH <kbd>od a.o</kbd>
<!--"-->00000  00407  00020  00004  00050  00044  00000  00000  00000<!--"-->
<!--"-->00020  10546  10605  12700  <strong>12345</strong>  00167 -77764  00167 -77760<!--"-->
<!--"-->00040  40024  40000  00000  00000  00000  00000  00000  00051<!--"-->\
</code></pre>
<p class="indented continuing">
(I am sparing you from the rest of the object file
 and <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=75">the remaining 420 bytes of this output</a>;
 do note, however, how this signed output style is <a href="//ro.ws.co.ls/man1/od.1.pdf">not available</a> in present-day od).
</p>

<p class="indented continuing">
With our epistemic method honed, we can attack the problem directly by spelling <code>return 1783;</code> as
</p>
<pre><code>\
HASH <kbd>cat >b.c
size() { return(012345 / 3); }</kbd>
HASH <kbd>cc -c b.c</kbd>
I
II
HASH <kbd>ls -l b.o</kbd>
<!--"-->total    1<!--"-->
<!--"-->133 s-rwrw  1 root     92 Jan  1 00:00:00 b.o<!--"-->
HASH <kbd>od b.o</kbd>
<!--"-->00000  00407  00030  00002  00000  00030  00000  00000  00000<!--"-->
<!--"-->00020  10546  10605  12714  <strong>12345</strong>  12767  <strong>00003</strong> -37262  11400<!--"-->
<!--"-->00040  00167 -77754  00167 -77750  40000  00000  00000  00000<!--"-->\
</code></pre>
<p class="continuation">
shocking no-one, this is clearly a run-time division.
The source doesn't<!--'--> even contain anything close to an optimiser that I could find.
</p>

<p class="indented continued">
<q>A PDP-11 disassembler exists.</q> — good news if we are to dead-confirm this —
but I don't<!--'--> think ken would appreciate it if I were to <q>Contact the author for more information.</q>.
(I have, in fact, just quoted the <em>entire</em> das (VI) manual from
 <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=184">V1</a>,
 <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v2/v2man.pdf#page=239">V2</a>,
 and
 <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v3/v3man.tar.gz">V3</a> (<samp>./manx/das.6</samp>)
 (it goes away in <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v4/v4man.tar.gz">V4</a>).)
It's<!--'--> also not part of unix72 or any dump.
</p>
<p class="indented continuing">
But others must exist, and indeed <a href="//rawcdn.githack.com/caldwell/pdp11dasm/refs/heads/master/pdp11dasm.html">pdp11dasm</a>
(from a <a href="//github.com/caldwell/pdp11dasm">re-re-re-host</a>, as is tradition) works, yielding
</p>
<pre><code>\
<!--"-->000020: 010546                  mov     r5,-(r6)<!--"-->
<!--"-->000022: 010605                  mov     r6,r5<!--"-->
<!--"-->000024: 012714 012345           mov     <strong>#12345</strong>,(r4)<!--"-->
<!--"-->000030: 012767 000003 140516    mov     <strong>#3</strong>,140554<!--"-->
<!--"-->000036: 011400                  mov     (r4),r0<!--"-->
<!--"-->000040: 000167 100024           jmp     100070<!--"-->\
</code></pre>
<p class="continuing">
after <a href="/content/assets/blogn_t/020.01-deworm.c">deworming</a> + truncating the od output and <code>echo d 0+20 > b.o.ctl</code>.
</p>
<p class="indented continuation">
God knows <em>how</em> the jump achieves division, but it obviously does.
V2 verdict: no <code>sizeof</code>, no <samp>int/int</samp> folding.
</p>


HEADING_S(2, prestruct-c, class="continued", <a href="//web.archive.org/web/20080419002944/http://cm.bell-labs.com/cm/cs/who/dmr/primevalC.html">prestruct-c</a>)
<p class="continuing">
<q>is a copy of the compiler just before I started changing it to use structures itself</q> (imagine!).
<q>It's<!--'--> a bit hard to get really accurate dates for these compilers, except that they are certainly 1972-73</q>,
<q>by the time of the second, we had a PDP-11 that did provide mapping</q>
— this roughly lines up with the metatext of PDP-11/45 mentions in
UNIX Programmer'<!--'-->s Manual, <cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v3/v3man.tar.gz">Third Edition</a></cite>,
and definitely lines up with the <q>February, 1973</q> dating.
</p>
<p class="indented continuing">
Still no <code>sizeof</code> (proof by <code>grep -r</code>),
but there is an optimiser! as part of <a href="//web.archive.org/web/20080419002944/http://cm.bell-labs.com/cm/cs/who/dmr/prestruct-c/c01.c">the first pass</a>,
which I present to the dear reader in its entirety
(though I must warn that the experience is not unlike reading Perl for the first time;
 also, <code>int name[]</code> is the spelling-du-jour of <code>int *name</code>):
</p>
#include "blogn_t/020.01-prestruct-c-c01-optim.oldc.html"
<p class="continuation">
This folds additions where either
(one operand is a constant 0) or
(one operand is a constant and the other is a <code>&var</code> expression).
One has to assume <code>&var + 3.5</code> gets promoted before this, but idk if this works for <code>3.5 + 0</code> or <code>3.5 + 0.0</code>.
Either way, V3 verdict: no <code>sizeof</code>, no <samp>int/int</samp> folding.
</p>

<p class="indented continued" id="v4">
<del style="opacity: initial;">V4 has a V3-style cc (I), and, likely, compiler. No way to know.</del>
Since first writing this post, a dump of the system corresponding to
</p>
HEADING_S(2, v4-heading, class="continuing", UNIX Programmer'<!--'-->s Manual, <cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v4/">Fourth Edition</a></cite>)
<p class="continuing">
was <a href="//lfs.nabijaczleweli.xyz/0031-Utah_v4">found</a> and <a href="022-Utah_v4.html">analysed</a>.
So we can observe this directly.
</p>
<p class="indented continuing">
<cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v4/v4man.tar.gz">Fourth Edition</a>, <samp>./man1/cc.1</samp></cite> is
</p>
<blockquote class="continuing">
<b>cc</b> [ <b>−c</b> ] [ <b>−p</b> ] file ...
</blockquote>
<p class="continuing">
(with <code>-p</code> being like present-day <code>-E</code>), but is otherwise
— per <cite><a href="//lfs.nabijaczleweli.xyz/0031-Utah_v4/v4root.tar">V4</a>, <samp>/usr/source/s1/cc.c</samp>, <samp>/usr/c/c10.c</samp></cite> —
<em>exactly</em> like V5, described below. Except undocumentedly.
</p>
<p class="indented continuation">
V4 verdict: yes <code>sizeof</code> (new: <cite>ibid., <samp>/usr/c/c0[01].c</samp></cite>), yes <samp>int/int</samp> folding.
</p>


HEADING_S(2, v5, class="continued", UNIX Programmer'<!--'-->s Manual, <cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5man.pdf#page=36">Fifth Edition</a></cite>)
<blockquote class="continuing">
	<dl class="continuing">
		<dt style="font-weight: bold;">−O</dt>
		<dd>Invoke the experimental object-code optimizer.</dd>
	</dl>
</blockquote>
<p class="continuing">
but internally this is the <q>C object code <em>improver</em></q>!
(<cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5root.tar.gz">V5</a>, <samp>./usr/source/s1/c2<var>?</var>.c</samp></cite>)
as a new third pass
(and actually parses and optimises the assembly output by the second pass, not the object, but same difference).
</p>
<p class="indented continuing">
The <em>actual</em> optimiser moves to the second pass to take up a whole <q>C compiler part 2 -- expression optimizer</q> file
(<cite>ibid., <samp>./usr/source/s1/c12.c</samp></cite>),
and is no longer just a peep-hole at the two addition cases,
though they do still feature, but in 4K this time:
</p>
#include "blogn_t/020.02-v5-c12-optim.oldc.html"
<p class="continuing">
but also with a full constant folder:
</p>
#include "blogn_t/020.03-v5-c12-const.oldc.html"
<p class="continuation">
V5 verdict: yes <code>sizeof</code> (<del style="opacity: initial;">new:</del> <cite>ibid., <samp>./usr/source/s1/c0[01].c</samp></cite>), yes <samp>int/int</samp> folding.
</p>

HEADING(2, rest, &c.)

<p class="indented continued" id="v6">
<cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v6/v6src.tar.gz">V6</a> (<samp>./c/</samp>)</cite>'s cc doesn't change for the purposes of this analysis.
By following <cite>Computer History Wiki's<!--'--> <a href="//gunkies.org/wiki/Installing_UNIX_v6_(PDP-11)_on_SIMH">Installing UNIX v6 (PDP-11) on SIMH</a></cite>
we can observe this directly:
</p>
<pre><code>\
$ pdp11 boot.ini
PDP-11 simulator V3.8-1
Disabling XQ
@<kbd>unix</kbd>

login: <kbd>root</kbd>
HASH <kbd>chdir /tmp</kbd>
HASH <kbd>cat >a.c
gaming[012345];
size() { return(sizeof(gaming) / sizeof(*gaming)); }</kbd>
HASH <kbd>cc -c a.c</kbd>
HASH <kbd>od a.o</kbd>
0000000 000407 000016 000000 000000 000110 000000 000000 000000
0000020 004567 177774 012700 <strong>012345</strong> 000400 000167 177762 000000
0000040 000071 000000 000000 000000 000000 000131 063537 066541\
</code></pre>
<p class="indented continuing">and naturally</p>
<pre><code>\
<!--"-->000020: 004567 177774           jsr     r5,20<!--"-->
<!--"-->000024: 012700 012345           mov     <strong>#12345</strong>,r0<!--"-->
<!--"-->000030: 000400                  br      32<!--"-->
</code></pre>

<p class="indented" id="v7">
<cite><a href="//www.tuhs.org/Archive/Distributions/Research/Henry_Spencer_v7/v7.tar.gz">V7</a> (<samp>usr/src/cmd/c/</samp>)</cite>'s cc doesn't change for the purposes of this analysis.
</p>

<p class="indented continued" id="sys3">
<span class="smallcaps">Unix</span> User'<!--'-->s Manual, <a href="//archive.org/details/bitsavers_attunixSysalRelease3Jun80_33886798/page/n108/mode/1up">Release 3.0</a>
ships both a classic V6 compiler and, on the PDP-11, a "portable" pcc.
What it actually means by this is that it ships pcc on both the PDP-11 and VAX, but calls it <samp>/bin/pcc</samp> on the PDP-11 and <samp>/bin/cc</samp> on the VAX.
The PDP-11 classic compiler grows <samp>unsigned</samp> and, with it, 8 branches in <code>const()</code>,
but does not otherwise change for the purposes of this analysis
(<cite><a href="//vetusware.com/download/UNIX%20System%20III%20Source%20Code%20SYSIII/?id=11576">SysIII</a>, <samp>src/cmd/cc/pdp11/c12.c</samp></cite>;
 with thanks to my good friend Vetus).
</p>
<p class="indented continuing">
pcc
(both pccs, since, despite having a machine-independent and machine-dependent half, both are twice in the source,
 and the machine-independent bits <em>are</em> different
 (<cite>ibid., <samp>src/cmd/cc/pccSLASH_ASTERIX</samp> & <samp>src/cmd/cc/vax/{cc.*,pcc/,mip/}</samp></cite>)),
also supports <code>sizeof</code> and also folds <samp>int/int</samp> divisions
(but don't<!--'--> be fooled: the latter happens during AST construction, not in the optimiser
 (<cite>ibid., <samp>src/cmd/cc/pcc/mip/trees.c</samp> & <samp>src/cmd/cc/vax/mip/trees.c</samp></cite> (these are actually the same))):
</p>
#include "blogn_t/020.04-sys3-pcc-trees.c.html"
<p class="indented continuation">
Also, VAX SysIII separately includes the <q>improver</q> (<cite>ibid., <samp>src/cmd/cc/vax/c2/</samp></cite>) and the front-end <em>does</em> run it there.
</p>

<p class="indented continued" id="sys5r1">
<cite><a href="//vetusware.com/download/UNIX%20SYSVr1%20Source%20Code%20r1/?id=11570">SysVr1</a>, <samp>sysv-pdp11_usr-src/cmd/cc/cc.mk</samp></cite>
elucidates(?) this:
</p>
#include "blogn_t/020.05-sysvr1-cc.mk.html"
<p class="continuation">
But doesn't<!--'--> otherwise change for the purposes of this analysis (<cite>ibid., <samp>sysv-pdp11_usr-src/cmd/cc/pcc/mip/trees.c</samp></cite>).
</p>

<p class="indented" id="sys5r2">
<cite><a href="//vetusware.com/download/UNIX%20SYSVr2%20Source%20Code%20r2/?id=11571">SysVr2</a> (<samp>usr/src/cmd/c/</samp>)</cite>'s ccs don't change for the purposes of this analysis.
</p>

<p class="indented" id="sys5r3">
<cite><a href="//vetusware.com/download/UNIX%20SYSVr3%20Source%20Code%20r3/?id=11572">SysVr3</a> (<samp>ATT-SYSVr3/{301,31}/usr/src/scripts/cc/</samp>)</cite> comes with just pcc and I don't see source for it but there's no reason to suspect it'd've lost the optimisation.
</p>

<p class="indented continued" id="sys5r4">
<cite><a href="//vetusware.com/download/UNIX%20SYSVr4%20Source%20Code%20r4/?id=11573">SysVr4</a> (<samp>ATT-SYSVr3/{301,31}/usr/src/scripts/cc/</samp>)</cite> comes with <em>some</em> compiler?
But
<cite><a href="//bitsavers.org/pdf/att/unix/System_V_Release_4/0-13-947029-8_Unix_System_V_Rel4_Programmers_Reference_Manual_1990.pdf#page=79">UNIX® System V Release 4 Programmer's Reference manual</a>'s cc(1)</cite>
doesn't<!--'--> change from
<cite><a href="//bitsavers.org/pdf/att/unix/System_V_Release_3/UNIX_System_V_Programmers_Reference_Manual_1987.pdf#page=33">UNIX System V Programmer's Reference Manual</a>'s cc(1)</cite>,
so it's<!--'--> probably still the same pcc.
</p>
<p class="indented continuation">
It also includes the <a href="//101010.pl/@nabijaczleweli/115278564014771352">all-time-funniest AT&T program</a> as <samp>/usr/ucb/cc</samp>.
</p>

<p class="indented" id="1bsd">
1BSD doesn't<!--'--> include a different C compiler
(<cite><a href="//archive.org/details/The_CSRG_Archives_CD-ROM_1_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 1</span>: Berkeley Systems 1978-1986</a>, <samp>./1bsd/</samp></cite>).
</p>

<p class="indented" id="2bsd">
2BSD includes some cc patches which do not affect related functionality we care about
(<cite>ibid., <samp>./2bsd/upgrade/c/</samp></cite>).
</p>

<p class="indented" id="3bsd">
3BSD ships cc as pcc + the extracted c2 improver
(<cite>ibid., <samp>./3bsd/usr/src/cmd/{cc.c,pcc/,mip/,c2/}</samp></cite>).
The relevant segment of <cite><samp>./3bsd/usr/src/cmd/mip/trees.c</samp></cite> is the same as above.
</p>

<p class="indented" id="4bsd">
4BSD's cc doesn't change for the purposes of this analysis
(<cite>ibid., <samp>./4.0/usr/src/cmd/mip/trees.c</samp></cite>).
</p>

<p class="indented" id="4.1bsd">
4.1BSD's cc doesn't change for the purposes of this analysis
(<cite>ibid., <samp>./4.1/usr/src/cmd/mip/trees.c</samp></cite>).
</p>

<p class="indented" id="4.2bsd">
4.2BSD's cc doesn't change for the purposes of this analysis
(<cite>ibid., <samp>./4.1/usr/src/lib/mip/trees.c</samp></cite>).
</p>

<p class="indented" id="4.3bsd">
4.3BSD's cc doesn't change for the purposes of this analysis
(<cite>ibid., <samp>./4.1/usr/src/lib/mip/trees.c</samp></cite>).
</p>

<p class="indented continued" id="4.3bsd-tahoe">
4.3BSD-Tahoe's cc doesn't change for the purposes of this analysis
(<cite><a href="//archive.org/details/The_CSRG_Archives_CD-ROM_2_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 2</span>: Berkeley Systems 1987-1993</a>, <samp>./4.0/usr/src/cmd/mip/trees.c</samp></cite>).
It actually ships a second one in <cite><samp>./4.3tahoe/usr/src/lib/old_compiler/</samp></cite>, but the purpose of this is unclear to me.
The only reference (I think?) to this situation is in <cite><samp>./4.3tahoe/usr/doc/smm/12.uchanges/1.t</samp></cite>, quoth:
</p>
<blockquote class="continuation">
Some effort has been made to improve error reporting
for program errors and to handle exceptional conditions in which
the old compiler used to punt.
</blockquote>

<p class="indented" id="4.3bsd-reno">
4.3BSD-Reno's cc doesn't change for the purposes of this analysis
(<cite>ibid., <samp>./4.3reno/usr/src/libexec/pcc/mip/trees.c</samp></cite>).
</p>

<p class="indented" id="4.4bsd">
The 4.4BSD-Lites ship with GCC 2.3.3
(<cite>ibid., <samp>./4.4BSD-Lite1</samp></cite>;
 <cite><a href="//archive.org/details/The_CSRG_Archives_CD-ROM_3_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 3</span>: Final Berkeley Releases</a>, <samp>./4.4BSD-Lite2</samp></cite>).
</p>

<p class="indented continued">
It's<!--'--> difficult to come to a
</p>
HEADING_S(2, conclusion, class="continuing", conclusion)
<p class="continuing">
other than "there has never been a compiler with <code>sizeof</code> but no <samp>int/int</samp> folding".
</p>
<p class="indented continuation">
<del style="opacity: initial;"><em>Perhaps</em> for a hair? in 1973 around our V4 epistemic hole, <a href="/content/assets/blogn_t/020.02-kicker.webm">but.</a></del>
Ever.
</p>


BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
