<!--
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../writing/writing.h"
#include "../fontawesome.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Thu, 11 Jan 2024 04:04:28 +0100" -->
#define POST_DATE      Thu, 11 Jan 2024 04:04:28 +0100
#define POST_POST_DATE , updated Thu, 11 Jan 2024 21:38:02 +0100
<!-- docs.chrultrabook.com saved as /web/20240109135642 -->

#ifdef linux
#undef linux
#endif


#define STYLESHEETS BLOGN_T_STYLESHEETS FONTAWESOME_LINK                                    FORCED_NEWLINE \
                    <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" /> FORCED_NEWLINE \
                    <link href="/content/assets/bigtable.css"           rel="stylesheet" />


#define HEADING_CHRULTRA_S(level, hid, style_arg, sect, ...) HEADING_S(level, hid, style_arg, <a style="color: inherit; text-decoration: none;" href=STR(httpsCOLON_SLASH_SLASHdocs.chrultrabook.com/docs/sect)>__VA_ARGS__ FA(external-link-alt)</a>)
#define HEADING_CHRULTRA(level, hid, sect, ...) HEADING_CHRULTRA_S(level, hid, , sect, __VA_ARGS__)


BOILERPLATE(012a. Installing Debian on the Lenovo 300e 2nd-gen Chromebook (Intel) — blognꞌt, 012a. Installing Debian on the Lenovo 300e 2nd-gen Chromebook (Intel) with Intel Celeron N4000, en-GB, STYLESHEETS WORD_COUNT_SCRIPT_NON_ENGLISH)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

/* This page has a bigcode at the very top, so on big screens in light mode you get blue/purple links on black background  */
@media (min-device-width: 800px) and (prefers-color-scheme: light) {
  details#contents > ol {
    background-color: rgba(255, 255, 255, .5);
    border-radius: .2em;
  }
}

img {
  max-width: 100%;
  border-radius: .2em;
  vertical-align: bottom;
}

dt {
  font-weight: bold;
}
dd {
  margin-left: 0;
}
dl > div {
  display: inline-grid;
  margin-right: 0.5em;
}


#include "012-chromebook-keyboard.h"
dl.keyboard {
  grid-template-columns: repeat(4, 1fr);
}
@media all and (min-device-width: 700px) {
  dl.keyboard {
    grid-template-columns: repeat(6, 1fr);
  }
}
@media all and (min-device-width: 800px) {
  dl.keyboard {
    grid-template-columns: repeat(4, 1fr);
  }
}
@media all and (min-device-width: 1200px) {
  dl.keyboard {
    grid-template-columns: repeat(6, 1fr);
  }
}
@media all and (min-device-width: 1500px) {
  dl.keyboard {
    grid-template-columns: repeat(8, 1fr);
  }
}


tt {
  font-family: "Droid Sans Mono", monospace;  /* <code> */
}

pre > code {
  white-space: pre-wrap !important;
}
pre details {
  display: inherit;
}
pre details summary {
  display: inline list-item;
  font-family: inherit;
}

dl.linear, dl.linear dt, dl.linear dd {
  display: inline;
}
dl.linear dt::after {
  content: ":";
}
dl.linear dd::after {
  content: ",";
}
dl.linear dd:last-child::after {
  content: ".";
}

ol#explicit-contents a {
  display: block;
}
ol#explicit-contents, ol#explicit-contents ol {
  list-style-type: none;
}
ol#explicit-contents ol {
  padding-left: 1em;
}
.heading-ref, ol#explicit-contents a {
  font-family: "Merriweather", serif; /* same as h1 &c. */
  font-size: 0.95em; /* unscale a bit */
}
.heading-ref {
  font-weight: bold;
}

.chrultra-heading {
  font-weight: bold;
  font-style: italic;
}

div.tipwarning {
  padding-left: 0.25em; /* same as blockquote  */
  border-left: 0.25em solid;
}
.tipwarning.tip {
  border-left-color: #30d56f;
}
.tipwarning.warning {
  border-left-color: #e0ad15;
}
.tipwarning.warning dt {
  color: #fdca31;
}
.tipwarning.danger {
  border-left-color: #fc1e38;
}
.tipwarning.danger dt, a.tipwarning.danger {
  color: #fc2d3b;
}

.language-ANSI .bold {
  font-weight: bold;
}
.language-ANSI .cyan {
  color: #00CDCD;  /* cyan3  */
}
.language-ANSI .green {
  color: #00CD00;  /* green3  */
}
.language-ANSI .red {
  color: #CD0000;  /* red3  */
}
.language-ANSI .yellow {
  color: #CDCD00;  /* yellow3  */
}
.language-ANSI .bright.yellow {
  color: #FFFF00;  /* yellow */
}
.language-ANSI .bright.blue {
  color: #6c5cff;  /* #6c5cff */
}
.language-ANSI .bright.magenta {
  color: #FF00FF;  /* magenta */
}

HASHspacespace::before {
  content: "  ";
}

samp.path {
	font-style: italic;
}

code[class="language-ini"], pre[class="language-ini"] {
	tab-size: 8 !important;
	-moz-tab-size: 8 !important;
}
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(012a. Installing Debian on the Lenovo 300e 2<sup>nd</sup>-gen Chromebook (Intel))

<p class="continued">
This <a href="//sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices">concerns</a>
</p>
<blockquote class="continuing">
  <dl class="continuing">
    <div><dt>Release</dt><dd      >1 March 2019</dd></div>
    <div><dt>OEM</dt><dd          >Lenovo</dd></div>
    <div><dt>Model</dt><dd        ><a href="//sites.google.com/a/chromium.org/dev/chromium-os/Lenovo%20300e%20Chromebook%202nd%20Gen%20(Intel)">Lenovo 300e Chromebook 2nd Gen (Intel)</a></dd></div>
    <div><dt>Code name</dt><dd    >Phaser360</dd></div>
    <div><dt>Board name(s)</dt><dd>Octopus</dd></div>
    <div><dt>Base board</dt><dd   >octopus</dd></div>
    <div><dt>User ABI</dt><dd     >x86_64</dd></div>
    <div><dt>Kernel</dt><dd       >4.14</dd></div>
    <div><dt>Kernel ABI</dt><dd   >x86_64</dd></div>
    <div><dt>Platform</dt><dd     >Gemini Lake</dd></div>
    <div><dt>Form Factor</dt><dd  >Convertible</dd></div>
    <div><dt>First Release</dt><dd>R72</dd></div>
  </dl>
</blockquote>
<p class="continuing">
which Lenovo tricked me into getting in
<a href="012-debian-chromebook-lenovo-300e-gen2.html"><samp>012. Debian on the Lenovo 300e 2<sup>nd</sup>-gen arm64 Chromebook</samp></a>.
</p>
<p class="indented continuing">
But because it'<!--'-->s an Intel platform with a Celeron N4000 and 4G of LPDDR4-2400 you can install Debian on it, at least hypothetically.
</p>

<div class="bigcode">
#include "blogn_t/012a.01-script.shell-session.html"
</div>
<p class="continuing" style="display: inline;">
(all the boring common mountopts stripped; note also how the console login is somehow <tt>TERM=xterm</tt>); the UUIDs amount to
</p>
<dl class="continuation linear">
  <dt><code>encstateful</code></dt> <dd><tt>91e91d32-94d2-457f-a4a7-05db62492040</tt></dd>
  <dt><code>mmcblk0p1</code></dt>   <dd><tt>b3770f19-2ac7-402d-9e3c-5c04e3e157fa</tt></dd>
  <dt><code>mmcblk0p8</code></dt>   <dd><tt>9db5d778-0ac8-43be-b4dd-b8cd77248ba3</tt></dd>
  <dt><code>mmcblk0p12</code></dt>  <dd><tt>563B-40A9</tt></dd>
