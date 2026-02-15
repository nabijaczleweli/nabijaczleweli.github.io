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
#include "blogue.h"
#include "blogue/023,a!01-linenos.html"


   <!-- RSS_PUB_DATE: "Fri, 23 Jan 2026 21:28:16 +0100" -->
#define POST_DATE      Fri, 23 Jan 2026 21:28:16 +0100
#define POST_POST_DATE

#define DEL <del>[…]</del>
#define pdp <span class="smallcaps">pdp</span>


BOILERPLATE(023‚b. A J. DeFelice polemick on V1 UNIX buffering schemes‚ novel results regarding V1 UNIX mounts‚ on the conceptualisation of the file system and block device partitioning — blogue, 023‚b. A J. DeFelice polemick on V1 UNIX buffering schemes‚ novel results regarding V1 UNIX mounts‚ on the conceptualisation of the file system and block device partitioning, en-GB, BLOGN_T_STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

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
.offset figcaption:first-child {
	padding-bottom: 0.25em;
	text-align: center;
}
.offset figcaption:last-child {
	padding: 0.5em;
	text-align: center;
}

pre .label {
	border-radius: 3px;
	padding: 1px 0.5px;
}
.label.a { background-color: #ff00007f; }
.label.b { background-color: #ff00ff7f; }
.label.c { background-color: #0000ff7f; }
.label.d { background-color: #00ffff7f; }
.label.e { background-color: #00ff007f; }
.label.f { background-color: #ffff007f; }

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
cite.inline {
	font-size: inherit;
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

cite blockquote {
	font-style: normal;
}
</style>

#define unix <span class="smallcaps">unix</span>
BLOGN_T_HEADING(023,b. A J. DeFelice polemick on V1 unix buffering schemes, novel results regarding V1 unix mounts, on the conceptualisation of the file system and block device partitioning)

<p class="indented continued">
If we cast our <a href="023,a-v1-nbuf-benchmark.html">minds back</a> and eyeballs down to
	<tt>write (II)</tt>
→	<tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u1#L334">syswrite</a></tt>
→	<tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u6#L125">writei</a><small>node</small></tt>
→	<tt><a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u6#L212">dskw</a> <small>(<q>write routine for non-special files</q>)</small></tt>:
</p>
#include "023,a.01-dskw.h"
<p class="continuing">
we observe the following: accd'g<!--'--> to
<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/PreliminaryUnixImplementationDocument_Jun72.pdf#page=2">DeFelice's<!--'--> commentary</a>,
the final <tt>dskwr</tt> call will schedule I/O such that
<q>the</q> (implied current) i-node <em>and</em> the freshly-written data block are sent to disk.
This is not true:
the old i-node (if any) was already enqueued,
the current i-node is not affected by this call,
and the only buffer scheduled here is the new data block.
</p>
<p class="indented continuation">
This is all the more interesting because the behaviour of the <tt>iget</tt> call is labelled correctly, and would contradict the supposed <tt>dskwr</tt> behaviour.
</p>


HEADING_S(3, PSW, class="continued", <tt><q>proc. status</q></tt>)
<p class="continuing">
is the process<em>or</em> status,
which contains arithmetic status flags
(<cite><a href="//archive.org/details/bitsavers_decpdp11ha11ArchitectureHandbook1983_28728405/page/79/mode/1up?q=ps">overflow, carry, zero, negative</a></cite>)
and the <a href="//bitsavers.informatik.uni-stuttgart.de/pdf/dec/pdp11/handbooks/EB-24944-18_Micro_PDP-11_Handbook_1983-84.pdf#page=277">interrupt priority</a>:
</p>
<blockquote class="continuing">
During the interrupt acknowledge and priority arbitration phase the
LSI-11/23 processor will acknowledge interrupts under the following
conditions:
<ol>
	<li>The device interrupt priority is higher than the current PS&lt;7:5>.</li>
	<li>The processor has completed instruction execution and no additional bus cycles are pending.</li>
</ol>
</blockquote>
<p class="continuing">
which can themselves go up to 7 (and <span class="smallcaps">micro/pdp-11</span>'s<!--'--> smallest interrupt priority seems to be 4),
so setting it to 7 blocks all interrupts.
The V1 kernel uses these values:
</p>
<style>
HASHps-comparison {
	margin-left: 1em;
}
HASHps-comparison td:nth-child(1),
HASHps-comparison td:nth-child(3),
HASHps-comparison td:nth-child(4) {
	font-family: "Droid Sans Mono", monospace;
}
HASHps-comparison td:nth-child(2),
HASHps-comparison td:nth-child(4) {
	padding-left: 0.5em;
	text-align: right;
}
HASHps-comparison td:nth-child(3)::before {
}
HASHps-comparison td:nth-child(3),
HASHps-comparison td:nth-child(5) {
	padding-right: 0.5em;
}
HASHps-comparison td:nth-child(3)::before,
HASHps-comparison td:nth-child(5)::before {
	content: "=";
	float: left;
	margin-left: -0.25em;
}
HASHps-comparison td:nth-child(6) {
	text-align: right;
}
</style>
#define O0   0<sub><small style="opacity: 0;">8</small></sub>
#define O(o) o<sub><small>8</small></sub>
<table id="ps-comparison">
	<tr><th>Instruction</th>	<th colspan=2>Value</th>			<th colspan=2>Priority</th>	<th>Occurrences</th>	<th>Filter</th></tr>
	<tr><td>clr	*$ps</td>	<td>O0</td>	<td>0000 0000 0000 0000</td>	<td>000</td>	<td>0</td>	<td>13<del>+1</del></td>	<td>All interrupts allowed</td></tr>
	<tr><td>mov	$240,*$ps</td>	<td>O(240)</td>	<td>0000 0000 1010 0000</td>	<td>101</td>	<td>5</td>	<td>11<del>+1</del></td>	<td>Priority 6, 7 interrupts allowed</td></tr>
	<tr><td>mov	$300,*$ps</td>	<td>O(300)</td>	<td>0000 0000 1100 0000</td>	<td>110</td>	<td>6</td>	<td>2<del style="opacity: 0;">+0</del></td>	<td>Priority 7 interrupts allowed</td></tr>
	<tr><td>mov	$340,*$ps</td>	<td>O(340)</td>	<td>0000 0000 1110 0000</td>	<td>111</td>	<td>7</td>	<td>2<del style="opacity: 0;">+0</del></td>	<td>All interrupts blocked</td></tr>
</table>
#undef O
#undef O0

<p class="indented continued">
Priority 7 is used to guard the I/O buffer queue:
set by <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L295"><tt>bufaloc</tt></a>
— which finds, locks, and returns a dynamic I/O buffer slot or sleeps in I/O wait until one is available —
and in <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L188"><tt>ppoke</tt></a> which wraps <tt>poke</tt> in priority=7
— used by static <tt>sb0</tt>/<tt>sb1</tt>/<tt>swp</tt> I/O buffer slots.
<tt>poke</tt> enqueues dirty buffers onto their respective device I/O queues
(so it requires priority=7 on entry — this matches "must call with these locks held" interface contracts in modern Linux).
</p>
<p class="indented continuing">
Priority 6
(<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u4#L270"><tt>swap</tt></a>,
 <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u4#L270"><tt>sleep</tt></a>)
is used to guard the run queues (<tt>runq</tt>, <tt>p.link</tt>).
Their precise structure is thankfully not relevant here.
</p>
<p class="indented continuing">
Priority 5 is used by the teletype driver to protect tty state (thus why its use sprawls quite so).
</p>
<p class="indented continuation">
Priority is cleared when not in a critical section
(or during lock inversion while in I/O sleep in <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u3#L156"><tt>idle</tt></a>).
</p>

<p class="indented">
One would be remiss to not note that this interface, obviously, is not very good:
it'<!--'-->s less of an issue for a system with barely any memory management,
but overwriting other flags (well, the non-ephemeral ones to the left of the priority)
combined with a text-search-defeating non-zero offset both suck ass.
Thus,
<a href="//bitsavers.informatik.uni-stuttgart.de/pdf/dec/pdp11/handbooks/EB-24944-18_Micro_PDP-11_Handbook_1983-84.pdf#page=332">
	subsequent systems grow an <tt>spl</tt> instruction</a>
and C unix/**/es have (<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/conf/mch.s#L674">V4 has</a>) <tt>spl<var>[\
<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/dmr/bio.c#L149">0</a>\
<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/ken/clock.c#L75">1</a>\
<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/dmr/pc.c#L72">4</a>\
<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/dmr/rf.c#L34">5</a>\
<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/ken/slp.c#L78">6</a>\
<a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/ken/sys2.c#L226">7</a>\
]</var>()</tt> functions,
which use this instruction on the pdp-11/45 (and open-code it on the pdp-11/40, emulating atomicity by ORing to get to privilege 7, then clearing the unneeded bits).
(Note also how pdp-11/40 <tt>spl4()</tt> falls through to <tt>spl5()</tt>.)
</p>


HEADING_S(3, buffer, class="continued", Buffered block I/O)
<p class="continuation">
was touched upon in the last post, but only insofar as the number of dynamic buffers.
</p>

<figure class="offset C">
	<figcaption>
		<tt>_</tt>-prefixed names were invented for exposition; others match source.<br />
		Upper-case comments are DeFelice's<!--'-->; others from me.<br />
		This is covered by <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#ux">the final file with variables</a>
		and <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L79">the top of on-entry initialisation</a>.
	</figcaption>

<del>
LINETEXTS__7_ux_1__1s__1_ux_1s__3_ux_2__1_u0_3__2s_ux_3__1_ux_2_u0_3__1_ux_1_u0_3__1__1s_ux_2_ux_1s_u0_2__1
LINENOS_7z_35f_1_1sz_1z_71f_1s_3z_1_71f_1_1z_115f_1_117f_2_2sz_36f_3_1z_2f_1_15f_1_122f_1_127f_1_125f_1_1z_24f_1_123f_1_129f_1_128f_1_1z_1sz_76f_1_75f_1_74f_1s_124f_1_130f_1_1z
</del>
<pre>
<!--       "-->struct _iobuf_hdr {<!--"-->
<!--       "-->	char  _dev;       	<del>// 0=<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=157">rf0</a>/1=<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=158">rk0</a>/≥2=<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=159">tap<var>0-7</var></a> (dectape)</del><!--"-->
<!--       "-->	char  _flags;<!--"-->
<!--       "-->	int   _block_number;<!--"-->
<!--       "-->	int   _word_count;	<del>// negative</del><!--"-->
<!--       "-->	char *_buf;<!--"-->
<!--       "-->};<!--"-->
<!--ux 35  "-->struct _iobuf_hdr * bufp[nbuf + 3];  <del>// priority = reverse index</del><!--"-->
<small>\
<!---->
</small>\
<!--       "-->struct {<!--"-->
<small>\
<!--ux 71  "-->	char _ttybufs[140][ntty];<!--"-->
</small>\
<!--       "-->	struct _dynamic_iobuf {<!--"-->
<!--       "-->		struct _iobuf_hdr _hdr;<!--"-->
<!--       "-->		char              _buf[512];<!--"-->
<!--ux 72  "-->	} _iobufs[nbuf];<!--"-->
<!--ux 71  "-->} buffer;<!--"-->
<!---->
<!--u0 115 "-->bufp[0..nbuf] = &buffer._iobufs[0..nbuf]._hdr;<!--"-->
<!--u0 117 "-->bufp[0..nbuf]->_buf        = buffer._iobufs[0..nbuf]._buf;<!--"-->
<!--u0 118 "-->bufp[0..nbuf]->_word_count = -256;  <del>// 512 bytes</del><!--"-->
<small>\
<!---->
<!---->
</small>\
<!--ux 36  "-->struct _iobuf_hdr sb0;  <del>// I/O queue entry drum</del><!--"-->
<!--ux 37  "-->struct _iobuf_hdr sb1;  <del>// I/O queue entry disk (mounted device)</del><!--"-->
<!--ux 38  "-->struct _iobuf_hdr swp;  <del>// I/O queue entry core image being swapped</del><!--"-->
<!---->
<!--ux 2   "-->struct <del>/* 218 bytes */</del> systm;  <del>// rootfs superblock</del><!--"-->
<!--ux 15  "-->struct inode           inode;<!--"-->
<!--u0 122 "-->bufp[nbuf]      = &sb0;<!--"-->
<!--u0 127 "-->sb0._buf        = &systm;<!--"-->
<!--u0 125 "-->sb0._word_count = (&systm - &inode) / 2;<!--"-->
<!---->
<!--ux 24  "-->char mount[1024];              <del>// second filesystem superblock</del><!--"-->
<!--u0 123 "-->bufp[nbuf + 1]  = &sb1;<!--"-->
<!--u0 129 "-->sb1._buf        = &mount;<!--"-->
<!--u0 128 "-->sb1._word_count = -512;  <del>// 1024 bytes</del><!--"-->
<!---->
<small>\
<!--       "-->union {<!--"-->
</small>\
<!--ux 76  "-->	struct <del>/*...*/</del> u;             <del>// process-specific state</del><!--"-->
<!--ux 75  "-->	char           user[64];<!--"-->
<small>\
<!--ux 74  "-->} [[pin(core - 64)]];          <del>// (precedes start of userspace memory)</del><!--"-->
</small>\
<!--u0 124 "-->bufp[nbuf + 2] = &swp;<!--"-->
<!--u0 130 "-->swp._buf       = &user;<!--"-->
<!--        --><del>// swp._word_count set when swapping process <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u3#L99">in</a>/<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u3#L81">out</a></del>
</pre>
</figure>

<p class="continued">
Herein we observe that:
</p>
<!-- 0: __COUNTER__ -->
#define LIC(val) li id=val value=val
#define LI LIC(__COUNTER__)
<script>
document.addEventListener("DOMContentLoaded", function() {
	Array.from(document.querySelectorAll("li[id][value]")).forEach(function(li) {
		let container = document.createElement("span");
		container.append(...li.childNodes);
		li.append(container);

		li.addEventListener("click", function(ev) {
			if(ev.target == li) {
				location.hash = "#" + li.id;
			}
		})
	});
});
</script>
<style>
li[id][value]::marker {
  cursor: pointer;
}
</style>
<ol>
	<LI>this assembler uses <a href="/vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L279"><tt>!</tt> for bit inversion</a>
	    (what C later called <tt>~</tt>; insert Rust retvrn gag)</li>
	<p></p>

	<LI>unix supports exactly 1 or 2 filesystems being mounted at any time</li>
	<LI>the super-block of the second filesystem, if any, is 1k, which matches
	    <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=172">file system (V)</a>
	    — <q>Every file system storage volume (e.g. RF disk, RK disk, DECtape reel) has a common format DEL divided into DEL 512 byte<del>)</del> blocks.
	         Blocks 0 and 1 are collectively known as the <u>super</u>-<u>block</u>.</q></li>
	<LI>the mandatory file-system
	    <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L85">resides</a>
	    <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L154">on</a>
	    <tt>rf0</tt></a> and its super-block is but <em>218</em> bytes!</li>
	<LI>this is because the V1 file system is self-describing unstructuredslop with its two fields (free-block bitmap, free-i-node bitmap)
	    laid out length-prefixed, unpadded, in order,
	    and <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L82">both</a> <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L188">parsers</a>
	    effectively take an <tt>int *</tt></li>
	<LI>because of this, the root filesystem's<!--'--> size is encoded in the kernel
	    — <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#ux#L3">128 * 8 blocks, 64 * 8 i-nodes</a>
	      (also <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L171">mirrored</a>
	       in the <a href="014-unix-pre-v4-pid0-corollary.html#superblock installation">installer</a>) —
	    and changing this would render kernels configured with differently-sized root filesystems unbootable</li>
	<LI>(but if you copy a rootfs to a different device, it's<!--'--> still usable generically)</li>
	<LI>these sizes mean that, by definition, the rootfs is 1024 blocks long (512k, matching the documented RK05 size),
	    and can contain up to 512 files</li>
	<LI>(it's<!--'--> actually less, because the blocks at the end of the filesystem are marked as used and data is stored there at well-known addresses:
	     the last 32k of the disk is used for the bootloader and kernels,
	     then 136k for swapped-out process images
	     (8k+512 per process (corresponding to the userspace memory size + 1 block for kernel <tt>user</tt> area), <tt>nproc</tt> = 16);
	     i-node storage takes up an additional 32 blocks, so there are 654 data blocks (327k) on the rootfs)</li>
	<LI>((if you added more processes to your unix (or if you added more memory so you're swapping out more memory per process) but didn't re-create the rootfs,
	      then the system will boot but the bottom of the area the new unix will swap to will still be marked as free,
	      so if you happen to allocate blocks in that range (i.e. when you fill your rootfs)
	      then those blocks will overwrite parts of the swapped-out image for the last process in the process tables))</li>
	<LI>the rootfs's privileged position means you can just stuff debug data after the filesystem stuff in the super-block and it's chill,
	    so long as you keep it under 512 bytes
	    — they <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=173">advertise</a> this as
	           <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=97">tm (I)</a> —
	    system-wide accounting of time spent in the kernel (<tt>s.syst</tt>, which tm calls <tt><q>ovh</q></tt>, which is rather telling of the attitudes of the time)
	    vs. in what we'd<!--'--> call iowait (<tt>s.wait</tt>/<tt><q>dsk</q></tt>)
	    vs. idle (no process to run) (<tt>s.idlet</tt>/<tt><q>idl</q></tt>)
	    vs. in userspace (<tt>s.chrgt</tt>/<tt><q>usr</q></tt>)
	    + error count (<tt>s.drerr</tt>/<tt><q>der</q></tt>;
	                   the source doesn't use this symbol at all, but it's got fully functional logs in the manual,
	                   so perhaps DeFelice got an early (or late) version with this stubbed out? unclear.)
	    —
	    but the real current time is also kept there
	    (the clock updating the time(s) doesn't<!--'--> cause the super-block to be written to disk, of course, but it will come along with the next update)
	</li>
	<LI>an additional side-effect of this is that on each rootfs superblock update
	    (i.e. when-ever the block or i-node bitmaps are updated, i.e. on file creation/destruction and file growth/shrinkage),
	    <em>less than half a block</em> is written to disk;
	    conversely, every time the optional file-system is updated <small>(as above)</small>, the <em>entire kilobyte</em> is sent to disk/tape</li>
	<LI>similarly, this frees appx. two dynamic I/O buffers'<!--'--> worth of space in the kernel,
	    which, <a href="023,a-v1-nbuf-benchmark.html">as proven before</a>, is very much worth it,
	    and gaining two I/O buffers (4 → 6 (shipped value)) makes the system ~30% faster in an emulator</li>
<!--
for space_for_blocks in $(seq 2 2 1020); do
	blocks=$(( space_for_blocks * 8 ))

	space_for_inodes=$(( 1020 - space_for_blocks ))
	inodes=$(( space_for_inodes * 8 ))
	last_inode_block=$(( (inodes+31)/16 ))

	[ $last_inode_block -le $blocks ] && echo blocks=$blocks inodes=$inodes
done
blocks=496 inodes=7664
blocks=512 inodes=7648
blocks=528 inodes=7632
blocks=544 inodes=7616
blocks=560 inodes=7600
blocks=576 inodes=7584
blocks=592 inodes=7568
blocks=608 inodes=7552
blocks=624 inodes=7536
blocks=640 inodes=7520
blocks=656 inodes=7504
blocks=672 inodes=7488
blocks=688 inodes=7472
blocks=704 inodes=7456
blocks=720 inodes=7440
blocks=736 inodes=7424
blocks=752 inodes=7408
blocks=768 inodes=7392
blocks=784 inodes=7376
blocks=800 inodes=7360
blocks=816 inodes=7344
blocks=832 inodes=7328
blocks=848 inodes=7312
blocks=864 inodes=7296
blocks=880 inodes=7280
blocks=896 inodes=7264
blocks=912 inodes=7248
blocks=928 inodes=7232
blocks=944 inodes=7216
blocks=960 inodes=7200
blocks=976 inodes=7184
blocks=992 inodes=7168
blocks=1008 inodes=7152
blocks=1024 inodes=7136
blocks=1040 inodes=7120
blocks=1056 inodes=7104
blocks=1072 inodes=7088
blocks=1088 inodes=7072
blocks=1104 inodes=7056
blocks=1120 inodes=7040
blocks=1136 inodes=7024
blocks=1152 inodes=7008
blocks=1168 inodes=6992
blocks=1184 inodes=6976
blocks=1200 inodes=6960
blocks=1216 inodes=6944
blocks=1232 inodes=6928
blocks=1248 inodes=6912
blocks=1264 inodes=6896
blocks=1280 inodes=6880
blocks=1296 inodes=6864
blocks=1312 inodes=6848
blocks=1328 inodes=6832
blocks=1344 inodes=6816
blocks=1360 inodes=6800
blocks=1376 inodes=6784
blocks=1392 inodes=6768
blocks=1408 inodes=6752
blocks=1424 inodes=6736
blocks=1440 inodes=6720
blocks=1456 inodes=6704
blocks=1472 inodes=6688
blocks=1488 inodes=6672
blocks=1504 inodes=6656
blocks=1520 inodes=6640
blocks=1536 inodes=6624
blocks=1552 inodes=6608
blocks=1568 inodes=6592
blocks=1584 inodes=6576
blocks=1600 inodes=6560
blocks=1616 inodes=6544
blocks=1632 inodes=6528
blocks=1648 inodes=6512
blocks=1664 inodes=6496
blocks=1680 inodes=6480
blocks=1696 inodes=6464
blocks=1712 inodes=6448
blocks=1728 inodes=6432
blocks=1744 inodes=6416
blocks=1760 inodes=6400
blocks=1776 inodes=6384
blocks=1792 inodes=6368
blocks=1808 inodes=6352
blocks=1824 inodes=6336
blocks=1840 inodes=6320
blocks=1856 inodes=6304
blocks=1872 inodes=6288
blocks=1888 inodes=6272
blocks=1904 inodes=6256
blocks=1920 inodes=6240
blocks=1936 inodes=6224
blocks=1952 inodes=6208
blocks=1968 inodes=6192
blocks=1984 inodes=6176
blocks=2000 inodes=6160
blocks=2016 inodes=6144
blocks=2032 inodes=6128
blocks=2048 inodes=6112
blocks=2064 inodes=6096
blocks=2080 inodes=6080
blocks=2096 inodes=6064
blocks=2112 inodes=6048
blocks=2128 inodes=6032
blocks=2144 inodes=6016
blocks=2160 inodes=6000
blocks=2176 inodes=5984
blocks=2192 inodes=5968
blocks=2208 inodes=5952
blocks=2224 inodes=5936
blocks=2240 inodes=5920
blocks=2256 inodes=5904
blocks=2272 inodes=5888
blocks=2288 inodes=5872
blocks=2304 inodes=5856
blocks=2320 inodes=5840
blocks=2336 inodes=5824
blocks=2352 inodes=5808
blocks=2368 inodes=5792
blocks=2384 inodes=5776
blocks=2400 inodes=5760
blocks=2416 inodes=5744
blocks=2432 inodes=5728
blocks=2448 inodes=5712
blocks=2464 inodes=5696
blocks=2480 inodes=5680
blocks=2496 inodes=5664
blocks=2512 inodes=5648
blocks=2528 inodes=5632
blocks=2544 inodes=5616
blocks=2560 inodes=5600
blocks=2576 inodes=5584
blocks=2592 inodes=5568
blocks=2608 inodes=5552
blocks=2624 inodes=5536
blocks=2640 inodes=5520
blocks=2656 inodes=5504
blocks=2672 inodes=5488
blocks=2688 inodes=5472
blocks=2704 inodes=5456
blocks=2720 inodes=5440
blocks=2736 inodes=5424
blocks=2752 inodes=5408
blocks=2768 inodes=5392
blocks=2784 inodes=5376
blocks=2800 inodes=5360
blocks=2816 inodes=5344
blocks=2832 inodes=5328
blocks=2848 inodes=5312
blocks=2864 inodes=5296
blocks=2880 inodes=5280
blocks=2896 inodes=5264
blocks=2912 inodes=5248
blocks=2928 inodes=5232
blocks=2944 inodes=5216
blocks=2960 inodes=5200
blocks=2976 inodes=5184
blocks=2992 inodes=5168
blocks=3008 inodes=5152
blocks=3024 inodes=5136
blocks=3040 inodes=5120
blocks=3056 inodes=5104
blocks=3072 inodes=5088
blocks=3088 inodes=5072
blocks=3104 inodes=5056
blocks=3120 inodes=5040
blocks=3136 inodes=5024
blocks=3152 inodes=5008
blocks=3168 inodes=4992
blocks=3184 inodes=4976
blocks=3200 inodes=4960
blocks=3216 inodes=4944
blocks=3232 inodes=4928
blocks=3248 inodes=4912
blocks=3264 inodes=4896
blocks=3280 inodes=4880
blocks=3296 inodes=4864
blocks=3312 inodes=4848
blocks=3328 inodes=4832
blocks=3344 inodes=4816
blocks=3360 inodes=4800
blocks=3376 inodes=4784
blocks=3392 inodes=4768
blocks=3408 inodes=4752
blocks=3424 inodes=4736
blocks=3440 inodes=4720
blocks=3456 inodes=4704
blocks=3472 inodes=4688
blocks=3488 inodes=4672
blocks=3504 inodes=4656
blocks=3520 inodes=4640
blocks=3536 inodes=4624
blocks=3552 inodes=4608
blocks=3568 inodes=4592
blocks=3584 inodes=4576
blocks=3600 inodes=4560
blocks=3616 inodes=4544
blocks=3632 inodes=4528
blocks=3648 inodes=4512
blocks=3664 inodes=4496
blocks=3680 inodes=4480
blocks=3696 inodes=4464
blocks=3712 inodes=4448
blocks=3728 inodes=4432
blocks=3744 inodes=4416
blocks=3760 inodes=4400
blocks=3776 inodes=4384
blocks=3792 inodes=4368
blocks=3808 inodes=4352
blocks=3824 inodes=4336
blocks=3840 inodes=4320
blocks=3856 inodes=4304
blocks=3872 inodes=4288
blocks=3888 inodes=4272
blocks=3904 inodes=4256
blocks=3920 inodes=4240
blocks=3936 inodes=4224
blocks=3952 inodes=4208
blocks=3968 inodes=4192
blocks=3984 inodes=4176
blocks=4000 inodes=4160
blocks=4016 inodes=4144
blocks=4032 inodes=4128
blocks=4048 inodes=4112
blocks=4064 inodes=4096
blocks=4080 inodes=4080
blocks=4096 inodes=4064
blocks=4112 inodes=4048
blocks=4128 inodes=4032
blocks=4144 inodes=4016
blocks=4160 inodes=4000
blocks=4176 inodes=3984
blocks=4192 inodes=3968
blocks=4208 inodes=3952
blocks=4224 inodes=3936
blocks=4240 inodes=3920
blocks=4256 inodes=3904
blocks=4272 inodes=3888
blocks=4288 inodes=3872
blocks=4304 inodes=3856
blocks=4320 inodes=3840
blocks=4336 inodes=3824
blocks=4352 inodes=3808
blocks=4368 inodes=3792
blocks=4384 inodes=3776
blocks=4400 inodes=3760
blocks=4416 inodes=3744
blocks=4432 inodes=3728
blocks=4448 inodes=3712
blocks=4464 inodes=3696
blocks=4480 inodes=3680
blocks=4496 inodes=3664
blocks=4512 inodes=3648
blocks=4528 inodes=3632
blocks=4544 inodes=3616
blocks=4560 inodes=3600
blocks=4576 inodes=3584
blocks=4592 inodes=3568
blocks=4608 inodes=3552
blocks=4624 inodes=3536
blocks=4640 inodes=3520
blocks=4656 inodes=3504
blocks=4672 inodes=3488
blocks=4688 inodes=3472
blocks=4704 inodes=3456
blocks=4720 inodes=3440
blocks=4736 inodes=3424
blocks=4752 inodes=3408
blocks=4768 inodes=3392
blocks=4784 inodes=3376
blocks=4800 inodes=3360
blocks=4816 inodes=3344
blocks=4832 inodes=3328
blocks=4848 inodes=3312
blocks=4864 inodes=3296
blocks=4880 inodes=3280
blocks=4896 inodes=3264
blocks=4912 inodes=3248
blocks=4928 inodes=3232
blocks=4944 inodes=3216
blocks=4960 inodes=3200
blocks=4976 inodes=3184
blocks=4992 inodes=3168
blocks=5008 inodes=3152
blocks=5024 inodes=3136
blocks=5040 inodes=3120
blocks=5056 inodes=3104
blocks=5072 inodes=3088
blocks=5088 inodes=3072
blocks=5104 inodes=3056
blocks=5120 inodes=3040
blocks=5136 inodes=3024
blocks=5152 inodes=3008
blocks=5168 inodes=2992
blocks=5184 inodes=2976
blocks=5200 inodes=2960
blocks=5216 inodes=2944
blocks=5232 inodes=2928
blocks=5248 inodes=2912
blocks=5264 inodes=2896
blocks=5280 inodes=2880
blocks=5296 inodes=2864
blocks=5312 inodes=2848
blocks=5328 inodes=2832
blocks=5344 inodes=2816
blocks=5360 inodes=2800
blocks=5376 inodes=2784
blocks=5392 inodes=2768
blocks=5408 inodes=2752
blocks=5424 inodes=2736
blocks=5440 inodes=2720
blocks=5456 inodes=2704
blocks=5472 inodes=2688
blocks=5488 inodes=2672
blocks=5504 inodes=2656
blocks=5520 inodes=2640
blocks=5536 inodes=2624
blocks=5552 inodes=2608
blocks=5568 inodes=2592
blocks=5584 inodes=2576
blocks=5600 inodes=2560
blocks=5616 inodes=2544
blocks=5632 inodes=2528
blocks=5648 inodes=2512
blocks=5664 inodes=2496
blocks=5680 inodes=2480
blocks=5696 inodes=2464
blocks=5712 inodes=2448
blocks=5728 inodes=2432
blocks=5744 inodes=2416
blocks=5760 inodes=2400
blocks=5776 inodes=2384
blocks=5792 inodes=2368
blocks=5808 inodes=2352
blocks=5824 inodes=2336
blocks=5840 inodes=2320
blocks=5856 inodes=2304
blocks=5872 inodes=2288
blocks=5888 inodes=2272
blocks=5904 inodes=2256
blocks=5920 inodes=2240
blocks=5936 inodes=2224
blocks=5952 inodes=2208
blocks=5968 inodes=2192
blocks=5984 inodes=2176
blocks=6000 inodes=2160
blocks=6016 inodes=2144
blocks=6032 inodes=2128
blocks=6048 inodes=2112
blocks=6064 inodes=2096
blocks=6080 inodes=2080
blocks=6096 inodes=2064
blocks=6112 inodes=2048
blocks=6128 inodes=2032
blocks=6144 inodes=2016
blocks=6160 inodes=2000
blocks=6176 inodes=1984
blocks=6192 inodes=1968
blocks=6208 inodes=1952
blocks=6224 inodes=1936
blocks=6240 inodes=1920
blocks=6256 inodes=1904
blocks=6272 inodes=1888
blocks=6288 inodes=1872
blocks=6304 inodes=1856
blocks=6320 inodes=1840
blocks=6336 inodes=1824
blocks=6352 inodes=1808
blocks=6368 inodes=1792
blocks=6384 inodes=1776
blocks=6400 inodes=1760
blocks=6416 inodes=1744
blocks=6432 inodes=1728
blocks=6448 inodes=1712
blocks=6464 inodes=1696
blocks=6480 inodes=1680
blocks=6496 inodes=1664
blocks=6512 inodes=1648
blocks=6528 inodes=1632
blocks=6544 inodes=1616
blocks=6560 inodes=1600
blocks=6576 inodes=1584
blocks=6592 inodes=1568
blocks=6608 inodes=1552
blocks=6624 inodes=1536
blocks=6640 inodes=1520
blocks=6656 inodes=1504
blocks=6672 inodes=1488
blocks=6688 inodes=1472
blocks=6704 inodes=1456
blocks=6720 inodes=1440
blocks=6736 inodes=1424
blocks=6752 inodes=1408
blocks=6768 inodes=1392
blocks=6784 inodes=1376
blocks=6800 inodes=1360
blocks=6816 inodes=1344
blocks=6832 inodes=1328
blocks=6848 inodes=1312
blocks=6864 inodes=1296
blocks=6880 inodes=1280
blocks=6896 inodes=1264
blocks=6912 inodes=1248
blocks=6928 inodes=1232
blocks=6944 inodes=1216
blocks=6960 inodes=1200
blocks=6976 inodes=1184
blocks=6992 inodes=1168
blocks=7008 inodes=1152
blocks=7024 inodes=1136
blocks=7040 inodes=1120
blocks=7056 inodes=1104
blocks=7072 inodes=1088
blocks=7088 inodes=1072
blocks=7104 inodes=1056
blocks=7120 inodes=1040
blocks=7136 inodes=1024
blocks=7152 inodes=1008
blocks=7168 inodes=992
blocks=7184 inodes=976
blocks=7200 inodes=960
blocks=7216 inodes=944
blocks=7232 inodes=928
blocks=7248 inodes=912
blocks=7264 inodes=896
blocks=7280 inodes=880
blocks=7296 inodes=864
blocks=7312 inodes=848
blocks=7328 inodes=832
blocks=7344 inodes=816
blocks=7360 inodes=800
blocks=7376 inodes=784
blocks=7392 inodes=768
blocks=7408 inodes=752
blocks=7424 inodes=736
blocks=7440 inodes=720
blocks=7456 inodes=704
blocks=7472 inodes=688
blocks=7488 inodes=672
blocks=7504 inodes=656
blocks=7520 inodes=640
blocks=7536 inodes=624
blocks=7552 inodes=608
blocks=7568 inodes=592
blocks=7584 inodes=576
blocks=7600 inodes=560
blocks=7616 inodes=544
blocks=7632 inodes=528
blocks=7648 inodes=512
blocks=7664 inodes=496
blocks=7680 inodes=480
blocks=7696 inodes=464
blocks=7712 inodes=448
blocks=7728 inodes=432
blocks=7744 inodes=416
blocks=7760 inodes=400
blocks=7776 inodes=384
blocks=7792 inodes=368
blocks=7808 inodes=352
blocks=7824 inodes=336
blocks=7840 inodes=320
blocks=7856 inodes=304
blocks=7872 inodes=288
blocks=7888 inodes=272
blocks=7904 inodes=256
blocks=7920 inodes=240
blocks=7936 inodes=224
blocks=7952 inodes=208
blocks=7968 inodes=192
blocks=7984 inodes=176
blocks=8000 inodes=160
blocks=8016 inodes=144
blocks=8032 inodes=128
blocks=8048 inodes=112
blocks=8064 inodes=96
blocks=8080 inodes=80
blocks=8096 inodes=64
blocks=8112 inodes=48
blocks=8128 inodes=32
blocks=8144 inodes=16
blocks=8160 inodes=0
-->
	<LI>the theoretically-maximal size of the optional file-system is
	    <ul style="padding-left: 0.5em;">
	      <li style="list-style-type: '';">8160 blocks (4M-16k with 0 i-nodes); or</li>
	      <li style="list-style-type: '';">7664 i-nodes (with 496 blocks (248k), of which 15 (7.5k) available for data); or</li>
	      <li style="list-style-type: '';">4080 blocks (2M-8k) * 4080 i-nodes (leaving 3823 blocks (1911k) for data)</li>
	    </ul></li>
</ol>

<p class="continued">
One would also be remiss not to note this error in the analysis:
</p>
<figure class="offset continuing">
	<figcaption>
		DeFelice calls base 256 <tt>base 8</tt>.<br />
		<a style="font-weight: bold; color: inherit;" href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L188"><tt>u5</tt></a>
	</figcaption>

<del>
LINENOS_188f_2_10s_11_2S_1
</del>
<pre>
<!--       "-->imap: <del>/ get the byte that has the allocation bit for the i-number contained</del><!--"-->
<!--       "-->      <del>/ in r1</del><!--"-->
<small>\
<!--       "-->	mov	$1,mq <del>/ put 1 in the mq</del><!--"-->
<!--       "-->	mov	r1,r2 <del>/ r2 now has i-number whose byte in the map we</del><!--"-->
<!--       "--> 		      <del>/ must find</del><!--"-->
<!--       "-->	sub	$41.,r2 <del>/ r2 has i-41</del><!--"-->
<!--       "-->	mov	r2,r3 <del>/ r3 has i-41</del><!--"-->
<!--       "-->	bic	$!7,r3 <del>/ r3 has (i-41) mod 8 to get the bit position</del><!--"-->
<!--       "-->	mov	r3,lsh <del>/ move the 1 over (i-41) mod 8 positions to the left</del><!--"-->
<!--       "-->		       <del>/ to mask the correct bit</del><!--"-->
<!--       "-->	asr	r2<!--"-->
<!--       "-->	asr	r2<!--"-->
</small>\
<!--       "-->	asr	r2 <del>/ r2 has (i-41) base 8 of the byte no. from the start of</del><!--"-->
<!--       "-->		   <del>/ the map</del><!--"-->
<!--       "-->	mov	r2,-(sp) <del>/ put (i-41) base 8 on the stack</del><!--"-->
<!--       "-->	mov	$systm,r2 <del>/ r2 points to the in-core image of the super</del><!--"-->
<!--       "-->			  <del>/ block for drum</del><!--"-->
<!--       "-->	tst	cdev <del>/ is the device the disk</del><!--"-->
<!--       "-->	beq	<!--"-->L(b,1f)<!--"--> <del>/ yes</del><!--"-->
<!--       "-->	add	$mount-systm,r2 <del>/ for mounted device, r2 points to 1st word</del><!--"-->
<!--       "-->				<del>/ of its super block</del><!--"-->
L(b,1):
<strong>\
<!--       "-->	add	(r2)+,(sp) <del>/ get byte address of allocation bit</del><!--"-->
<!--       "-->	add	(sp)+,r2 <del>/ ?</del><!--"-->
<!--       "-->	add	$2,r2 <del>/ ?</del><!--"-->
</strong>\
<!--       "-->	rts	r0<!--"-->
</pre>
</figure>
<p class="continuing">
which can be translated as
</p>
<figure class="offset continuing C">
	<figcaption>
		<tt>_</tt>-prefixed names were invented for exposition; others match source.<br />
		DeFelice's<!--'--> comments; my notes marked with <tt>[]</tt>.
	</figcaption>

#define EXCLAIM !
#define EQUAL   ⇔
<del>
LINETEXTS_ux_1__1_ux_4__1__2s_u5_1__4s__3_EXCLAIM_3S_EQUAL_1__1_u5_1__1
LINENOS_41f_1_1z_5f_4_2sz_188f_1_199f_1_4sz_3z_210f_1_2S_2z_213f_1_1z
</del>
<pre>
<!--       "-->extern cdev;  <del>// [device containing i-node referred to by any current i-node number]</del><!--"-->
<!--       "-->extern struct {<!--"-->
<!--       "-->	int _free_block_bitmap_size;<!--"-->
<!--       "-->	char _free_block_bitmap[._free_block_bitmap_size];<!--"-->
<!--       "-->	int _free_inode_bitmap_size;<!--"-->
<!--       "-->	char _free_inode_bitmap[._free_inode_bitmap_size];<!--"-->
<!--       "-->} systm, mount;<!--"-->
<small>\
<!---->
<!--       "-->extern r1, r2, r3, mq;<!--"-->
</small>\
<!--       "-->imap() {  <del>// get the byte that has the allocation bit for the i-number contained in r1</del><!--"-->
<small>\
<!--       "-->	r2 = r1 - 41; <!--"-->
<!--       "-->	mq = 1 << (r2 % 8); <del>// move the 1 over (i-41) mod 8 positions to the left</del><!--"-->
<!--       "-->	                    <del>// to mask the correct bit</del><!--"-->
<!---->
</small>\
<!--       "-->	int _off = r2 >> 3;  <del>// (i-41) base [256] of the byte no. from the start of the map</del><!--"-->
<!--       "-->	r2 = cdev <!--"-->L(b,?)<!--"--> &mount : &systm;<!--"-->
<!---->
<strong>\
<!--       "-->	_off += (r2 += 2)->_free_block_bitmap_size;<!--"-->
<!--       "-->	r2 += _off; <del>// ?</del><!--"-->
<!--       "-->	r2 += 2;    <del>// ?</del><!--"-->
</strong>\
<!--       "-->	<del>r2 = &r2->_free_inode_bitmap[_off];</del><!--"-->
<!---->
<!--       "-->	return;  <del>// [r2 points to the byte, mq has the mask]</del><!--"-->
<!--       "-->}<!--"-->
</pre>
</figure>
<p class="continuing">
It's a very ugly way to skip the first array and index into the second, but that's clearly what this does.
Charitably, one could say that the <tt><q>get byte address of allocation bit</q></tt> comment applies to the whole section.
</p>
<p class="indented continuation">
Notice also how each system call can affect only one filesystem at once
(the only one that would even have the capacity to would be link (II) and that's<!--'--> illegal),
hence why <tt>cdev</tt> works at all as a global variable.
</p>

<ol>
	<LI>the I/O queue consists of a list of I/O requests ordered by priority:
	    3 special-purpose with dedicated buffers,
	    then <a href="023,a-v1-nbuf-benchmark.html"><tt>nbuf</tt></a> general-purpose dynamic ones with 512-byte buffers</li>
	<LI>I/O requests are bound to device and starting 512-byte-block number, but may have <em>any</em> even length</li>
	<LI>the internal structure of the <tt>_flags</tt> byte need not concern us,
	    but it supports
	    	lock, <!-- 15 = "inhibit" -->
	    	"want to read", <!-- 10 --> "want to write", <!-- 9 -->
	    	"dispatched read request", <!-- 13 --> "dispatched write request" <!-- 12 -->
	    bits, and 0 means "buffer unclaimed"</li>
	<LI>I can't<!--'--> really tell why <tt>_word_count</tt> is negative,
	    except that the <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L247">disks</a>
	                and <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L379">tape</a>
	    just take that format
	    (presumably the devices do <samp>while(left++) *dst++ = *src++;</samp>)</li>
	<LI>since all but one buffer have a constant size, this <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u3#L77">doesn't<!--'--> really factor in</a></li>

	<p></p>
	<!-- <li>the dynamic buffer model uses a technique equivalent to what modern Linux calls <tt>container_of()</tt> —
	         it does but only in the initialiser and it's<!-'-> just easier with no temp variables </li> -->
	<LI>when <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L295">looking for a block on a block device</a>,
	    the dynamic buffer list is searched for, in order of preference:
	    <ol>
	    	<li>an unclaimed buffer for which (<tt>_dev</tt>, <tt>_block_number</tt>) matches (<tt>cdev</tt>, block number);
#define WARMFLAG "return address is not adjusted to skip over the next instruction in the caller"
	    	    a <abbr title=WARMFLAG>"buffer warm" flag is set</abbr> in this case
	    	    (lowest-priority result returned)</li>
	    	<li>any unclaimed buffer (highest-priority result returned)</li>
		    <li>(sleep in iowait and run the search again)</li>
	    </ol>
	    the returned buffer is moved to be the lowest priority
	</li>
	<LI>in theory this wants to form an LRU global coherent shared buffer of <tt>nbufs</tt> blocks (and under no load this does work);
	    in reality, due to the ordering of the constraints and the buffer <tt>_flags</tt> lifecycle, performance is degraded significantly:
	    <tt>_flags</tt> are 0 only <em>after</em> the I/O has completed,
	    while a warm-but-currently-pending request will have one of the "dispatched" flags set;
	    so, during repeated access to block 32 on <tt>rf0</tt>, the queue may look like this (in priority order):
	    <div style="margin-left: 1em;">
		    t=0:
		    <ol style="margin-left: 1em;">
		    	<li style="list-style-type: '0… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		    t=1:
		    <ol style="margin-left: 1em;">
		    	<li value=0>(0, 32) flags: want to write, dispatched write request</li>
		    	<li style="list-style-type: '1… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		    t=2:
		    <ol style="margin-left: 1em;">
		    	<li value=0>(0, 32) flags: want to write, dispatched write request</li>
		    	<li        >(0, 32) flags: want to read</li>
		    	<li style="list-style-type: '3… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		    t=3:
		    <ol style="margin-left: 1em;">
		    	<li value=0>(0, 32) flags: want to write, dispatched write request</li>
		    	<li        >(0, 32) flags: want to read</li>
		    	<li        >(0, 32) flags: want to read</li>
		    	<li style="list-style-type: '3… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		    t=4:
		    <ol style="margin-left: 1em;">
		    	<li value=0>(0, 32) unclaimed (flags: <del>none</del>)</li>
		    	<li        >(0, 32) flags: want to read, dispatched read request</li>
		    	<li        >(0, 32) flags: want to read</li>
		    	<li style="list-style-type: '3… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		  </div>
	    at this point the first request has succeeded (and requesting (0, 32) will return the buffer with priority 0),
	    so now there's an I/O request in flight (and one in the queue which will get sent) for data we've just gotten
	  </li>
	<LI>additionally, given:
	    <div style="margin-left: 1em;">
		    t=1:
		    <ol style="margin-left: 1em;">
		    	<li value=0>(0, 32) flags: want to write, dispatched write request</li>
		    	<li style="list-style-type: '1… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		    t=2:
		    <ol style="margin-left: 1em;">
		    	<li value=0>(0, 32) flags: want to write, dispatched write request</li>
		    	<li        >(0, 32) flags: want to write</li>
		    	<li style="list-style-type: '3… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		    t=3:
		    <ol style="margin-left: 1em;">
		    	<li value=0>(0, 32) flags: unclaimed (flags: <del>none</del>)</li>
		    	<li        >(0, 32) flags: want to write, dispatched write request</li>
		    	<li        >(0, 32) flags: want to write</li>
		    	<li style="list-style-type: '3… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		    t=3:
		    <ol style="margin-left: 1em;">
		    	<li value=0>(0, 32) flags: unclaimed (flags: <del>none</del>)</li>
		    	<li        >(0, 32) flags: unclaimed (flags: <del>none</del>)</li>
		    	<li        >(0, 32) flags: want to write, dispatched write request</li>
		    	<li style="list-style-type: '3… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		    </ol>
		  </div>
		  requesting (0, 32) will return the buffer with priority 0 (as above), which has stale data from the write issued after t=0,
		  in spite of a write was already issued and committed (and another one is pending, and will happen, and will render the returned data even more stale)</li>
	<LI>this would've<!--'--> been prevented if the discovery was more like
	    <ol>
	    	<li>a buffer for which (<tt>_dev</tt>, <tt>_block_number</tt>) matches (<tt>cdev</tt>, block number);
	    	    a <abbr title=WARMFLAG>"buffer warm" flag is set</abbr> in this case</li>
	    </ol>
	    which would mean that there's<!--'--> at most 1 entry in the cache for any (device, block), making staleness impossible.
	    I'm not sure how well the scheduler would cope with this, however (well. you'd write the scheduler to cope with it if you implemented it like this).</li>
	<LI>the most common functions used to interface with the block buffering system
	    — <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L148"><tt>dskrd</tt></a> and
	      <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L165"><tt>wslot</tt></a> —
	    mirror each other in a way that doesn't<!--'--> really make sense given the shipped buffer allocation model which can only return unclaimed buffers:<br />
	    <tt>dskrd</tt> requests a buffer for its device/block and returns it instantly if it was hot;
	    if it wasn't<!--'-->, it sets its "want to read" flag, enqueues it, then idles until the "want to read" and "dispatched read request" flags are clear
	    and returns it.<br />
	    Similarly, <tt>wslot</tt> requests a buffer for its device/block,
	    then idle-loops until the "want to read" and "dispatched read request" flags are clear
	    (which they always are since the returned buffer always has no flags set),
	    then sets "want to write" and lock flags,
	    and returns it</li>
	<LI>(this, to me, reads like a remnant of a buffering scheme that <em>could</em> return warm-but-currently-pending buffers,
	     especially since there are clear signs of a half-assed patch
	     (the <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L167"><tt>br 1f</tt></a>, only executed on a warm buffer,
	      is clearly supposed to point to the <em>next</em> <tt>1:</tt> label);
	     perhaps the scheduler or whatever did not in fact cope well with this; or I'm<!--'--> wrong and they just blindly re-wrote <tt>dskrd</tt>!)</li>
	<p></p>

	<LI>dynamic buffers, like the rest of memory, are zeroed, except for the fields indicated:
	    this means that the initial state of the cache isn't<!--'--> empty (or full of invalid entries),
	    but it actually consists of <tt>nbufs</tt> entries that say that block 0 on <tt>rk0</tt> consists of 512 zero bytes</li>
	<LI>(so, if not enough churn has happened (or I/O is serviced infinitely fast(?)), <code>od /dev/rf0</code> may return an all-zero block;
	     I haven't<!--'--> been able to reproduce this in single-user mode with <tt>nbufs</tt> of 6;
	     attempting to reduce the churn even more by using <tt>/bin/sh</tt> as <tt>/etc/init</tt> irreversibly destroyed my rootfs somehow)</li>
</ol>


HEADING_S(3, inode, class="continued", I-node cache)

<figure class="offset C">
	<figcaption>
		All names match source; <tt>rootdir</tt> comment DeFelice's<!--'-->, others mine.<br />
		Covered by <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#ux">the final file with variables</a>
		       and <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L192">on-entry process tables initialisation</a>.
	</figcaption>

<del>
LINETEXTS__2_ux_7__1_ux_1__2_ux_1__1s_ux_1_u0_1
LINENOS_2z_16f_7_1z_1_2z_62f_1_1zs_53f_1_195f_1
</del>
<pre>
<!--       "-->union {<!--"-->
<!--       "-->	struct {<!--"-->
<!--ux 16  "-->		int  flgs;<!--"-->
<!--ux 17  "-->		char nlks;<!--"-->
<!--ux 18  "-->		char uid;<!--"-->
<!--ux 19  "-->		int  size;<!--"-->
<!--ux 20  "-->		int  dskp[8];<!--"-->
<!--ux 21  "-->		int  ctim[2];<!--"-->
<!--ux 22  "-->		int  mtim[2];<!--"-->
<!--       "-->	}    i;<!--"-->
<!--ux 23  "-->	char inode[32];  <del>// (2 free bytes)</del><!--"-->
<!--       "-->};<!--"-->
<!--       "-->int  idev, ii;    <del>// i-node (device, number)</del><!--"-->
<!--ux 62  "-->bool imod;        <del>// modified?</del><!--"-->
<small>\
<!---->
</small>\
<!--ux 62  "-->int rootdir;<!--"-->
<!--u0 195 "-->rootdir = 41;     <del>// set to 41 and never changed</del><!--"-->
</small>\
</pre>
</figure>

<figure class="offset C">
	<figcaption>
		<tt>_</tt>-prefixed names were invented for exposition; others match source.<br />
		Lower-case <tt>//</tt> comments DeFelice's<!--'-->, others mine.
		<a style="margin-left: 1em" href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L215"><tt>u5</tt></a>
	</figcaption>

<del>
LINETEXTS_u0_1__2s_u5_1__1_u5_1__1_u5_2__3_u5_3__2_u5_3__3_u5_2__2_u5_3__1_u5_1__2_u5_2__4_u5_4__2_u5_1__1_u5_2__2
LINENOS_50f_1_2zs_215f_1_1z_249f_1_1z_221f_1_224f_1_3z_229f_3_2z_233f_1_248f_2_3z_241f_2_2z_244f_3_1z_249f_1_2z_251f_1_253f_1_4z_260f_4_2z_272f_1_1z_278f_1_280f_1_2z
</del>
<pre>
<!--u0 50  "-->int mdev; <del>// Device containing second filesystem</del><!--"-->
<small>\
<!---->
<!--       "-->extern r1;<!--"-->
</small>\
<!--u5 215 "-->iget() {  <del>// r1 = i-number of current flle</del><!--"-->
<!--       "-->	if(r1 == ii && idev == cdev)<!--"-->
<!--u5 249 "-->		return;<!--"-->
<!---->
<!--u5 221 "-->	if(imod) {        <del>// has i-node of current file been modified</del><!--"-->
<!--u5 224 "-->		imod = 0; <del>// if it has, we must write the new i-node out on disk</del><!--"-->
<!---->
<!--       "-->		int _ino = _std::exchange(r1,   ii);<!--"-->
<!--       "-->		int _dev = _std::exchange(cdev, idev);<!--"-->
<!--u5 229 "-->		icalc(1);<!--"-->
<!--u5 230 "-->		cdev = _dev;<!--"-->
<!--u5 231 "-->		r1   = _ino;<!--"-->
<!--       "-->	}<!--"-->
<!---->
<!--u5 233 "-->	if(r1 == 0) {<!--"-->
<!--u5 248 "-->		r1 = ii;<!--"-->
<!--u5 249 "-->		return;<!--"-->
<!--       "-->	}<!--"-->
<!---->
<!--       "-->	if(cdev == 0 && r1 == mnti) {  <del>// On rootfs and opening mounted-over file</del><!--"-->
<!--u5 241 "-->		cdev = mntd;<!--"-->
<!--u5 242 "-->		r1   = rootdir;<!--"-->
<!--       "-->	}<!--"-->
<!---->
<!--u5 244 "-->	ii = r1;<!--"-->
<!--u5 245 "-->	idev = cdev;<!--"-->
<!--u5 246 "-->	icalc(0);  <del>// read in i-node ii</del><!--"-->
<!---->
<!--u5 249 "-->	return;    <del>// r1 has i-node number</del><!--"-->
<!--       "-->}<!--"-->
<!---->
<!--u5 251 "-->icalc(_wr) { <del>// i-node i is located in block (i+31.)/16.</del><!--"-->
<!--u5 253 "-->	r1 += 31;   <del>// and begins 32.*(i+31)mod16 bytes from its start</del><!--"-->
<!--       "-->	int _pos_in_block = r1 % 16;<!--"-->
<!--       "-->	r1 /= 16; <del>// r1 contains block number of block in which</del><!--"-->
<!--       "-->		  <del>// i-node exists</del><!--"-->
<!---->
<!--u5 260 "-->	<del>/*r5 =*/</del> dskrd(); <del>// read in block containing i-node i.</del><!--"-->
<!--u5 261 "-->	if(_wr)<!--"-->
<!--u5 263 "-->		<del>/*r5 =*/</del> wslot(); <del>// set up data buffer for write</del><!--"-->
<!--u5 264 "-->			          <del>// (will be same buffer as dskrd got)</del><!--"-->
<!---->
<!--       "-->	r5 += _pos_in_block * 32; <del>// r5 points to first word in i-node i.</del><!--"-->
<!--u5 272 "-->	if(_wr) {<!--"-->
<!--       "-->		_memcpy(r5, inode, 32);<!--"-->
<!--u5 278 "-->		dskwr();<!--"-->
<!--u5 280 "-->	} else<!--"-->
<!--       "-->		_memcpy(inode, r5, 32);<!--"-->
<!--       "-->}<!--"-->
</pre>
</figure>

<ol>
	<LI>since <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=172">the smallest valid i-node is 1</a>,
	    the i-node cache starts empty (structurally, i-node 0 on <tt>rf0</tt>, all 0 bytes)</li>
	<LI>in the installer kernel, it's<!--'--> initialised <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L209">during rootfs prep</a></li>
	<LI>in a regular kernel, it's<!--'--> initialised in the user-space trampoline,
	    which <a href="014-unix-pre-v4-pid0-corollary.html#init">has featured before on this blog</a>;
	    summa summarum: initialised by <tt>exec("/etc/init", <del>…</del>)</tt>
	    (<a style="color: inherit;" href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u2#L91">⇒</a>  <tt>namei("/etc/init")</tt>
	     <a style="color: inherit;" href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u2#L248">⇒</a> <tt>iget(rootdir)</tt>)</li>
	<LI>it's<!--'--> never cleared again, so in V1, at all times, there is exactly <em>one</em> currently-opened file</li>
	<p></p>

	<LI>asking for i-node 0 is overloaded to be equivalent to what we'd<!--'--> call <tt>fsync()</tt> of the currently-open i-node:
	    if i-node modified, update the block it's<!--'--> contained in and enqueue writing it</li>
	<LI>this is used exactly once, <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u1#L76">when returning from kernel- to user-space</a>,
	    which, before deciding how to return,
	    <ul>
	    	<li><tt>r1 = 0; iget()</tt></li>
	    	<li>if rootfs superblock modified: enqueues writing <tt>sb0</tt></li>
	    	<li>if second filesystem's<!--'--> superblock modified: enqueues writing <tt>sb1</tt></li>
	    </ul>
	</li>
	<LI>this explains why unix72 <a href="//git.sr.ht/~nabijaczleweli/unix-jun72/tree/trunk/item/Readme#L60">prescribes <kbd>^E</kbd>, <kbd>q</kbd></a>
	    (halt emulator, exit) to stop:
	    while in userspace, all caches (i-node, block device) have been enqueued to be written,
	    so the system state is coherent once the disk is quiescent</li>
	<LI>in principle, this also means that, after init, all unix does is service interrupts (from userspace, disk/tape, clock, other devices);
	    the only persistent inter- and supra-process state are the process tables themselves;
	    this differs significanly from subsequent unix/**/es, which <a href="014-unix-pre-v4-pid0-corollary.html#nsys">have An kernel (scheduler) process</a></li>
	<LI>however, unix72 is wrong to say that
	    <q><a href="//git.sr.ht/~nabijaczleweli/unix-jun72/tree/trunk/item/Readme#L61">You do not need to sync the system before shutdown.</a></q>,
	    because you do — by waiting until all userspace processes are in userspace (or sleeping on non-filesystem & non-block-device I/O) and disk/tape I/O has stopped
	    (on a modern system with disk/tape backed by a VFS file this is below a human time-scale,
	     but there definitely <em>is</em> a <tt>sync</tt>-equivalent procedure,
	     and you can run afoul of it if you're<!--'--> unlucky)</kbd></li>
	<p></p>

	<LI>it's<!--'--> worth pointing out that this betrays what to a modern reader appears like a layering violation:
	    i-nodes appear on devices, not file-systems</li>
	<LI>rather, perhaps, these haven't<!--'--> fully divorced yet.
	    The unix Programmer's<!--'--> Manual is permeated with an unstated <del>almost-</del>equivalency of the two
	    — a modelling of the file system as little more than a slightly-more-convenient way to address the disk (tape), or
	      a relatively thin wrapper over the same</li>
	<LI>this reflects the rejection of the file management attitude of the systems pre-dating unix that so pervades contemporary
#define u(...) <u>__VA_ARGS__</u>
	    (<cite><a href="//www.tuhs.org/Archive/Distributions/Research/McIlroy_v0/UnixEditionZero-OCR.pdf#page=3"
	          >DRAFT: The UNIX Time-Sharing System, D. M. Ritchie</a>,
	           <a href="//www.tuhs.org/Archive/Distributions/Research/McIlroy_v0/Readme"><q>mid-1971</q></a></cite>
<blockquote class="continuing"><pre>\
u(1). u(Introduction)
DEL UNIX contains a number of features very seldom
offered even by larger systems, including\
<ol style="margin-left: 2.75em;">\
	<li>A versatile, convenient file system with complete integra-
tion between disk files and I/O devices;</li>\
</ol>\
<!---->
u(3). u(The) u(File) u(System)
The most important role of UNIX is to provide a file system. DEL
<!---->
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
	           (that's<!--'--> 2.5 times by page 7!))
	    and subsequent
	    (<cite id="Making Computers More Productive"><a href="//youtu.be/tc4ROCJYbm0">The UNIX™ System: Making Computers More Productive, 1982, Bell Laboratories</a>
	     —
dmr, 11:32-12:03:
<blockquote class="continuation" style="margin-bottom: calc(12.6715px / 2);">
unix system has many features which make it easier for the programmer to write programs.
These include formatless files, the hierarchical directory structure,
the ability to pipeline the output of one command as the input of another, device independent I/O:
all of these things make programming considerably easier than on most other systems.
</blockquote>

bwk, 12:03-12:55:
<blockquote class="continuation" style="margin-bottom: calc(12.6715px / 2);">
The heart of the system is really the file system –
the ability to store information for extended periods of time.
And the reason— one of the reasons the system works as well as it
does is that the file system is well-designed;
and, many systems, you have to say an awful lot about a file
before you can do anything with it.
You have to say where it is, and how big it is,
and what kind of information that's going to— that's going to be in it.
All kinds of things that are basically <em>utterly</em>, <em>completely</em> irrelevant.
Here, you don't<!--'--> have to do any of that:
a file is as big as it is,
it doesn't<!--'--> matter where it is as long
as you know what it's<!--'--> called…
and so, you basically don't<!--'--> have to think
of any of those complexities that you have in other systems.
When you want information in a file, you put it there;
when you want it back, you get it out again,
and you don't<!--'--> have to think about size,
or number of records and number of fields,
or anything like that,
unless it's<!--'--> really germane to your program.
For most purposes, it's<!--'--> utterly irrelevant.
</blockquote>

ken, 12:56-13:17:
<blockquote class="continuing">
A file is simply a sequence of bytes.
Its main attribute is its size.
By contrast, in more conventional systems,
a file has a dozen or so attributes.
To specify or create a file, it takes endless amounts of chit-chat.
If you want a unix system file, you simply ask for a file.
And you can use it interchangeably
wherever you want a file.
</blockquote>
</cite>
	    (this is all consecutive. it's<!--'--> so serious for them, and yet we cannot imagine a world where this would be prescient information.))
	    marketing</li>
	<LI>there is a view that is puritanical in a different direction than how a modern reader and system conceptualises strict filesystem-on-blockdev layering:
	    the file system's<!--'--> purpose is to let you <em>name (groups of) blocks on the underlying device</em>, as fast and easily as possible,
	    and anything that makes that harder or makes it be more structured is heresy</li>
	<p style="margin-top: 7.60px; margin-bottom: 7.60px;"></p>
	<LI>you can cut out basically any part of the data area of the file-system by marking it used (and remembering which blocks you marked used):
	    they do this to <a href="#9">the 32k area at the end of the disk with a bootloader and a few kernels</a> — what we'd<!--'--> call <tt>/boot</tt> —
	    and <a href="#9">the <tt>nproc</tt> 8k+512-byte-sized areas for swapped-out process images</a></li>
	<LI>this makes <tt>rf0</tt> implicitly (non-self-descriptively) partitioned into 3 (2+<tt>nproc</tt>) sections
	    — the file system (V) per se, the boot area, and the swap area (viz. <tt>nproc</tt> individually-allocated swap areas) —
	    but the non-self-descriptiveness <a href="#10">poses issues</a> (though idk whether they'd<!--'--> noticed this at the time, but it seems pretty obvious)</li>
	<LI><a href="022-Utah_v4.html#v4tape-1st">later unix/**/ex</a> do away with the split-<tt>/boot</tt> model and read the kernel from a file-system</li>
	<LI>at a later point in time, in descendant systems, "the swap area of the root file system/block device" reifies into "the swap"
	    and <a href="022-Utah_v4.html#v4root-1st">the file system gains a length field</a> (and a bootloader hole in block 0),
	    and the root device becomes more explicitly partitioned into {[bootloader+]filesystem, rest of device},
	    with rest of device being used for swapping (rather, the swap), but could be for anything,
	    and all readers/writers will understand this without knowing anything about the structure of the <em>file-system</em> beyond its length</li>
	<LI>later systems still grow actual partitions (poorly),
	    wherein 81200-block (39M+664k) <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5man.pdf#page=222">RP(IV)</a> disks have
		<style>
		/**/#rp {
			margin-left: 1em;
		}
		/**/#rp td:nth-child(2) {
			text-align: right;
		}
		/**/#rp td:nth-child(4)::before {
			content: '(';
		}
		/**/#rp td:nth-child(5) span {
			font-size: 0;
		}
		/**/#rp td:nth-child(5)::before {
			content: '+';
			float: left;
			margin-left: -0.3em;
		}
		/**/#rp td.z:nth-child(4)::after {
			content: ')';
			float: right;
			margin-right: -0.3em;
		}
		/**/#rp td:nth-child(5)::after {
			content: ')';
		}
		</style>
		<table id="rp">
			<tr><th>file                        </th>	<th>start</th>	<th>length</th> <th></th> <th></th></tr>
			<tr><td><tt>rp<var>0,8,16</var></tt></td>	<td>0</td>	<td>40600</td>	<td>19M</td> <td><span>+</span>844k</td></tr>
			<tr><td><tt>rp<var>1,9,17</var></tt></td>	<td>40600</td>	<td>40600</td>	<td>19M</td> <td><span>+</span>844k</td></tr>
			<tr><td><tt>rp<var>2,10,18</var></tt></td>	<td>0</td>	<td>9200</td>	<td> 4M</td> <td><span>+</span>504k</td></tr>
			<tr><td><tt>rp<var>3,11,19</var></tt></td>	<td>7200</td>	<td>9200</td>	<td> 4M</td> <td><span>+</span>504k</td></tr>
			<tr><td><tt>rp<var>4,12,20</var></tt></td>	<td>0</td>	<td>65535</td>	<td class="z">32M</td></tr>
			<tr><td><tt>rp<var>5,13,21</var></tt></td>	<td>15600</td>	<td>65535</td>	<td class="z">32M</td></tr>
		</table>
	    with a recommended configuration of rootfs on <tt>rp2</tt>, <tt>/usr</tt> on <tt>rp5</tt>,
	    and swap space <q>in the unused blocks 9500 to 15600 of <i>rp0</i> (or, equivalently, <i>rp4)</i></q>(?!);
	    allthewhile warning that
	    <q>It is unwise for all tof these files to be present in one installation, since there is overlap in addresses and proection becomes a sticky matter.</q>
	</li>
	<LI>(this is by no means universal in V5:
	     depending on the amount of <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5man.pdf#page=220">RF(IV)</a>-compatible disks you have
	     (context for reading the manual: RF11 is the controller, RS11 is the disk),
	     you're<!--'--> supposed to make <tt>/dev/rf0</tt> with the minor corresponding to how long they all are in 512k increments minus 1
	     (conveniently, this corresponds to how many disks you have minus one, since they're<!--'--> 512k long),
	     and you get a continuous block device spanning them all in order,
	     so if you have 3, you <tt>mknod /dev/tf0 b <var>n</var> 2</tt> and you get a 1.5M device;
	     <a href="//vtree.nabijaczleweli.xyz/?Dennis_v5#./usr/sys/dmr/rf.c#L26"><tt>rf.c</tt></a> backs this up,
	     and shows that the controller exposes all the disks in order like this, and this is just protection
	     (<cite><a href="//archive.org/details/bitsavers_decunibusDCdiskSystemManualAug71_16878841/page/n11/mode/1up"><!--
	   -->Digital Equipment Corporation, RF11/RS11 DECdisk system manual, 6th Printing, May 1973, DEC-11-HRFD-D, p. 1-4</a></cite>))</li>
	<LI>((conversely, <a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v5/v5man.pdf#page=221">RK(IV)</a>
	      has a <a href="//vtree.nabijaczleweli.xyz/?Dennis_v5#./usr/sys/dmr/rk.c#L77">three-liner implementing opt-in any-width RAID0 striping</a>;
	      but <a href="//vtree.nabijaczleweli.xyz/?Utah_v4#/usr/sys/dmr/rk.c#L55">so does V4</a>, and it's<!--'--> even better there;
	      they were kinda just doing whatever back then))</li>
	<LI>at UCB, by 4BSD, every supported disk type has partitions, and they're<!--'--> all in every installation,
	    with the <q>unwise</q> sentence conspicuously disappearing
	    <cite>(this doesn't<!--'--> exist in linkable form; cf. <tt>usr/man/man4/<!---->*.4</tt> in <tt>3bsd</tt>/<tt>4.0</tt> on
	           <a href="//archive.org/details/The_CSRG_Archives_CD-ROM_1_August_1998_Marshall_Kirk_McKusick">CSRG CD 1</a>)</cite>;
	    from experience (<a href="//lfs.nabijaczleweli.xyz/0017-twitter-export/#1524486577329778695">sending mail to/from 4.2BSD</a>)
	    this model <em>fucking sucks</em>, especially as disks get bigger and their lay-outs more convoluted, as they had by 4.2BSD</li>
	<p></p>

	<LI>but this implies a different solution to this problem — an alternate-reality unix —
	    where the swap areas for each process ended up properly as files on the filesystem as well;
	    this may've<!--'--> been <em>our</em> reality if the performance eval looked different</li>
	<LI>(this does happen a bit:
	     ext4 keeps <a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/ext4/ext4.h?id=a66191c590b3b58eaff05d2277971f854772bd5b#n311">some metadata</a> as <a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/ext4/ext4.h?id=a66191c590b3b58eaff05d2277971f854772bd5b#n3109">special</a> unnameable files,
	     and linux lets you have "swap files" which are actually just like V1 swap but the swap area is named as part of an allocated i-node
	     instead of blindly blocked off,
	     but no system du jour swaps to addressable filesystem files, separately <em>or</em> together;
	     all Windowses do this though)</li>
	<p></p>

	<LI><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf#page=124">sys mount (II)</a>
	    claims that
	    <blockquote class="continuing"><pre>\
Almost always, <u>name</u> should be a directory so that
an entire file system, not just one file, may
exist on the removable device\
	    </pre></blockquote>
	    but this is evidently false: every attempt to get the i-node that was the target of <tt>mount</tt> will return the root directory of the mounted file system;
	    since (unlike in later and modern systems) the file type is not cached in the directory entry, it is <em>impossible</em> to name the mounted-over file,
	    or at all distinguish it from the root of the mounted file system</li>
	<LI>unlike in comparatively modern systems with a name-based VFS, the file system is mounted on the <em>i-node</em>,
	    which means it's<!--'--> actually mounted on <em>every link the mounted-over file has</em>:</li>
</ol>

<pre>\
/**/# <kbd>chdir /tmp</kbd>
/**/# <kbd>echo gaming >file1</kbd>
/**/# <kbd>ln file1 file2</kbd>
/**/# <kbd>ls -l</kbd>
<!--"-->total    8<!--"-->
<!--"--> 47 s-r-r-  1 sys    1664 Jan  1 00:00:00 etma<!--"-->
<!--"-->119 s-rwrw  2 root      8 Jan  1 00:00:00 file1<!--"-->
<!--"-->119 s-rwrw  2 root      8 Jan  1 00:00:00 file2<!--"-->
<!--"--> 46 s-rwr-  1 root     26 Jan  1 00:00:00 ttmp<!--"-->
<!--"--> 45 s-rwr-  1 root    142 Jan  1 00:00:00 utmp<!--"-->
/**/# <kbd>cat file1 file2</kbd>
gaming
gaming
/**/# <kbd>cat >mt.s</kbd>
<!--"-->mount = 21.<!--"-->
<!--"-->umount = 22.<!--"-->
<!--"-->sys     umount; rk0<!--"-->
<!--"-->sys     mount; rk0; file1<!--"-->
<!--"-->sys     exit<!--"-->
<!--"-->rk0:    &lt;/dev/rk0\0><!--"-->
<!--"-->file1:  &lt;file1\0><!--"-->
/**/# <kbd>as mt.s</kbd>
I
II
/**/# <kbd>a.out</kbd>
/**/# <kbd>ls -l</kbd>
<!--"-->total   10<!--"-->
<!--"-->124 sxrwrw  1 root     96 Jan  1 00:00:00 a.out<!--"-->
<!--"--> 47 s-r-r-  1 sys    1664 Jan  1 00:00:00 etma<!--"-->
<!--"--> 41 sdrwr- 10 root    120 Jan  1 00:00:00 file1<!--"-->
<!--"--> 41 sdrwr- 10 root    120 Jan  1 00:00:00 file2<!--"-->
<!--"-->120 s-rwrw  1 root    107 Jan  1 00:00:00 mt.s<!--"-->
<!--"--> 46 s-rwr-  1 root     26 Jan  1 00:00:00 ttmp<!--"-->
<!--"--> 45 s-rwr-  1 root    142 Jan  1 00:00:00 utmp<!--"-->
/**/# <kbd>ls -l file1 file2</kbd>
file1:
<!--"-->total   82<!--"-->
<small>\
<!--"-->202 sdrwr-  2 root    140 Jan  1 00:00:00 boot<!--"-->
<!--"-->197 sdrwr-  2 root     60 Jan  1 00:00:00 fort<!--"-->
<!--"-->194 sdrwr-  2 root     40 Jan  1 00:00:00 jack<!--"-->
<!--"-->192 sdrwr-  2 root     30 Jan  1 00:00:00 ken<!--"-->
<!--"-->183 sdrwr-  2 root    100 Jan  1 00:00:00 lib<!--"-->
<!--"-->209 sdrwrw  2 root    110 Jan  1 00:00:00 nab-test<!--"-->
<!--"--> 42 sdrwr-  5 root     60 Jan  1 00:00:00 src<!--"-->
<!--"-->168 sdrwr-  2 root    360 Jan  1 00:00:00 sys<!--"-->
<!--"-->217 lxrwrw  2 root  36432 Jan  1 00:00:00 u<!--"-->
<!--"-->167 sxrwrw  1 root     54 Jan  1 00:00:00 x<!--"-->
<!---->
</small>\
file2:
<!--"-->total   82<!--"-->
<small>\
<!--"-->202 sdrwr-  2 root    140 Jan  1 00:00:00 boot<!--"-->
<!--"-->197 sdrwr-  2 root     60 Jan  1 00:00:00 fort<!--"-->
<!--"-->194 sdrwr-  2 root     40 Jan  1 00:00:00 jack<!--"-->
<!--"-->192 sdrwr-  2 root     30 Jan  1 00:00:00 ken<!--"-->
<!--"-->183 sdrwr-  2 root    100 Jan  1 00:00:00 lib<!--"-->
<!--"-->209 sdrwrw  2 root    110 Jan  1 00:00:00 nab-test<!--"-->
<!--"--> 42 sdrwr-  5 root     60 Jan  1 00:00:00 src<!--"-->
<!--"-->168 sdrwr-  2 root    360 Jan  1 00:00:00 sys<!--"-->
<!--"-->217 lxrwrw  2 root  36432 Jan  1 00:00:00 u<!--"-->
<!--"-->167 sxrwrw  1 root     54 Jan  1 00:00:00 x<!--"-->
</small>\
# <kbd>cat file1/x file2/x</kbd>
<!--"-->tap x\<!--"-->
<!--"-->./fort/fc1\<!--"-->
<!--"-->./fort/fc2\<!--"-->
<!--"-->./fort/fc3\<!--"-->
<!--"-->./fort/fc4<!--"-->
<!--"-->tap x\<!--"-->
<!--"-->./fort/fc1\<!--"-->
<!--"-->./fort/fc2\<!--"-->
<!--"-->./fort/fc3\<!--"-->
<!--"-->./fort/fc4<!--"-->
</pre>
<p class="indented continuation">
I've<!--'--> never seen this mentioned or hinted at by anyone, ever. Presumably because directories can only have 1 non-<tt>.<del>.</del></tt> link,
and people mount over directories generally?
No modern system lets you do this.
</p>

<ol>
	<LI>in principle, if the i-node on the mounted file system that was supposed to contain the root directory actually contained another type of file
	    that would also Just Work
	     (actually we can just test this too: after copying 32 bytes from after 0x18C0 to after 0x0900
	      — i-node 167 (<tt>/x</tt>) to 41 (<tt>/</tt>) — on <tt>rk0</tt> we observe</li>
</ol>
<pre>
:login: <kbd>root</kbd>
root
/**/# <kbd>ls -l</kbd>
<!--"-->total    6<!--"-->
<!--"--> 58 sdrwr-  2 root    620 Jan  1 00:00:00 bin<!--"-->
<!--"--> 42 sdrwr-  2 root    250 Jan  1 00:00:00 dev<!--"-->
<!--"--> 48 sdrwr-  2 root    110 Jan  1 00:00:00 etc<!--"-->
<!--"--> 44 sdrwr-  2 root    120 Jan  1 00:00:00 tmp<!--"-->
<!--"--> 41 sxrwrw  1 root     54 Jan  1 00:00:00 usr<!--"-->
/**/# <kbd>cat usr</kbd>
<!--"-->tap x\<!--"-->
<!--"-->./fort/fc1\<!--"-->
<!--"-->./fort/fc2\<!--"-->
<!--"-->./fort/fc3\<!--"-->
<!--"-->./fort/fc4<!--"-->
</pre>
<ol>
	<LIC(53)>– has anyone done this?)</li>
	<p></p>

	<LI>this is the final buffer we'll<!--'--> look at in this post, so:
	    knowing that the memory map consists of kernel memory in
	    <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L4">0</a>-<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L45">16k</a>,
	    then 8k of userspace memory,
	    and buffers total
	    <!--(218+32+1024+510+(9*140+6*520)=)-->6164=6k+20 bytes
	    (<tt>systm</tt><wbr />+<tt>inode</tt><wbr />+<tt>mount</tt><wbr />+<tt>clist</tt><wbr />+<tt>buffer</tt>),
	    buffers are 37.6% of kernel and 25.1% of total memory.</li>
</ol>


HEADING_S(3, finally, class="continued", And now, a vicious take-down of a retiree who's<!--'--> made a minor error 55 years ago)
<p class="continuing">
with a final look at <strong>emphasised</strong> fragments:
</p>
#define CONT continuing
#define LINENOS                                                                                      \
<del>                                                                                                \
LINETEXTS__1s_u6_1__1_u6_1S_u6_8__2_u6_1__3_u6_2__2_u6_5__2s_u6_1S__1__1                             \
LINENOS_1sz_212f_1_1z_214f_1S_4_220f_1_223f_1_225f_2_2z_229f_1_3z_240f_2_2z_243f_5_2sz_252f_1S_1z_1z \
</del>
#include "023,a.02-dskwC.h"
<p class="continuing">
where we observe
(assuming no other processes are running that would influence the make-up of the block device I/O queue),
if, say, writing to a small file with i-node 167 on <tt>rk0</tt> that remains small throughout
(which lets us discard <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u5#L3"><tt>mget</tt></a> cache effects from indirect blocks):
</p>
<ol>
	<LI>on l. 214, the file being written to is loaded into the i-node cache</li>
	<LI>(if it wasn't<!--'--> already in there, the block containing the i-node is looked up in the block cache
	     (and, if missing, enqueued to be read, and waited for), parsed)</li>
	<LI>((if had to look up in block cache, it now contains
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 12) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li style="list-style-type: '1… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)<!---->))</li>
		      </ol>
		    </div>
		    or
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 12) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li value=1>(0, 4) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li style="list-style-type: '2… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)<!---->))</li>
		      </ol>
		    </div>
		    if the previously-open i-node was modified (in this example: 0,4 has the i-node for <tt>/</tt>); this case folds into the former
	      </li>
	<p></p>

	<LI>if writing partial or non-block-aligned data (l. 240),
	    the data block at the file cursor is <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L148">looked up in the block cache</a> (l. 241)
	    (and, if missing, enqueued to be read, and waited for)</li>
	<LI>(the block cache now contains
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 222) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li value=1>(1, 12) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li style="list-style-type: '2… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)<!---->)</li>
		      </ol>
		    </div>
		    (if the block cache contained the data block <em>and</em> had to look up the i-node in the i-node cache) or
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 222) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li style="list-style-type: '1… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		      </ol>
		    </div>
		    (in all other cases)</li>
	<!-- preempt point -->
	<LI>the data block at the file cursor is looked up in the block cache (l. 243) and locked for writing</li>
	<LI>(the block cache now contains
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 222) flags: lock, want to write; data=(current contents of block (1,222) if <a href="#59">condition above</a> was met, otherwise stale data from some other block that was reclaimed for this)</li>
		      	<li value=1>(1, 12) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li style="list-style-type: '2… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)<!---->)</li>
		      </ol>
		    </div>
		    or
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 222) flags: lock, want to write; data=(current contents of block (1,222) if <a href="#59">condition above</a> was met, otherwise stale data from some other block that was reclaimed for this)</li>
		      	<li style="list-style-type: '1… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		      </ol>
		    </div>
		    resp.</li>
	<LI>after the open-coded L(d,<tt>_memcpy</tt>), the buffer contains the new contents of the block</li>
	<!-- preempt point -->
	<LI>on l. 252, the buffer with priority 0 is unlocked, and enqueued if there's<!--'--> no contending I/O
	    (<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u8#L184"><tt>dskwr</tt></a> is
	     <tt>bufp[0]._flags &= ~lock; <a href="#PSW">ppoke()</a>;</tt>)</li>
	<LI>(the block cache now contains
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 222) flags: want to write (+ dispatched read request if successfully enqueued)</li>
		      	<li value=1>(1, 12) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li style="list-style-type: '2… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)<!---->)</li>
		      </ol>
		    </div>
		    or
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 222) flags: want to write (+ dispatched read request if successfully enqueued)</li>
		      	<li style="list-style-type: '1… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)</li>
		      </ol>
		    </div>
		    resp.</li>
	<p></p>

	<LI>the sequence above repeats until all affected data blocks were written and enqueued;
	    the I/O queue grows like
	      <div style="margin-left: 1em;">
		      <ol style="margin-left: 1em;">
		      	<li value=0>(1, 223) flags: want to write (+ dispatched read request if successfully enqueued)</li>
		      	<li value=1>(1, 222) flags: want to write (+ dispatched read request if successfully enqueued)</li>
		      	<li value=2>(1, 12) flags: unclaimed (flags: <del>none</del>)</li>
		      	<li style="list-style-type: '3… ';">(<var>d</var>, <var>i</var>) unclaimed (flags: <del>none</del>)<!---->)</li>
		      </ol>
		    </div></li>
	<LI>after returning to one of the callers
	    <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u1#L334"><tt>syswrite</tt></a>,
	    <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u6#L125"><tt>wdir</tt></a>
	    (<a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u2#L46" ><tt>sysunlink</tt></a>),
	    <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u1#L120"><tt>badsys</tt></a>,
	    at some point control ends up returning from kernel- to user-space at which point
	    <a href="#33">the (block containing the) i-node is flushed</a> (if it was modified because the file grew)</li>
	<LI>(<tt>dskw</tt> is only called by as-if by tail recursion from <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u6#L125"><tt>writei</tt></a>,
	     so returning from <tt>dskw</tt> returns to <tt>writei</tt>'s<!--'--> caller)</li>
	<LI>((it's<!--'--> also called by the installer kernel to
	      <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u0#L223">write the installer i-nodes</a> which flushes everything together afterward))</li>
	<p></p>

	<LI>it follows trivially from the above that the <tt><q>yes, write the block and the i-node</q></tt> comment is bogus:
	    at most, it writes the block; most likely, it just returns because there's<!--'--> already I/O happening to the device containing the block</li>
	<p></p>

	<LI>an attentive reader will notice that if the process times out
	    (a <a href="//vtree.nabijaczleweli.xyz/?DeFelice_v1#u4#L11">clock interrupt</a> happens
	     ⇒ user <abbr title="that's what they called time slices at the time; &quot;process ran for too long, time for another to run&quot;">quantum</abbr> expired
	     ⇒ process swapped out),
	    another process can re-arrange the I/O queue arbitrarily;
	    this is expected, except this function behaves as-if it held a lock on the buffer between ll. 240-252,
	    but it doesn't<!--'--></li>
#define PROP58 <a href="#58">proposition 58</a> (l. 241)
#define PROP60 <a href="#60">proposition 60</a> (l. 243)
#define PROP63 <a href="#63">proposition 63</a> (l. 252)
	<LI>thus, if the process is interrupted between PROP58 and PROP60, and not writing full block (i.e. need original data),
	    if the returned block is pushed out of the cache, <tt>wslot</tt> will fail to find the buffer with the original data,
	    and will instead update a "random" block found on the cache with partial data</li>
	<LI>if the process is interrupted between PROP60 and PROP63 and the swapped-in process does any dynamic buffer I/O,
	    the buffer obtained in PROP60 will be lost forever, since it will have been moved to priority >0,
	    and thus never unlocked</li>
	<LI>(this would be fixed if <tt>dskwr</tt> did <tt>container_of(r5, struct _dynamic_iobuf, _buf)->_flags &= ~lock; ppoke();</tt>,
	     updating the used buffer instead of the one with priority 0)</li>
</ol>
<p class="continuation">
at least, I think this is possible.
The second half of <tt>clock</tt> is impenetrable to me.
</p>

<p class="indented">
There's<!--'--> no "satisfying" way to end this post.
All <a href="#51">novel</a> <a href="#53">results</a> were presented in-line,
and pedantry that disproves well-established consensus and unix historiosophy were rewards unto themselves.
<a href="//nabijaczleweli.bandcamp.com/album/file-view-edit">Spin <cite class="inline">File, View, Edit</cite></a> maybe?
<a href="//101010.pl/@nabijaczleweli/115945389936286232">Comment for engagement</a>?
Call to action
<a href="//store.nabijaczleweli.xyz">3</a>,
<a href="//liberapay.com/nabijaczleweli">4</a>,
5…?
</p>


BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
