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
#include "blogn_t.h"


                                                     <!-- RSS_PUB_DATE: "Thu, 9 Apr 2020 01:44:47 +0200" -->
#define POST_DATE                                                        Thu, 9 Apr 2020 01:44:47 +0200
#define POST_POST_DATE , last updated <span style="white-space: nowrap">Tue, 28 Apr 2020 02:54:07 +0200</span>
                                                 <!-- RSS_UPDATE_DATE: "Tue, 28 Apr 2020 02:54:07 +0200" -->

#define CMT Also used in heading.h, make sure to update both with fixes
#undef CMT
#define HEADING_LINK(id)                  <a class="hash-link" href=STR(HASH##id)>HASH</a>
#define HEADING_S(level, hid, style, ...) <h##level id=STR(hid) style>HEADING_LINK(hid) __VA_ARGS__</h##level>
#define HEADING(level, id, ...)           HEADING_S(level, id, , __VA_ARGS__)


#ifdef linux
#undef linux
#endif

#define STYLESHEETS BLOGN_T_STYLESHEETS                                                      FORCED_NEWLINE \
                    <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" />  FORCED_NEWLINE \
                    <link href="/content/assets/bigtable.css"           rel="stylesheet" />

BOILERPLATE(001. Installing Debianꞌs x32 port in 2020 — blognꞌt, 001. Installing Debianꞌs x32 port in 2020, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(<code>001. Installing Debian'<!--'-->s x32 port in 2020</code>)

<p class="indented continued">
Some time ago I bought an <a href="//support.hp.com/us-en/product/hp-rp5700-desktop-pc/4257406/model/4257455">HP rp5700</a> <del>Piece of Shit</del> Point of Sale system
  with a 2.13GHz Core 2 Duo E6400, fascinating OEM assembly, and FreeDOS, fourth-hand –
	follow <a href="//twitter.com/nabijaczleweli/status/1204465652628672512">this Twitter thread</a> to experience this machine as its story'<!--'-->d unravelled.
</p>
<p class="indented continuation">
Some time later, I decided to make a router out of it, and, having heard of <code>x32</code> – 32-bit ABI/userland, with a long-mode kernel/CPU –
	some time prior, that had become the architecture of choice.
<code>x32</code>'s proponents tout increased performance compared to <code>amd64</code>, but I couldn't care less;
	if you're looking for performance comparisons, this ain't it, I did this entirely because it was weird and rife with funny corner cases.
</p>

<p class="indented continued">
The Debian wiki <a href="//wiki.debian.org/X32Port">X32Port</a> page dates back to around when <code>x32</code> was introduced in 2012 with such beautiful excerpts as:
</p>
<blockquote class="continuing">
The second [system] is the QEMU/Chroot guest, and it <em>must</em> run Debian 8/Jessie Unstable.
</blockquote>
<p class="continuing">
Which, while amusing, isn'<!--'-->t very conducive to getting an <code>x32</code> system up, nor are the outdated-at-best instructions.
So this is the combination of the things I'<!--'-->ve read and tried in order to install Debian "bullseye/sid" <code>x32</code> <a href="//twitter.com/nabijaczleweli/status/1245500423370309632">on <samp style="white-space: nowrap;">Wed Apr &nbsp;1 22:02:50 UTC 2020<samp></a> (it was already <samp>0:02:50</samp> the next day in my timezone but I forgot to set it; oh well):
</p>
<center><a href="//twitter.com/nabijaczleweli/status/1245500423370309632">
	<!-- DSCN0443.JPG -->
	<!-- This used to be "//pbs.twimg.com/media/EUjn9pPWsAAsTVT.jpg:large", but that link only worked if you were logged into twitter, somehow -->
	<img class="main-screenshot continuing" alt="Login screen showing the aforementioned date and dpkg --print-architecture returning x32"
	     src="/content/assets/blogn_t/001.01-success.jpg" /></a></center>
<p class="continuation"></p>

<p class="indented continued">
<code>debian-installer</code> existing for x32 would have solved most (all) of the problems with this install,
	but <a href="//bugs.debian.org/778195"><code>#778195</code></a> is open since Feb 2015, and dead as of that very November.
The <a href="//bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=778195;filename=0001-Add-x32-support.patch;msg=15">patch</a>
	from message #15 applied (relatively) cleanly on top of <code>1ab40c5</code> from <a href="//salsa.debian.org/installer-team/debian-installer">Salsa</a>,
	barring one trivial conflict in <code>debian/control</code>, but I couldn'<!--'-->t figure out how to build it for <code>x32</code> on my <code>amd64</code> machine
	(or in general, frankly).
</p>
<p class="continuing">
Just for the fucks, I also tried to add and build a kernel config for <code>x32</code>, which ended exactly like all my kernel-building endeavours of the past
	(plus, tracking and building Debian updates ad infinitum sounds like a horrible time).
</p>
<p class="continuing">
I also tried to <a href="//wiki.debian.org/CrossGrading">cross-grade</a> an installed <code>amd64</code> system,
	but doing it through buster-to-sid just™ refused to work,
	and sid-to-sid broke on <code>+b2</code> "Rebuild with ruby2.5 support dropped" <a href="//wiki.debian.org/binNMU">binNMUs</a>
	existing for <code>i386</code> and <code>amd64</code> but not for <code>x32</code>
	(being a few versions behind on some packages didn'<!--'-->t help, either),
	although, in the few days it's taken me to write this, it'd started to look like the rest of the architectures are catching up.
</p>
<p class="continuation">
And so, it came time to install Debian without <code>d-i</code>, like some sort of Arch user.
</p>

HEADING(2, requirements, What you'<!--'-->ll need)
<p class="indented continued">
<a href="//manpages.debian.org/stretch/debootstrap/debootstrap.8.en.html"><code>debootstrap</code></a> and root privileges.
</p>
<p class="continuation">
Also a kernel that can run <code>x32</code> binaries; Debian <code>amd64</code> kernels <em>can</em>,
	but have it <a href="//salsa.debian.org/kernel-team/linux/-/blob/6ae9ea8461605132b4628b5fbedd558ac1df10f7/debian/patches/features/x86/x86-make-x32-syscall-support-conditional.patch">disabled by default</a>, and need a <code>syscall.x32=y</code> parameter to do so
	(I looked, out of curiosity:
		Arch <a href="//git.archlinux.org/svntogit/packages.git/tree/trunk/config?h=packages/linux&id=a794e88873fed3637d98563f73629651b1faf1b1#n672">
		doesn'<!--'-->t support <code>x32</code> at all</a>, Gentoo
		<a href="//gitweb.gentoo.org/repo/gentoo.git/tree/sys-kernel/vanilla-kernel/vanilla-kernel-5.5.14.ebuild?id=d193a0f3de9e106971405c3acb27d5ca90f8bc21#n55">does</a>,
		Fedora and RHEL <a href="//src.fedoraproject.org/rpms/kernel/blob/2703d9b16cc4a0cf8b5c25c8af390663092f455b/f/kernel-x86_64-fedora.config#_6885">don'<!--'-->t</a>;
		FreeBSD'<!--'-->s <a href="//www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/linuxemu.html">"Linux® Binary Compatibility"</a>
		             does <a href="//twitter.com/nabijaczleweli/status/1246919228877426688">not</a> (as of 12.1)).
</p>

<p class="indented">
I used <code>d-i</code>'<!--'-->s rescue mode (<code>rescue/enable=true</code> parameter) and added <code>syscall.x32=y</code> in the bootloader manually,
	this allowed me to use <code>d-i</code> for some of the annoying config parts (hostname, network), and PXE-booting it was the most convenient for me.
</p>

HEADING(2, target_requirements, What you'<!--'-->ll want)
<p class="indented continued">
In (reverse-)chronological order: a disklabel, a bootloader, an initramfs (generator),
	a kernel (at time of writing this means Linux, since
	          FreeBSD is <a href="//www.freebsd.org/cgi/man.cgi?query=arch&manpath=FreeBSD+12-current"><code>i386</code>/<code>amd64</code>-only</a> on x86,
	          Hurd is <a href="//git.savannah.gnu.org/cgit/hurd/hurd.git/tree/README?id=f9cb35bcb40fd9a2a553469242189871fd558f87"><code>i386</code>-only</a>),
	an init, a user, configs –
	<code>/etc/fstab</code>, <code>/etc/hosts</code>, timezone.
</p>
<p class="continuing">
My target disklabel is a standard GPT-on-BIOS setup with a separate <code>/boot</code>
(this helps by allowing the use of partlabels throughout, since <kbd>SZAROTKA-BOOT</kbd> is longer than the <code>vfat</code> maximum of 11):
<div class="bigcode">
#include "blogn_t/001-disklabel.shell-session.html"
</div>
</p>


HEADING(2, building, Assembling the system)

<p class="indented continued">
Pressing <kbd>Tab</kbd> in ISOLINUX et al. pops up the command-line, which looks vaguely like this:
</p>
<center><img class="main-screenshot continuing" alt="ISOLINUX boot menu, showing Expert Install, Rescue Mode, and Automated Install; below it a editing prompt to edit the kernel command-line, the last element being syscall.x32=y"
	           src="/content/assets/blogn_t/001.02-ISOLINUX.png" /></center>
<p class="continuing">
Going through the rescue up to this menu ensures all the small annoying things are configured:
</p>
<center><img class="main-screenshot continuing" alt="Two QEMU windows, both showing a debian-installer 'Enter rescue mode' screen; the one at the top says that 'The installer could not find any partitions' with a <Go Back> and <Continue> buttons; the one at the bottom says to 'Enter a device you wish to use as your root file system' with a list of drives between /dev/sda1 and /dev/sda3, an 'Assemble RAID array' and 'Do not use a root file system' options as well as a <Go Back> button"
	           src="/content/assets/blogn_t/001.03-enter-rescue-mode.png" /></center>
<p class="continuation">
You can press <kbd>Alt</kbd>+<kbd>F2</kbd>/<kbd>F3</kbd> to switch to a virtual terminal with a usable background and <code>$TERM</code>.
</p>

<table class="bigtable">
	<tr><td>Prepare the target VFS with all the partitions mounted first.</td>
	    <td><samp>~ # <kbd>mkdir target</kbd></samp><br />
	        <samp>~ # <kbd>mount /dev/disk/by-partlabel/szarotka-root target</kbd></samp><br />
	        <samp>~ # <kbd>mkdir target/boot</kbd></samp><br />
	        <samp>~ # <kbd>mount /dev/disk/by-partlabel/szarotka-boot target/boot</kbd></samp></td></tr>
	<tr><td>Start off with a simple chroot.<br />
	        Note the ill-advised <samp>--no-check-gpg</samp>,
	        but finding/downloading/extracting that <code>.deb</code> in a bare *X environment is too annoying to warrant itself.<br />
	        Note also the <samp>sid</samp> suite — no <samp>stable</samp> for as long as <code>x32</code> is a port.</td>
	    <td><samp>~ #
	      <kbd>debootstrap --arch=x32 --variant=minbase --include=debian-ports-archive-keyring --no-check-gpg sid target https://deb.debian.org/debian-ports</kbd>
	    </samp></td></tr>
	<tr><td>Now you can (try to) chroot into the new system; if you see <samp style="white-space: nowrap;">chroot: can'<!--'-->t execute '/bin/sh': exec format error</samp>,
	        your kernel doesn'<!--'-->t support <code>x32</code> executables.
	        On Debian kernels, verify that you have <samp>syscall.x32=y</samp> in <code>/proc/cmdline</code>.<br />
	        The bind-mounts of <samp>/dev</samp>, <samp>/sys</samp>, and <samp>/proc</samp> are there for the GRUB install and <samp>dracut</samp>'<!--'-->s host-only mode;
	        of <samp>/tmp</samp> and <samp>/run</samp> – to avoid leaving some mounted-over garbage in the target system.</td>
	    <td><samp>~ # <kbd>mount --bind /dev target/dev</kbd></samp><br />
	        <samp>~ # <kbd>mount --bind /sys target/sys</kbd></samp><br />
	        <samp>~ # <kbd>mount --bind /proc target/proc</kbd></samp><br />
	        <samp>~ # <kbd>mount --bind /run target/run</kbd></samp><br />
	        <samp>~ # <kbd>mount -t tmpfs tmpfs target/tmp</kbd></samp><br />
	        <samp>~ # <kbd>chroot target /bin/bash</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd># Huzzah!</kbd></samp></td></tr>
	<tr><td>Sprinkle in your favourite init and initramfs generator.</td>
	    <td><samp>root@szarotka:/# <kbd>apt install systemd-sysv</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>apt install dracut --no-install-recommends</kbd></samp></td></tr>
	<tr><td>The time has come to add a kernel, which is the only <em>required</em> <code>amd64</code> part of the system
	        (if you need something from the <code style="white-space: nowrap;">non-free</code> or <code>contrib</code> components (e.g. microcode tools),
	         you'<!--'-->ll still need the <code>amd64</code> packages, or to <samp>apt source</samp> and rebuild them for <code>x32</code>).<br />
	        Note the <a href="//manpages.debian.org/buster/apt/sources.list.5.en.html#THE_DEB_AND_DEB-SRC_TYPES:_OPTIONS"><code>[arch]</code></a> options –
	        those are to avoid errors from <code>apt</code> as it tries to find <code>x32</code> in the non-ports repositories, and vice versa.<br />
	        Note also lack of <code>deb-src</code> spec for the ports repository,
	        as it <a href="//deb.debian.org/debian-ports/dists/sid/Release">doesn'<!--'-->t</a> have sources at all
	        (<a href="//deb.debian.org/debian/dists/sid/Release">compare</a>).</td>
	    <td><samp>root@szarotka:/# <kbd>sed -i 's/deb/deb [arch=x32]/' /etc/apt/sources.list</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>cat >> /etc/apt/sources.list</kbd></samp><br />
	        <samp><kbd>deb     [arch=amd64] https://deb.debian.org/debian sid main contrib non-free</kbd></samp><br />
	        <samp><kbd>deb-src              https://deb.debian.org/debian sid main contrib non-free</kbd></samp><br />
	        <samp><kbd>^D</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>dpkg --add-architecture amd64</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>apt update</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>apt install linux-image-amd64 --no-install-recommends</kbd></samp></td></tr>
	<tr><td>And a bootloader (at time of writing <samp>grub2</samp> recommends <samp style="white-space: nowrap;">os-prober</samp> –
	        if you don'<!--'-->t plan on running other OSs this can be <kbd>--no-install-recommends</kbd>ed).<br />
	        Remember: at the prompt, if unsure about the choice offered by GRUB,
	        you can switch VTs again (<kbd>Alt</kbd>+<kbd>F2</kbd>/<kbd>F3</kbd>) and use <samp>blkid</samp> or <samp>lsblk</samp>.<br />
	        The <samp>sed</samp> adds the syscall toggle inside <code>GRUB_CMDLINE_LINUX</code>, rather than <code>_DEFAULT</code>,
	        since it'<!--'-->s required to boot the system at all
	        (not using a text editor because, despite <samp>ed</samp> being the standard text editor,
	         using <samp>sed</samp>/<samp>awk</samp>/<samp>cat</samp> is less annoying and easier to spec like this
	         (also, the normal <samp>vi</samp> derivatives were broken due to the aforementioned <samp>ruby2.5</samp>-related problem
	          (I ended up using <samp>nvi</samp>))).</td>
	    <td><samp>root@szarotka:/# <kbd>apt install grub2</kbd></samp><br />
	        <samp>Configuring grub-pc</samp><br />
	        <samp>-------------------</samp><br />
	        <br />
	        <samp>  1. /dev/sda (??? MB; ???)  2. - /dev/sda2 (??? MB; /)  3. - /dev/sda3 (??? MB; /boot)</samp><br />
	        <br />
	        <samp>GRUB install devices: <kbd><strong>/dev/sda</strong></kbd></samp><br />
	        <br />
	        <samp>Installing for i386-pc platform.</samp><br />
	        <samp>root@szarotka:/# <kbd>sed -ri 's/(CMDLINE_LINUX=)""/\1"syscall.x32=y"/' /etc/default/grub</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>update-grub</kbd></samp></tr>
	<tr><td>Various bits and bobs; <samp>/etc/resolv.conf</samp> was already set up during <samp>debootstrap</samp>.<br />
	        If using <code>vfat</code> for your <code>/boot</code>, check if your kernel sets <code>FAT_DEFAULT_UTF8=y</code>,
	        or specify <code>utf8=y</code> instead of <code>defaults</code>.<br />
	        This <code>/etc/hosts</code> is really bare-bones and the <samp>d-i</samp> one is too long to reproduce here in full;
	        I'<!--'-->d recommend copying and modifying one from another host on your network.<br />
	        Previously this paragraph contained some ill-advised init-specific bollocks about setting timezones, reproduced below,
	        instead of the <samp>dpkg-reconfigure</samp>; mistakes of my youth slash two weeks ago I guess.<br />
	        <del>If you're not using systemd, here is where you'd link <samp>/etc/localtime</samp> to somewhere in <samp>/usr/share/zoneinfo</samp>
	        (see <samp><a href="//manpages.debian.org/buster/systemd/localtime.5.en.html">localtime(5)</a></samp>), otherwise run
	        <samp style="white-space: nowrap;"><a href="//manpages.debian.org/buster/systemd/timedatectl.1.en.html">timedatectl(1)</a> set-timezone CET</samp>
	        after rebooting.</del></td>
	    <td><samp>root@szarotka:/# <kbd>cat > /etc/fstab</kbd></samp><br />
	        <samp>PARTLABEL=szarotka-root  /      ext4  noatime   0  1</samp><br />
	        <samp>PARTLABEL=szarotka-boot  /boot  vfat  defaults  0  2</samp><br />
	        <samp><kbd>^D</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>cat > /etc/hosts</kbd></samp><br />
	        <samp>127.0.0.1  localhost</samp><br />
	        <samp>127.0.1.1  szarotka szarotka.local.nabijaczleweli.xyz</samp><br />
	        <samp><kbd>^D</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>dpkg-reconfigure tzdata</kbd></samp><br />
	        <samp>Configuring tzdata</samp><br />
	        <samp>------------------</samp><br />
	        <br />
	        <samp>  1. Africa  […]  7. Atlantic  8. Europe  9. Indian  10. Pacific  11. SystemV  […]</samp><br >
	        <samp>Geographic area: <kbd><strong>8</strong></kbd></samp><br />
	        <br />
	        <samp>  4. Athens  […]  32. Minsk  39. Prague  46. Simferopol  53. Ulyanovsk  60. Warsaw</samp><br >
	        <samp>Time zone: <kbd><strong>60</strong></kbd></samp><br />
	        <br />
	        <samp>Current default time zone: 'Europe/Warsaw'</samp><br />
	        <samp>Local time is now:      Tue Apr 28 02:25:44 CEST 2020.</samp><br />
	        <samp>Universal Time is now:  Tue Apr 28 00:25:44 UTC 2020.</samp><br />
	        <samp>root@szarotka:/# <kbd>apt install sudo</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>adduser --ingroup users nabijaczleweli</kbd></samp><br />
	        <samp>root@szarotka:/# <kbd>adduser nabijaczleweli sudo</kbd></samp><br />
	        </td></tr>
</table>

<p class="indented continued">
This should ensure the system boots and is usable enough after doing so — press <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd> and find out!
</p>
<center><img class="main-screenshot continuing" alt="Linux console in QEMU window, showing a login, uname output of 'Linux szarotka 5.5.0-1-amd64', dpkg --print-architecture yielding 'x32', dpkg listing of amd64 packages yielding just two kernel packages, and the output of file on a system executable starting with 'ELF 32-bit LSB shared object, x86-64'"
	           src="/content/assets/blogn_t/001.04-live-terminal.png" /></center>
<p class="continuation">
If that didn't get your system to boot, please do <a href="mailto:nabijaczleweli@nabijaczleweli.xyz">shoot me an e-mail</a>, but if it did, then that's all from me for today,
except, maybe, one last thing?
</p>

<p class="indented continued">
Ever wondered what'd happen if you had inits but the kernel couldn't execute them? <a href="//twitter.com/nabijaczleweli/status/1246438561735413760">So did I</a>:
</p>
<center><img class="main-screenshot continuing" alt="Linux console during init in QEMU windows, first complaining about 'modprobe bindfmt-464c' not being processable, then 'Starting init: /sbin/init exists but couldn't execute it (error: -8)', then 'Run /etc/init as init process', then /bin/init, then /bin/sh, yielding the same error as /sbin/init, finishing with a kernel panic 'not syncing: No working init found.  Try passing init= option to kernel.'"
	           src="/content/assets/blogn_t/001.05-kernel-death.png" /></center>
<p class="continuation">
Alright, bye!
</p>

BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()