<!--
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->
<!-- https://lfs.nabijaczleweli.xyz/0016-cohost-export/https:///nabijaczleweli/post/1730377-please-talk-to-my-su -->


#include "../writing/writing.h"
#include "../fontawesome.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Mon, 19 Jun 2023 23:53:58 +0200" -->
#define POST_DATE      Mon, 19 Jun 2023 23:53:58 +0200
#define POST_POST_DATE , <a href="#sun4c">Solaris on Sun-4c</a> on <span style="white-space: nowrap">Wed, 21 Jun 2023 23:56:00 +0200</span>
                                                                              <!-- RSS_UPDATE_DATE: "Wed, 21 Jun 2023 23:56:00 +0200" -->

#define CMT Also used in heading.h, make sure to update both with fixes
#undef CMT
#define HEADING_LINK(id)                  <a class="hash-link" href=STR(HASH##id)>HASH</a>
#define HEADING_S(level, hid, style, ...) <h##level id=STR(hid) style>HEADING_LINK(hid) __VA_ARGS__</h##level>

#define Tn(...) <span class="smallcaps">__VA_ARGS__</span>
#define COMMENT <!--"-->  <!--"-->#


#define STYLESHEETS BLOGN_T_STYLESHEETS FONTAWESOME_LINK <link href="/content/assets/bigtable.css" rel="stylesheet" />


