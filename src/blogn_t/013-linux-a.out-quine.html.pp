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


   <!-- RSS_PUB_DATE: "Sun, 17 Mar 2024 04:57:16 +0100" -->
#define POST_DATE      Sun, 17 Mar 2024 04:57:16 +0100
#define POST_POST_DATE

#define Tn(...)  <span class="smallcaps">__VA_ARGS__</span>
#define CMT(...) <span class="cmt">__VA_ARGS__</span>

#ifdef linux
#undef linux
#endif
#ifdef unix
#undef unix
#endif


BOILERPLATE(013. Linux a.out quine in 44 bytes — blognꞌt, 013. Linux a.out quine in 44 bytes, en-GB, BLOGN_T_STYLESHEETS WORD_COUNT_SCRIPT_NON_ENGLISH)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

.cmt {
	opacity: 50%;
}

pre {
	     tab-size: 5;
	-moz-tab-size: 5;
}

pre, img {
	max-width: 100%;
	overflow-x: auto;
}

figure {
	margin-left: 0;
	margin-right: 0;
}

pre kbd {
	font-weight: bold;
	font-family: inherit;
}
</style>


BLOGN_T_HEADING(013. Linux a.out quine in 44 bytes)


<p class="indented continued">
<a href="//susam.net/self-printing-machine-code.html">Susam Pal'<!--'-->s <cite>Self-Printing Machine Code</cite></a>
(on <a href="//mastodon.social/@susam/112104337300249149">mastussy</a>)
demonstrates a 12-byte Tn(dos) program copying its image to the standard output.
This platform lends itself well to the problem, since executables are allowed to be bare code and copied to a fixed offset,
naturally advantaging it over real systems like Tn(unix).
Nevertheless, the Tn(unix) a.out header is only 32 bytes and the entire image is similarly mapped at a well-known location;
too bad Linux doesn'<!--'-->t support a.out.
</p>
<p class="indented continuing">
But
<a href="//lists.debian.org/debian-announce/1995/msg00004.html"><q>Debian GNU/Linux 0.93 will be the last release that uses the a.out binary format.</q></a>,
and <a href="//archive.debian.org/debian/dists/Debian-0.93R6/">0.93R6 is, obviously, readily available to install</a>.
A musty 1995 vintage, for which you
<a href="//101010.pl/@nabijaczleweli/110729867412904137">definitely want to consult the installation guide</a>,
but 1995 debian-installer is irrevocably and unfalteringly debian-installer.
There are, of course, some fundamental issues with running a 30-year-old system:
</p>
<ul style="padding-left: 1em;">
	<li>KVM breaks it completely (not that it needs acceleration)</li>
	<li>no SCSI, and the installation is multi-floppy, so <span id="google">google</span> "qemu monitor change floppy" is in full effect</li>
	<li>it needs a little bit of RAM (<q>at least four megabytes</q>), but not too much; the Tn(qemu) default of 128M <em>is</em> too much</li>
	<li>similarly for the disk – suppress the instinct of defaulting to 4G, and given that <q>a new disk partition of at least 40 megabytes</q>, 128M works</li>
	<li>ACPI doesn'<!--'-->t exist yet. the system halts by halting</li>
	<li>it will probably Just hang at one point;
	    lynx will cause a kernel oops;
	    (address resolution in) ping will <a href="//101010.pl/@nabijaczleweli/112106991701251065">randomly hardloop/segfault</a></li>
	<li>there is no DHCP-enabled config in the installer, and you don'<!--'-->t need it because Tn(qemu) doesn'<!--'-->t emulate any supported ethernet card</li>
	<li>this means that the only I/O to the world is by floppy and serial</li>
	<li>boot is floppy-only as well</li>
