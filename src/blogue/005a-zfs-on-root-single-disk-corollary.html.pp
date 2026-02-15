<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
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


   <!-- RSS_PUB_DATE: "Thu, 05 Nov 2020 22:06:30 +0100" -->
#define POST_DATE      Thu, 05 Nov 2020 22:06:30 +0100
#define POST_POST_DATE


#define STYLESHEETS BLOGN_T_STYLESHEETS                                                      FORCED_NEWLINE \
                    <link href="/content/assets/prism-twilight.min.css" rel="stylesheet">

BOILERPLATE(005a. A single-disk but slightly more cursed ZFS-on-root corollary — blogue, 005a. A single-disk but slightly more cursed ZFS-on-root corollary, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

.main-screenshot {
	margin-top: 0.2em;
	margin-bottom: 0.15em;
}
</style>


BLOGN_T_HEADING(005a. A single-disk but slightly more cursed ZFS-on-root corollary)

<p class="indented continued">
Fujitsu's employed me, which means I'm empowered to make <a href="//lfs.nabijaczleweli.xyz/0017-twitter-export#1321625051771375616">bad financial decisions</a>
at a larger scale than previous — in this case, a <a href="//droix.net/products/one-netbook-mix-3-pro-ultrabook">OneMix 3 Pro</a>,
which has only one disk in it, but I'<!--'-->d still prefer to zoot it in less than twenty hours over USB or whatever.
</p>
<p class="indented continuing">
Thankfully, I'<!--'-->ve finally figured out how
<samp><a href="//manpages.debian.org/bullseye/zfsutils-linux/zpool.8.en.html">zpool(8)</a> import -e</samp>/<samp>autoexpand=on</samp> works.
This is not for lack of trying – indeed, this is not my first or third attempt, but, well,
the manpage <a href="//github.com/openzfs/zfs/blob/a4246bce5024df202e7c41a682c3f74555777197/man/man8/zpoolprops.8#L54">said</a>
</p>
<!-- embedding instead of formatting a hlpp here because language-markdown leaves the `**`s -->
<div class="bigcode continuing"><pre class="language-markdown"><code class="language-markdown">expandsize:
  Amount of uninitialized space within the pool or device
  that can be used to increase the total capacity of the pool.
  Uninitialized space consists of any space on an EFI labeled vdev
  which has not been brought online (e.g, using <strong>zpool online -e</strong>).
  This space occurs when a LUN is dynamically expanded.</code></pre>
</div>
<p class="continuation">
Which, frankly, makes no fucking sense, especially, since that invocation didn'<!--'-->t claim unpartitioned space inside the GPT.
</p>

<p class="indented continued">
However, what it did do was handle expanding entire drives (i.e. ones with space <em>beyond</em> the GPT), as well as manually grown partitions.
And so, I'<!--'-->ve <a href="//github.com/openzfs/zfs/pull/11158">updated</a> the manpage, which should land in 2.0.0-rc6 to some semblance of sense:
</p>
<div class="bigcode continuing"><pre class="language-markdown"><code class="language-markdown">expandsize:
  Amount of uninitialized space within the pool or device
  that can be used to increase the total capacity of the pool.
  On whole-disk vdevs, this is the space beyond the end of the GPT –
  typically occurring when a LUN is dynamically expanded
  or a disk replaced with a larger one.
  On partition vdevs, this is the space appended to the partition
  after it was added to the pool – most likely by resizing it in-place.
  The space can be claimed for the pool by bringing it online
  with <strong>autoexpand=on</strong> or using <strong>zpool online -e</strong>.</code></pre>
</div>
<p class="continuation">
That doesn't mean I'm quite sure what a LUN is, but it gets the point across much better.
</p>


<p class="indented continued">
This doesn'<!--'-->t change much during
</p>
HEADING_S(2, installation, class="continuing", Installation)
<p class="indented continuing">
Except that the initial destination filesystem must go at the <em>end</em> of the free space, leaving a hole big enough to fit the initial pool at the beginning.
</p>
<center><a href="/content/assets/blogn_t/005a.01-i-t-partitioning.png">
	<img class="main-screenshot continuing" alt="initramfs-tools partitioning screen showing an 8GB disk with a 250MB EFI System Partiition marked 'zoot-EFI', then 6GB of empty space, then 2GB ext4 filesystem for the root FS, marked 'zoot-root'"
	     src="/content/assets/blogn_t/005a.01-i-t-partitioning.png" /></a></center>


<p class="indented continued">
What does change significantly, though, is the
</p>
HEADING_S(2, layout, class="continuing", Physical layout)
<p class="indented continuing">
Since currently there'<!--'-->s no partition for the pool to occupy:
</p>
<div class="bigcode">
#include "blogue/005a.01-fresh-fdisk.shell-session.html"
</div>

<p class="continued">
I'<!--'-->m using <code><a href="//manpages.debian.org/bullseye/fdisk/fdisk.8.en.html">fdisk(8)</a></code>
(mainly because I'<!--'-->m too small-brain for <code><a href="//manpages.debian.org/bullseye/parted/parted.8.en.html">parted(8)</a></code>),
other home nations are available.
</p>
<div class="bigcode">
#include "blogue/005a.02-making-zpool-part.shell-session.html"
</div>
<p class="continuing">
Of note:
</p>
<ol class="continuation">
	<li>if reordering, a reboot is required afterward, as indicated by the kernel using old partition tables, because</li>
	<li>using <code>PARTLABEL=</code> or "Partition name" is the hardest to fuck up way to spec a partition vdev.</li>
</ol>

<p class="continued">
The table is as follows for now:
</p>
<div class="bigcode">
#include "blogue/005a.03-bardo-fdisk.shell-session.html"
</div>

<p class="continued">
This means, that the creation command turns into
</p>
<pre class="continuation indented roboto-unscale">zpool create -O mountpoint=/ -O canmount=off -R /mnt zoot zoot-zoot</pre>


<p class="indented continued">
Besides this, everything continues as previous until rebooted with ZFS as rootfs, when it'<!--'-->s time for
</p>
HEADING_S(2, cleanup, class="continuing", Clean-up)
<p class="indented continuing">
Which consists of removing the partition with the previous rootfs and expanding the one with the vdev, being sure to not wipe it:
</p>
<div class="bigcode">
#include "blogue/005a.04-expanding-zpool-part.shell-session.html"
</div>

<p class="indented continued">
Which yields a vdev partition the size of the rest of the disk, but ZFS will not recognise it until after a reboot:
</p>
<div class="bigcode">
#include "blogue/005a.05-final-fdisk.shell-session.html"
</div>

<p class="indented continued">
But after one, the rest of the partition is recognised and can be claimed:
</p>
<div class="bigcode">
#include "blogue/005a.06-zvol-expansion.shell-session.html"
</div>


BLOGN_T_FOOTER()
WORD_COUNTER_END()
BOILERPLATE_END()