BOILERPLATE(010. tme booting SunOS 3 on Sun-2 in 2023 — blognꞌt, 010. tme booting SunOS 3 on Sun-2 in 2023, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

.main-screenshot {
	margin-top: 0.2em;
	margin-bottom: 0.15em;
	width: 100%;
}

kbd {
	font-weight: bold;
}

pre.bigcode {
	white-space: pre-wrap;
}
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(<code>010. tme booting SunOS 3 on Sun-2 in 2023</code>)


<p class="indented continued">
As usual, some program has seen disproportionate development on SunOS.
This was (relatively-)easily-handled for <a href="//srhtcdn.githack.com/~nabijaczleweli/voreutils/blob/man/man1/hostid.1.html"><code>hostid</code></a>.
Text processing is impossible to guess from foreign-arch binaries, however, especially since all manuals consist primarily of lies;
<code>fmt</code> being part of the Mail package doesn'<!--'-->t help.
</p>
<p class="indented continuation">
<em>The</em> Sun-2 emulator is, fittingly, <a href="//people.csail.mit.edu/fredette/tme/"><code>tme</code></a>.
This is great, since there'<!--'-->s not a dozen of half-broken emulators.
This is bad, because 0.8 was published in 2010 and targets exclusively NetBSD through 2007-era autohell.
This is good, since it seems to be <em>the</em> porterbox for NetBSD/sun<var>?</var>.
This is sub-optimal, because the <em>only</em> working guest is NetBSD.
</p>

<pre class="bigcode continued"><samp><!--
-->$ <kbd>curl https://people.csail.mit.edu/fredette/tme/tme-0.8.tar.gz | tar -xz</kbd>
$ <kbd>cd tme-0.8</kbd>
$ <kbd>./configure</kbd>
$ <kbd>find -name Makefile -exec sed -i s/-Werror// {} +</kbd><!--"-->    <!--"--># the author's "reasonably fast machine" is a 500MHz Pentium III
$ <kbd>find -name Makefile -exec sed -i 's/^all-local:/& $(pkglib_LTLIBRARIES)/' {} +</kbd>COMMENT unclear if this has ever worked or if the author had simply only ever ran single-job <code>make</code>s
$ <kbd>make -j25</kbd><!--
--></samp></pre>
<p class="indented continuing">
If you have <code>libltdl-dev</code> installed, you'<!--'-->ll get
</p>
<pre class="continuing">
<!--"-->module.c:93:3: error: use of undeclared identifier 'lt_preloaded_symbols'<!--"-->
<!--"-->   93 |   LTDL_SET_PRELOADED_SYMBOLS();<!--"-->
<!--"-->      |   ^<!--"-->
<!--"-->/usr/include/ltdl.h:109:23: note: expanded from macro 'LTDL_SET_PRELOADED_SYMBOLS'<!--"-->
<!--"-->  109 |         lt_dlpreload_default(lt_preloaded_symbols)<!--"-->
<!--"-->      |                              ^<!--"-->
</pre>
<p class="continuing">
because for some reason the system – instead of the embedded – <code>libltdl</code> is used.
This is remedied by just commenting it out with
</p>
<p class="indented continuing"><samp>$ <kbd>ed libtme/module.c</kbd></samp></p>
<p class="indented continuation"><samp><kbd>93s:^://:</kbd></samp></p>

<p class="indented continued">
Usually, this ought to be enough; however, in this state it only boots NetBSD; thankfully,
<a href="//www.giga.nl/walter/computers/sun2-install.html">other</a>
<a href="//www.heeltoe.com/index.php?n=Retro.Sun2">users</a>
have come up with patchsets that fix <code>tme</code> enough to boot SunOS 3.
SunOS 2 doesn'<!--'-->t bootstrap (and even if installed from SunOS 3, it still
<a href="//nabijaczleweli.xyz/content/assets/blogn_t/010.6-sunos2.png">just but errors</a>).
The only SunOS 3 that worked for me was 3.5; earlier installation tapes were broken to varying extents.
</p>
<p class="indented continuing">
Additionally, during SunOS 3 installation,
<a href="//lfs.nabijaczleweli.xyz/0016-cohost-export/https:///nabijaczleweli/post/1709365-real-innovation-has#post-1706872">the emulator will <code>SIGABRT</code> in the tape driver</a>,
since WRITE MARKS is unimplemented.
This is trivially fixed by turning it into a no-op instead.
</p>
<pre class="bigcode continuation"><samp><!--
-->$ <kbd>curl http://www.heeltoe.com/download/sun2/diffs-20111125 | patch -p1</kbd>
patching file bus/multibus/sun-mie.c
patching file generic/bus.c
patching file generic/bus-el.c
patching file host/posix/posix-memory.c
patching file ic/i825x6.c
patching file ic/m68k/m68010.c
patching file ic/m68k/m68k-execute.c
patching file ic/m68k/m68k-impl.h
patching file ic/m68k/m68k-insns-auto.c
patching file ic/m68k/m68k-misc.c
patching file libtme/module.c
patching file machine/sun/sun-bwtwo.c
patching file machine/sun2/sun2-mainbus.c
patching file machine/sun2/sun2-mmu.c
patching file machine/sun3/sun3-mainbus.c
patching file machine/sun4/sun4-mainbus.c
patching file scsi/emulexmt02.c
patching file tmesh/tmesh.c
patching file tmesh/tmesh-cmds.c
patching file tmesh/tmesh-input.y
$ <kbd>ed scsi/scsi-tape.c</kbd>
38495
<kbd>585</kbd>
  abort();
<kbd>s:^://:</kbd>
<kbd>w</kbd>
38497
<kbd>q</kbd>
$ <kbd>make -j25</kbd><!--
--></samp></pre>

<p class="indented continued">
With this, the <a href="//people.csail.mit.edu/fredette/tme/sun2-120-nbsd.html">official Sun-2 instructions</a> may continue.
Well.
It'<!--'-->s said that when configuring with <samp>--disable-shared</samp>, plugins will be linked in statically:
this doesn'<!--'-->t hold (and I needed to manually edit the final linker run).
</p>
<p class="indented continuing">
It'<!--'-->s also said that to run <code>tme</code> from the build directory, you can just export <code>LTDL_LIBRARY_PATH=$PWD</code>;
this almost works except it doesn'<!--'-->t (presumably because bookworm libtool lays the output out differently,
and the final binary is still linked to the embedded libltdl(?)).
Thus, on the first run, no system component will be loaded to a choir of ENOENTs.
To save you some round-trips between
<kbd>strace -oss tmesh/tmesh MY-SUN2</kbd>,
<kbd>grep 'tme_.*so' ss | grep ENOENT</kbd>, and
<kbd>find $PWD -name whatever.so.0</kbd>,
I found this sufficient for <samp style="white-space: nowrap;">SUN2-MULTIBUS</samp>:
</p>
<p class="indented continuation"><samp>$ <kbd>ln -s $PWD/bus/multibus/.libs/tme_bus_multibus.so.0 $PWD/generic/.libs/tme_generic.so.0 $PWD/host/gtk/.libs/tme_host_gtk.so.0 $PWD/host/posix/.libs/tme_host_posix.so.0 $PWD/ic/.libs/tme_ic_am9513.so.0 $PWD/ic/.libs/tme_ic_mm58167.so.0 $PWD/ic/.libs/tme_ic_z8530.so.0 $PWD/ic/m68k/.libs/tme_ic_m68k.so.0 $PWD/machine/sun2/.libs/tme_machine_sun2.so.0 $PWD/scsi/.libs/tme_scsi.so.0 $PWD/serial/.libs/tme_serial_kb.so.0 tme</kbd></samp></p>

<p class="indented continued">
With this, the <a href="//people.csail.mit.edu/fredette/tme/sun2-120-nbsd.html">official Sun-2 instructions</a> may continue:
</p>
<pre class="bigcode continuing"><samp><!--
-->$ <kbd>curl -O https://people.csail.mit.edu/fredette/tme/sun2-multi-rev-R.bin</kbd>
$ <kbd>cp $(find -name SUN2-MULTIBUS) MY-SUN2</kbd>
+ cp ./machine/sun2/SUN2-MULTIBUS MY-SUN2
$ <kbd>perl -w $(find -name tme-sun-idprom) 2/120 8:0:20:0:0:0 > my-sun2-idprom.bin</kbd>COMMENT s/0:0:0/<var>whatever</var>/ if you have other sunmicro hosts
+ perl -w ./machine/sun/tme-sun-idprom 2/120 8:0:20:0:0:0
$ <kbd>find -name sun-keyboards.txt</kbd>
./machine/sun/sun-keyboards.txt
$ <kbd>cp ./machine/sun/sun-keyboards.txt ./machine/sun/my-sun-macros.txt .</kbd>
$ <kbd>truncate -s 40G my-sun2-disk.img</kbd>COMMENT fun: the emulator <code>SIGBUS</code>ses if the guest reads past the end here!<!--
--></samp></pre>
<p class="indented continuing">
Thankfully, customisation points for SunOS enjoyers and auto-boot are outlined explicitly:
</p>
<pre class="bigcode continuing"><samp><!--
-->$ <kbd>grep -nC3 SunOS MY-SUN2</kbd>
82-## a SCSI disk:
83-##
84:# if you'<!--'-->re using SunOS, change the disk type from tme-scsi-1 to
85-# acb4000, to get an Adaptec ACB-4000 compatible disk:
86-#
87-sd0 at scsibus0: tme/scsi/disk id 0 type tme-scsi-1
--
90-## a SCSI tape:
91-##
92:# if you'<!--'-->re using SunOS, remove the vendor EMULEX and product "MT-02 QIC"
93-# to get a 100% Emulex MT-02 compatible tape:
94-#
95-st0 at scsibus0: tme/scsi/tape id 4 type emulex-mt02 vendor EMULEX product "MT-02 QIC"
$ <kbd>ed MY-SUN2</kbd>
3579
<kbd>87s/tme-scsi-1/acb4000/p</kbd>
sd0 at scsibus0: tme/scsi/disk id 0 type acb4000
<kbd>95s/ ve.*//p</kbd>
st0 at scsibus0: tme/scsi/tape id 4 type emulex-mt02
<kbd>$s/# //p</kbd>
command mainbus0 power up
<kbd>w</kbd>
3540
<kbd>q</kbd><!--
--></samp></pre>
<p class="indented continuing">
By default, the emulator boots with the GTK display.
This is fine, it works the most; however, for the purposes of transcribing this tutorialisation I took advantage of the
<a href="//people.csail.mit.edu/fredette/tme/#system-tty">serial I/O capability</a>
— which can be toggled by inverting the comments on both mentions of "GTK" in <code>MY-SUN2</code> —
to use my preferred xterm, which I can copy from, as the head.
</p>
<p class="indented continuing">
Naturally, it only supports BSD PTYs, which Debian hasn'<!--'-->t configured with on <em>any</em> arch since <a href="//bugs.debian.org/338404"><em>2007</em></a>.
Thankfully, all <samp>/dev/ptmx</samp> support needs is
</p>
<pre class="continuing"><!--
"-->--- host/posix/posix-serial.c	2007-08-24 02:57:01.000000000 +0200<!--"-->
<!--"-->+++ host/posix/posix-serial.c	2023-06-19 01:26:46.891606875 +0200<!--"-->
@@ -34,4 +34,5 @@
  */
<!--"--> <!--"-->
+#define _GNU_SOURCE
<!----> #include &lt;tme/common.h>
 _TME_RCSID("$Id: posix-serial.c,v 1.11 2007/08/24 00:57:01 fredette Exp $");
@@ -43,4 +44,5 @@
<!----> #include &lt;fcntl.h>
<!----> #include &lt;stdio.h>
+#include &lt;signal.h>
<!----> #include &lt;termios.h>
<!----> #include &lt;sys/types.h>
@@ -342,4 +344,6 @@
     if (rc < 0) {
       /* XXX diagnostic */
<!--"-->+      if (errno == EIO)<!--"-->
<!--"-->+        raise(SIGHUP);<!--"-->
       continue;
     }
@@ -842,4 +846,5 @@
   const char *filename_in;
   const char *filename_out;
<!--"-->+  char *vt;<!--"-->
   int fd_in, fd_out;
   int usage;
@@ -943,4 +948,9 @@
       return (errno);
     }
