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


   <!-- RSS_PUB_DATE: "Mon, 15 Dec 2025 00:02:14 +0100" -->
#define POST_DATE      Mon, 15 Dec 2025 00:02:14 +0100
#define POST_POST_DATE

#define vfat <tt>vfat</tt>
#define DEL <del>[…]</del>


#define STYLESHEETS BLOGN_T_STYLESHEETS                                                    FORCED_NEWLINE \
                    <link href="/content/assets/prism-twilight.min.css" rel="stylesheet">
BOILERPLATE(021. Natively mirrored but still functional & correct /boot/efi — blogue, 021. Natively mirrored but still functional & correct /boot/efi, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

tt {
	font-family: "Droid Sans Mono", monospace;
}

pre[class*="language-"] {
	margin-top: 0;
	margin-bottom: 0;
	padding: 0.25em 0.5em;
}

code.language-shell-session, pre.language-shell-session,
code.language-bash, pre.language-bash {
	white-space: pre-wrap;
}
code.language-shell-session, pre.language-shell-session {
	line-height: initial;
}

del {
	opacity: 50%;
	text-decoration: none;
}

ol, ul {
	padding-left: 1em;
}

dl {
	font-family: "Droid Sans Mono", monospace;
	white-space: pre-wrap;
}

dt {
	font-style: italic;
}

dd {
	margin-left: 0;
}

dl > span {
	border: 1px solid;
	border-radius: 0.25em;
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

@media (prefers-color-scheme: light) {
	.light-invert {
		filter: invert(1);
	}
}

/* Replicated from 019-aphantasia */

blockquote div {
	padding-left: 4em;
}

blockquote div > span {
	margin-left: -4em;
	padding-left: 4em;
}

blockquote div > span > h4 {
	text-indent: -4em;
	display: inline-block;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	margin: 0;
	padding-right: 0.2rem;
}

blockquote strong {
	font-weight: 600;
	opacity: 80%;
}

time > span, blockquote div > span > h4 > :nth-child(2) > span {
	display: inline-block;
	width: 0;
	opacity: 0;
}

time {
	font-family: 'RobotoSlab-Regular+tabdig', 'Roboto Slab', serif;
	font-size: 0.75rem;
	opacity: 70%;
	transition: opacity 0.3s;
}

time > span, blockquote div > span > h4 > :nth-child(2) > span {
	display: inline-block;
	width: 0;
	opacity: 0;
}
</style>

BLOGN_T_HEADING(021. Natively mirrored but still functional & correct /boot/efi)

<!-- https://discord.com/channels/@me/576788179441680394/1446121407917592647 https://discord.com/channels/@me/576788179441680394/1446125899979296914 https://discord.com/channels/@me/576788179441680394/1446137172427145236 -->
<p class="indented continued">
Recently, a friend shared with me the following observation of a novel system (compacted for NutriScore KPIs):
</p>
#include "blogue/021.01-observation.shell-session.html"
<p class="continuing">
Yowza! but how?
Must the ESP not be a vfat with the ESP parttype?
This is obviously better than SOP of "rsync job copying between replicas of the ESP"
(or <a href="005-low-curse-zfs-on-root.html">"don't replicate the ESP at all"</a>).
Is there a special RAID1 mode that does a transparent replica? or does the firmware have drivers for this?
The following epistemic elucidates:
</p>
#include "blogue/021.02-epistemic-fdisk.shell-session.html"
<p class="continuing">
No ESP tag… does this system boot via EFI at all?
<del>And how the hell is GPT support <cite>new</cite>?</del>
</p>
#include "blogue/021.03-epistemic-efibootmgr,file-s.shell-session.html"
<p class="continuing">
Yes, and it is in fact Just a vfat.
And it is in fact the <em>very same</em> vfat so our eyes do not deceive us…
</p>

#define POST(ts, user, ...) <div><span><h4><time datetime=STR(2025-12-04 ts+02:00)><span>[</span>ts<span>]</span></time> <strong>user<span>:</span></strong></h4> <span>__VA_ARGS__</span></span></div>
<blockquote style="white-space: pre-wrap;">\
POST(14:44, Cicada, ooooh ok I got it)\
POST(14:44, Cicada, centos is using mdadm with metadata version 1.0 (at the end of the partition))\
POST(14:52, nabijaczleweli, i will be describing this technique and! making millions)\
</blockquote>


HEADING(2, technique, Immortal technique)

<p class="indented continued">
With a GPT partlabel, per
 	<cite>
	UEFI Forum, Inc.,
	Unified Extensible Firmware Interface (UEFI) Specification,
	Release 2.11,
	Nov 21, 2024,
	13. Protocols – Media Access,
	13.3. File System Format,
	<a href="//uefi.org/specs/UEFI/2.11/13_Protocols_Media_Access.html#partition-discovery">13.3.2. Partition Discovery</a>
	(<a href="//uefi.org/sites/default/files/resources/UEFI_Spec_Final_2.11.pdf#subsection.13.3.2">p. 464</a>)
	</cite>,
</p>
<blockquote class="continuing">
UEFI does not impose a restriction on the number or location of System Partitions<del>[, which]</del>
are discovered DEL by examining the partition GUID and verifying that the contents of the partition conform to the FAT file system DEL.
Further, UEFI implementations may allow the use of conforming FAT partitions which do not use the ESP GUID.
Partition creators may prevent UEFI firmware from examining and using a specific partition by setting bit 1 of the Partition Attributes DEL.
</blockquote>
<p class="continuation">
so this is all rather above board, so long as we get a partition with a FAT in it.
Which this clearly does, and any space at the end of the partition with the FAT is free game.
</p>

<p class="indented">
We additionally observe that the size of the ESP is considered negligible,
and that the contents of the ESP are a <a href="//manpages.debian.org/update-initramfs.8">simple</a> <a href="//manpages.debian.org/dracut.8">function</a> of the rootfs,
so the replicas are <em>convenience copies</em> for booting a system in soft-degraded conditions,
and have no bearing on the redundancy of the rootfs.
For the performance characteristics we can consider the ESP write-only and write-never.
</p>

<p class="continued">
Modern Linux provides two and a half layers of abstraction related to doing this
(much of (the basis for) this information is stored in the zeitgeist; this also serves to reify it):
</p>
<ul>
	<li><a href="//docs.kernel.org/admin-guide/device-mapper/">device-mapper</a>, which is the kernel API;
		  when ZFS is not available and I used the other abstraction layers for redundancy, I'd<!--'--> never had to use
		  <cite><a href="//manpages.debian.org/dmsetup.8">dmsetup(8) – low level logical volume management</a></cite>;
	    the ontology is likewise masked,</li>
	<li><a href="//gitlab.com/lvmteam/lvm2">LVM2</a>, which seems to be the only recommended public-facing RAID &c. toolchain
	    and which defines a Volume Group/Physical Device/Logical Volume ontology;
	    being co-located with device-mapper implies to me that it is indeed <em>the</em> printf(3) to device-mapper's<!--'--> write(2),</li>
	<li>an LVM1 had supposedly existed at some point (it's <a href="//sources.debian.org/src/lvm2/2.03.16-2/man/lvm.8_main#L250-L253">mentioned by name in bookworm lvm2 (2.03.16-2)'s lvm(8)</a>),
	    but has since stopped previously existing (<a href="//sources.debian.org/src/lvm2/2.03.31-2/man/lvm.8_main#L5">trixie lvm2 (2.03.31-2)'s<!--'--> lvm(8) no longer mentions it, and rebrands from <q>LVM2 tools</q> to <q>LVM tools</q></a>);
	    LVM2 was first uploaded to Debian <a href="https://sources.debian.org/src/lvm2/2.03.31-2/debian/changelog#L1458-L1462">on 2002-02-20</a>,
	    and LVM1 (<a href="//tracker.debian.org/pkg/lvm10"><tt>src:lvm10</tt></a>) was removed on 2006-10-22 after already severely bitrotting
	    <a href="//bugs.debian.org/394212#58">because</a>
	    <blockquote class="continuing" style="margin-left: 1em;">
	    	lvm10 doesn't<!--'--> work with 2.6 kernels and is unsupported upstream.<br />
	    	DEL<br />
				lvm2 works with 2.4 kernels, and is compatible with lvm10 metadata formats.
				and (importantly) is well supported upstream
	    </blockquote>
	    but already in 2001 <a href="//bugs.debian.org/121529">people variably called it <tt>lvm</tt> and <tt>lvm10</tt> to a contemporaneously confusing extent</a>, and</li>
	<li>"MD", which the kernel documentation calls <a href="//docs.kernel.org/driver-api/md/md-cluster.html">"MD"</a> or <a href="//docs.kernel.org/admin-guide/device-mapper/dm-raid.html">"MD RAID"</a> everywhere except <a href="//docs.kernel.org/admin-guide/md.html">its dedicated page</a> where it calls it "RAID Arrays".
	    because of how ass the name is I've<!--'--> seen many users metonymise this to <a href="//manpages.debian.org/mdadm.8">mdadm(8)</a>,
	    which already hedges when it self-describes as <q>manage MD devices <i>aka</i> Linux Software RAID</q>.
	    I'm<!--'--> not sure what the M or the D are actually supposed to be. this is something you advertise usually. but not here!
	    the first time <tt>Documentation/md.txt</tt> appeared was in <a href="//github.com/schwabe/davej-history/blob/2.1.85/Documentation/md.txt">Linux 2.1.85</a> (<a href="//www.kernel.org/pub/linux/kernel/v2.1/#:~:text=2.1.85">1998-02-04</a>)
	    (to expound on "lilo and loadlin options"(!) for booting off MD):
	    <blockquote class="continuing" style="margin-left: 1em;">
	    	<p class="continuation">Tools that manage md devices can be found at sweet-smoke.ufr-info-p7.ibp.fr
				in public/Linux/md035.tar.gz.</p>

				<p style="text-indent: 4em;">       Marc ZYNGIER &lt;zyngier@ufr-info-p7.ibp.fr></p>

				<hr style="color: initial;">

				<p class="continued">You can boot (if you selected boot support in the configuration) with your md
				device with the following kernel command line:</p>
	    </blockquote>
	    and looking at <a href="//github.com/schwabe/davej-history/blob/2.1.85/include/linux/md.h"><tt>include/linux/md.h</tt> from the time</a> shows
	    <blockquote class="continuing" style="margin-left: 1em;">
	      md.h : Multiple Devices driver for Linux
	    </blockquote>
	    Multiple fucking Devices. no wonder! also <a href="//docs.kernel.org/admin-guide/devices.html#:~:text=/dev/md0">it's<!--'--> metadisk sometimes</a>;<br />
	    This is a kernel API that provides more device-mapper-style functionality.
	    You used to use mdadm(8) directly but this is passé and cringe now and you're<!--'--> supposed to be using LVM<del>2</del>,
	    which still uses this same driver but differently (via <a href="//docs.kernel.org/admin-guide/device-mapper/dm-raid.html">dm-raid</a>(?)) and that's<!--'--> okay.
	    I think it's<!--'--> because the original MD design was ass to autodetect and LVM2 solves this?</li>
</ul>

<p class="continued">
Out of a few greps through kernel <tt>Documentation/</tt>, only searching through <tt>admin-guide/device-mapper/</tt> for "mirror" yielded two useful results:
</p>
<ul>
	<li><a href="//docs.kernel.org/admin-guide/device-mapper/dm-raid.html"><tt>dm-raid</tt></a> in <tt>raid1</tt> (<q>RAID1 mirroring</q>) mode and</li>
	<li><tt>dm-mirror</tt> which is only <a href="//docs.kernel.org/admin-guide/device-mapper/dm-clone.html#:~:text=dm-mirror">mentioned</a> <a href="//docs.kernel.org/admin-guide/device-mapper/dm-init.html#:~:text=mirror">indirectly</a> and doesn't<!--'--> have its own file.</li>
</ul>
<p class="continuation">
The sampled system above uses un-device-mapper-wrapped MD <tt>raid1</tt> (thus, <tt>/dev/md<var>???</var></tt> and "Linux RAID").
</p>

<p class="indented continued">
For the purposes of this exercise, we will consider disks <tt>/dev/sd<var>[abc]</var></tt> configured thusly:
</p>
#include "blogue/021.04-prep-disk-layout.shell-session.html"
<p class="continuing">
With contents of whatever was previously in <tt>/boot/efi</tt> in <tt>~/oldbootefi</tt>.
This configuration can be easily obtained in the debian-installer partitioner.
</p>

HEADING(3, dmsetup, <tt>dmsetup</tt>)

<p class="indented continued">
Making mirrors is undocumented.
<a href="//wiki.gentoo.org/wiki/Device-mapper#Mirror">Notoriously</a> undocumented, in fact.
I don't even know how the Gentoo Wiki authors reverse-engineered the format because to me <tt>drivers/md/dm-{raid1,log}.c</tt> don't look like they have a parser at all.
(Yes, the <tt>mirror</tt> provider is in <tt>dm-raid1.c</tt>.)
However, I replicate Gentoo Wiki's<!--'--> analysis of the table format.
So, after substituting our config:
</p>
<dl class="continuing" style="margin-left: 1em;">\
<!--"--><span><dt>start length         </dt><!--"-->\
<!--"      --><dd>    0 2097152 mirror </dd><!--"--></span>\
<!--"--><span><dt>in-memory write log 1 argument 1k </dt><!--"-->\
<!--"      --><dd>core                1          2  </dd><!--"--></span>\
<!--"--><span><dt>  3 devices </dt><!--"-->\
<!--"      --><dd>  3         </dd><!--"--></span>\
<!--"--><span><dt>   device offset     d o          d o </dt><!--"-->\
<!--"      --><dd>/dev/sda1 0  /dev/sdb1 0  /dev/sdc1 0 </dd><!--"--></span>\
<!--"--><span><dt>  1 feature</dt><!--"-->\
<!--"      --><dd>  1 handle_errors</dd><!--"--></span>
</dl>
#include "blogue/021.05-dmsetup-mirror.shell-session.html"
<p class="continuing">
Of note here:
</p>
<ul>
	<li>device-mapper is accounted in 512-byte blocks, even if the device's<!--'--> block size were 4k.</li>
	<li>I do <em>not</em> reproduce the Gentoo Wiki's<!--'--> minimum write log size
	    (it says the minimum is the page size
	     — <tt>$(( $(getconf PAGE_SIZE) / 512 ))</tt> —
 	     but the only restrixion is <a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/md/dm-log.c?id=98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09#n349">power of two that isn't<!--'--> 1</a>;
	     this was <a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2045e88edb4e0c9ce62d317f77dc59d27d9c530e">changed in 2009</a>
	     from "multiple of the page size")
	    we pick the minimum value since the ESP is write-never.</li>
	<li>If <tt>/dev/sda1</tt> already had an ESP, it'll<!--'--> get synced to the others
	    (<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/md/dm-raid1.c?id=98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09#n157">the first device is canonical on sync</a>).</li>
	<li>The mirror is the <em>same size</em> as the mirrored partitions. There is no metadata anywhere so this is ephemeral.
	    This is interesting and informative for future (and the most annoying way to spell <code>tee < /dev/sda1 > /dev/sdb1 /dev/sdc1</code> known to man),
	    but not persistent and thus not useful.</li>
</ul>


HEADING(3, mdadm, <tt>mdadm</tt>)

<p class="indented continued">
Per <a href="//manpages.debian.org/mdadm.8">mdadm(8)</a>:
</p>
<blockquote class="continuing">
<p class="continuation">
Currently, Linux supports DEL <b>RAID0</b> (striping), <b>RAID1</b> (mirroring), <b>RAID4</b>, DEL.
</p>

<p style="text-indent: -2em; margin-left: 2em;">
<b>-e</b>, <b>--metadata=</b><br />
	Declare the style of RAID metadata (superblock) to be used. The default is 1.2 DEL.
</p>
<p class="continuing" style="text-indent: -2em; margin-left: 4em;">
Options are:
</p>
<p class="continuation" style="text-indent: -2em; margin-left: 6em;">
0, 0.90<br />
	DEL This format limits arrays to 28 component devices DEL. It is also possible for there to be confusion about whether the superblock applies to a whole device or just the last partition, if that partition starts on a 64K boundary.
</p>
<p class="continuation" style="text-indent: -2em; margin-left: 6em;">
1, 1.0, 1.1, 1.2 default<br />
	DEL This has fewer restrictions. DEL <del>[A]</del> recovery operation can be checkpointed and restarted. The different sub-versions store the superblock at different locations on the device, either at the end (for 1.0), at the start (for 1.1) or 4K from the start (for 1.2). "1" is equivalent to "1.2" DEL.
</p>
<p class="continuing" style="text-indent: -2em; margin-left: 6em;">
DEL
</p>
</blockquote>

<p class="continuing">
so..:
</p>
#include "blogue/021.06-mdadm-raid1-v0.shell-session.html"
<p class="continuing">
The date ends up at the front of the partitions, the device is 64k shorter…
</p>
#include "blogue/021.07-mdadm-raid1-v0-superblock.shell-session.html"
<p class="continuing">
and it says <tt>bitm</tt> and we enabled the bitmap. That's<!--'--> kino.
(Though I'll admit it's unclear to me how you indent writes to an unstructured binary file;
 but I can't<!--'--> even clown on them because I <a href="//github.com/md-raid-utilities/mdadm/pull/177">apparently fixed this half a year ago</a> then forgot instantly.)
We do want the bitmap because the counterfactual means
<a href="//docs.kernel.org/admin-guide/md.html#:~:text=consistency_policy">re-replicating the whole device</a>
when importing a dirty array,
and it has no cost that I've measured (maybe it'd eat another block if the device exceeded the bitmap capacity in the superblock?).
</p>
<p class="indented continuing">
The original assessment is correct, then:
version 0 metadata does go at the end.
But, version 0 stinky version 1 good: number bigger?
Sure, but it doesn't<!--'--> really change anything I could measure;
</p>
#include "blogue/021.08-mdadm-raid1-v1.0.shell-session.html"
<p class="continuation">
except the bitmap and the superblock are backwards.
</p>

<p class="indented">
As advertised, metadata 1.1 and 1.2 put the superblock at 0 and 4k, respectively
The seemingly-promising <tt>--data-offset</tt> argument only moves where the data is allocated, not the superblock.
</p>

<p class="indented continued">
Thus,
</p>
#include "blogue/021.09-mdadm-raid1-final.shell-session.html"
<p class="continuing">
and it comes up normally.
But what does the EFI think, and does this still pick up changes to one of the ESPs?
Breaking into the shell yields:
</p>
#include "blogue/021.10-mdadm-raid1-EFI.shell-session.html"
<p class="continuation">
It doesn't<!--'--> mind, and yes it does (in spite of the bitmap thing? unclear what this implies).
Removing one of the disks also works.
</p>

<p class="indented">
The conclusion to the <tt>mdadm</tt> approach is that it works perfectly, except that it's passé and cringe because it's <tt>mdadm</tt>.
</p>


HEADING_S(3, LVM, class="continued", LVM<del>2</del>)
<p class="continuing">
<!--'-->'s metadata <em>must</em> have a label in blocks [0,4)
(this alone would be surmountable, <code>mkfs.vfat -R 4</code> gives us space for 2! in fact, FAT can ignore any number of blocks at the start of the device,
 so long as it gets the first two),
then a header around a megabyte in,
then user data,
in this order.
</p>
<details>
	<summary>You can even easily make a partition that <em>co-locates</em> a vfat and an LVM PV (there's<!--'--> no reason to do this, but you can!)</summary>
	<p class="indented continuing">
		I was trying to get a funny screenshot and mount them both but Linux refuses this
		(it might be possible if you could import LVM VGs in read-only mode,
		 but no matter how much I needled it, combining them gave me <tt>EBUSY</tt>):
	</p>
#include "blogue/021.11-vfat-collocated-LVM-PV.shell-session.html"
</details>
<a href="/content/assets/blogn_t/021.01-vfat-collocated-LVM-PV.png"><img class="light-invert" style="width: 100%" src="/content/assets/blogn_t/021.01-vfat-collocated-LVM-PV.png" alt=""></a> <!-- this is a visual representation of the code block above -->


HEADING(2, conclusion, Conclusion)

<p>
There is only one way to do this: with <tt>mdadm</tt>.
This way is kosher, but a little cringe.
But to be cringe is to be free.
</p>

#include "blogue/021.12-conclusion.sh.html"


BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
