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


   <!-- RSS_PUB_DATE: "Mon, 14 Sep 2020 00:20:20 +0200" -->
#define POST_DATE      Mon, 14 Sep 2020 00:20:20 +0200
#define POST_POST_DATE , updated Tue, 15 Sep 2020 20:08:12 +0200, Tue, 29 Sep 2020 23:06:46 +0200, and Sat, 12 Dec 2020 01:22:52 +0100
                                                                                <!-- RSS_UPDATE_DATE: "Sat, 12 Dec 2020 01:22:52 +0100" -->

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

BOILERPLATE(005. Low-curse ZFS-on-root for new Debian installations on multi-disk systems — blognꞌt, 005. Low-curse ZFS-on-root for new Debian installations on multi-disk systems, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

.main-screenshot {
	margin-top: 0.2em;
	margin-bottom: 0.15em;
}
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(<code>005. Low-curse ZFS-on-root for new Debian installations on multi-disk systems</code>)

<p class="indented continued">
In a brief departure from microcomputing saprophagia, imagine you'<!--'-->re <a href="//twitter.com/Guriwesu">an american</a> and acquiring a ThinkPad P15,
sporting two two-terabyte drives and, naturally, you'<!--'-->d like to have a single continuous volume spanning both of them to do whatever your heart desires.
</p>
<p class="indented continuing">
After the shock at willingly staying in the American empire and paying it for the privilege wears off, two approaches reveal themselves:
</p>
<ol class="continuing">
	<li>LVM, with its native <samp>debian-installer</samp> support, and</li>
	<li>ZFS, without it,
		  but with the ability to do <samp><a href="//manpages.debian.org/bullseye/zfsutils-linux/zfs.8.en.html">zfs(8)</a>-send</samp> backups,
		  live-mirroring to an external enclosure with a <samp>[mirror[internal, external], mirror[internal, external]]</samp> topology, and
	    me egging you on to do it.</li>
</ol>
<p class="continuing">
Now, I also wanted to do a ZFS-on-root for my own nefarious uses, and so it was decided:
</p>
<blockquote class="continuation">
	<!-- https://discord.com/channels/145079846832308224/150317232239542272/752226540808437770 -->
	Good, do it before I buy the p15 and report back <a href="//wiki.jvflux.fr/Noel"><img src="/content/assets/noel.gif" alt=":noel:" title=":noel:" style="margin-bottom: -5px;" /></a>
</blockquote>

<!--
HEADING_S(2, toc, class="continued", Contents)
<ol class="continuation">
	<li><a href="#setup"       >Set-up</a></li>
	<li><a href="#installation">Installation</a></li>
	<li><a href="#bootloader"  >Bootloader</a></li>
	<li><a href="#zfs"         >The ZFS bit</a></li>
	<li><a href="#layout"      >Layout</a></li>
</ol> -->

HEADING_S(2, setup, class="continued", Set-up)
<p class="indented continuing">
To minimise how cursed this is, the following restrixions are in place:
</p>
<ul class="continuing">
	<li>EFI booting, because GRUB'<!--'-->s ZFS detexion and handling blows ass, and</li>
	<li>a normal <samp>d-i</samp> installation and no external computer <em>nor</em> drives required,
	    since doing <samp>d-i</samp>'s job by hand was covered previously in <a href="001-x32-in-2020.html">Installing Debian's x32 port in 2020</a>,
	    and it'<!--'-->s a similarly good experience (plus building the modules in a chroot is a good time at any rate).</li>
</ul>
<p class="continuing">
This means that all you need is an EFI-compatible multi-disk platform and some way to EFI boot it into <samp>d-i</samp> —
the bootloader will be fixed, ZFS installed normally, and the rootfs <samp>dump</samp>ed/<samp>restore</samp>d thereonto after normally booting into the target system.
</p>
<!-- For reference:
	qemu-system-x86_64 -enable-kvm -bios /usr/share/qemu/OVMF.fd -smp 6 -m 4g -drive file=vda,format=raw,id=vda,if=none -drive file=vdb,format=raw,id=vdb,if=none -drive file=vdc,format=raw,id=vdc,if=none -device virtio-blk-pci,drive=vda -device virtio-blk-pci,drive=vdb -device virtio-blk-pci,drive=vdc
	qemu-system-x86_64 -enable-kvm -bios /usr/share/qemu/OVMF.fd -smp 6 -m 4g -drive file=vda,format=raw -drive file=vdb,format=raw -net user,hostfwd=tcp::10023-:22 -net nic,model=virtio-net-pci -->
<p class="indented continued">
The test setup is QEMU <code>-bios OVMF.fd</code> and two 8G drives, one of which is designated as primary.
Filesystem tuning is not covered, encryption is supported, SecureBoot is not covered because I haven'<!--'-->t figured it out yet,
most-all gotchas are hopefully explained,
there'<!--'-->s a <a href="//openzfs.github.io/openzfs-docs/Getting%20Started/Debian/Debian%20Buster%20Root%20on%20ZFS.html">prior art</a> that was of little help, and
<code>zfs-{initramfs,dracut}</code> are full of <a href="//github.com/openzfs/zfs/issues/10908">problems</a> that I try to work around here:
</p>
<center><a href="//twitter.com/nabijaczleweli/status/1303858705788801024">
	<img class="main-screenshot continuation" alt="Excerpt from zfs-initramfs, function load_module_initrd that starts with 'if [ $variable > 0 ]'"
	     src="/content/assets/blogn_t/005.01-zfs-initramfs-gt-0.png" style="min-width: 75%;" /></a></center>

HEADING_S(2, installation, class="continued", Installation)
<p class="indented continuing">
The restrixions to the original installation are all during the partitioning phase and as follows:
</p>
<ol class="continuing">
	<li>Stick to just the primary drive,</li>
	<li>pick an EFI partition large enough for a few kernels and initrds, and</li>
	<li>stuff everything onto the rootfs:</li>
</ol>
<center><a href="/content/assets/blogn_t/005.02-i-t-partitioning.png">
	<img class="main-screenshot continuing" alt="initramfs-tools partitioning screen showing one of two disks used with a 250MB EFI System Partiition marked 'zoot-EFI' and rest for the root FS, marked 'zoot-root'"
	     src="/content/assets/blogn_t/005.02-i-t-partitioning.png" /></a></center>

<p class="indented">
Either installing sid or enabling backports for buster is required,
since <a href="//manpages.debian.org/bullseye/zfsutils-linux/zfs-mount-generator.8.en.html"><code>zfs-mount-generator(8)</code></a> appeared in 0.8.0;
if you don't install GRUB you'll have to boot
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/admin-guide/efi-stub.rst?h=v5.8">manually</a>
from the EFI shell after copying the kernel and initrd from <code>target/boot/</code> to <code>target/boot/efi/</code>.
</p>

HEADING_S(2, bootloader, class="continued", Bootloader)
<p class="continuing indented">
Using GRUB and a unified boot-on-root is, for better or for worse, not possible;
GRUB <a href="//git.savannah.gnu.org/cgit/grub.git/tree/grub-core/fs/zfs/zfs.c?id=3f05d693d1274965ffbe4ba99080dc2c570944c6#n280">supports</a> these
non-R/O zpool features:
</p>
<div class="bigcode continuing">
  #include "blogn_t/005.01-grub-features.c.html"
</div>
<p class="continuing">
Which means that these, as of OpenZFS 0.8.4, are the ones that it doesn'<!--'-->t support:
</p>
<div class="bigcode continuing">
  #include "blogn_t/005.02-grub-nonfeatures.shell-session.html"
</div>
<p class="continuation">
Confer <a href="//manpages.debian.org/buster-backports/zfsutils-linux/zpool-features.5.en.html"><samp>zpool-features(5)</samp></a>
for details so as to why this is not acceptable
(remember: you couldn't any of these even by accident on your root pool, and most of them can't ever be turned off).
</p>

<p class="indented continued">
Using a separate <code>/boot</code> on ZFS required a lot of dicking around with the options for GRUB to recognise the filesystem at all
(confer <a href="//openzfs.github.io/openzfs-docs/Getting%20Started/Debian/Debian%20Buster%20Root%20on%20ZFS.html#step-2-disk-formatting">prior art</a>,
 Step 2: Disk Formatting, 4. Create the boot pool, with its 12 lines of options for pool features alone)
<!-- In case that goes away:
zpool create \
    -o ashift=12 -d \
    -o feature@async_destroy=enabled \
    -o feature@bookmarks=enabled \
    -o feature@embedded_data=enabled \
    -o feature@empty_bpobj=enabled \
    -o feature@enabled_txg=enabled \
    -o feature@extensible_dataset=enabled \
    -o feature@filesystem_limits=enabled \
    -o feature@hole_birth=enabled \
    -o feature@large_blocks=enabled \
    -o feature@lz4_compress=enabled \
    -o feature@spacemap_histogram=enabled \
    -o feature@zpool_checkpoint=enabled \
    -O acltype=posixacl -O canmount=off -O compression=lz4 \
    -O devices=off -O normalization=formD -O relatime=on -O xattr=sa \
    -O mountpoint=/boot -R /mnt \
    bpool ${DISK}-part3
-->
and GRUB had difficulties generating the right <code>root=</code> cmdline options for a normal pool anyway.
</p>
<p class="indented continuation">
Using a separate <code>/boot</code> on ext*/FAT didn'<!--'-->t make much sense for booting on EFI, either,
so cutting GRUB out was a simple way to berid of a lot of bollocks.
</p>

<p class="indented continued">
Boot into your freshly installed system, become root, and:
</p>
<table class="bigtable">
	<tr><td>Get rid of GRUB, optionally keeping EFI tools.</td>
	    <td><samp>root@zoot:~# <kbd>apt-mark manual efibootmgr mokutil</kbd></samp><br />
          <samp>efibootmgr, mokutil set to manually installed.</samp><br />
	        <samp>root@zoot:~# apt purge grub* && apt autopurge</samp><br />
	        <samp>The following packages will be REMOVED:</samp><br />
	        <samp>  grub-common* grub-efi-amd64* grub-efi-amd64-bin* grub-efi-amd64-signed*</samp><br />
	        <samp>  grub2-common* os-prober* shim-signed* gettext-base* libbrotli1* libfreetype6*</samp><br />
	        <samp>  libfuse2* libpng16-16* shim-helpers-amd64-signed* shim-signed-common* shim-unsigned*</samp><br />
	        <samp>0 upgraded, 0 newly installed, 15 to remove and 0 not upgraded.</samp><br />
	        <samp>After this operation, 44.9 MB disk space will be freed.</samp></td></tr>
	<tr><td>Verify that you only have GRUB here before cleaning it out!</td>
	    <td><samp>root@zoot:~# <kbd>tree /boot/efi/</kbd></samp><br />
	        <samp>/boot/efi/</samp><br />
	        <samp>├── EFI</samp><br />
	        <samp>│   └── debian</samp><br />
	        <samp>│       ├── BOOTX64.CSV</samp><br />
	        <samp>│       ├── fbx64.efi</samp><br />
	        <samp>│       ├── grub.cfg</samp><br />
	        <samp>│       ├── grubx64.efi</samp><br />
	        <samp>│       ├── mmx64.efi</samp><br />
	        <samp>│       └── shimx64.efi</samp><br />
	        <samp>└── NvVars</samp><br />
	        <samp>root@zoot:~# <kbd>rm -rf /boot/efi/EFI/</kbd></samp></td></tr>
	<tr><td>Install <samp>systemd-boot</samp> and enable a timeout.<br />
	        This <em>might</em> not be required on platforms that support the systemd <a href="//systemd.io/BOOT_LOADER_SPECIFICATION/">Boot Loader Specification</a>
	        (are there any?); in that case, you'<!--'-->ll need to <samp class="nobr"><kbd>mkdir "/boot/efi/$(cat /etc/machine-id)"</kbd></samp> instead,
	        since <samp>kernel-install</samp> won'<!--'-->t make it by itself.</td>
	    <td><samp>root@zoot:~# <kbd>bootctl install</kbd></samp><br />
	        <samp>Created "/boot/efi/EFI", other directories.</samp><br />
	        <samp>Copied "/usr/lib/systemd/boot/efi/systemd-bootx64.efi" to "/boot/efi/EFI/{systemd/systemd-bootx64.efi,BOOT/BOOTX64.EFI}".</samp><br />
	        <samp>Random seed file /boot/efi/loader/random-seed successfully written (512 bytes).</samp><br />
	        <samp>Created EFI boot entry "Linux Boot Manager".</samp><br />
	        <samp>root@zoot:~# <kbd>sed -i 's/#timeout/timeout/' /boot/efi/loader/loader.conf</kbd></samp></td></tr>
	<tr><td><del>Add kernel version to loader entry.</del>
		      This is <a href="https://github.com/systemd/systemd/pull/17072">not required</a> for a normal installation,
		      since sd-boot will disambugate entries by version as needed, but may be useful to distinguish monokernel VM installs or something.</td>
	    <td><samp>root@zoot:~# <kbd>cp /{usr/lib,etc}/kernel/install.d/90-loaderentry.install</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>diff -U2 /{usr/lib,etc}/kernel/install.d/90-loaderentry.install</kbd></samp><br />
	        <samp>--- /usr/lib/kernel/install.d/90-loaderentry.install    2020-09-02 11:49:08.000000000 +0200</samp><br />
	        <samp>+++ /etc/kernel/install.d/90-loaderentry.install        2020-09-13 05:06:49.541120128 +0200</samp><br />
	        <samp>@@ -44,4 +44,6 @@</samp><br />
	        <samp> if ! [[ $PRETTY_NAME ]]; then</samp><br />
	        <samp>     PRETTY_NAME="Linux $KERNEL_VERSION"</samp><br />
	        <samp>+else</samp><br />
	        <samp>+    PRETTY_NAME+=" with Linux $KERNEL_VERSION"</samp><br />
	        <samp> fi</samp><br />
	        <samp>​</samp></td></tr>
	<tr><td><del>Disable a
	        <a href="https://salsa.debian.org/systemd-team/systemd/-/blob/3e2db72b37d72527eca2474a4e08f44fa3f342e8/debian/extra/kernel-install.d/85-initrd.install">Debian</a>
	        <code>.install</code> hook, which copies the initrd into <code>\MID\VER\initrd</code>
	        despite that being handled by <code>90-loaderentry.install</code>, which copies it into <code>\MID\VER\BASENAME</code>,
	        thereby duplicating it. This will <a href="//bugs.debian.org/970213">not be required</a> in the future.</del><br />
	        This hook was <a href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970213#27">fixed</a> in 247.1-4 (Fri, 11 Dec 2020 20:48:44 +0000),
	        and this step can be avoided.</td>
	    <td><samp>root@zoot:~# <kbd>ln -s /dev/null /etc/kernel/install.d/85-initrd.install</kbd></samp></td>
	<tr><td>Add sd-boot hooks, for integration with the normal kernel installation/removal flow.<br />
	        GRUB installs these as <code>zz-update-grub</code>, but <code>kernel-install</code> sorts later than any other thing I saw there myself.
	        I hope to integrate this and make it not required in the future.</td>
	    <td><samp>root@zoot:~# <kbd>cat > /etc/kernel/postinst.d/kernel-install</kbd></samp><br />
	        <samp><kbd>#!/bin/sh</kbd></samp><br />
	        <samp><kbd>bootctl is-installed > /dev/null || exit 0</kbd></samp><br />
	        <samp><kbd>exec kernel-install add "$1" "/boot/vmlinuz-$1" "/boot/initrd.img-$1"</kbd></samp><br />
	        <samp><kbd>^D</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>cat > /etc/kernel/postrm.d/kernel-install</kbd></samp><br />
	        <samp><kbd>#!/bin/sh</kbd></samp><br />
	        <samp><kbd>bootctl is-installed > /dev/null || exit 0</kbd></samp><br />
	        <samp><kbd>exec kernel-install remove "$1"</kbd></samp><br />
	        <samp><kbd>^D</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>chmod +x /etc/kernel/post{inst,rm}.d/kernel-install</kbd></samp></td></tr>
#define BSAMP(...) <samp style="word-break: break-all;">__VA_ARGS__</samp>
	<tr><td>Install the kernel.<br />
	        The initial run takes a long time, hence the <code>-v</code>; <code>62dd03a4928c412180b3024ac6c03a90</code> is this machine'<!--'-->s ID.<br />
	        The current cmdline will be used for the boot entry, overridable with <code>/etc/kernel/cmdline</code>.</td>
	    <td><samp>root@zoot:~# <kbd>kernel-install -v add $(uname -r) /boot/vml&lt;TAB&gt; /boot/ini&lt;TAB&gt;</kbd></samp><br />
	        <samp>Running depmod -a 5.8.0-1-amd64</samp><br />
	        BSAMP(Installing /boot/efi/62dd03a4928c412180b3024ac6c03a90/5.8.0-1-amd64/vmlinuz-5.8.0-1-amd64)<br />
	        BSAMP(Creating /boot/efi/loader/entries/62dd03a4928c412180b3024ac6c03a90-5.8.0-1-amd64.conf)<br />
	        <samp>root@zoot:~# <kbd>tree /boot/efi/</kbd></samp><br />
	        <samp>/boot/efi/</samp><br />
	        <samp>├── 62dd03a4928c412180b3024ac6c03a90</samp><br />
	        <samp>│   └── 5.8.0-1-amd64</samp><br />
	        <samp>│       ├── initrd-5.8.0-1-amd64</samp><br />
	        <samp>│       └── linux</samp><br />
	        <samp>├── EFI</samp><br />
	        <samp>│   ├── BOOT</samp><br />
	        <samp>│   │   └── BOOTX64.EFI</samp><br />
	        <samp>│   ├── Linux</samp><br />
	        <samp>│   └── systemd</samp><br />
	        <samp>│       └── systemd-bootx64.efi</samp><br />
	        <samp>├── loader</samp><br />
	        <samp>│   ├── entries</samp><br />
	        BSAMP(│   │   └── 62dd03a4928c412180b3024ac6c03a90-5.8.0-1-amd64.conf)<br />
	        <samp>│   ├── loader.conf</samp><br />
	        <samp>│   └── random-seed</samp><br />
	        <samp>└── NvVars</samp><br />
	        <br />
	        <samp>8 directories, 9 files</samp></td></tr>
</table>

<p class="indented continued">
I'<!--'-->d recommend rebooting now to verify that this works, which should look like this:
</p>
<center><a href="/content/assets/blogn_t/005.03-sd-boot.png">
	<img class="main-screenshot continuation" alt="text-mode QEMU window with two centered lines, the first one, selected, saying 'Debian GNU/Linux bullseye/sid with Linux 5.8.0-1-amd64', the second saying 'Reboot Into Firmware Interface'"
	     src="/content/assets/blogn_t/005.03-sd-boot.png" /></a></center>
<p class="indented continuing">
If not, and <code>sd-boot</code> shows errors or doesn'<!--'-->t start at all; boot into the EFI shell,
<kbd>fs0:</kbd>, and <kbd>\&lt;MID&gt;\&lt;VER&gt;\linux initrd=\&lt;MID&gt;\&lt;VER&gt;\initrd root=/dev/sda2</kbd>
(the shell should support tab-completion, you might need to add a space before completing the initrd)
(the <code>root=</code> option assumes you installed to the second partition of the first SCSI drive, as I did; adjust to taste),
then write me an <a href="mailto:nabijaczleweli@nabijaczleweli.xyz">e-mail</a> or a <a href="//twitter.com/nabijaczleweli">DM</a>
or whatever else is listed <a href="/">here</a> so I can issue a correxion; thanks in advance, &c.:
</p>
<center><a href="/content/assets/blogn_t/005.04-EFI-shell.png">
	<img class="main-screenshot continuation" alt="EFI shell, demonstrating the above command"
	     src="/content/assets/blogn_t/005.04-EFI-shell.png" /></a></center>

<p class="indented continued">
Now we can boot without dealing with GRUB. On to the ZFS bit:
</p>
HEADING_S(2, zfs, class="continuing", The ZFS bit)
<table class="bigtable">
	<tr><td>Install the prerequisites, remember to match the headers to your kernel!</td>
	    <td><samp>root@zoot:~# <kbd>apt install --no-install-recommends linux-headers-amd64 build-essential</kbd></samp><br />
	        <samp>The following NEW packages will be installed:</samp><br />
	        <samp>  binutils binutils-common binutils-x86-64-linux-gnu build-essential dpkg-dev</samp><br />
	        <samp>  g++ g++-10 gcc gcc-10 libasan6 libatomic1 libbinutils libc-dev-bin libc6-dev</samp><br />
	        <samp>  libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libdpkg-perl libgcc-10-dev</samp><br />
	        <samp>  libgdbm-compat4 libgdbm6 libgomp1 libitm1 liblsan0 libperl5.30 libquadmath0</samp><br />
	        <samp>  libstdc++-10-dev libtsan0 libubsan1 linux-compiler-gcc-10-x86</samp><br />
	        <samp>  linux-headers-5.8.0-1-amd64 linux-headers-5.8.0-1-common linux-headers-amd64</samp><br />
	        <samp>  linux-kbuild-5.8 linux-libc-dev make patch perl perl-modules-5.30</samp><br />
	        <samp>0 upgraded, 40 newly installed, 0 to remove and 0 not upgraded.</samp><br />
	        <samp>After this operation, 286 MB of additional disk space will be used.</samp></td></tr>
	<tr><td>And ZFS.<br />
	        Depending on dependency ordering, starting the services sometimes fails; simply re-running the command will fix it.</td>
	    <td><samp>root@zoot:~# <kbd>apt install zfs-dkms</kbd></samp><br />
	        <samp>The following NEW packages will be installed:</samp><br />
	        <samp>  distro-info-data dkms fakeroot libfakeroot libnvpair1linux libuutil1linux</samp><br />
	        <samp>  libzfs2linux libzpool2linux lsb-release python3-distutils python3-lib2to3</samp><br />
	        <samp>  zfs-dkms zfs-zed zfsutils-linux</samp><br />
	        <samp>After this operation, 22.3 MB of additional disk space will be used.</samp><br />
	        <samp>Building for 5.8.0-1-amd64</samp><br />
	        <samp>Building initial module for 5.8.0-1-amd64</samp><br />
	        <samp>Done.</samp><br />
	        <br />
	        <samp>zfs.ko:</samp><br />
	        <samp>Running module version sanity check.</samp><br />
	        <samp> - Original module</samp><br />
	        <samp>   - No original module exists within this kernel</samp><br />
	        <samp> - Installation</samp><br />
	        <samp>   - Installing to /lib/modules/5.8.0-1-amd64/updates/dkms/</samp><br />
	        <samp>&c.</samp><br />
	        <br />
	        <samp>DKMS: install completed.</samp><br />
	        <samp>root@zoot:~# <kbd>zpool list</kbd></samp><br />
	        <samp>no pools available</samp><br /></tr>
	<tr><td>Here'<!--'-->s the thing: <code>zfs-initramfs</code> is much more broken than <code>zfs-dracut</code>;
		      I've made sure that what follows works with both of them, but I'd recommend using dracut anyway.<br />
		      If you want to be really sure after this, you can reboot, add <code>break</code> or <code>rd.break</code> to the cmdline,
		      and run a ZFS command in the initrd.</td>
	    <td><samp>root@zoot:~# <kbd>apt install zfs-initramfs</kbd></samp><br />
	        <samp>The following NEW packages will be installed:</samp><br />
	        <samp>  zfs-initramfs</samp><br />
	        <samp>After this operation, 108 kB of additional disk space will be used.</samp><br />
	        <samp>root@zoot:~# <kbd>apt install --no-install-recommends dracut zfs-dracut && apt autopurge initramfs-tools</kbd></samp><br />
	        <samp>The following packages will be REMOVED:</samp><br />
	        <samp>  initramfs-tools* initramfs-tools-core* klibc-utils* libklibc*</samp><br />
	        <samp>The following NEW packages will be installed:</samp><br />
	        <samp>  dracut dracut-core kpartx libglib2.0-0 pkg-config zfs-dracut</samp><br />
	        <samp>After this operation, 4,644 kB of additional disk space will be used.</samp><br />
	        <samp>root@zoot:~# <kbd>/etc/kernel/postinst.d/kernel-install $(uname -r)</kbd></samp></td></tr>
</table>

<p class="indented continued">
And now a brief interlude on the layout of ZFS datasets in the VFS.
</p>
HEADING_S(2, layout, class="continuation", Layout)

<p class="indented continued">
<a href="//openzfs.github.io/openzfs-docs/Getting%20Started/Debian/Debian%20Buster%20Root%20on%20ZFS.html#step-3-system-installation">Prior art</a>,
Step 3: System Installation issues a lot of commands and doesn'<!--'-->t really explain why.
</p>
<p class="continuing">
The final mount tree is as such:
</p>
<div class="bigcode">
#include "blogn_t/005.03-mount-tree.plaintext.html"
</div>

<p class="indented continued">
Why?
</p>
<ul class="continuation">
	<li>The root dataset is not mounted, because the explicit initrd'<!--'-->s <code>root=</code> parameter requires a dataset to mount,
	    and the scripts don'<!--'-->t behave too well when the detected bootfs is the root; <code>zoot/root</code> is filling that role instead;</li>
	<li><code>/var</code>, <code>/var/lib</code>, and <code>/usr</code> are all required for the system to boot
	    (I didn't try a split-<code>/usr</code> system, but don't have much hope either way),
	    and the initrd
	    <a href="//github.com/openzfs/zfs/blob/8e7fe49b25d63e855a8d230d2775f99d722818ff/contrib/dracut/90zfs/mount-zfs.sh.in#L80">only</a>
	    <a href="//github.com/openzfs/zfs/blob/8e7fe49b25d63e855a8d230d2775f99d722818ff/contrib/initramfs/scripts/zfs#L966">mounts</a>
	    the root filesystem — things don't go well when these aren't there,
	    but the descendant filesystems are only used after the real init remounts everything;</li>
	<li>additionally, <code>/var/log</code> needs POSIX ACLs for <code>sd-journald</code> and <code>/var/tmp</code> needs to be sticky <code>a+rwx</code>.</li>
</ul>

<p class="indented continued">
And so:
</p>
<table class="bigtable">
	<tr><td>Move <code>/tmp</code> to tmpfs.
	        The Debian default is to keep it on <code>/</code>; if you, for some reason, prefer this, you can treat it like <code>/var/tmp</code> later.</td>
	    <td><samp>root@zoot:~# <kbd>ln -s /usr/share/systemd/tmp.mount /etc/systemd/system/</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>systemctl enable tmp.mount</kbd></samp><br />
	        <samp>Created symlink /etc/systemd/system/local-fs.target.wants/tmp.mount → /usr/share/systemd/tmp.mount.</samp><br />
	        <samp>root@zoot:~# <kbd>mv /tmp{,_} && systemctl start tmp.mount && mv /tmp{_,}</kbd></samp></td></tr>

	<tr><td>Now the pool on the <em>second</em>, heretofor unused, disk.<br />
		      <br />
		      As promised, filesystem tuning is not included, so I'<!--'-->m not speccing <samp><kbd>-o ashift=12 -O relatime=on -O compress=lz4</kbd></samp>
	        and whateverelse, but I am adding encryption with <samp><kbd>-O encryption=on -O keyformat=passphrase</kbd></samp>.</td>
	    <td><samp>root@zoot:~# <kbd>ls -l /dev/disk/by-id/</kbd></samp><br />
	        <samp>ata-QEMU_DVD-ROM_QM00003 -> ../../sr0</samp><br />
	        <samp>ata-QEMU_HARDDISK_QM00001 -> ../../sda</samp><br />
	        <samp>ata-QEMU_HARDDISK_QM00001-part1 -> ../../sda1</samp><br />
	        <samp>ata-QEMU_HARDDISK_QM00001-part2 -> ../../sda2</samp><br />
	        <samp>ata-QEMU_HARDDISK_QM00002 -> ../../sdb</samp><br />
	        <samp>root@zoot:~# <kbd>zpool create -O mountpoint=/ -O canmount=off -R /mnt zoot ata-QEMU_HARDDISK_QM00002</kbd></samp><br />
	        <samp>root@zoot:~# zpool list</samp><br />
	        <samp>NAME   SIZE  ALLOC   FREE  CKPOINT  EXPANDSZ   FRAG    CAP  DEDUP    HEALTH  ALTROOT</samp><br />
	        <samp>zoot  7.50G   564K  7.50G        -         -     0%     0%  1.00x    ONLINE  /mnt</samp><br />
	        <samp>root@zoot:~# zfs list</samp><br />
	        <samp>NAME   USED  AVAIL     REFER  MOUNTPOINT</samp><br />
	        <samp>zoot   492K  7.27G      192K  /mnt</samp></td></tr>
	<tr><td>Enable <a href="//manpages.debian.org/bullseye/zfsutils-linux/zfs-mount-generator.8.en.html"><code>zfs-mount-generator(8)</code></a>
	        via <a href="//manpages.debian.org/bullseye/zfsutils-linux/zed.8.en.html"><code>zed(8)</code></a> for mount ordering; this makes systemd aware of,
	        i.a., <code>/boot/efi</code> depending on <code>/boot</code> and mount <code>/var/log</code> before starting journald there,
	        making both mounts both (a) behave as expected and (b) work.</td>
	    <td><samp>root@zoot:~# <kbd>ln -s /usr/lib/zfs-linux/zed.d/history_event-zfs-list-cacher.sh /etc/zfs/zed.d/</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>mkdir -p /etc/zfs/zfs-list.cache</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>touch /etc/zfs/zfs-list.cache/zoot</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>systemctl restart zfs-zed</kbd></samp></td></tr>
	<tr><td>And the filesystems, as discussed above.<br />
	        <a href="//openzfs.github.io/openzfs-docs/Getting%20Started/Debian/Debian%20Buster%20Root%20on%20ZFS.html#step-3-system-installation">Prior art</a>,
	        Step 3: System Installation, 3. Create datasets uses the <code>com.sun:auto-snapshot</code> property,
	        but as far as I can tell it'<!--'-->s used only by third-party tools.</td>
	    <td><samp>root@zoot:~# <kbd>zfs create -o mountpoint=/ zoot/root</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>for f in zoot/{home{,/nab},boot,var{,/lib,/log,/cache,/tmp},opt,srv,usr{,/local}}; do zfs create $f; done</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>zfs create -o mountpoint=/root zoot/home/root</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>zfs set canmount=off zoot/{usr,var{,/lib}}</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>zfs set com.sun:auto-snapshot=false zoot/var/{cache,tmp}</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>zfs set acltype=posixacl xattr=sa zoot/var/log</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>chmod 1777 /mnt/var/tmp</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>zfs list -o name,used,mountpoint,canmount</kbd></samp><br />
	        <samp>NAME            MOUNTPOINT      CANMOUNT</samp><br />
	        <samp>zoot            /mnt                 off</samp><br />
	        <samp>zoot/boot       /mnt/boot             on</samp><br />
	        <samp>zoot/home       /mnt/home             on</samp><br />
	        <samp>zoot/home/nab   /mnt/home/nab         on</samp><br />
	        <samp>zoot/home/root  /mnt/root             on</samp><br />
	        <samp>zoot/opt        /mnt/opt              on</samp><br />
	        <samp>zoot/root       /mnt                  on</samp><br />
	        <samp>zoot/srv        /mnt/srv              on</samp><br />
	        <samp>zoot/usr        /mnt/usr             off</samp><br />
	        <samp>zoot/usr/local  /mnt/usr/local        on</samp><br />
	        <samp>zoot/var        /mnt/var             off</samp><br />
	        <samp>zoot/var/cache  /mnt/var/cache        on</samp><br />
	        <samp>zoot/var/lib    /mnt/var/lib         off</samp><br />
	        <samp>zoot/var/log    /mnt/var/log          on</samp><br />
	        <samp>zoot/var/tmp    /mnt/var/tmp          on</samp><br />
	        <samp>root@zoot:~# <kbd>systemctl stop zfs-zed</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>sed -Ei 's;/mnt/?;/;' /etc/zfs/zfs-list.cache/zoot</kbd></samp></td></tr>
	<tr><td><a href="//github.com/openzfs/zfs/blob/8e7fe49b25d63e855a8d230d2775f99d722818ff/contrib/initramfs/scripts/zfs#L751">These</a> or
	        <a href="//github.com/openzfs/zfs/blob/8e7fe49b25d63e855a8d230d2775f99d722818ff/contrib/dracut/90zfs/parse-zfs.sh.in#L22">these</a>
	        are all the valid forms.<br />
	        If <code>bootfs=</code> is set, <code>root=zfs:AUTO</code> becomes valid, but an explicit pool can always be specified.
	        The documentation mentions no <code>root=</code> at all,
	        but dracut hangs waiting for <code>/dev/gpt-auto-root</code> if one isn'<!--'-->t specified.</td>
	    <td><samp>root@zoot:~# <kbd>zpool set bootfs=zoot/root zoot</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>cat /proc/cmdline > /etc/kernel/cmdline</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>echo 'root=zfs:zoot/root' > /etc/kernel/cmdline</kbd></samp><br />
	        <samp>root@zoot:~# <kbd># Trim out initrd= and add root=ZFS=zoot/root or root=zfs:AUTO to taste.</kbd></samp></td></tr>
	<tr><td>Comment out old rootfs to prevent re-mounting it on top of the new one and regenerate+reinstall initrds.</td>
	    <td><samp>root@zoot:~# <kbd>sed -i 's;.* / .*ext.*;#&;' /etc/fstab</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>run-parts --arg=$(uname -r) /etc/kernel/postinst.d/</kbd></samp></td></tr>
	<tr><td>And now copy the system to the pool; this is the cursed bit.<br />
	        Note the CWD and ignore the few "file exists" errors for the directories — those are by design.</td>
	    <td><samp>root@zoot:~# <kbd>apt install dump</kbd></samp><br />
	        <samp>The following NEW packages will be installed:</samp><br />
	        <samp>  dump liblzo2-2</samp><br />
	        <samp>After this operation, 539 kB of additional disk space will be used.</samp><br />
	        <samp>root@zoot:/mnt# <kbd>dump -f - / | restore rf -</kbd></samp><br />
	        <samp>  DUMP: Date of this level 0 dump: Sat Sep 12 02:11:03 2020</samp><br />
	        <samp>  DUMP: Dumping /dev/sda2 (/) to standard output</samp><br />
	        <samp>  DUMP: Label: zoot-root</samp><br />
	        <samp>restore: ./boot, ./var, ./&c.: File exists</samp><br />
	        <samp>  DUMP: 1357080 blocks (1325.27MB)</samp><br />
	        <samp>  DUMP: finished in 50 seconds, throughput 27141 kBytes/sec</samp><br />
	        <samp>  DUMP: Date of this level 0 dump: Sat Sep 12 02:11:03 2020</samp><br />
	        <samp>  DUMP: Date this dump completed:  Sat Sep 12 02:11:53 2020</samp><br />
	        <samp>  DUMP: DUMP IS DONE</samp><br />
	        <samp>root@zoot:/mnt# <kbd>rm restoresymtable</kbd></samp><br />
	        <samp>root@zoot:/mnt# <kbd>reboot</kbd></samp><br />
	      </td></tr>
</table>

<p class="indented continued">
If all went well, the system should now prompt for a password:
</p>
<center><a href="/content/assets/blogn_t/005.05-type-password.png">
	<img class="main-screenshot continuing" alt="'Encrypted ZFS password for zoot/root' prompt after boot with many messages"
	     src="/content/assets/blogn_t/005.05-type-password.png" /></a></center>
<p class="continuation">
dracut might try to use a stored mount option like <code>errors=remount-ro</code> for the rootfs;
in that case <kbd>mount -t zfs -o zfsutil zoot/root /sysroot</kbd> and regenerating the initrd will help.
</p>

<p class="indented continued">
If it says something to the effect of
</p>
<p class="continuing">
<samp>[FAILED] Failed to start Import ZFS pools by cache file.</samp><br />
<samp>See 'systemctl status zfs-import-cache.service' for details.</samp>
</p>
<p class="continuation">
instead, it'<!--'-->s likely that <code>/etc/zfs/zpool.cache</code> exists and is zero-length, and was copied like this from the real root,
which is like this for god-knows-why.
<kbd>zpool import zoot</kbd> and the same <kbd>mount</kbd> invocation will let it boot,
then removing the file and regenerating the initrd should fix the problem permanently.
</p>

<p class="indented continued">
Post-login, the mounts should now be all ZFS:
</p>
<center><a href="/content/assets/blogn_t/005.06-findmnt.png">
	<img class="main-screenshot continuing" alt="findmnt output, showing that all filesystems that should be ZFS (/, /home, &c.) are"
	     src="/content/assets/blogn_t/005.06-findmnt.png" /></a></center>
<p class="indented continuing">
Or:
</p>
<div class="bigcode continuing">
#include "blogn_t/005.04-mounts.shell-session.html"
</div>
<p class="indented continuation">
And, yes, the chrome of the windows changed from Windows 10 to i3, this is a goddamn mess of a post.
</p>

<p class="indented continued">
One last part now, to actually use both disks:
</p>
<table class="bigtable">
	<tr><td>I'm specifying the primary disk's rootfs partition by <a href="#installation">its partlabel</a>,
	        but <code>ata-QEMU_HARDDISK_QM00001-part2</code> would also work in this case.</td>
	    <td><samp>root@zoot:~# <kbd>gdisk -l /dev/disk/by-id/ata-QEMU_HARDDISK_QM00001</kbd></samp><br />
	        <samp>Disk /dev/disk/by-id/ata-QEMU_HARDDISK_QM00001: 16777216 sectors, 8.0 GiB</samp><br />
	        <samp>Disk identifier (GUID): 0D47FC01-7947-4DDE-9506-3BBBCFF572FF</samp><br />
	        <br />
	        <samp>Number  Start (sector)    End (sector)  Size       Code  Name</samp><br />
	        <samp>   1            2048          487423   237.0 MiB   EF00  zoot-EFI</samp><br />
	        <samp>   2          487424        16775167   7.8 GiB     8300  zoot-root</samp><br />
	        <samp>root@zoot:~# <kbd>zpool add zoot zoot-root</kbd></samp><br />
	        <samp>invalid vdev specification</samp><br />
	        <samp>use '-f' to override the following errors:</samp><br />
	        <samp>/dev/disk/by-partlabel/zoot-root contains a filesystem of type 'ext4'</samp><br />
	        <samp>root@zoot:~# <kbd>dd if=/dev/zero of=/dev/disk/by-partlabel/zoot-root count=16</kbd></samp><br />
	        <samp>root@zoot:~# <kbd>zpool add zoot zoot-root</kbd></samp><br />
</table>

<p class="indented continued">
And that's it. There ain't much fan-fare to it, since this took only the very best part of a week to get right.
</p>
<div class="bigcode">
#include "blogn_t/005.05-final-list.shell-session.html"
</div>

<p class="indented continued">
Or, as was succinctly put by the instigator of all this mess:
</p>
<!-- https://discord.com/channels/145079846832308224/150317232239542272/754853633031536670 -->
<center><a href="/content/assets/blogn_t/005.07-final-review.png">
	<img class="main-screenshot continuation" alt="[01:58] Griwes: okay, *to be fair* this looks less cursed than I thought it would be, so kudos :noel:"
	     src="/content/assets/blogn_t/005.07-final-review.png" style="min-width: 75%;" /></a></center>

<p class="indented continued">
On Tue, 29 Sep 2020 22:16 -0800, after minor hiccups, the deed has finally been done, with a recommendation of the highest order:
</p>
<!-- https://discordapp.com/channels/145079846832308224/150317232239542272/760731829304688640 -->
<center><a href="//twitter.com/nabijaczleweli/status/1311318328510644225">
	<img class="main-screenshot continuation" alt="[07:16] Griwes: @((наб *)(войд)())() I'll have you know that everything worked, and I did indeed hit the dracut issue of using a weird option on first reboot and that it did indeed resolve itself after rebuilding initrd, it felt like black magic"
	     src="/content/assets/blogn_t/005.08-success.png" style="min-width: 75%;" /></a></center>

BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()