</ul>
<script>
(function() {
	let googles = ["google", "ddg", "baidu", "kagi", "startpage"];
	google.innerText = googles[Math.floor(Math.random() * googles.length)];
})()
</script>
<p class="continuation">
overall <code>qemu-system-i386 -m 32m -fda boot.bin -hda rootfs -boot a -fdb debs.tar</code> works,
and the most annoying limitation is that the floppy will be truncated at 2.8M, so you can'<!--'-->t tar up every deb at once;
not that it really matters because <tt>strace</tt>/<tt>gdb</tt>/<tt>binutils</tt>/<tt>gcc</tt> are the only relevant ones not on the installation floppies.
</p>

<p class="indented continued">
This draws heavily from the aforelinked <a href="//binary.golf">BGGP4</a> submission,
where <a href="//101010.pl/@nabijaczleweli/111400543705964317">I had been robbed of my winning submissions</a> for both the binary and shell program categories.
Nevertheless, this allows for more interesting packing; given the annotated program:
</p>
<div style="text-align: right;">
(build with <code>cut -sf2 &lt; prog | tr a-f A-F | tr -d '[:space:]' | base16 -d</code>)
</div>
<pre class="continuing"><code>\
CMT(0)<!--"-->	cc 00 64 00	<!--"-->CMT(;)<!--"--> <var>a_midmag</var><!--"-->
CMT(4)<!--"-->	0C 00 00 00	<!--"-->CMT(;)<!--"--> <var>a_text</var><!--"-->
CMT(8)<!--"-->	00 00 00 00	<!--"-->CMT(;)<!--"--> <var>a_data</var><!--"-->
CMT(12)<!--"-->	b0 04      	<!--"-->CMT(;)<!--"--> <var>a_bss</var> eax=4	mov    al,0x4	number=__NR_write<!--"-->
CMT(14)<!--"-->	EB 10      	<!--"-->CMT(;)<!--"-->            	jmp    +16<!--"-->
CMT(18)<!--"-->	00 00 00 00	<!--"-->CMT(;)<!--"--> <var>a_syms</var><!--"-->
CMT(22)<!--"-->	0C 10 00 00	<!--"-->CMT(;)<!--"--> <var>a_entry</var><!--"-->
CMT(26)<!--"-->	00 00 00 00	<!--"-->CMT(;)<!--"--> <var>a_trsize</var><!--"-->
CMT(30)<!--"-->	00 00 00 00	<!--"-->CMT(;)<!--"--> <var>a_drsize</var><!--"-->
CMT(32)<!--"-->	31 db      	<!--"-->CMT(;)<!--"--> ebx=0     	xor    ebx,ebx	fd    =0<!--"-->
CMT(34)<!--"-->	31 c9      	<!--"-->CMT(;)<!--"-->           	xor    ecx,ecx<!--"-->
CMT(36)<!--"-->	b5 10      	<!--"-->CMT(;)<!--"--> ecx=0x1000	mov    ch,0x10	buf   =loadaddr<!--"-->
CMT(38)<!--"-->	31 d2      	<!--"-->CMT(;)<!--"-->           	xor    edx,edx<!--"-->
CMT(40)<!--"-->	b2 2C      	<!--"-->CMT(;)<!--"--> edx=44    	mov    dl,44	count =progsize<!--"-->
CMT(42)<!--"-->	cd 80      	<!--"-->CMT(;)<!--"--> syscall() 	int    0x80<!--"-->
CMT(44)\
</code></pre>
<p class="continuing">
note that
<var>a_midmag</var> (the magic),
<var>a_text</var> (the size of the program text immediately following the header;
                   Linux has started requiring this (and, thus, the file size) to be page-aligned by 2.6), and