</dl>

<p class="indented continued">
<a href="//docs.chrultrabook.com/docs/firmware/supported-devices.html#:~:text=Lenovo%20300e%20Chromebook%20Gen%202">Chrultrabook</a>
lists this device as explicitly supported as
</p>
<blockquote class="continuing">
  <dl class="continuing">
    <div><dt>Device Name</dt><dd                  >Lenovo 300e Chromebook Gen 2/IdeaPad Flex 3<br />
                                                   NEC Chromebook Y1</dd></div>
    <div><dt>Board Name</dt><dd                   >PHASER360</dd></div>
    <div><dt>RW_LEGACY<br />Firmware</dt><dd      >✅</dd></div>
    <div><dt>UEFI Firmware<br />(Full ROM)</dt><dd>✅</dd></div>
    <div><dt>WP Method</dt><dd                    ><a href="//wiki.mrchromebox.tech/Firmware_Write_Protect#Hardware_Write_Protection">CR50 (battery)</a></dd></div>
    <div><dt>Windows Notes</dt><dd                >Audio driver is paid.</dd></div>
    <div><dt>Linux Notes</dt><dd                  >Supported</dd></div>
    <div><dt>MacOS Notes</dt><dd                  >No MacOS support.</dd></div>
  </dl>
</blockquote>
<p class="continuing">
so this has been done before and this is thus largely a <a href="/content/recipes/">replication post</a>, mirroring the chrultrabook documentation structure:
</p>
<ol id="explicit-contents" class="continuation" style="padding-left: 1em;">
  <a href="#firmware">Firmware</a>
  <ol>
    <li><a href="#firmware-finding-system-info">Finding System Info</a></li>
    <li><a href="#firmware-known-issues">Known Issues</a></li>
    <ol>
      <li><a href="#firmware-known-issues-firmware">Firmware</a></li>
    </ol>
    <li><a href="#firmware-enabling-developer-mode">Enabling developer mode</a></li>
    <li><a href="#firmware-disabling-write-protect">Disabling write protect</a></li>
    <ol>
      <li><a href="#firmware-types-of-firmware">Types of Firmware</a></li>
      <ol>
        <li><a href="#firmware-types-of-firmware-RW_LEGACY">RW_LEGACY</a></li>
        <li><a href="#firmware-types-of-firmware-UEFI">(UEFI) Full ROM</a></li>
      </ol>
    </ol>
    <li><a href="#firmware-disabling-write-protect2">(Back to) Disabling write protect</a></li>
    <ol>
      <li><a href="#firmware-disabling-write-protect-unplugging-the-battery">Disabling write protect via Battery</a></li>
      <ol>
        <li><a href="#firmware-disabling-write-protect-unplugging-the-battery-step-1-open-the-device-and-disconnect-the-battery">Step 1: Open the device and disconnect the battery</a></li>
        <li><a href="#firmware-disabling-write-protect-unplugging-the-battery-step-2-boot-using-ac-power-and-flash">Step 2: Boot using AC power, and flash.</a></li>
      </ol>
    </ol>
    <li><a href="#firmware-flashing-custom-firmware">Flashing Custom Firmware</a></li>
  </ol>
  <li><a href="#installing">Installing an OS</a></li>
  <ol>
    <li><a href="#installing-known-issues">Known Issues</a></li>
    <ol>
      <li><a href="#installing-known-issues-linux">Linux</a></li>
    </ol>
    <li><a href="#installing-making-a-bootable-usb">Making a Bootable USB</a></li>
    <ol>
      <li><a href="#installing-making-a-bootable-usb-flashing-with-dd-linux-macos">Flashing with dd (Linux/macOS)</a></li>
    </ol>
    <li><a href="#installing-installing-linux">Installing Linux</a></li>
    <ol>
      <li><a href="#installing-installing-linux-recommended-distributions">Recommended Distributions</a></li>
      <li><a href="#installing-installing-linux-installation">Installation</a></li>
      <li><a href="#installing-installing-linux-fixing-audio">Fixing Audio</a></li>
      <ol>
        <li><a href="#installing-installing-linux-fixing-audio2">Fixing Audio</a></li>
      </ol>
    </ol>
    <li><a href="#installing-post-install">Post Install</a></li>
    <ol>
      <li><a href="#installing-post-install-linux">Linux</a></li>
      <ol>
        <li><a href="#installing-post-install-linux-general-qol-fixes">General QOL Fixes</a></li>
        <li><a href="#installing-post-install-linux-celes-post-install-workaround">CELES Post Install Workaround</a></li>
      </ol>
    </ol>
    <li><a href="#installing-using-ectool">Using Ectool</a></li>
  </ol>
  <li><a href="#conclusions">Conclusions</a></li>
  <ol>
    <li><a href="#conclusions-pog-moments">pog moments</a></li>
    <li><a href="#conclusions-cringe-moments">cringe-ass nae-nae baby moments</a></li>
    <li><a href="#conclusions-funny-moments">family guy funny moments</a></li>
  </ol>
</ol>


HEADING_CHRULTRA_S(2, firmware, class="continued", firmware/, Firmware)
HEADING_CHRULTRA_S(3, firmware-finding-system-info, class="continuing", firmware/system-info.html, Finding System Info)
All of these I found in <a href="012-debian-chromebook-lenovo-300e-gen2.html"><samp>012. Debian on the Lenovo 300e 2<sup>nd</sup>-gen arm64 Chromebook</samp></a>,
sections <a class="heading-ref" href="012-debian-chromebook-lenovo-300e-gen2.html#jailbreak">Save me from chromium (chrome os (chromium os(?)))</a>
     and <a class="heading-ref" href="012-debian-chromebook-lenovo-300e-gen2.html#HFBITLAND">Take me to <span class="smallcaps">hfbitland</span></a>,
<dl class="continuation">
  <div><dt>System Architecture</dt><dd>x86_64</dd></div>
  <div><dt>Board Name</dt><dd>PHASER360</dd></div>
  <div><dt>CPU Model and generation</dt><dd><tt>Intel(R) Celeron(R) N4000 CPU @ 1.10GHz</tt> and <span class="chrultra-heading">Geminilake</span></dd></div>
</dl>

<p class="indented">
Why the model is in the uname I cannot tell you, but it is there.
As seen above, it matches <samp class="path">/proc/cpuinfo</samp>.
</p>

<p class="indented continued">
<a class="chrultra-heading" href="//docs.chrultrabook.com/docs/firmware/system-info.html#system-architecture">How to find your architecture</a>
and
<a class="chrultra-heading" href="//docs.chrultrabook.com/docs/firmware/system-info.html#how-to-find-your-cpu-model">How to find your CPU model</a>
similarly recommend <kbd>ctrl</kbd>+<kbd>alt</kbd>+<kbd>t</kbd> to open the "de<span class="smallcaps">cro</span>ded <span class="smallcaps">sh</span>ell".
This still doesn'<!--'-->t do anything, and <kbd>ctrl</kbd>+<kbd>alt</kbd>+<kbd>→</kbd> (not the arrow key) is required.
</p>
<p class="indented continuation">
<a class="chrultra-heading" href="//docs.chrultrabook.com/docs/firmware/system-info.html#how-to-find-your-cpu-model">How to find your CPU model</a>
recommends <samp>cat /proc/cpuinfo | grep "model name"</samp>.
Why it'<!--'-->s not <samp>grep "model name" /proc/cpuinfo</samp> is beyond me.
</p>