<!--"-->+    if (vt = ptsname(fd_in)) {<!--"-->
<!--"-->+      printf("opened %s\n", vt);<!--"-->
<!--"-->+      grantpt(fd_in);<!--"-->
<!--"-->+      unlockpt(fd_in);<!--"-->
<!--"-->+    }<!--"-->
   }
   if (fd_out < 0) {<!--
--></pre>
<p class="indented continuing">
I'<!--'-->ve personally added
</p>
<pre class="continuing">
      if (!fork())
        _exit(execlp("st", "st", "-l", vt, (char *)0));
</pre>
<p class="continuing">
after the <code>unlockpt()</code>, yielding an upgraded-over-stock UX of an xterm showing up on boot and closing the xterm killing the emulator
(set <var>device</var> to <code>/dev/ptmx</code>).
Strictly, this ought to be <code>st -l <var>vt</var> -- -parenb 9600 clocal</code> to match the author'<!--'-->s remote(5) line, but none of these do anything on a PTY.
</p>
<pre class="bigcode continuation"><samp><!--
-->$ <kbd>curl https://nabijaczleweli.xyz/content/assets/blogn_t/010.1-tme-0.8-ptmx | patch -p0</kbd>
$ <kbd>make -j25</kbd><!--
--></samp></pre>

<p class="indented continued">
<em>Now</em>
</p>
<pre class="bigcode continuing"><samp><!--
-->$ <kbd>LTDL_LIBRARY_PATH=$PWD tmesh/tmesh MY-SUN2</kbd>
[/display0.0]: cannot generate keysym 'Meta_R' directly, or through a macro: No such file or directory
<em># ...</em>
[/display0.0]: cannot generate keysym 'R1' directly, or through a macro: No such file or directory
lt-tmesh> <kbd>ls</kbd>
mainbus0: tme/machine/sun2 multibus my-sun2-idprom.bin
cpu0 at mainbus0: tme/ic/m68010
obio0 at mainbus0 obio: tme/generic/bus size 8MB
obmem0 at mainbus0 obmem: tme/generic/bus size 16MB
ram0 at obmem0 addr 0x0: tme/host/posix/memory ram 4MB
rom0 at obmem0 addr 0xef0000: tme/host/posix/memory rom sun2-multi-rev-R.bin
rom0 at obmem0 addr 0xef8000
clock0 at obio0 addr 0x2800: tme/machine/sun2/clock
tod0 at obio0 addr 0x3800: tme/machine/sun2/tod
zs0 at obio0 addr 0x2000 ipl 6: tme/machine/sun2/zs
mbio0 at mainbus0 mbio: tme/generic/bus size 8MB
mbmem0 addr 0x00000 at mainbus0 mbmem: tme/generic/bus size 8MB
sc0 at mbmem0 addr 0x80000 ipl 2: tme/bus/multibus/sun-sc
scsibus0 at sc0: tme/scsi/bus
bwtwo0 at obmem0 addr 0x700000 ipl 4: tme/machine/sun2/bwtwo type multibus
zs1 at obmem0 addr 0x780000 ipl 6: tme/machine/sun2/zs
kbd0 at zs1 channel A: tme/serial/keyboard type sun-type-2 macros my-sun-macros.txt map sun-keyboards.txt rate 20
ms0 at zs1 channel B: tme/serial/mouse type mousesystems-5
display0 at bwtwo0: tme/host/gtk/display
display0 at kbd0
display0 at ms0
sd0 at scsibus0: tme/scsi/disk id 0 type acb4000
disk0 at sd0: tme/host/posix/disk file my-sun2-disk.img
st0 at scsibus0: tme/scsi/tape id 4 type emulex-mt02
tape0 at st0: tme/host/posix/tape<!--
--></samp></pre>
<p class="continuing">
or
</p>
<pre class="bigcode continuing"><samp><!--
-->$ <kbd>LTDL_LIBRARY_PATH=$PWD tmesh/tmesh MY-SUN2</kbd>
opened /dev/pts/0
lt-tmesh> <kbd>ls</kbd>
mainbus0: tme/machine/sun2 multibus my-sun2-idprom.bin
cpu0 at mainbus0: tme/ic/m68010
obio0 at mainbus0 obio: tme/generic/bus size 8MB
obmem0 at mainbus0 obmem: tme/generic/bus size 16MB
ram0 at obmem0 addr 0x0: tme/host/posix/memory ram 4MB
rom0 at obmem0 addr 0xef0000: tme/host/posix/memory rom sun2-multi-rev-R.bin
rom0 at obmem0 addr 0xef8000
clock0 at obio0 addr 0x2800: tme/machine/sun2/clock
tod0 at obio0 addr 0x3800: tme/machine/sun2/tod
zs0 at obio0 addr 0x2000 ipl 6: tme/machine/sun2/zs
mbio0 at mainbus0 mbio: tme/generic/bus size 8MB
mbmem0 addr 0x00000 at mainbus0 mbmem: tme/generic/bus size 8MB
sc0 at mbmem0 addr 0x80000 ipl 2: tme/bus/multibus/sun-sc
scsibus0 at sc0: tme/scsi/bus
console0 at zs0 channel A: tme/host/posix/serial device /dev/ptmx break-carats
sd0 at scsibus0: tme/scsi/disk id 0 type acb4000
disk0 at sd0: tme/host/posix/disk file my-sun2-disk.img
st0 at scsibus0: tme/scsi/tape id 4 type emulex-mt02
tape0 at st0: tme/host/posix/tape<!--
--></samp></pre>
<p class="continuing">
should hold.
If you get any <code>ENOENT</code>s that aren't due to keysyms, you're missing some plugins that need to be linked to <code>tme/</code>.
Since Tn(unix) is an exercise in writing programs for your programs in your programs, the <code>tmesh</code> process is, per nom, a shell;
unlike Tn(dec)tapes everyone'<!--'-->s familiar with, tapes here consist of indexed partitions;
thus, running <kbd>command tape0 load part0 part1 …</kbd> inserts a tape consisting of <var>part</var>s into <code>st0</code>,
<kbd>command tape0 unload</kbd> does the obverse, and <code>load</code>ing twice in a row yields a sensible error.
</p>
<p class="indented continuation">
Conversely, <kbd>^D</kbd>ing segfaults the emulator.
</p>

<a href="/content/assets/blogn_t/010.2-plain.png"><img alt="" class="main-screenshot" src="/content/assets/blogn_t/010.2-plain.png" /></a>

<p class="indented continued">
The hard(-to-bear) part (other people'<!--'-->s C) is largely over, and can be followed by the hard(-to-bear) part of unpacking Tn(unix).
Western Electric and UCB licensees may obtain the SunOS 3.5/Sun-2 tape set from <a href="//winworldpc.com/product/sunos/3x">WinWorld</a>,
extract it somewhere, and ease their lives by running <kbd>ln -s <var>$somewhere</var>/'Sun UNIX 4.2 Release 3.5 (Tape) [Sun-2]'/tape? .</kbd>.
All SunOS 3 tapes, contrary to their predecessors, have a TOC as the second partition:
</p>
<pre class="bigcode continuation"><samp><!--
-->$ <kbd>cat tape1/02</kbd>COMMENT Inter-tape distances enlarged to show texture
TABLE OF CONTENTS
MC68010 tape 1
1 1 tape boot block
1 2 toc
1 3 copyright
1 4 diag
1 5 copy
1 6 mini-root
1 7 root
1 8 pub
1 9 client image
1 10 copyright
<!---->
2 1 copyright
2 2 toc
2 3 Sys
2 4 Networking tools and programs
2 5 Debugging tools
2 6 usr
2 7 copyright
<!---->
3 1 copyright
3 2 toc
3 3 SunView User Programs
3 4 SunView Programmers Files
3 5 SunView and Demo Program source
3 6 Text Processing tools
3 7 Setup tools
3 8 Standalone Diagnostics
3 9 Fortran Compiler & Libraries
3 10 User Level Diagnostics
3 11 SunCore & CGI Libraries
3 12 Pascal Interpreter & Compiler
3 13 Profiled Libraries
3 14 uucp programs
3 15 copyright
<!---->
4 1 copyright
4 2 toc
4 3 System V programs and libraries
4 4 Manual Pages
4 5 Demonstration Programs
4 6 Games
4 7 SunPro
4 8 copyright
<!---->
5 1 copyright
5 2 toc
5 3 Versatec Printer Software
5 4 copyright
<!----># This is, thus, not relevant, but is nevertheless humourous
$ <kbd>paste &lt;(ls -l tape?SLASH_ASTERIX | cut -c35-) &lt;(file tape?SLASH_ASTERIX | cut -d: -f2-)</kbd>
<!--"-->  30720 Mar 28  1994 tape1/01	data<!--"-->
<!--"-->   1024 Mar 28  1994 tape1/02	GTA in-game text (GXT), version 3, used in GTA VC/LS/VCS<!--"-->
<!--"-->    512 Mar 28  1994 tape1/03	data<!--"-->
<!--"-->  98816 Mar 28  1994 tape1/04	a.out SunOS mc68010 executable<!--"-->
<!--"-->  41472 Mar 28  1994 tape1/05	a.out SunOS mc68010 executable not stripped<!--"-->
<!--"-->4718592 Mar 28  1994 tape1/06	Unix Fast File system [v1] (big-endian), last mounted on /mnt, last written at Wed Dec  2 18:02:04 1987, clean flag 0, number of blocks 4608, number of data blocks 4303, number of cylinder groups 3, block size 8192, fragment size 1024, minimum percentage of free blocks 0, rotational delay 4ms, disk rotational speed 60rps, TIME optimization<!--"-->
<!--"-->1843200 Mar 28  1994 tape1/07	tar archive<!--"-->
<!--"-->4198400 Mar 28  1994 tape1/08	tar archive<!--"-->
<!--"-->1740800 Mar 28  1994 tape1/09	tar archive<!--"-->
<!--"-->    512 Mar 28  1994 tape1/10	data<!--"-->
$ <kbd>echo tape1SLASH_ASTERIX; echo tape2SLASH_ASTERIX; echo tape3SLASH_ASTERIX; echo tape4SLASH_ASTERIX; echo tape5SLASH_ASTERIX</kbd>COMMENT and this is useful for later
tape1/01 tape1/02 tape1/03 tape1/04 tape1/05 tape1/06 tape1/07 tape1/08 tape1/09 tape1/10
tape2/01 tape2/02 tape2/03 tape2/04 tape2/05 tape2/06 tape2/07
tape3/01 tape3/02 tape3/03 tape3/04 tape3/05 tape3/06 tape3/07 tape3/08 tape3/09 tape3/10 tape3/11 tape3/12 tape3/13 tape3/14 tape3/15
tape4/01 tape4/02 tape4/03 tape4/04 tape4/05 tape4/06 tape4/07 tape4/08
tape5/01 tape5/02 tape5/03 tape5/04<!--
--></samp></pre>

<p class="indented continued">
Therefore
</p>
<pre class="bigcode continuing"><samp><!--
-->lt-tmesh> <kbd>command tape0 load tape1/01 tape1/02 tape1/03 tape1/04 tape1/05 tape1/06 tape1/07 tape1/08 tape1/09 tape1/10</kbd><!--
--></samp></pre>
<p class="continuing">
and on the console:
</p>
<pre class="bigcode continuing"><samp><!--
-->Self Test completed successfully.
<!---->
Sun Workstation, Model Sun-2/120 or Sun-2/170, Sun-2 keyboard
ROM Rev R, 4MB memory installed
Serial #83661, Ethernet address 8:0:20:0:0:0
<!---->
Probing Multibus: sd
Auto-boot in progress...
Boot: sd(0,0,0)vmunix
<!---->
Exception 2C at 006000
><kbd>b st()</kbd>COMMENT equivalent to st(0,0,0)
Boot: st(0,0,0)
Boot: <kbd>st(0,0,3)</kbd>COMMENT "1 4 diag"
Size: 58636+33256+29072 bytes
<!---->
Version 1.3 86/07/25
Disk Initialization and Diagnosis
<!---->
When asked if you are sure, respond with 'y' or 'Y'
<!---->
specify controller:
<!--"-->	<!--"-->0 - Interphase SMD-2180
<!--"-->	<!--"-->1 - Xylogics 440 (prom set 926)
<!--"-->	<!--"-->2 - Xylogics 450/451
<!--"-->	<!--"-->3 - Adaptec ACB 4000 - SCSI/ST506
<!--"-->	<!--"-->4 - Emulex MD21 - SCSI/ESDI
which one? <kbd>4</kbd>COMMENT even though the configuration includes the <code>acb4000</code>; the Tn(emulex) appears to be functionally equivalent but it has bigger disks available
Specify controller address on the mainbus (in hex): <kbd>80000</kbd>COMMENT <code>disk0 at sd0 at scsibus0 at sc0 at mbmem0 addr 0x80000</code>
Device address: 80000
<!---->
Which target? <kbd>0</kbd>COMMENT for a second disk, duplicate both lines mentioning <code>sd0</code>, rename to <code>sd1</code>, <code>disk1</code>, <code>id 1</code> and use <kbd>1</kbd> here; this ends up being <code>/dev/sd2</code>
<!---->
Which unit? <kbd>0</kbd>
<!---->
Specify drive:
<!--"-->	<!--"-->0 - Micropolis 1355
<!--"-->	<!--"-->1 - Toshiba MK 156F
<!--"-->	<!--"-->2 - Micropolis 1558
<!--"-->	<!--"-->3 - Other
which one? <kbd>2</kbd>COMMENT this is the largest disk available; the 1355 is the second-largest, and the 1558 is not available on earlier systems
<!---->
ncyl 1218 acyl 2 nhead 15 nsect 35 interleave 1
reset the SCSI bus...
diag> <kbd>label</kbd>
label this disk...
OK to use logical partition map 'Micropolis 1558'? <kbd>y</kbd>
Are you sure you want to write? <kbd>y</kbd>
verify label
id: &lt;Micropolis 1558 cyl 1218 alt 2 hd 15 sec 35>
<!--"-->	<!--"-->Partition a: starting cyl=0, # blocks=16275
<!--"-->	<!--"-->Partition b: starting cyl=31, # blocks=32550
<!--"-->	<!--"-->Partition c: starting cyl=0, # blocks=639450
<!--"-->	<!--"-->Partition g: starting cyl=93, # blocks=590625
diag> <kbd>q</kbd>
Boot: <kbd>st(,,4)</kbd>COMMENT "1 5 copy"
Size: 23088+5248+113452 bytes
Standalone Copy
From: <kbd>st(0,0,5)</kbd>COMMENT "1 6 mini-root"
To: <kbd>sd(0,0,1)</kbd>COMMENT sd0b, conventionally swap
Copy completed - 4720640 bytes
Boot: <kbd>sd(0,0,1)vmunix -as</kbd>COMMENT -a to prompt for /; -s for single-user
Size: 481704+76100+64288 bytes
Sun UNIX 4.2 Release 3.5 (GENERIC) #1: Tue Dec 1 16:56:07 PST 1987
Copyright (c) 1986 by Sun Microsystems, Inc.
mem = 4096K (0x400000)
avail mem = 3280896
Ethernet address = 8:0:20:0:0:0
sc0 at mbmem 80000 pri 2
sd0 at sc0 slave 0
sd0:<!--"-->  <!--"-->&lt;Micropolis 1558 cyl 1218 alt 2 hd 15 sec 35>
sd1 at sc0 slave 1
st0 at sc0 slave 32
sd2 at sc0 slave 8
st1 at sc0 slave 40
zs0 at obio 2000 pri 3
pi0 at obio 1800
tod0 at obio 3800
root device? <kbd>sd0*</kbd>COMMENT <a href="/content/assets/blogn_t/010.3-setconf.png">the <code>*</code> enables cooperative swap-on-root</a> (instead of normally dumping to sd0b, which instantly destroys the filesystem there); this doesn'<!--'-->t appear to be documented
using 100 buffers containing 366592 bytes of main memory
WARNING: TOD clock not initialized -- CHECK AND RESET THE DATE!
Singleuser boot -- fsck not done
<!----># <kbd>stty erase \^H</kbd>COMMENT (<code>^</code> is special in the bourne shell) if using the graphical console; the keyboard mapping appears to match <a href="//github.com/delan/usb3sun/blob/default/src/bindings.h#L132">actual keyboards</a> in backspace being ^H; the miniroot has no way of checking whether it'<!--'-->s run on /dev/console and always runs <code>stty dec</code>; the installed system does, but also still does
<!----># <kbd>cd dev</kbd>
<!----># <kbd>MAKEDEV st0</kbd>
<!----># <kbd>newfs /dev/rsd0a</kbd>
/dev/rsd0a:<!--"-->	<!--"-->16274 sectors in 31 cylinders of 15 tracks, 35 sectors
<!--"-->	<!--"-->8.3Mb in 2 cyl groups (16 c/g, 4.30Mb/g, 1920 i/g)
super-block backups (for fsck -b#) at:
 32, 8480,
<!----># <kbd>newfs /dev/rsd0g</kbd>
/dev/rsd0g:<!--"-->	<!--"-->590624 sectors in 1125 cylinders of 15 tracks, 35 sectors
<!--"-->	<!--"-->302.4Mb in 71 cyl groups (16 c/g, 4.30Mb/g, 1984 i/g)
super-block backups (for fsck -b#) at:
 32, 8480, 16928, 25376, 33824, 42272, 50720, 59168, 67616, 76064,
 84512, 92960, 101408, 109856, 118304, 126752, 134432, 142880, 151328, 159776,
 168224, 176672, 185120, 193568, 202016, 210464, 218912, 227360, 235808, 244256,
 252704, 261152, 268832, 277280, 285728, 294176, 302624, 311072, 319520, 327968,
 336416, 344864, 353312, 361760, 370208, 378656, 387104, 395552, 403232, 411680,
 420128, 428576, 437024, 445472, 453920, 462368, 470816, 479264, 487712, 496160,
 504608, 513056, 521504, 529952, 537632, 546080, 554528, 562976, 571424, 579872,
 588320,
<!----># <kbd>mount sd0a /a</kbd>
<!----># <kbd>cd /a</kbd>
<!----># <kbd>mm() { mt -f /dev/nrst0 $*; }</kbd>
<!----># <kbd>unp() { mm rew; mm fsf $i; tar xvpf /dev/nrst0; }</kbd>COMMENT I'm pretty sure the bourne shell on this system doesn't have scoped variables, because using <code>mm fsf $*</code> or <code>$1</code> here always runs <code>mm fsf rew</code>
<!----># <kbd>set -x</kbd>
<!----># <kbd>for i in 6 7 8; do unp; done</kbd>COMMENT "1 7 root", "1 8 pub", "1 9 client image"
+ unp
+ mm rew
+ mt -f /dev/nrst0 rew
+ mm fsf 6
+ mt -f /dev/nrst0 fsf 6
+ tar xvpf /dev/nrst0
x ./etc/nd.local, 270 bytes, 1 tape blocks
x ./etc/dkinfo, 24576 bytes, 48 tape blocks
x ./etc/nd, 49152 bytes, 96 tape blocks
<em># ...</em>
x ./pub/bin/sh, 65536 bytes, 128 tape blocks
x ./.cshrc, 15 bytes, 1 tape blocks
x ./.login, 84 bytes, 1 tape blocks
x ./.profile, 70 bytes, 1 tape blocks
x ./.rhosts, 0 bytes, 0 tape blocks
x ./boot, 35020 bytes, 69 tape blocks
<!----># <kbd>cd dev</kbd>
<!----># <kbd>MAKEDEV std ttys pty0 win0 sd0 st0</kbd>
<!----># <kbd>mount sd0g /a/usr</kbd>
<!----># <kbd>cd ../etc</kbd>
<!----># <kbd>cat > fstab</kbd>
<!--"--><kbd>/dev/sd0a	/	4.2	rw,noquota	1	1<!--"-->
<!--"-->/dev/sd0g	/usr	4.2	rw,noquota	1	2<!--"-->
^D</kbd>
<!----># <kbd>mv ypbind ypbind_</kbd>COMMENT this disables ypbind(8), cf. rc.local
lt-tmesh> <kbd>command tape0 unload</kbd>
lt-tmesh> <kbd>command tape0 load tape2/01 tape2/02 tape2/03 tape2/04 tape2/05 tape2/06 tape2/07</kbd>
<!----># <kbd>cd ../usr</kbd>
<!----># <kbd>for i in 2 3 4 5; do unp; done</kbd>COMMENT "2 3 Sys", "2 4 Networking tools and programs", "2 5 Debugging tools", "2 6 usr"
+ unp
+ mm rew
+ mt -f /dev/nrst0 rew
+ mm fsf 2
+ mt -f /dev/nrst0 fsf 2
+ tar xvpf /dev/nrst0
x ./sys/OBJ/addupc.o, 354 bytes, 1 tape blocks
x ./sys/OBJ/af.o, 526 bytes, 2 tape blocks
x ./sys/OBJ/ar.h, 14 bytes, 1 tape blocks
<em># ...</em>
x ./sccs/helpdir/un, 559 bytes, 2 tape blocks
x ./sccs/helpdir/ut, 2070 bytes, 5 tape blocks
x ./sccs/helpdir/va, 101 bytes, 1 tape blocks
x ./sccs/helpdir/vc, 2417 bytes, 5 tape blocks
lt-tmesh> <kbd>command tape0 unload</kbd>
lt-tmesh> <kbd>command tape0 load tape3/01 tape3/02 tape3/03 tape3/04 tape3/05 tape3/06 tape3/07 tape3/08 tape3/09 tape3/10 tape3/11 tape3/12 tape3/13 tape3/14 tape3/15</kbd>
<!----># <kbd>for i in 2 3 4 5 6 7 8 9 10 11 12 13; do unp; done</kbd>COMMENT "3 3 SunView User Programs", "3 4 SunView Programmers Files", "3 5 SunView and Demo Program source", "3 6 Text Processing tools", "3 7 Setup tools", "3 8 Standalone Diagnostics", "3 9 Fortran Compiler & Libraries", "3 10 User Level Diagnostics", "3 11 SunCore & CGI Libraries", "3 12 Pascal Interpreter & Compiler", "3 13 Profiled Libraries", "3 14 uucp programs"
+ unp
+ mm rew
+ mt -f /dev/nrst0 rew
+ mm fsf 2
+ mt -f /dev/nrst0 fsf 2
+ tar xvpf /dev/nrst0
x ./bin/adjacentscreens symbolic link to othertools
x ./bin/align_equals symbolic link to suntools
<em># ...</em>
x ./spool/uucp/LOGFILE, 0 bytes, 0 tape blocks
x ./spool/uucp/SYSLOG, 0 bytes, 0 tape blocks
lt-tmesh> <kbd>command tape0 unload</kbd>
lt-tmesh> <kbd>command tape0 load tape4/01 tape4/02 tape4/03 tape4/04 tape4/05 tape4/06 tape4/07 tape4/08</kbd>
<!----># <kbd>for i in 2 3 4 5 6; do unp; done</kbd>COMMENT "4 3 System V programs and libraries", "4 4 Manual Pages", "4 5 Demonstration Programs", "4 6 Games", "4 7 SunPro"
<em># ...</em>
+ unp
+ mm rew
+ mt -f /dev/nrst0 rew
+ mm fsf 6
+ mt -f /dev/nrst0 fsf 6
+ tar xvpf /dev/nrst0
x ./sunpro/install_sunpro, 472 bytes, 1 tape blocks
x ./sunpro/compile, 73728 bytes, 144 tape blocks
x ./sunpro/cpp, 49152 bytes, 96 tape blocks
x ./sunpro/ld, 57344 bytes, 112 tape blocks
x ./sunpro/m4, 40960 bytes, 80 tape blocks
x ./sunpro/make, 98304 bytes, 192 tape blocks
x ./sunpro/make.1, 39910 bytes, 78 tape blocks
x ./sunpro/default.mk, 3351 bytes, 7 tape blocks
x ./sunpro/filemerge, 638976 bytes, 1248 tape blocks
x ./sunpro/filemerge.1, 7165 bytes, 14 tape blocks
<!----># <kbd>cd /</kbd>
<!----># <kbd>umount /a/usr</kbd>
<!----># <kbd>umount /a</kbd><!--
--></samp></pre>
<p class="continuation">
and kill the emulator: the miniroot doesn'<!--'-->t have <code>halt</code>, not that it potentially getting corrupted matters.
</p>

<p class="indented">
At this point we have SunOS, and it Just Boots.
The miniroot environment didn'<!--'-->t have curses programs, but your fully-unpacked 46MiB system (more if you also unpacked the printer drivers) does;
<code>TERM=sun</code> works for the graphical console; termcap is hell, <code>TERM=ansi</code>
(<samp>sx|ansi|any ansi terminal with pessimistic assumptions:\</samp>)
doesn'<!--'-->t work under my preferred xterm, and I have neither the patience or the will to try others.
Unless you're an ed fiend, I'd recommend just using the graphical console.
(If you won't, you'll need to also fight getty to produce a sane login prompt.)
</p>

<a href="/content/assets/blogn_t/010.4-fresh.png"><img alt="" class="main-screenshot" src="/content/assets/blogn_t/010.4-fresh.png" /></a>

<pre class="bigcode continued"><samp><!--
-->$ <kbd>LTDL_LIBRARY_PATH=$PWD tmesh/tmesh MY-SUN2</kbd>
Self Test completed successfully.
<!---->
Sun Workstation, Model Sun-2/120 or Sun-2/170, Sun-2 keyboard
ROM Rev R, 4MB memory installed
Serial #83661, Ethernet address 8:0:20:0:0:0
<!---->
Probing Multibus: sd
Auto-boot in progress...
Boot: sd(0,0,0)vmunix
Load: sd(0,0,0)boot
Boot: sd(0,0,0)vmunix
Size: 481704+76100+64288 bytes
Sun UNIX 4.2 Release 3.5 (GENERIC) #1: Tue Dec 1 16:56:07 PST 1987
Copyright (c) 1986 by Sun Microsystems, Inc.
mem = 4096K (0x400000)
avail mem = 3280896
Ethernet address = 8:0:20:0:0:0
sc0 at mbmem 80000 pri 2
sd0 at sc0 slave 0
sd0:<!--"-->  <!--"-->&lt;Micropolis 1558 cyl 1218 alt 2 hd 15 sec 35>
sd1 at sc0 slave 1
st0 at sc0 slave 32
sd2 at sc0 slave 8
st1 at sc0 slave 40
zs0 at obio 2000 pri 3
pi0 at obio 1800
root on sd0
using 100 buffers containing 366592 bytes of main memory
WARNING: no TOD clock -- CHECK AND RESET THE DATE!
/dev/sd0a: 257 files, 5903 used, 1705 free (1 frags, 213 blocks)
/dev/rsd0g: 4749 files, 47151 used, 229399 free (311 frags, 28636 blocks)
Automatic reboot in progress...
Wed Dec<!--"-->  <!--"-->2 10:13:37 PST 1987
starting rpc and net services: portmap router biod.
local daemons: sendmail statd lockd.
preserving editor files
clearing /tmp
standard daemons: update cron printer uucp.
starting network: inet.
Wed Dec<!--"-->  <!--"-->2 10:13:38 PST 1987
�
 �o���e�lo�i�:��
                �o���e�lo�i�:��
                               �o���e�lo�i�:�
                                             �
                                              �o���e�lo�i�:�t��t�re�et
Password:
Login incorrect
login: <kbd>root</kbd>
Sun UNIX 4.2 Release 3.5 (GENERIC) #1: Tue Dec 1 16:56:07 PST 1987
noname# <kbd>cat .login</kbd>
stty dec
set path=($path /etc /usr/etc)
set noglob; eval `tset -Q -s`; unset noglob
noname# <kbd>ed .login</kbd>
84
<kbd>1a
if (`tty` = /dev/console) stty erase ^H
.
w</kbd>
126
<kbd>q</kbd>
noname# <kbd>cd /etc</kbd>
noname# <kbd>ed rc.boot</kbd>
1439
<kbd>/host/</kbd>
hostname=noname
<kbd>s/noname/<var>sunos3</var>/
w</kbd>
1439
<kbd>q</kbd>
noname# <kbd>ed rc.local</kbd>
3079
<kbd>/nona/</kbd>
/bin/domainname noname
<kbd>s/noname/<var>nabijaczleweli.xyz</var>/</kbd>
<kbd>w</kbd>
3091
<kbd>q</kbd>
noname# <kbd>halt</kbd>
syncing disks... done
Unix Halted
<!---->
><kbd>b</kbd>
Boot: sd(0,0,0)vmunix
Load: sd(0,0,0)boot
Boot: sd(0,0,0)vmunix
Size: 481704+76100+64288 bytes
Sun UNIX 4.2 Release 3.5 (GENERIC) #1: Tue Dec 1 16:56:07 PST 1987
Copyright (c) 1986 by Sun Microsystems, Inc.
mem = 4096K (0x400000)
avail mem = 3280896
Ethernet address = 8:0:20:0:0:0
<em># ...</em>
standard daemons: update cron printer uucp.
starting network: inet.
Wed Dec<!--"-->  <!--"-->2 10:16:12 PST 1987
�
 ���o�3�lo�i�:��
                ���o�3�lo�i�:��
                               ���o�3�lo�i�:����
Password:
Login incorrect
login: <kbd>root</kbd>
Last login: Wed Dec<!--"-->  <!--"-->2 10:14:09 on console
Sun UNIX 4.2 Release 3.5 (GENERIC) #1: Tue Dec 1 16:56:07 PST 1987
sunos3# <kbd>suntools</kbd><!--
--></samp></pre>
<p class="indented continued">
starts <del>X</del> (hover over the text that says "Mouse is off" in the bottom left and press something on the keyboard to capture the mouse):
</p>
<a href="/content/assets/blogn_t/010.5-suntools.png"><img alt="Graphical console screenshot, showing the suntools interface with a text editor and an xterm with a process listing" class="main-screenshot continuation" src="/content/assets/blogn_t/010.5-suntools.png" /></a>


<p class="indented continued">
<del>X</del> (and the console in general) achieve single-digit refresh rates on bookworm;
this is likely related to the emulator being in a tight <code>poll()</code> loop with a zero <var>timeout</var>.
I'<!--'-->d attribute this to a GDK incompatibility probably (or the intrusive user-space scheduler), idk what else it could be doing.
</p>
<p class="indented continuing">
The emulator supposedly sleeps when kNetBSD does.
This may be true even for kSunOS, but due to the above it sits at a constant 100% CPU always.
</p>
<p class="indented continuing">
Host networking is only available via the BSD <samp>/dev/bpf<var>*</var></samp> interface.
That said, <samp>host/bsd/bsd-bpf.c</samp> is just 1200 lines and most of that is likely able to be duplicated directly.
OTOH it'<!--'-->s unclear if the <code>ie</code> device itself would work under SunOS.
</p>

HEADING_S(2, sun4c, class="continued", SunOS 4 (Solaris) on Sun-4c)
<pre class="bigcode continuing"><samp><!--
-->$ <kbd>curl https://nabijaczleweli.xyz/content/assets/blogn_t/010.7-tme-0.8-sun4 | patch -p0</kbd>
$ <kbd>make -j25</kbd>
$ <kbd>ln -s $PWD/bus/sbus/.libs/tme_bus_sbus.so.0 $PWD/ic/.libs/tme_ic_am7930.so.0 $PWD/ic/.libs/tme_ic_am7990.so.0 $PWD/ic/.libs/tme_ic_lsi64854.so.0 $PWD/ic/.libs/tme_ic_mk48txx.so.0 $PWD/ic/.libs/tme_ic_ncr53c9x.so.0 $PWD/ic/.libs/tme_ic_nec765.so.0 $PWD/ic/sparc/.libs/tme_ic_sparc.so.0 $PWD/machine/sun4/.libs/tme_machine_sun4.so.0 tme</kbd><!--
--></samp></pre>
<p class="continuing">
wherein
</p>
<pre class="continuing"><!--
"-->--- libtme/log-prf.c	2009-08-30 18:56:42.000000000 +0200<!--"-->
<!--"-->+++ libtme/log-prf.c	2023-06-21 18:23:33.286882822 +0200<!--"-->
@@ -205,7 +205,7 @@
<!--"-->       case 's':<!--"-->
<!--"--> 	prf_value_s = va_arg(prf_args, const char *);<!--"-->
<!--"--> 	PRF_OUT_ARG_CODE(TME_LOG_ARG_CODE_STRING);<!--"-->
<!--"-->-	PRF_OUT_MEM(prf_value_s, strlen(prf_value_s));<!--"-->
<!--"-->+	PRF_OUT_MEM(prf_value_s, prf_value_s ? strlen(prf_value_s) : (size_t)0);<!--"-->
<!--"--> <!--"-->
<!--"--> 	/* enter state zero: */<!--"-->
<!--"--> 	prf_agg = prf_format;<!--"
--></pre>
<p class="continuing">
fixes a <samp>printf("%s")</samp> implementation (why doess <code>tme</code> ship its own printf body?) to not segfault when passed a null pointer,
and
</p>
<pre class="continuing"><!--
"-->--- libtme/host/x86/misc-x86.c	2009-11-08 18:21:18.000000000 +0100<!--"-->
<!--"-->+++ libtme/host/x86/misc-x86.c	2023-06-21 21:39:26.322610998 +0200<!--"-->
@@ -49,10 +49,14 @@
   unsigned long reg_d;
   union tme_value64 value;
<!--"--> <!--"-->
+#if 0
   asm("	rdtsc	\n"
       : "=a" (reg_a), "=d" (reg_d));
   value.tme_value64_uint32_lo = reg_a;
   value.tme_value64_uint32_hi = reg_d;
+#else
<!--"-->+  value.tme_value64_uint = __builtin_ia32_rdtsc();<!--"-->
+#endif
   return (value);
 }
<!----> #define TME_HAVE_MISC_CYCLES<!--
--></pre>
<p class="continuation">
fixes the instruction counter being truncated to 32 bits ⇒ no forward progress when measuring ⇒ tickrate estimation estimating zero ticks per second ⇒
faulting <code>cpu0</code> with an error on creation.
</p>

<p class="indented continued">
With this, I could boot a Sun-4c machine as in <a href="//people.csail.mit.edu/fredette/tme/sun4-75-nbsd.html">the upstream instruxions</a>
(the <code>idle-type</code> bit in the config may be adjusted for SunOS and the emulator does actually sleep;
 the graphical console still updates at the same rate, and the serial variant doesn'<!--'-->t seem to work at all after the initial POST)
with <a href="//vetusware.com/download/Solaris%201.1.2%201.1.2/?id=8931"><code>solaris1.1.2.7z</code></a> from my good friend Juliano
and install by following the script (you want <kbd>suninstall</kbd> after rebooting to the miniroot).
</p>
<p class="indented continuing">
I got to the <a href="//lfs.nabijaczleweli.xyz/0016-cohost-export/https:///nabijaczleweli/post/1728522-the-9-genders-briti">funniest time-zone selection menu in history</a>:
</p>
<a href="/content/assets/blogn_t/010.8-sunos4-timezone.png"><img alt="SYSTEM CONFIGURATION EUROPE  GB-Eire  Great Britain and Eire; WET  Western Europe time; Iceland  Iceland; MET  Middle European time also called Central European time; Poland  Poland; EET  Eastern European time; Turkey  Turkey; Israel  Israel; W-SU  Western Soviet Union" class="main-screenshot continuing" src="/content/assets/blogn_t/010.8-sunos4-timezone.png" /></a>
<p class="continuing">
in the third-stage setup (and the hardware clock does work! <code>Poland</code>, at least, appears to be accurate still.
Haven'<!--'-->t checked whether "euro-bit-of-the-СССР" matches any part of the РФ).
The UID entry box is broken, and doesn'<!--'-->t accept the entered line: do not answer yes to making a new user in sys-setup.
</p>
<p class="indented continuing">
I have found that the system is — regardless of disklabel — very liable to just hang when when quota-checking or fscking on boot,
unpacking a bigger preset,
or simply <kbd>cd /usr/etc/install; ls -l</kbd>ling to recover from the above.
In many ways I haven'<!--'-->t actually gotten the system to boot cleanly (indeed, at all) after the final post-installation reboot,
so the time-zone selection menu is all you really get.
Or just <kbd>^C</kbd>ing it and hoping it doesn'<!--'-->t break before you manage to test what you need,
but at that point you might as well just chroot after installing from the miniroot.
</p>


BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()