<var>a_data</var> (the size of program data, following the text)
are fixed parameters while
<var>a_trsize</var>
and
<var>a_drsize</var>
must be <strong>0</strong>;
<var>a_bss</var> can be anything, since it describes the initial allocation to map after the program data,
while
<var>a_syms</var> can, empirically, <em>sometimes</em> have a non-zero low byte.
</p>
<p class="indented continuing">
While COMs are loaded at <var>0x100</var> and a.outs are loaded at <var>0x1000</var>,
the start address for COMs is also <var>0x100</var>, while for a.outs it'<!--'-->s <code><var>a_entry</var></code>.
"Real" a.outs in the distribution include the libc runtime entry point at start of the program text,
and thus <code><var>a_entry</var></code> is unwaveringly <samp>0x1020</samp> (<var>0x1000</var> + the 32 header bytes);
except in this case it'<!--'-->s <code><var>a_bss</var></code>, into which the first instruxion is packed.
</p>
<p class="indented continuing">
While Susam'<!--'-->s program amounts to, effectively, a "write a buffer, then return" implementation (down to exiting with <code>ret</code>) in 12 bytes,
this is an exercise in zeroing registers, since it amounts to
</p>
<pre class="continuing"><code>\
<!--"-->	write(0, 0x1000, 44);<!--"-->\
</code></pre>
<p class="continuing">
in 44 bytes – conveniently an even 32 more, matching the header size.
The astute reader will'<!--'-->ve noted that it <em>actually</em> executes 16 bytes to do so,
but if all registers were clear on entry this would'<!--'-->ve been just 10.
</p>
<p class="indented continuation">
There is no explicit exit,
since the 270M of zeroes (allocated by <code><var>a_bss</var></code>=<code>0x10eb04b0</code>)
decode to <samp style="white-space: nowrap;">add byte [eax], al</samp> which instantly segfaults,
and, if you don'<!--'-->t disable coredumps, fills your disk.
</p>

<figure>
	<a href="/content/assets/blogn_t/013.01-output.png"><img alt="" src="/content/assets/blogn_t/013.01-output.png"></a>
	<figcaption>
		<pre class="continuing">\
<!--"-->Debian GNU/Linux 0.93R6<!--"-->
<!--"-->Copyright (C) 1993, 1994, 1995 Debian Association, Inc. and others<!--"-->
<!--"-->0.93R6 login: <kbd>nab</kbd><!--"-->
<!--"-->Password:<!--"-->
<!--"-->Last login: Sat Mar 16 21:15:48 on tty1<!--"-->
<!--"-->Linux 0.93R6 1.2.13 #2 Wed Oct 4 17:35:14 EST 1995 i686<!--"-->
<!--"-->Copyright (C) 1993, 1994, 1995 Debian Association, Inc. and others<!--"-->
<!---->
<!--"-->Everything included with the Debian GNU/Linux system is freely<!--"-->
<!--"-->redistributable; the exact distribution terms for each program<!--"-->
<!--"-->are described in the individual files in /usr/doc/copyright/.<!--"-->
<!---->
<!--"-->Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent<!--"-->
<!--"-->permitted by applicable law.<!--"-->
<!--"-->$ <kbd>ulimit -c 0</kbd><!--"-->
<!--"-->$ <kbd>./newd3</kbd><!--"-->
<!--"-->�d<!--"-->
<!--"-->  ��<!--"-->
<!--"-->    1�1ɵ1Ҳ,̀Segmentation fault<!--"-->
<!--"-->$ <kbd>./newd3 0>&1 | od -tx1 -Ad</kbd><!--"-->
<!--"-->0000000 cc 00 64 00 0c 00 00 00 00 00 00 00 b0 04 eb 10<!--"-->
<!--"-->0000016 00 00 00 00 0c 10 00 00 00 00 00 00 00 00 00 00<!--"-->
<!--"-->0000032 31 db 31 c9 b5 10 31 d2 b2 2c cd 80<!--"-->
<!--"-->0000044<!--"-->
<!--"-->Segmentation fault<!--"-->
<!--"-->$ <kbd>&lt; newd3 od -tx1 -Ad</kbd><!--"-->
<!--"-->0000000 cc 00 64 00 0c 00 00 00 00 00 00 00 b0 04 eb 10<!--"-->
<!--"-->0000016 00 00 00 00 0c 10 00 00 00 00 00 00 00 00 00 00<!--"-->
<!--"-->0000032 31 db 31 c9 b5 10 31 d2 b2 2c cd 80<!--"-->
<!--"-->0000044<!--"-->\
</pre>
	</figcaption>
</figure>


BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