HEADING_CHRULTRA_S(3, firmware-known-issues, class="continued", firmware/known-issues.html, Known Issues)
HEADING_CHRULTRA_S(4, firmware-known-issues-firmware, class="continuing", firmware/known-issues.html#firmware, Firmware)
<blockquote class="continuing">
GeminiLake: Legacy boot mode/alternative firmware menu works but does not show payload list
</blockquote>
<p class="continuation">
which is irrelevant.
</p>

HEADING_CHRULTRA_S(3, firmware-enabling-developer-mode, class="continued", firmware/developer-mode.html, Enabling developer mode)
<p class="continuation">
has already been done in <a href="012-debian-chromebook-lenovo-300e-gen2.html"><samp>012. Debian on the Lenovo 300e 2<sup>nd</sup>-gen arm64 Chromebook</samp></a>.
</p>

HEADING_CHRULTRA_S(3, firmware-disabling-write-protect, class="continued", firmware/write-protect.html, Disabling write protect)
<blockquote class="continuation">
  <dl class="continuation">
    <div class="tipwarning tip"><dt class="smallcaps">Tip</dt><dd>You do not have to disable write protect if flashing <a href="//docs.chrultrabook.com/docs/firmware/about.html#rw_legacy">RW_Legacy</a>.</dd></div>
  </dl>
</blockquote>

HEADING_CHRULTRA_S(4, firmware-types-of-firmware, class="continued", firmware/about.html, Types of Firmware)
HEADING_CHRULTRA_S(5, firmware-types-of-firmware-RW_LEGACY, class="continuing", firmware/about.html#rw-legacy, RW_LEGACY)
<blockquote class="continuing">
  <dl class="continuing">
    <div class="tipwarning warning"><dt class="smallcaps">Warning</dt><dd>The RW_LEGACY firmware is for users who want to dual-boot ChromeOS + Linux, or users who want to run Linux without having to open the device/disable the firmware write-protect (and are OK with the accompanying limitations).</dd></div>
  </dl>
</blockquote>
HEADING_CHRULTRA_S(5, firmware-types-of-firmware-UEFI, class="continuing", firmware/about.html#uefi-full-rom, (UEFI) Full ROM)
<blockquote class="continuing">
  <ul style="padding-left: 1em;">
    <li>Removes the developer mode boot ("OS verification is OFF") screen</li>
    <li>UEFI firmware contains updated EC firmware as well, which brings additional fixes on most Chromebooks (mainly keyboard related)</li>
  </ul>
  <dl class="continuing">
    <div class="tipwarning tip"><dt class="smallcaps">Tip</dt><dd>The (UEFI) Full ROM firmware is the best option for all users who no longer need/want to run ChromeOS (ie, want to run Linux/Windows/macOS exclusively), and who don'<!--'-->t mind disabling write-protection on their device.</dd></div>
  </dl>
</blockquote>
<p class="continuation">
Unclear to me what "ie" means, but sign me up, brother.
Here'<!--'-->s hoping it also fixes the scandi keyboard.
</p>

HEADING_S(3, firmware-disabling-write-protect2, class="continued", (Back to) Disabling write protect)
HEADING_CHRULTRA_S(4, firmware-disabling-write-protect-unplugging-the-battery, class="continuing", firmware/battery.html, Disabling write protect via Battery)
HEADING_CHRULTRA_S(5, firmware-disabling-write-protect-unplugging-the-battery-step-1-open-the-device-and-disconnect-the-battery, class="continuation", firmware/battery.html#step-1-open-the-device-and-disconnect-the-battery, Step 1: Open the device and disconnect the battery)

<p class="indented">
The <a href="//sites.google.com/a/chromium.org/dev/chromium-os/Lenovo%20300e%20Chromebook%202nd%20Gen%20(Intel)">internal link from within google documentation</a>
is a 404.
Obviously.
Neither the fake nor the
<a href="//www.lenovo.com/us/en/p/laptops/lenovo/lenovo-edu-chromebooks/300e-chromebook-2nd-gen-(11.6-inch)-laptop/len101l0001">real Lenovo product page</a>
carry a manual of any sort, but a
<a href="//support.lenovo.com/us/en/solutions/ht509430-removal-and-replacement-videos-lenovo-300e-chromebook-gen-2-81mb">completely unrelated</a>
Lenovo page <a href="https://download.lenovo.com/consumer/mobiles_pub/300e500e_chromebook_2nd_gen_series_hmm_201901.pdf">does</a>,
and it also has videos-as-in-37-second-MP4s that show where the latches are,
because sexion "1020 Base cover assembly" of the manual says "Pry up latches and remove the base cover assembly."
but doesn'<!--'-->t show where the latches are. But the video does.
</p>

<a href="/content/assets/blogn_t/012a.04-DSC_0957cv.JPG"><img alt="the laptop in question, filleted " src="/content/assets/blogn_t/012a.04-DSC_0957cv.JPG"></a>
One of my screws was missing, but another was in a loose insert, and I only broke one tab! And another pile fell out from previous service.
<a href="/content/assets/blogn_t/012a.05-DSC_3011c.JPG"><img alt="it's a staggering pile of plastic" src="/content/assets/blogn_t/012a.05-DSC_3011c.JPG"></a>

HEADING_CHRULTRA_S(5, firmware-disabling-write-protect-unplugging-the-battery-step-2-boot-using-ac-power-and-flash, class="continued", firmware/battery.html#step-2-boot-using-ac-power-and-flash, Step 2: Boot using AC power, and flash.)
HEADING_CHRULTRA_S(3, firmware-flashing-custom-firmware, class="continuing", firmware/flashing-firmware.html, Flashing Custom Firmware)
<blockquote class="continuing">
  <ol style="padding-left: 1em;" start=3>
    <li>Run <a href="//mrchromebox.tech/#fwscript">MrChromebox'<!--'-->s firmware utility script</a> within VT-2 (<kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>f2</kbd> (right arrow)).
        <ul>
          <li>Type <code>cd; curl -LO mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh</code> and press Enter.</li>
        </ul></li>
  </ol>
</blockquote>
<p class="continuing">
This is weird and borders on dangerous. Maybe?
The website says
</p>
<blockquote class="continuing">
  <h4 class="continuation">IMPORTANT</h4>
  <p>
    Due to recent changes in ChromeOS'<!--'--> security settings, you may need to use a new set of commands to run the Firmware Utility Script under ChromeOS. Running it under Linux can use the same old one-line command.<br />
    Also, you must execute these commands **as a normal/non-root user**. Running them as root will break things. DO NOT RUN 'SUDO SU' BEFORE RUNNING THE SCRIPT CMD BELOW.
  </p>
  …<br/>
  To download and run this script under ChromeOS or Linux, from a terminal/shell type:<br/>
  <code>cd; curl -LO mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh</code><br/>
  and press enter.<br/>
  …<br/>
  REALLY READ THIS: Under ChromeOS, starting with R117, this script must be run from a VT2 terminal (from login screen: CTRL+ALT+F2, login 'chronos'); it cannot be run from a crosh shell (CTRL+ALT+T when logged in) due to the removal of sudo, or from a crostini (penguin) terminal; […].
</blockquote>
<p class="continuing">
So: Are you supposed to run it as root under sudo? Run it as root straight from login? Or are you to <em>not</em> do that because it'<!--'-->ll break your system?
How is it gonna flash anything as non-root? If you log in as "chronos" are you supposed to drop the sudo it specs?
Why does downstream Chrultrabook not comment on this at all and why does it not say which user you'<!--'-->re supposed to log in as if it matters?
</p>
<p class="indented continuation">
<a href="//forum.chrultrabook.com/t/general-mild-documentation-oddities-rollup/521/13">According to upstream</a> this is all intentionally misleading,
and the purpose of the huge bizarre paragraph with a random user is to find a R/W mountpoint.
Just download it and run it as root
(copy it off the USB (sure, maybe under <samp class="path">~chronos</samp>, or <code>mount -o remount,rw /</code>), since it wants to exclusively mount it)
instead of this rigamarole.
</p>

<p class="indented continued">
I downloaded the thingy (which redirected me twice, last step at <a href="//raw.githubusercontent.com/MrChromebox/scripts/master/firmware-util.sh">pisshub</a>)
onto removable media (unclear to me how you'<!--'-->d download it from the target system in a privacy-preserving way):
</p>
<div class="bigcode continuation">
#include "blogn_t/012a.02-firmware1.shell-session.html"
</div>

<p class="indented continued">
The most natural question is "how does <samp>chromeos-setdevpasswd</samp> differ from <samp>passwd chronos</samp>"?
Significantly:
</p>
<a href="/content/assets/blogn_t/012a.02-DSCN0555cvcc.JPG"><!--'--><img alt='# command -v chromeos-setdevpasswd
/usr/sbin/chromeos-setdevpasswd

HASH cat /usr/sbin/chromeos-setdevpasswd
PASSWD_FILE=/mnt/stateful_partition/etc/devmode.passwd
pass=$(openssl passwd -1)

mkdir -p "${PASSWD_FILE%/*}"
: > "${PASSWD_FILE}"
chmod 600 "${PASSWD_FILE}"
echo "chronos:${pass}" > "${PASSWD_FILE}"' src="/content/assets/blogn_t/012a.02-DSCN0555cvcc.JPG"></a><!--'-->

<p class="indented continued">
The next-most natural question is "great.".
Which isn'<!--'-->t a question but "why the aren't there any errors?" is.
Well, "MrChromebox's firmware utility script" is
</p>
<div class="bigcode continuing">
#include "blogn_t/012a.03-utility.shell.html"
</div>
<p class="continuing">
which raises so many more questions (why are the curls <em>supposed</em> to fail silently? why are the three <code>rm</code>s not one? &c. &c. in the trimmed parts),
but that'<!--'-->s neither here nor there,
and just meant I had to download <tt>https://raw.githubusercontent.com/MrChromebox/scripts/master/{sources,firmware,functions}.sh</tt>,
and, since all the other modules also run <code>$CURL -s…</code>, apply
</p>
<div class="bigcode continuing" id="firmware.diff">
#include "blogn_t/012a.04-firmware.diff.html"
</div>
<p class="continuation">
Which is possible due to the narrow flag vocabulary.
</p>

<p class="indented">
Some parts of <code>flash_rwlegacy()</code>, like the boot order, degrade gracefully, which is not what we want.
Similarly, <code>downgrade_touchpad_fw()</code>, which is meant to "offer to downgrade touchpad firmware on EVE" does the same.
But my laptop doesn'<!--'-->t have "EVE" anywhere in the board name so no issue there.
All other curl uses hard-fail, and I turned around twice, for
<tt>https://www.mrchromebox.tech/files/{util/cbfstool.tar.gz,firmware/full_rom/coreboot_edk2-phaser360-mrchromebox_20231222.rom{,.sha1}}</tt>.
</p>

<p class="indented continued">
The first time I tried this, it told me
</p>
<div class="bigcode continuing">
#include "blogn_t/012a.05-firmware2.ANSI.html"
</div>
<p class="continuation">
and, naturally, rebooted instantly, so I lost the transcript.
</p>

<p class="indented continued">
But after the two expected errors, I got
</p>
<div class="bigcode continuing">
#include "blogn_t/012a.06-firmware5.ANSI.html"
</div>


<blockquote class="continued">
  <dl class="continued">
    <div class="tipwarning tip"><dt class="smallcaps">Tip</dt><dd>If you unplugged the battery to <a href="//docs.chrultrabook.com/docs/firmware/battery.html">disable write protect</a>, you can plug it back in now. All subsequent flashing won'<!--'-->t require it from now on.</dd></div>
    <div><dt>UEFI</dt><dd>It can take up to a minute for display to come up on first POST. Do not interrupt the first boot.</dd>
  </dl>
</blockquote>
<p class="continuing">
I'<!--'-->m not trying to be flipping the shit running with a cable plugged in, I plugged the battery back after rebooting and proof-booting d-i.
</p>
<p class="continuation">
Yeah, it took about that long. But the updater explicitly says it won'<!--'-->t boot ChromeOS anymore. So I held off until I had a d-i image.
</p>

HEADING_CHRULTRA_S(2, installing, class="continued", installing/, Installing an OS)
HEADING_CHRULTRA_S(3, installing-known-issues, class="continuing", installing/known-issues.html, Known Issues)
HEADING_CHRULTRA_S(4, installing-known-issues-linux, class="continuing", installing/known-issues.html#linux, Linux)
<blockquote class="continuing">
  <ul style="padding-left: 1em;">
    <li>Debian 12 (Bookworm) needs a custom kernel.</li>
  </ul>
</blockquote>
<p class="continuing">
No it doesn'<!--'-->t. Pretty sure. No one wants to document what they mean by this. And I got spam-blocked on the forum for no reason.
</p>
#define SCREENSHOT_LINK <a href="data:image/png;base64,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">screenshot</a>
<p class="indented continuing">
And by that I mean this is not mentioned in the documentation, and not in
<a href="//101010.pl/@elly@donotsta.re/111722941614342831">one</a> (SCREENSHOT_LINK),
<a href="//101010.pl/@weirdtreething@donotsta.re/111723029109242853">two</a>,
<a href="//101010.pl/@weirdtreething@donotsta.re/111723748295321731">three</a>,
<a href="//forum.chrultrabook.com/t/general-mild-documentation-oddities-rollup/521/8">four</a>,
<a href="//101010.pl/@weirdtreething@donotsta.re/111723900288585374">five</a>
posts about this from Chrultrabook authors, in a few cases <em>while questioned directly</em>.
Do <em>they</em> even know why?
</p>
<p class="indented continuation">
It turns out they do on the
<a href="//101010.pl/@weirdtreething@donotsta.re/111724074322859319">sixth</a>
attempt: the catchily-designated <a href="//salsa.debian.org/kernel-team/linux/-/merge_requests/768/">MR!768 – [x86] Various drivers for ChromeOS devices</a>.
A <a href="//101010.pl/@nabijaczleweli/111724158873684896">trivial analysis</a> shows this actually wants a kernel at least <samp>6.6.3-1</samp>,
so at time of writing "current sid", but hopefully it'<!--'-->ll be in backports later.
</p>


HEADING_CHRULTRA_S(3, installing-making-a-bootable-usb, class="continued", installing/bootableusb.html, Making a Bootable USB)
HEADING_CHRULTRA_S(4, installing-making-a-bootable-usb-flashing-with-dd-linux-macos, class="continuing", installing/bootableusb.html#flashing-with-dd-linux-macos, Flashing with dd (Linux/macOS))
<p class="continuing">
I'<!--'-->m snidely avoiding comment on the bit where it specs <samp>dd</samp> but uses no flags that would make it do anything different than <samp>cp</samp>.
</p>
<p class="indented continuation">
No syncing of any kind is criminal, though.
</p>


HEADING_CHRULTRA_S(3, installing-installing-linux, class="continued", installing/installing-linux.html, Installing Linux)
<blockquote class="continuing">
  <dl class="continuing">
    <div class="tipwarning tip"><dt class="smallcaps">Tip</dt><dd>Only Linux kernel 6.4 or newer is supported.</dd></div>
  </dl>
</blockquote>
<p class="continuation">
It doesn'<!--'-->t say why. Well – why? (See above.)
</p>


HEADING_CHRULTRA_S(4, installing-installing-linux-recommended-distributions, class="continued", installing/installing-linux.html#recommended-distributions, Recommended Distributions)
<blockquote class="continuing">
  <dl class="continuing">
    <div class="tipwarning warning"><dt class="smallcaps">Warning</dt><dd>Debian versions older than Debian 12 (Bookworm) are <strong>not supported</strong>. Debian 12 (Bookworm) requires a custom kernel, the <a href="//docs.chrultrabook.com/docs/installing/installing-linux.html#fixing-audio">audio script</a> will automatically install it for you.</dd></div>
  </dl>
</blockquote>
<ol style="list-style: symbols(fixed '(a)' '(b)'); display: inline; padding-left: 0;">
  <li style="display: inline list-item;">No the fuck it won'<!--'-->t.</li>
  <li style="display: inline list-item;">Bookworm ships (at time of writing, from <tt>stable-security</tt>) 6.1.69-1, and the <a href="//deb.debian.org/debian/dists/bookworm/main/installer-amd64/current/images/netboot/mini.iso">current d-i image</a>'<!--'-->s kernel is branded "6.1.66-1 (2023-12-09)". So it must work. (See above, again.)</li>
</ol>

<p class="indented continuing">
<a href="//paste.sr.ht/~nabijaczleweli/9cce0cbdf7a7874520cd8e3c08dde598a6c5e6be">If it were up to me</a>,
since this is just about some modules, this box would be
</p>
<dl class="continuing">
  <div class="tipwarning warning"><dt class="smallcaps">Warning</dt><dd>Debian versions older than Debian 12 (Bookworm) are <strong>not supported</strong>. Debian 12 (Bookworm) itself requires the <a href="//backports.debian.org/Instructions/">backports kernel</a> for <a href="//salsa.debian.org/kernel-team/linux/-/merge_requests/768">full functionality</a>.</dd></div>
  <div class="tipwarning danger"><dt class="smallcaps">Danger</dt><dd>On Debian 12 (Bookworm), the <a href="//docs.chrultrabook.com/docs/installing/installing-linux.html#fixing-audio">audio script</a> will try to download an install a third-party kernel image. Answer <kbd style="font-weight: bold;">N</kbd> at the "Would you like the script to automatically install this kernel?" prompt!</dd></div>
</dl>
<p class="continuation">
But for now just install
<a href="//snapshot.debian.org/archive/debian/20240103T032204Z/pool/main/l/linux-signed-amd64/linux-image-6.6.9-amd64_6.6.9-1_amd64.deb">the sid kernel</a>.
</p>


HEADING_CHRULTRA_S(4, installing-installing-linux-installation, class="continued", installing/installing-linux.html#installation, Installation)
<blockquote class="continuing">
  <ol style="padding-left: 1em;" start=4>
    <li>Install as you would on any other computer.</li>
  </ol>
</blockquote>
<p class="continuing">
I'm assuming this means you can safely dump the whole <samp class="path">/dev/mmcblk0</samp>? Which I had pause about, but clearly I oughtn't've'd.
</p>


HEADING_CHRULTRA_S(4, installing-installing-linux-fixing-audio, class="continued", installing/installing-linux.html#fixing-audio, Fixing Audio)
HEADING_CHRULTRA_S(5, installing-installing-linux-fixing-audio2, class="continuing", installing/installing-linux.html#fixing-audio-1, Fixing Audio)
<p class="continuing">(yeah there'<!--'-->s two nested identical sexions)</p>
<blockquote class="continuing">
  <dl class="continuing">
    <div class="tipwarning danger"><dt class="smallcaps">Danger</dt><dd>Using AVS on a device with max98357a will blow your speakers. You have been warned.</dd></div>
  </dl>
</blockquote>
<p class="continuing">
this machine does have this device
(apparently <a href="//github.com/WeirdTreeThing/chromebook-linux-audio/blob/03e64fe3986039502183c953a5d12d14f2ef1c69/setup-audio#L135">this</a> is the check,
 and apparently this only affects output to the built-in speakers, and the "audio script" will disable it automatically, maybe),
and:
</p>
<pre class="continuing" style="margin-left: 1em;"><code>$ grep -w CONFIG_SND_SOC_INTEL_AVS /boot/config-6.1.0-9-amd64 /boot/config-6.6.9-amd64
/boot/config-6.1.0-9-amd64:# CONFIG_SND_SOC_INTEL_AVS is not set
/boot/config-6.6.9-amd64<span id="spacespace"></span>:CONFIG_SND_SOC_INTEL_AVS=m</code></pre>
<p class="continuing">
and, uncharacteristically,
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/intel/Kconfig?id=v6.6#n212">Linux doesn'<!--'-->t spec what the modules are called</a>,
but it <a href="//web.archive.org/web/20240109135353/https://packages.debian.org/sid/amd64/linux-image-6.6.9-amd64/filelist">looks like</a> <samp>snd-soc-avs</samp>,
so booting the bookworm kernel is safe, but booting a later kernel wants <code>modprobe.blacklist=snd-soc-avs</code> in the cmdline.
</p>

<p class="indented continued">
So, with no contraindications, and a very peculiar sense of drip
</p>
<a href="/content/assets/blogn_t/012a.06-DSCN0560cv.JPG"><img alt="coreboot logo, below it Press ESC for Boot Options/Settings" src="/content/assets/blogn_t/012a.06-DSCN0560cv.JPG"></a>
<a href="/content/assets/blogn_t/012a.07-DSCN0559cvcc.JPG"><img alt="70s-style text-mode BIOS" src="/content/assets/blogn_t/012a.07-DSCN0559cvcc.JPG"></a>
<p class="continuing">
(yes, that is a 4:3 EDK2 on an almost-16:9 monitor):
</p>
<a href="/content/assets/blogn_t/012a.03-DSCN0557c.JPG"><img alt="It's GNU GRUB version 2.06-13+deb12u1 booting debian 12" src="/content/assets/blogn_t/012a.03-DSCN0557c.JPG"></a>
<p class="continuation">
and I installed sid <a href="//101010.pl/@nabijaczleweli/111726416245752000">normally</a>.
ChromeOS used <samp>discard</samp>, so I added this to the mount options as well.
Installing GRUB into the removable media path was not necessary.
This yields <a href="//bugs.debian.org/1060325">#1060325</a>.
</p>

<p class="indented continued">
Apparently, pressing <kbd>alt</kbd> and <kbd>˂</kbd> or <kbd>˃</kbd> (the arrow keys) cycles between the available VTs.
This is useful because there are no function keys, and <kbd>alt</kbd> and <kbd>←</kbd> or <kbd>→</kbd> (not the arrow keys) doesn'<!--'-->t do anything.
</p>
<p class="indented continuing">
I also persisted the blacklist after first boot
and fixed the <a href="//bugs.debian.org/1060331">touch</a><a href="//bugs.debian.org/1060332">pad</a>
because the default decroded-ass no-tap-to-click behaviour is more infuriating than you'<!--'-->d think in a.d. 2023.
</p>
<div class="bigcode" id="xorg.conf.d">
#include "blogn_t/012a.07-instant.shell-session.html"
</div>


HEADING_CHRULTRA_S(3, installing-post-install, class="continued", installing/post-install.html, Post Install)
<blockquote class="continuing">
  <dl class="continuing">
    <div class="tipwarning tip"><dt class="smallcaps">Tip</dt><dd>Install <a href="//github.com/death7654/Chrultrabook-Controller/releases">Chrultrabook Controller<!---->FA(external-link-alt)</a> for fan controls, keyboard backlight controls, system information and more.</dd></div>
  </dl>
</blockquote>
<p class="continuation">
This machine has neither, and the "system information" in the screenshots appears to be the first three lines of dmesg.
</p>

HEADING_CHRULTRA_S(4, installing-post-install-linux, class="continued", installing/post-install.html#linux, Linux)
HEADING_CHRULTRA_S(5, installing-post-install-linux-general-qol-fixes, class="continuing", installing/post-install.html#general-qol-fixes, General QOL Fixes)
<blockquote class="continuing">
  <ul style="padding-left: 1em;">
    <li>Run the <a href="//github.com/WeirdTreeThing/chromebook-linux-audio">audio script<!---->FA(external-link-alt)</a> if you haven'<!--'-->t already.</li>
  </ul>
</blockquote>
<p class="continuing">
Heed the <a href="#installing-installing-linux-recommended-distributions" class="smallcaps tipwarning danger">Danger</a>, of course, if you installed Bookworm.
The script checks if you have an audio daemon installed (in my case wireplumber), so make sure you do install it first.
But, yes, this does work:
<button onclick='Array.from(document.querySelectorAll("#expandall-target details")).forEach(function(d) { d.open = !document.expandall_open; }); document.expandall_open = !document.expandall_open;'>Expand/collapse all</button>
</p>
<div class="bigcode continuing" id="expandall-target">
#include "blogn_t/012a.08-chromebook-linux-audio.ANSI.html"
</div>
<p class="continuation">
And after a reboot I could play aloud
<a href="//nabijaczleweli.itch.io/002-fluorescent-heart">my</a> <a href="//nabijaczleweli.bandcamp.com/album/fluorescent-heart">album</a>,
all without the <a href="#installing-installing-linux-fixing-audio2" class="smallcaps tipwarning danger">Danger</a>ous driver.
</p>


<p id="installing-post-install-linux-general-qol-fixes-cros-keyboard-map"></p>
<blockquote class="continuing">
  <ul style="padding-left: 1em;">
    <li>Run the <a href="//github.com/WeirdTreeThing/cros-keyboard-map">cros-keyboard-map<!---->FA(external-link-alt)</a> script to remap top row FX keys.</li>
  </ul>
</blockquote>
<p class="continuing">
This is actually much less annoying than the Home/End/PgUp/PgDn situation,
which on normal small keyboards is Fn+←/→/↑/↓,
but this is not mapped to <kbd>alt</kbd>+<kbd>˂</kbd>/<kbd>˃</kbd>/<kbd>˄</kbd>/<kbd>˅</kbd> here,
which sucks shit.
No Delete is pretty bad as well.
The top row is, accd'<!--'-->g to <code>xev</code>,
</p>
<dl class="keyboard continuing">
  <dt><kbd>esc</kbd></dt><dd><code>Escape</code></dd>
  <dt><kbd>←</kbd></dt><dd><code>XF86Back</code></dd>
  <dt><kbd>→</kbd></dt><dd><code>XF86Forward</code></dd>
  <dt><kbd>⟳</kbd></dt><dd><code>XF86Reload</code></dd>
  <dt><kbd>TABLEAU</kbd></dt><dd>nothing?</dd>
  <dt><kbd>FASTRECTANGLE</kbd></dt><dd><code>XF86LaunchA</code></dd>
  <dt><kbd><small>☀️</small></kbd></dt><dd><code>XF86MonBrightnessDown</code></dd>
  <dt><kbd>☀️</kbd></dt><dd><code>XF86MonBrightnessUp</code></dd>
  <dt><kbd>🔇</kbd></dt><dd><code>XF86AudioMute</code></dd>
  <dt><kbd>🔉</kbd></dt><dd><code>XF86AudioLowerVolume</code></dd>
  <dt><kbd>🔊</kbd></dt><dd><code>XF86AudioRaiseVolume</code></dd>
  <dt><kbd>🔒</kbd></dt><dd><code>XF86Sleep</code></dd>
</dl>
<p class="continuing">
(🔒 is the Suspend Key and handled by logind by default;
 to see it you need to unmap it in <samp class="path">/etc/systemd/logind.conf</samp>;
 I <a href="//bugs.debian.org/1060389">settled on</a>
</p>
<pre class="continuing" style="padding-left: 1em;"><!--
 -->[Login]
HandlePowerKey=hibernate
HandleSuspendKey=ignore
HandleSuspendKeyLongPress=ignore<!--
 --></pre>
<p class="continuing">
.)
Caps Lock is replaced with
</p>
<dl class="keyboard continuing">
  <dt><kbd>🔍</kbd></dt><dd><code>Super_L</code></dd>
</dl>
<p class="indented continuation">
Why <kbd>🔉</kbd>/<kbd>🔊</kbd> are on the keyboard when there are physical buttons for them (or vice versa) is beyond me, too.
</p>

<p class="indented continued">
The upstream instructions say to run <samp class="path">install.sh</samp>,
but on Debian
that installs <a href="//github.com/rvaiya/keyd">keyd</a> off unchecked HEAD
(which until <a href="//github.com/rvaiya/keyd/commit/03d4a27b83ac69bc6854f7759de6124cc5e74d6d">three weeks ago</a> dumped shit into <samp class="path">/usr</samp>,
 and the installer checks for
 <a href="//github.com/WeirdTreeThing/cros-keyboard-map/blob/25b0e9c2a10fc834d414b427c40d572fb38cda14/install.sh#L26"><samp class="path">/usr/bin/keyd</samp></a>
 and will do it again;
 it continues to run unadorned <a href="//github.com/rvaiya/keyd/blob/dcbb68b12f71245121035b730b50872802a259b4/Makefile#L71"><code>groupadd keyd</code></a>
 to add a system group!),
first cloning it to no-where,
and <a href="//github.com/WeirdTreeThing/cros-keyboard-map/blob/25b0e9c2a10fc834d414b427c40d572fb38cda14/cros-keyboard-map.py#L77">generates a config</a>
with
</p>
<div class="bigcode continuation">
#include "blogn_t/012a.09-cros-keyboard-map.python.html"
</div>
<p class="indented">
deadass
<a href="//commons.wikimedia.org/wiki/File:Vivaldi.jpg"><img class="iconic" alt="vivaldi" src="data:image/png;base64,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"></a>
☕
</p>

<p class="indented continued">
This would be excessive, but we can'<!--'-->t actually even <em>see</em> <kbd>TABLEAU</kbd> and the
<a href="//lfs.nabijaczleweli.xyz/0017-twitter-export/#1326260988811898883">standard</a>
remapping facilities are insufficiently expressive anyway.
</p>
<p class="indented continuing">
There'<!--'-->s a <a href="//bugs.debian.org/1060023">2024-01-04 ITP</a> for keyd with no linked dsc,
but it features on <a href="//mentors.debian.net/package/keyd/">mentors.d.n</a>,
which, well, if I posted I could never show my face in public again
(and it takes over a minute for one python program at 100% CPU on my <a href="//man.sr.ht/~nabijaczleweli/snappy-tools/measurements/2024-01-03-mt.md#bookworme5645ddr3-1600-quottartaquot">big host</a>,
 so there's no way it'd ever finish building on a shitty Celeron),
but this is what mentors is for, so let'<!--'-->s accept keyd is not in Debian:
</p>
<div class="bigcode continuing">
#include "blogn_t/012a.10-keyd.shell-session.html"
</div>
<p class="continuing">
and
</p>
<div class="bigcode continuation">
#include "blogn_t/012a.11-keymap.shell-session.html"
</div>

<p class="indented continued">
Now that we've installed a key- and mouse-logger, it doesn't actually work,
Thankfully, there'<!--'-->s a monitoring interface in the form of <code>keyd monitor</code>;
so, pressing all of the top row, then <kbd>🔍</kbd>, then the side buttons (filtered for down events):
</p>
<pre class="continuing"><!--
-->device added: 0001:0001 AT Translated Set 2 keyboard (/dev/input/event0)
device added: 04f3:00be Elan Touchpad (/dev/input/event7)
device added: 06cb:1a10 SYTS7817:00 06CB:1A10 (/dev/input/event9)
<a href="//github.com/rvaiya/keyd/issues/645">+1041019475 ms</a>	AT Translated Set 2 keyboard	0001:0001	enter up
<!--"-->+672 ms	AT Translated Set 2 keyboard  0001:0001  esc down<!--"-->
<!--"-->+201 ms	AT Translated Set 2 keyboard  0001:0001  back down<!--"-->
<!--"-->+192 ms	AT Translated Set 2 keyboard  0001:0001  forward down<!--"-->
<!--"-->+149 ms	AT Translated Set 2 keyboard  0001:0001  refresh down<!--"-->
<!--"-->+135 ms	AT Translated Set 2 keyboard  0001:0001  zoom down<!--"-->
<!--"-->+155 ms	AT Translated Set 2 keyboard  0001:0001  scale down<!--"-->
<!--"-->+128 ms	AT Translated Set 2 keyboard  0001:0001  brightnessdown down<!--"-->
<!--"-->+107 ms	AT Translated Set 2 keyboard  0001:0001  brightnessup down<!--"-->
<!--"-->+113 ms	AT Translated Set 2 keyboard  0001:0001  mute down<!--"-->
<!--"-->+175 ms	AT Translated Set 2 keyboard  0001:0001  volumedown down<!--"-->
<!--"-->+139 ms	AT Translated Set 2 keyboard  0001:0001  volumeup down<!--"-->
<!--"-->+519 ms	AT Translated Set 2 keyboard  0001:0001  sleep down<!--"-->

<!--"-->+191 ms	AT Translated Set 2 keyboard  0001:0001  leftmeta down<!--"-->

<!--"-->+173 ms	AT Translated Set 2 keyboard  0001:0001  volumedown down<!--"-->
<!--"-->+480 ms	AT Translated Set 2 keyboard  0001:0001  volumeup down<!--"--><!--
--></pre>
<p class="indented continuing">
<code># <kbd>systemctl start keyd</kbd></code>
</p>
<pre class="continuing"><!--
-->device added: 0fac:0ade keyd virtual keyboard (/dev/input/event14)
device added: 0fac:1ade keyd virtual pointer (/dev/input/event15)
<!--"-->+324 ms	keyd virtual keyboard  0fac:0ade  esc down<!--"-->
<!--"-->+157 ms	keyd virtual keyboard  0fac:0ade  back down<!--"-->
<!--"-->+141 ms	keyd virtual keyboard  0fac:0ade  forward down<!--"-->
<!--"-->+124 ms	keyd virtual keyboard  0fac:0ade  refresh down<!--"-->
<!--"-->+87 ms	keyd virtual keyboard  0fac:0ade  f11 down<!--"-->
<!--"-->+104 ms	keyd virtual keyboard  0fac:0ade  scale down<!--"-->
<!--"-->+139 ms	keyd virtual keyboard  0fac:0ade  brightnessdown down<!--"-->
<!--"-->+129 ms	keyd virtual keyboard  0fac:0ade  brightnessup down<!--"-->
<!--"-->+147 ms	keyd virtual keyboard  0fac:0ade  mute down<!--"-->
<!--"-->+147 ms	keyd virtual keyboard  0fac:0ade  volumedown down<!--"-->
<!--"-->+316 ms	keyd virtual keyboard  0fac:0ade  volumeup down<!--"-->
<!--"-->+263 ms	keyd virtual keyboard  0fac:0ade  coffee down<!--"-->

<!--"-->+221 ms	keyd virtual keyboard  0fac:0ade  leftmeta down<!--"-->

<!--"-->+773 ms	keyd virtual keyboard  0fac:0ade  volumedown down<!--"-->
<!--"-->+339 ms	keyd virtual keyboard  0fac:0ade  volumeup down<!--"--><!--
--></pre>
<p class="indented continuation">
So the only thing that changed was <kbd>TABLEAU</kbd> into F11,
And the volume buttons on the side are seemingly indistinguishable from <kbd>🔉</kbd>/<kbd>🔊</kbd>.
</p>

<p class="indented continued">
After a debugging session where I thought my keyd was broken (it <a href="//github.com/rvaiya/keyd/pull/646">had been</a>, but unrelatedly),
it turns out the generated mapping is just bonkers.
I wasn'<!--'-->t gonna include it here because it differs per-model, but the generated <samp class="path">/etc/keyd/cros.conf</samp> is:
</p>
<div class="bigcode continuing">
#include "blogn_t/012a.12-cros.conf.ini.html"
</div>
<p class="continuation">
(Rember that lines that start with "<code>f<var>123</var> =</code>" are no-ops, since the keyboard by default generates the special keys.)
</p>

<p class="indented continued">
Yes: this has the ☕, but also identity-maps everything, and you unfuck it by holding <kbd>🔍</kbd> (the objectively-incorrect mode).
Except <kbd>TABLEAU</kbd>, which is in the would-be-F4 position, but it'<!--'-->s mapped to F11.
<kbd>🔒</kbd> is mapped to ☕ despite being where Delete usually is, and Delete is achieved with <kbd>alt</kbd>+<kbd>⟵</kbd>.
</p>
<p class="indented continued" id="cros2.conf">
I feel like I could do better with
</p>
<div class="bigcode continuing">
#include "blogn_t/012a.13-cros2.conf.ini.html"
</div>
<p class="continuing">
<kbd>TABLEAU</kbd> looks the most like a screen, hence it'<!--'-->s mapped to PrtSc.
Specifically <kbd>FASTRECTANGLE</kbd>, but also <kbd>←</kbd>, <kbd>→</kbd>, and <kbd>⟳</kbd> are prime real estate for mapping something useful to.
<kbd>ctrl</kbd>+<kbd>alt</kbd>+<kbd>FASTRECTANGLE</kbd> even works to switch to VT4, and <kbd>ctrl</kbd>+<kbd>alt</kbd>+<kbd>🔒</kbd> to salute!
</p>
<p class="indented continuing">
With this, the optimal <samp class="path">/etc/systemd/logind.conf</samp> becomes just the usual
</p>
<pre class="continuation"><!--
 -->[Login]
HandlePowerKey=hibernate<!--
 --></pre>

<p class="indented continued">
It'<!--'-->s also tempting to solve the Home/End/PgUp/PgDn situation here instead of with xmodmap,
so appending this to the updated <samp class="path">/etc/keyd/cros.conf</samp> works like one'<!--'-->d expect
(but <code>[meta]</code> is better for i3 usage;
 also note that you can'<!--'-->t make another file and have it patch the big one, because at most one file can match each device):
</p>
<div class="bigcode continuation">
#include "blogn_t/012a.14-cros-arrows.conf.ini.html"
</div>

<p class="indented continued">
I had to find out <a href="//101010.pl/@nabijaczleweli/111739210958704043">the hard way</a> that keyd, <em>by default</em>,
mangles Shift_R and Control_R into Shift_L and Control_L.
Appending this is necessary to make them work correctly:
</p>
<div class="bigcode continuation">
#include "blogn_t/012a.15-rctrl_rshift.conf.ini.html"
</div>

<p class="indented">
Overall, low value-add factor here.
The quirks file is nice though.
Let's hope it's upstreamed before it breaks,
like upstream <a href="//wayland.freedesktop.org/libinput/doc/latest/device-quirks.html#device-quirks-local">guarantees it will</a>.
</p>


HEADING_CHRULTRA_S(5, installing-post-install-linux-celes-post-install-workaround, class="continued", installing/post-install.html#celes-post-install-workaround-1, CELES Post Install Workaround)
<blockquote class="continuing">
If you experience issues in applications such as Parsec, or […]
</blockquote>
<p class="continuation">
Okay but that'<!--'-->s <em>so</em> true though?
</p>


HEADING_CHRULTRA_S(3, installing-using-ectool, class="continued", installing/ectool.html, Using Ectool)
<blockquote class="continuing">
<tt>ectool</tt> is a utility that is used to interface with the ChromeOS Embedded Controller.
It is used to communicate with the embedded controller from userspace and vice versa.
</blockquote>
<p class="continuation">
Boy I sure hope to use this program to communicate with the embedded controller!
I would love to communicate with the ChromeOS Embedded Controller through this program.
</p>

<p class="indented">
Also: no link and it'<!--'-->s not in by that name in Debian.
Is it the same one as <samp class="path">/sbin/ectool</samp> from <a href="//packages.debian.org/bookworm/amd64/coreboot-utils/filelist">coreboot-utils</a>?
Unknowable.
</p>


HEADING_S(2, conclusions, class="continued", Conclusions)
HEADING_S(3, conclusions-pog-moments, class="continuing", pog moments)
<ul style="padding-left: 0;">
  <li>normal computer</li>
  <li>normal debian just works</li>
  <li>overall a sensible walk-through</li>
  <li>privacy preserved (ChromeOS didn'<!--'-->t ever see the network)</li>
  <li>fun bunny on POST</li>
</ul>

HEADING_S(3, conclusions-cringe-moments, class="continued", cringe-ass nae-nae baby moments)
<ul style="padding-left: 0;">
  <li>PXE-booting from a USB-C dongle doesn'<!--'-->t work</li>
  <li>small patch and a few round-trips required to actually ensure privacy is preserved</li>
  <li>the recommended keyboard mapping is so bizarre I straight-up thought keyd was broken</li>
  <li>Chrultrabook stance is that users <em>should</em> give up their privacy to make following the guide more convenient (this is used as a justification for a <a href="//forum.chrultrabook.com/t/general-mild-documentation-oddities-rollup/521/6">mild editorial oddity</a> and the impetus to retain it is stronger than to simplify the page)</li>
  <li>Chrultrabook and its upstreams appear allergic to actually documenting crucial security-sensitive and stated-as-device-bricking information in the text and actively avoid providing it when questioned</li>
  <li>this extends to Chrultrabook authors posting <a href="//forum.chrultrabook.com/t/general-mild-documentation-oddities-rollup/521/14">misinformation</a> at least <a href="//101010.pl/@elly@donotsta.re/111722941614342831">twice</a> (SCREENSHOT_LINK), presumably because of this lack of documentation</li>
  <li>were I to guess, this is also probably why they consider users <a href="//forum.chrultrabook.com/t/general-mild-documentation-oddities-rollup/521/4">"not technical enough"</a> 🤢 to follow a longer thing they may understand than a magical one-liner</li>
  <li>forum'<!--'-->s <a href="//101010.pl/@nabijaczleweli/111722108722210068">fucking</a> <a href="//101010.pl/@nabijaczleweli/111723601116129102">Discourse</a></li>
  <li>I ran out of <a href="//101010.pl/@nabijaczleweli/111733977710166096">words</a> to put <a href="//101010.pl/@nabijaczleweli/111734016113409806">links</a> on for the last one</li>
  <li>I liked her <a href="//media.ccc.de/v/37c3-11929-turning_chromebooks_into_regular_laptops">talk</a> but elly <a href="//101010.pl/@elly@donotsta.re/111734258473806402">threatened to ban me</a> for
      <blockquote class="continuing">
        Shitting all over the non-profit project, documentation written by community and mentality "I know better than you" is exactly the kind of toxicity we don'<!--'-->t want in our community.
      </blockquote>
      ; one will do well to note we've interacted once on the forum and at most twice off the forum (of her accord) and both of those went fine. Odd behaviour, given that she's the one with the misinformation above, and, well, you've seen this post and you can click through to my <a href="//101010.pl/@nabijaczleweli/111721710968221669">mastussy thread</a> and the <a href="//forum.chrultrabook.com/t/general-mild-documentation-oddities-rollup/521">forum post</a>, none of these are particularly "shitting on", much less toxic. I don't even think I exhibit that mentality, really. Maybe this is a language barrier (we're both polish), seeing as I haven't gotten an actual warning or anything before (except for automatic Discourse bullshit), and another user with admin powers <a href="//101010.pl/@BluRaf@donotsta.re/111734014889040333">gladly unblocked me</a> (also unprompted and of his own volition) more than once, well.</li>
</ul>

HEADING_S(3, conclusions-funny-moments, class="continued", family guy funny moments)
<ul style="padding-left: 0;">
  <li>guide sections are randomly-cased</li>
  <li><a href="//forum.chrultrabook.com/t/help-me-please-i-buyed-incorrect-drivers/218">paid drivers</a> meme real</li>
</ul>

<p class="indented">
Most of the issues out-lined above have been <a href="//forum.chrultrabook.com/t/general-mild-documentation-oddities-rollup/521">forwarded</a>.
That is also the reason for most of them having been discovered.
</p>

<p class="indented">
<a href="//linux-hardware.org/?probe=7402fc6e46">hw-probe of my result.</a>
</p>

<p class="indented">
A good bug report never goes unpunished.
</p>


BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
