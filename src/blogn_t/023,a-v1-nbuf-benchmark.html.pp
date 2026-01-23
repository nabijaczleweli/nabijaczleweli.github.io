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
#include "blogn_t/023,a!01-linenos.html"


   <!-- RSS_PUB_DATE: "Sat, 17 Jan 2026 04:33:03 +0100" -->
#define POST_DATE      Sat, 17 Jan 2026 04:33:03 +0100
#define POST_POST_DATE

#define DEL      <del>[…]</del>


BOILERPLATE(023‚a. V1 UNIX I/O buffer count vs. performance benchmark — blognꞌt, 023‚a. V1 UNIX I/O buffer count vs. performance benchmark, en-GB, BLOGN_T_STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

ol.arrows > li:first-child::marker {
	content: "";
}
ol.arrows > li::marker {
	content: "→ ";
}

.offset {
	margin-left: -2em;
}
@media (min-device-width: 800px) {
	.offset {
		margin-left: -4em;
	}
}
@media (min-device-width: 600px) {
	.offset {
		margin-left: -4em;
	}
}
.offset {
	border: 1px solid;
	border-radius: 1em;
	padding: 0.5em;
/*	padding-top: 0;*/
}
.offset figcaption:last-child {
	padding: 0.5em;
	text-align: center;
}

pre .label {
	border-radius: 3px;
	padding: 1px 0.5px;
}
pre .label.a { background-color: #ff00007f; }
pre .label.b { background-color: #ff00ff7f; }
pre .label.c { background-color: #0000ff7f; }
pre .label.d { background-color: #00ffff7f; }
pre .label.e { background-color: #00ff007f; }
pre .label.f { background-color: #ffff007f; }

pre.linenos {
	float: left;
	text-align: right;
	padding-right: 0.25em;
	margin-right: 0.25em;
	border-right: 1px dashed;
}

cite {
	font-size: 83.3653266056052%;
}

cite var {
	font-style: normal; /* nested italics */
}

tt, pre {
	font-family: "Droid Sans Mono", monospace;
}

pre {
	margin: 0;
}


del {
	opacity: 80%;
	text-decoration: none;
}

ol, ul {
	padding-left: 1em;
}

pre small {
	display: block;
}

* {
	     tab-size: 8 !important;
	-moz-tab-size: 8 !important;
}
figure.C > pre,
figure.C > pre * {
	     tab-size: 4 !important;
	-moz-tab-size: 4 !important;
}

pre small {
	letter-spacing: 13%;
}

kbd {
	font-weight: bold;
}

@media (prefers-color-scheme: light) {
	.light-invert {
		filter: invert(1);
	}
}
</style>

#define unix <span class="smallcaps">unix</span>
BLOGN_T_HEADING(023,a. V1 unix I/O buffer count vs. performance benchmark)

<p class="continued">
My draft for post 023 currently quips
</p>
<blockquote style="margin-left: 0;" class="continuing">
(to wit: V1's<!--'--> filesystem cache consists of 1 – The – open file
 <cite>(<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L215"><tt>iget</tt></a> (<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L270">+ <tt>icalc</tt></a>),
        <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#ux#L15"><tt>inode</tt>, <tt>i.<var>*</var></tt>, <tt>ii</tt>, <tt>idev</tt>, <tt>cdev</tt>, <tt>imod</tt></a>)</cite>,
 and up to 6 (<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L40">installer kernel has 2</a>, I'm<!--'--> pretty sure even just 1 would work) 512-byte I/O block buffers
 <cite>(<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L40"><tt>nbuf</tt></a>,
        <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#ux#L71"><tt>buffer</tt></a> (<tt>bufp</tt>),
        <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L180"><tt>wslot</tt></a>)</cite>
 (the block containing The open i-node isn't<!--'--> cached)).
</blockquote>
<p class="continuing">
but <q>pretty sure</q> is not good enough.
If only there were some way to compile and run a V1 kernel and test this directly!
</p>
<p class="indented continuing">
This is borne out of pedantry and to satisfy my neurosis, because
</p>
<ol class="arrows">
	<li><tt>write (II)</tt></li>
	<li><tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u1#L334">syswrite</a></tt></li>
	<li><tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u6#L125">writei</a><small>node</small></tt></li>
	<li><tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u6#L212">dskw</a> <small>(<q>write routine for non-special files</q>)</small></tt></li>
</ol>
<p class="continuing">
says
</p>
#include "023,a.01-dskw.h"

<p class="indented continued">
The comment on the <tt>dskwr</tt> call implies that it'll<!--'--> (schedule to)
<abbr title="A pedantic reader will notice that is not how V1's buffering works. More on this in 023,b. For the purposes of this post we can consider the caching models to be black boxes.">
	write the current i-node as well as the just-written-to data block</abbr>.
This is conspicuous given that <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L40">the installation build of the kernel</a>
downgrades from 6 I/O buffers to 2.
Are those the same two?
</p>
<p class="indented continuing">
<a href="//lfs.nabijaczleweli.xyz/0033-unix-jun72">unix72</a> builds an image containing the unpacked source in <tt>/usr/sys</tt>,
so it's<!--'--> pretty easy to just Do this.
time (II) is updated to return a sentinel large value to check if running updated kernel
(this would be better served with a <tt>printf</tt> or the like, but this kernel doesn't<!--'--> have <em>any</em> kernel output facility):
</p>
<pre>
<!----># <kbd>cp u2.s u2.s.orig</kbd>
<!----># <kbd>ed u2.s</kbd>
19053
<kbd>.,.+4p</kbd>
systime: / get time of year
<!--"-->	mov	s.time,4(sp)<!--"-->
<!--"-->	mov	s.time+2,2(sp) / put the present time on the stack<!--"-->
<!--"-->	br	sysret4<!--"-->
<!---->
<kbd><del>/sys/t@</del>/systime/</kbd>
systime: / get time of year
<!---->
<!--"-->	mov	s.time,4(sp)<!--"-->
<kbd>s/s.time/$65<del>3#5</del>35./
p</kbd>
<!--"-->	mov	$65535.,4(sp)<!--"-->
<!---->
<!--"-->	mov	s.time+2,2(sp) / put the present time on the stack<!--"-->
<kbd>s/s.time+2/<del>65535#####</del>$655<del>4$##</del>3<del>4#4#</del>5./
p</kbd>
<!--"-->	mov	$65535.,2(sp) / put the present time on the stack<!--"-->
<!---->
<!----># <kbd>cp u0.s u0.s.orig</kbd>
<!----># <kbd><del>ed us@</del>ed u0.s</kbd>
12636
<kbd>/nbuf/</kbd>
nbuf = 6
<kbd>d
d
d
p</kbd>
.endif
<kbd>d
i
nbuf = 1
.
w</kbd>
12588
<kbd>q</kbd>
<!----># <kbd>as u*.s</kbd>
I
II
<!----># <kbd>ls -l</kbd>
total  539
225 lxrwrw  1 root  36432 Jan  1 00:00:00 a.out
</pre>

<p class="indented continued">
What remains is the matter of getting the kernel to boot.
The unix72 bootloader is broadly-compatible with
<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=195">boot procedures (VII)</a>
and documented in
<a href="//git.sr.ht/~nabijaczleweli/unix-jun72/tree/trunk/item/boot/README"><tt>boot/README</tt></a>:
</p>
<blockquote class="continuing">
<p class="continuation">
NOTE: For using kernels built using the V2 assembler, all of the following
should refer to msys2, instead of msys.
</p>
<p>
Alternatively, everything can be installed while running under the V1 system
using the following procedure:
</p>
<p style="margin-left: 2em;">
    First, build the support programs: bos and msys
</p>
<pre style="margin-left: 4em;">
chdir /usr/boot
sh run
</pre>
<p style="margin-left: 2em;">
DEL
If you build a kernel under V1, then you can install it into the DEL cold
boot area (such as for testing) with:
</p>
<pre style="margin-left: 4em;">
msys 1 name_of_kernel
</pre>
<p style="margin-left: 2em;">
<del>[I]</del>f the cold boot area is being used for testing new kernels,
then the kernel can be bootstrapped using:
</p>
<pre style="margin-left: 4em;">
tools/pdp11 boot/simh_cold.cfg
</pre>
</blockquote>
<p class="continuation">
(layout sic!).
The only difference in <tt>boot/simh_cold.cfg</tt> is the console switches going from 173700<sub><small>8</small></sub> to 1.
I bring this documentation up only because the <tt>run</tt> script doesn't<!--'--> actually build <tt>msys2</tt>,
which one'd<!--'--> think rather defeats the purpose, since running it is only meaningful in the emulated system,
which we know only has the V2 assembler.
unix72 is universally weird like this.
</p>

<pre class="continued">
<!----># <kbd>chdir /usr/boot</kbd>
<!----># <kbd>cat run</kbd>
as bos.s
mv a.out bos
as msys.s
mv a.out msys
<!----># <kbd>as msys2.s</kbd>
I
II
<!----># <kbd>mv a.out msys2</kbd>
<!----># <kbd>msys2 1 /usr/sys/a.out</kbd>
<!----># <kbd>date</kbd>
Sun Jan 23 22:46:32
<!----># <kbd>^E</kbd>
Simulation stopped, PC: 007332 (MOV (SP)+,25244)
sim> <kbd>q</kbd>
Goodbye
RF: writing buffer to file
TC0: writing buffer to file
unix72$ <kbd>pdp11 simh_cold.cfg</kbd>
PDP-11 simulator V3.8-1
Disabling CR
Disabling XQ
RF: buffering file in memory
TC0: 16b format, buffering file in memory

:login: root
root
<!----># <kbd>date</kbd>
Sun Dec <9 12:06:28
<!----># <kbd>chdir /usr/sys</kbd>
<!----># <kbd>as u*.s</kbd>
I
II
<!---->#
</pre>
<p class="continuing">
so it does work, it just took a little longer. Well, it felt longer.
</p>
<p class="indented continuing">
This paragraph was going to start "Easy enough to quantify, though:" but it isn't<!--'-->, because SIMH resists being instrumented at every turn.
What <em>is</em> easy is making the kernel self-identify by putting <tt>nbuf</tt> in the minutes field of date (I)
(there's<!--'--> an off-by-one in the division for seconds, so just returning <code>60*nbuf</code> for nbuf=4 yields <tt><q>Fri Jan &nbsp;1 00:00:03</q></tt>):
</p>
<pre class="continuation">
<!----># <kbd>ed u2.s</kbd>
19053
/65535/
        mov     $65535.,4(sp)
s/65535/0/

        mov     $65535.,2(sp) / put the present time on the stack
s/\$65535./$[60. * 60. * nbuf]/
w
19061

<!----># <kbd>as u*.s</kbd>
I
II
<!----># <kbd>/usr/boot/msys2 1 a.out</kbd>
<!----># <kbd>^E</kbd>
Simulation stopped, PC: 007332 (MOV (SP)+,25232)
sim> <kbd>q</kbd>
unix72$ <kbd>pdp11 simh_cold.cfg</kbd>
:login: <kbd>root</kbd>
root
<!----># <kbd>date</kbd>
Fri Jan  1 00:01:00
</pre>

<pre class="continued">
<!----># <kbd>chdir /usr/sys</kbd>
<!----># <kbd>cat >nbuf
: echo leaves a space at the end of every line
echo /nbuf/s/=.\*/= $1/p >.ed
echo w                  >>.ed
ed .ed
1,$s/ $//
w
q
ed u0.s <.ed
rm .ed
as u*.s
mv a.out nbuf.$1</kbd>
<!----># <kbd>sh nbuf 0; sh nbuf 1; sh nbuf DEL; sh nbuf 11; sh nbuf 12</kbd>
<!----># <kbd>ls -l nbuf*</kbd>
<!--"-->220 s-rwrw  1 root    178 Jan  1 00:00:00 nbuf<!--"-->
<!--"-->240 lxrwrw  1 root  36432 Jan  1 00:00:00 nbuf.0<!--"-->
<!--"-->230 lxrwrw  1 root  36432 Jan  1 00:00:00 nbuf.1<!--"-->
<!--"-->242 lxrwrw  1 root  37960 Jan  1 00:00:00 nbuf.10<!--"-->
<!--"-->234 lxrwrw  1 root  39004 Jan  1 00:00:00 nbuf.11<!--"-->
<!--"-->236 lxrwrw  1 root  40048 Jan  1 00:00:00 nbuf.12<!--"-->
<!--"-->232 lxrwrw  1 root  36432 Jan  1 00:00:00 nbuf.2<!--"-->
<!--"-->225 lxrwrw  1 root  36432 Jan  1 00:00:00 nbuf.3<!--"-->
<!--"-->237 lxrwrw  1 root  36432 Jan  1 00:00:00 nbuf.4<!--"-->
<!--"-->231 lxrwrw  1 root  36432 Jan  1 00:00:00 nbuf.5<!--"-->
<!--"-->235 lxrwrw  1 root  36432 Jan  1 00:00:00 nbuf.6<!--"-->
<!--"-->238 lxrwrw  1 root  36916 Jan  1 00:00:00 nbuf.7<!--"-->
<!--"-->239 lxrwrw  1 root  37960 Jan  1 00:00:00 nbuf.8<!--"-->
<!--"-->241 lxrwrw  1 root  39004 Jan  1 00:00:00 nbuf.9<!--"-->
<!----># <kbd>/usr/boot/msys2 1 nbuf.0</kbd>
<!----># <kbd>^E</kbd>
sim> <kbd>q</kbd>
unix72$ <kbd>pdp11 simh_cold.cfg</kbd>
Disabling CR
Disabling XQ
RF: buffering file in memory
TC0: 16b format, buffering file in memory
Listening on port 5555 (socket 7)
<del>(it loops here)</del>
Simulation stopped, PC: 001000 (TSTB 25135)
sim> <del>q</del>
</pre>
<p class="continuing">
so 0 obviously doesn't<!--'--> work (entirely unsurprisingly).
6, as shipped, is the max: 7 crashes with
</p>
<blockquote class="continuation">
<tt>Trap stack push abort, PC: 011600 (BNE 11612)</tt>
</blockquote>

<p class="indented continued">
The instrumentation is then "install kernel, exit; boot it, compile the kernel, exit". <kbd>^E</kbd> is byte 5.
</p>
<pre>
<!--"-->for i in $(seq 6); do<!--"-->
<!--"-->	{ sleep 1; echo root; echo "/usr/boot/msys2 1 /usr/sys/nbuf.$i";<!--"-->
<!--"-->	  sleep 1; printf '\005'; sleep 0.2; echo q; } |<!--"-->
<!--"-->		script /dev/null -c 'pdp11 simh.cfg'<!--"-->
<!--"-->	for sample in $(seq 10); do<!--"-->
<!--"-->		{ sleep 1; echo root; echo date; echo "chdir /usr/sys"; echo "as u*.s";<!--"-->
<!--"-->		  sleep 5; printf '\005'; sleep 0.2; echo q; } |<!--"-->
<!--"-->			script log.$i+$sample -T log.$i+$sample.tm -c 'pdp11 simh_cold.cfg'<!--"-->
<!--"-->	done<!--"-->
<!--"-->done<!--"-->
</pre>
<p class="continued">
Time samples can be found by <a href="/content/assets/blogn_t/023,a.01-parser.cpp">parsing</a> the (time) logs:
</p>
<!--
3.089472s: log.1
3.111546s: log.1
3.069670s: log.1
3.059972s: log.1
3.051238s: log.1
3.104852s: log.1
3.374483s: log.1
3.053362s: log.1
3.060943s: log.1
3.171275s: log.1
3.150920s: log.1
3.111829s: log.1
3.070184s: log.1
3.287678s: log.1
3.086909s: log.1
3.159535s: log.1
3.090829s: log.1
3.058854s: log.1
3.301087s: log.1
3.032912s: log.1
3.086063s: log.1
3.158491s: log.1
3.062695s: log.1
3.075707s: log.1
3.254755s: log.1
1.322997s: log.2
1.296934s: log.2
1.306806s: log.2
1.299251s: log.2
1.309037s: log.2
1.300868s: log.2
1.303242s: log.2
1.307097s: log.2
1.303823s: log.2
1.304637s: log.2
1.300503s: log.2
1.329324s: log.2
1.300778s: log.2
1.306288s: log.2
1.297252s: log.2
1.391388s: log.2
1.311729s: log.2
1.308864s: log.2
1.277079s: log.2
1.355897s: log.2
1.362374s: log.2
1.300994s: log.2
1.297451s: log.2
1.300042s: log.2
1.300317s: log.2
0.991696s: log.3
0.992638s: log.3
1.004344s: log.3
0.992051s: log.3
0.996795s: log.3
0.992992s: log.3
0.999235s: log.3
1.004857s: log.3
0.984199s: log.3
1.003325s: log.3
1.012972s: log.3
1.002739s: log.3
1.002213s: log.3
0.986319s: log.3
0.993444s: log.3
1.004088s: log.3
1.000995s: log.3
0.999323s: log.3
1.000193s: log.3
0.999016s: log.3
1.005345s: log.3
1.003168s: log.3
1.010267s: log.3
1.003820s: log.3
0.999272s: log.3
0.765964s: log.4
0.751000s: log.4
0.756883s: log.4
0.760165s: log.4
0.768689s: log.4
0.759780s: log.4
0.770072s: log.4
0.770772s: log.4
0.748427s: log.4
0.766785s: log.4
0.764432s: log.4
0.746427s: log.4
0.756008s: log.4
0.755073s: log.4
0.768758s: log.4
0.762580s: log.4
0.792220s: log.4
0.766032s: log.4
0.750377s: log.4
0.759079s: log.4
0.759669s: log.4
0.764008s: log.4
0.762561s: log.4
0.750332s: log.4
0.772324s: log.4
0.718920s: log.5
0.724461s: log.5
0.719645s: log.5
0.723170s: log.5
0.719862s: log.5
0.717961s: log.5
0.720314s: log.5
0.728411s: log.5
0.721577s: log.5
0.720466s: log.5
0.723177s: log.5
0.723622s: log.5
0.721433s: log.5
0.720886s: log.5
0.719573s: log.5
0.719127s: log.5
0.721585s: log.5
0.719419s: log.5
0.721195s: log.5
0.720431s: log.5
0.719682s: log.5
0.719675s: log.5
0.719535s: log.5
0.718997s: log.5
0.720640s: log.5
0.718169s: log.6
0.718189s: log.6
0.722394s: log.6
0.718941s: log.6
0.717006s: log.6
0.722416s: log.6
0.719249s: log.6
0.716889s: log.6
0.717868s: log.6
0.737526s: log.6
0.719055s: log.6
0.723793s: log.6
0.721165s: log.6
0.717377s: log.6
0.717185s: log.6
0.718586s: log.6
0.717744s: log.6
0.717190s: log.6
0.717851s: log.6
0.717381s: log.6
0.716304s: log.6
0.717867s: log.6
0.724943s: log.6
0.719816s: log.6
0.717491s: log.6

nabijaczleweli@tarta:~/store/vm/unix72/logc$ for f in *.tm; do ../023,a.01-parser ${f%.tm} $f; done | sed 's/+.*//' | hypermid
Benchmark 6: log.1
Time (mean ± σ):       3125.410440 ms ±    87.628246 ms
Range (min … max):     3032.912000 ms …  3374.483000 ms    25 runs

Benchmark 5: log.2
Time (mean ± σ):       1311.798880 ms ±    23.923147 ms
Range (min … max):     1277.079000 ms …  1391.388000 ms    25 runs

Benchmark 4: log.3
Time (mean ± σ):        999.412240 ms ±     6.723066 ms
Range (min … max):      984.199000 ms …  1012.972000 ms    25 runs

Benchmark 3: log.4
Time (mean ± σ):        761.936680 ms ±     9.526866 ms
Range (min … max):      746.427000 ms …   792.220000 ms    25 runs

Benchmark 2: log.5
Time (mean ± σ):        720.950560 ms ±     2.187914 ms
Range (min … max):      717.961000 ms …   728.411000 ms    25 runs

Benchmark 1: log.6
Time (mean ± σ):        719.695800 ms ±     4.265195 ms
Range (min … max):      716.304000 ms …   737.526000 ms    25 runs
-->
<table class="perf">
	<tr><th><tt>nbuf</tt></th> <th>Time to <tt>as u*.s</tt></th> <th>speedup</th> <th>vs previous</th></tr>
	<tr><th>1            </th>                    <td>3.12s </td></tr>
	<tr><th>2            </th>                    <td>1.31s </td> <td>2.383×</td>      <td>138.3%</td></tr>
	<tr><th>3            </th>                    <td> 999ms</td> <td>3.127×</td>      <td> 31.3%</td></tr>
	<tr><th>4            </th>                    <td> 762ms</td> <td>4.102×</td>      <td> 31.2%</td></tr>
	<tr><th>5            </th>                    <td> 721ms</td> <td>4.335×</td>      <td>  6.7%</td></tr>
	<tr><th>6            </th>                    <td> 720ms</td> <td>4.343×</td>      <td>   .2%</td></tr>
</table>
<style>
table.perf tr > * {
	padding-left:  0.25em;
	padding-right: 0.25em;
}
table.perf tr:nth-child(2n) {
	background-color: #80808020;
}

table.perf {
	margin-left: 1em;
	text-align: right;
}
</style>
<p class="continuation">
This would be much more linear, except nbufs=1 pays double price because in that configuration,
having <em>any</em> in-flight I/O blocks <em>any</em> disk I/O (except to the superblock and swap),
so unix and the disk no longer run in parallel.
This is in an emulator with functionally-instant-for-the-time I/O.
One has to assume this'd<!--'--> be <em>much</em> worse on hardware.
See chart, below, with half of nbufs=1 additionally indicated.
</p>

<p class="indented">
In conclusion:
nbufs=2 is a soft usability minimum, more-so than a hard limit, and
the distribution kernel ships as many nbufs as it can easily fit.
</p>

<img src="/content/assets/blogn_t/023,a.03-graph.png" style="width: 100%; max-height: 50em;" class="light-invert" />

BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
