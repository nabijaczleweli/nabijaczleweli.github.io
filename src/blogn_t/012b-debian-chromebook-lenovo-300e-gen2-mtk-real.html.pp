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


   <!-- RSS_PUB_DATE: "Wed, 07 Feb 2024 01:09:33 +0100" -->
#define POST_DATE      Wed, 07 Feb 2024 01:09:33 +0100
#define POST_POST_DATE

#define STYLESHEETS BLOGN_T_STYLESHEETS                                                            FORCED_NEWLINE \
                    <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" />        FORCED_NEWLINE \
                    <link href="/content/assets/bigtable.css"           rel="stylesheet" />        FORCED_NEWLINE \
                    <link href="/content/assets/blogn_t/008.01-amix-fonts.css" rel="stylesheet" />

#undef linux


BOILERPLATE(012b. Debian on the Lenovo 300e 2nd-gen MTK arm64 Chromebook (hana) (real) — blognꞌt, 012b. Debian on the Lenovo 300e 2nd-gen MTK arm64 Chromebook (hana) with MediaTek MT8173/MT8173C (real), en-GB, STYLESHEETS WORD_COUNT_SCRIPT_NON_ENGLISH)
<style>
/*#include "../writing/the_taste_of_mi/spacing.css" + !important for <pre> */
.continued {
	margin-bottom: 0 !important;
}
.continuing {
	margin-top: 0 !important;
	margin-bottom: 0 !important;
}
.continuation {
	margin-top: 0 !important;
}


#include "../gen-epub-book/fonts.css"
#include "../indent.css"


/* From https://hinfo.network/  */
.sunfont {
  font-family: sunfont;
  font-size: 1.25em;
  font-kerning: none;
}
.topaz {
  font-family: topaz;
  font-size: 0.60em;
  position: relative;
  top: -0.05em;
}


img, video {
  max-width: 100%;
  border-radius: .5em;
  vertical-align: bottom;
}
video {
	width: 100%;
}

dt {
  font-weight: bold;
}
dl:not(.patch-list) dd {
  margin-left: 0;
}
dl > div {
  display: inline-grid;
  margin-right: 0.5em;
}

.spacing-only {
  color: transparent;
}

tt {
  font-family: "Droid Sans Mono", monospace;  /* <code> */
}


@media all and (min-device-width: 600px) {
	.side-by-each-inside > a {
		width: 50%;
		vertical-align: middle;
		display: inline-block;
	}
}


samp.path {
	font-style: italic;
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
  content: "";
}

summary {
	font-family: inherit;
}
details a {
	display: inline-block;
}
details a::after {
  content: ",";
}
details a:last-child::after {
  content: "";
}
details#contents a::after {
	content: "";
}

pre[class*="language-"] > code[class*="language-"] small {
	vertical-align: text-bottom;
}

dl.guid-demo dt, dl.guid-demo dd {
	display: inline;
}
dl.guid-demo dt:after {
	content: ":";
}

pre .off {
	display: none;
}


ol.alphalist {
  counter-reset: alphalist;
}
ol.alphalist > li {
  list-style: none;
  counter-increment: alphalist;
}
ol.alphalist > li::marker {
  content: counter(alphalist, lower-latin) ")\a0";
}

.continuing-inside > * {
	margin-top: 0 !important;
	margin-bottom: 0 !important;
}

cite.local-ref, cite .local-ref {
	font-style: inherit;
  font-family: "Merriweather", serif; /* same as h1 &c. */
  font-size: 0.95em; /* unscale a bit */
}

blockquote del, q del, .ell del, cite:not(.local-ref) del {
	opacity: 50%;
	text-decoration: inherit;
}

HASHdebug_button_shortcuts_table {
	border-collapse: collapse;
}
#define CHROMIUMOS_F5F5F5 rgba(128, 128, 128, 0.0784313725490196)
HASHdebug_button_shortcuts_table th {
	background-color: CHROMIUMOS_F5F5F5;
}
#define CHROMIUMOS_EEE rgba(128, 128, 128, 0.133333333333333)
HASHdebug_button_shortcuts_table th,
HASHdebug_button_shortcuts_table td {
	border: 1px solid CHROMIUMOS_EEE;
	padding: 4px 12px;
}
HASHdebug_button_shortcuts_table kbd, kbd.chromiumos {
	padding: 2px 4px;
	background-color: CHROMIUMOS_F5F5F5;
	border-radius: .5em;
}

.language-ANSI .green, .language-ANSI .green > a {
  color: #00CD00;  /* green3  */
}

.language-ANSI .red {
  color: #CD0000;  /* red3  */
}

aside {
  position: absolute;
  right: 0;
  top: 0;
  background: rgba(0, 0, 0, .7);
  padding: 5px;
  border-radius: .5em;
  color: white;
  text-decoration: underline;
	font-family: "Droid Sans Mono", monospace;  /* <code> */
	font-weight: bold;
}

iframe {
	display: block;
	max-width: 100%;
}

figure {
	margin-left: 0;
	margin-right: 0;
}
figure small, small.very {
	font-size: 0.5em;
}

#include "012-chromebook-keyboard.h"
dl.keyboard {
  grid-template-columns: repeat(6, 1fr);
}
@media all and (min-device-width: 700px) {
  dl.keyboard {
    grid-template-columns: repeat(8, 1fr);
  }
}
@media all and (min-device-width: 1200px) {
  dl.keyboard {
    grid-template-columns: repeat(12, 1fr);
  }
}

.tab8-inside * {
	     tab-size: 8 !important;
	-moz-tab-size: 8 !important;
}
</style>


#define POST012   <a href="012-debian-chromebook-lenovo-300e-gen2.html"><samp>012. Debian on the Lenovo 300e 2<sup>nd</sup>-gen arm64 Chromebook</samp></a>
#define POST012aC <samp>012a. Installing Debian on the Lenovo 300e 2<sup>nd</sup>-gen Chromebook (Intel)</samp>
#define POST012a  <a href="012a-installing-debian-chromebook-lenovo-300e-gen2-intel.html">POST012aC</a>

BLOGN_T_HEADING(012b. Debian on the Lenovo 300e 2<sup>nd</sup>-gen MTK arm64 Chromebook (hana) (real))


<p class="indented continued">
In POST012 I bought a laptop I thought was this one and in POST012a I <a href="//docs.chrultrabook.com">made it normal</a>.
Now I have a celeron laptop for some reason.
</p>
<p class="indented continuing">
Well, the reason is that Lenovo makes three identical laptops,
as listed by
#define ARCHIVE_LINK(new_href, original_href, ...) <a href=new_href>__VA_ARGS__</a><sup>[<abbr title="original version, archived">orig. arch.</abbr>]</sup>
ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/", "//web.archive.org/web/20231113233836/sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices", <cite>Chromium OS > <b>Developer Information for Chrome OS Devices</b></cite>):
</p>
<blockquote class="continuing">
  <dl class="continuing">
    <div style="text-align: right;"><dt style="text-align: initial;">Release</dt><dd>27 February 2019</dd><dd>1 March 2019</dd><dd>28 February 2020</dd></div>
    <div><dt>OEM</dt          ><dd>Lenovo</dd          ><dd>Lenovo</dd      ><dd>Lenovo</dd></div>
    <div><dt>Model</dt><dd    ><a href="//www.lenovo.com/us/en/laptops/lenovo/student-chromebooks/Lenovo-300e-Chromebook-2nd-Gen-MTK/p/88ELC1S9988">Lenovo 300e Chromebook 2nd Gen (MTK)</a></dd><dd><a href="//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/Lenovo%20300e%20Chromebook%202nd%20Gen%20(Intel)">Lenovo 300e Chromebook 2nd Gen (Intel)</a></dd><dd><a href="//www.lenovo.com/us/en/laptops/lenovo/student-chromebooks/Lenovo-300e-Chromebook-2nd-Gen-AST/p/88ELC1S8036">Lenovo 300e <span title='"Chromebook" ominously missing from the page, a clear mistake' class="spacing-only">Chromebook</span> 2nd Gen AMD</a></dd></div>
    <div><dt>Code name</dt    ><dd>Sycamore360</dd     ><dd>Phaser360</dd   ><dd>Treeya360</dd></div>
    <div><dt>Board name(s)</dt><dd>hana</dd            ><dd>Octopus</dd     ><dd>Grunt</dd></div>
    <div><dt>Base board</dt   ><dd>oak</dd             ><dd>octopus</dd     ><dd></dd></div>
    <div><dt>User ABI</dt     ><dd>arm</dd             ><dd>x86_64</dd      ><dd>x86_64</dd></div>
    <div><dt>Kernel</dt       ><dd>3.18</dd            ><dd>4.14</dd        ><dd>4.14</dd></div>
    <div><dt>Kernel ABI</dt   ><dd>aarch64</dd         ><dd>x86_64</dd      ><dd>x86_64</dd></div>
    <div><dt>Platform</dt     ><dd>MT8173</dd          ><dd>Gemini Lake</dd ><dd>Stoney Ridge</dd></div>
    <div><dt>Form Factor</dt  ><dd>Chromebook</dd      ><dd>Convertible</dd ><dd>Convertible</dd></div>
    <div><dt>First Release</dt><dd>R72</dd             ><dd>R72</dd         ><dd>R80</dd></div>
  </dl>
</blockquote>
<p class="continuing">
compare this to what Lenovo product pages call them:
</p>
<blockquote class="continuing">
  <dl class="continuing">
		<div><dt>Branding</dt><dd><a href="//www.lenovo.com/us/en/p/laptops/lenovo/lenovo-edu-chromebooks/lenovo-300e-chromebook-2nd-gen-mtk/88elc1s9988">300e Chromebook 2nd Gen (11.6") Laptop</a></dd><dd><a href="//www.lenovo.com/us/en/p/laptops/lenovo/lenovo-edu-chromebooks/300e-chromebook-2nd-gen-(11.6-inch)-laptop/len101l0001">300e Chromebook 2nd Gen (11.6") Laptop</a></dd><dd><a href="//www.lenovo.com/us/en/p/laptops/lenovo/lenovo-edu-chromebooks/lenovo-300e-chromebook-2nd-gen-ast/88elc1s8036">300e Chromebook 2nd Gen (11.6”, AMD)</a></dd></div>
		<div><dt>Google summary and "product not available" popup</dt><dd>Lenovo 300e Chromebook (2nd Gen, MTK)</dd><dd>300e Chromebook 2nd Gen (11.6"<!--"-->) Laptop</dd><dd>New Lenovo Chromebook 300e</dd></div>
		<div><dt>P/N</dt><dd><a href="//psref.lenovo.com/syspool/Sys/PDF/Lenovo/Lenovo_300e_Chromebook_2nd_Gen_MTK/Lenovo_300e_Chromebook_2nd_Gen_MTK_Spec.PDF">81QC</a></dd><dd><a href="//psref.lenovo.com/syspool/Sys/PDF/Lenovo/Lenovo_300e_Chromebook_2nd_Gen/Lenovo_300e_Chromebook_2nd_Gen_Spec.pdf">81MB</a></dd><dd><a href="//psref.lenovo.com/syspool/Sys/PDF/Lenovo/Lenovo_300e_Chromebook_2nd_Gen_AST/Lenovo_300e_Chromebook_2nd_Gen_AST_Spec.pdf">82CE</a></dd></div>
		<div><dt>Processor</dt><dd>MediaTek™ 8173C (2.10GHz)</dd><dd>Intel® Celeron® N4020 Processor (…)</dd><dd>7th Generation AMD A4-9120C APU (…)</dd></div>
	</dl>
</blockquote>
<p class="continuing">
and to what the bottom stickers and the "Product Specification References" (the PDFs you get in Tech Specs, More Information) call them:
</p>
<blockquote class="continuing">
  <dl class="continuing">
		<div><dt>Sticker</dt><dd>Lenovo 300e Chromebook 2nd Gen MTK</dd           ><dd>Lenovo 300e Chromebook 2nd Gen</dd><dd>Lenovo 300e Chromebook 2nd Gen AST</dd></div>
		<div><dt>PSRef</dt  ><dd>Lenovo 300e Chromebook 2<sup>nd</sup> Gen MTK</dd><dd>Lenovo 300e Chromebook 2nd Gen</dd><dd>Lenovo 300e Chromebook 2nd Gen AST</dd></div>
	</dl>
</blockquote>
<p class="indented continuing">
This <em>has</em> to be actively-malicious behaviour on Lenovo'<!--'-->s part.
I bought my Intel (sorry, my ) 300e thinking it were the MTK one becuase it was listed thusly.
The sticker didn't specify any variant, but it's the first from the series so that added up.
The seller had listed it as that because the <em>only</em> Google result for "Lenovo 300e Chromebook 2nd Gen" is the MTK-variant product page,
there's no way she could've known.
The ‌ variant appears to be absolute search engine poison. Or deduplicated away. Or whatever.
</p>
<p class="indented continuation">
Also, I don'<!--'-->t know where the ChromiumOS page got the parens around the variant designator from, or the "Intel",
but they were crucial in fooling me, personally.
</p>

<p class="indented">
In an obverse vein, the "Acer Chromebook R13" (which was also under consideration this time)
is a <a href="//allegrolokalnie.pl/oferta/acer-cb5312t-chromebook-133-ips-fullhd-464gb">real product</a>
that the ChromiumOS page also knows about,
and Acer seems to entirely and wholly deny having ever produced it – there is no mention of it on acer.com, and Google returns second-hand re-sellers exclusively.
</p>

<p class="indented continued">
Regardless, the search space is thus narrowed considerably,
because any listing that doesn'<!--'-->t show a clear, in-focus, readable, un-painted-over view of the bottom sticker, at least enough to make out "MTK", is right out.
This means I may'<!--'-->ve missed out on some deals,
but at time of writing there'<!--'-->s all of 5 working arm64 Chromebooks in Poland for a reasonable price (defined as a hard ≤200zł (≤46€) filter).
</p>
<p class="indented continuation">
On 2024-01-11 I bought the titular laptop for 149+10.95zł (70+22zł for one with a busted-ass screen; resp. 36.78€ and 21.15€; resp. 18.5kg and 10.6kg of kefir)
for the same reason as in POST012 – as an arm64-with-CRC32 testbed.
</p>

<p class="indented continued">
This continues to be primarily precipitated by <a href="//media.ccc.de/v/37c3-11929-turning_chromebooks_into_regular_laptops">the chrultrabook talk</a>,
and naturally it continues to be impossible to install Debian traditionally on ARM Chromebooks.
#define INSTALLINGDEBIANON_SAMSUNG_ARMCHROMEBOOK <cite><a href="//wiki.debian.org/InstallingDebianOn/Samsung/ARMChromebook">InstallingDebianOn/Samsung/ARMChromebook</a></cite>
Like INSTALLINGDEBIANON_SAMSUNG_ARMCHROMEBOOK
and <cite><a href="//archlinuxarm.org/platforms/armv7/samsung/samsung-chromebook-2">Samsung Chromebook 2</a></cite>,
this is "running debian on the chromebook from the μ<span class="smallcaps">sd</span> card, and also you can »install« by properly arranging and copying to the internal flash",
even though both of them do say they're "installing" on the device when they aren't.
Which is why POST012a had "install" in the title and this doesn'<!--'-->t.
</p>
<p class="indented continuation">
Hopefully,
instead of using unprecedented-in-the-text shell programs and methodologies that definitely make sense to the authors at the time to construct the images,
I can demonstrate the final state itself (god forbid!) as well as the basis for the steps taken with no leaps of logic,
so this can serve as more useful documentation.
</p>


HEADING(2, jpeg, no nooo my nose cam noooooo)

<div class="side-by-each-inside continued">
	   <a href="/content/assets/blogn_t/012b.02-DSC_0970cvcc.jpg"><img class="continued" alt="Chromebook open flat; there's a camera and a glaring white sticker above the screen; the keyboard itself is english and decroted: there are two extrmely wide keys to the left of the space bar (ctrl and alt), the ISO enter is half a key thin, the caps lock has a 🔍 on it, and the top row has an esc key, then a series of 11 icons" src="/content/assets/blogn_t/012b.02-DSC_0970cvcc.jpg"></a><!--
	--><a href="/content/assets/blogn_t/012b.03-DSC_0969cvcc.jpg"><img class="continuation" alt="Chromebook open flat, bottom side up: there's two more stickers over screws in the bottom panel, and a yellow barcode beow the product sticker; the top panel has both a chrome wordmark and logo, and a Lenovo wordmark in inverse colours; the hinges are beat to hell" src="/content/assets/blogn_t/012b.03-DSC_0969cvcc.jpg"></a>
</div>
<p class="indented continuing">
Here we can see some obvious <a href="012-debian-chromebook-lenovo-300e-gen2.html">physical differences</a>
between these supposedly-identical laptops (barring the warranty/service seals glued to the screen):
on the english keyboard, <kbd>⟵</kbd> is actually labelled <kbd>backspace</kbd>, <kbd>⇥</kbd> – <kbd>tab</kbd>, and <kbd>⇧</kbd> – <kbd>shift</kbd>.
</p>
<p class="indented continuation">
Most importantly, however: there's no nose cam. What's the point of a laptop, then, honestly.
</p>

<a href="/content/assets/blogn_t/012b.04-DSC_0974+0976.jpg"><img class="continued" alt="the hinge-corner of the chromebook on its side. both halves have holes out and are thick, implying both halves are the keyboard half" src="/content/assets/blogn_t/012b.04-DSC_0974+0976.jpg"></a>
<p class="indented continuing">
And this demonstrates a significant consumer-affecting difference, in that the holes are just different:
</p>
<dl class="continuing">
	<div><dt>81MB Left</dt ><dd>USB-C charging</dd ><dd>USB-A 3</dd             ><dd>μSD card</dd  ><dd>3.5mm TRRS</dd></div>
	<div><dt>81QC Left</dt ><dd>USB-C charging</dd ><dd>HDMI</dd                ><dd>USB-A 3</dd   ><dd>SD card</dd></div>
	<div><dt>81MB Right</dt><dd>Kensington lock</dd><dd>USB-C</dd               ><dd>USB-A 3</dd   ><dd>power/volume buttons</dd></div>
	<div><dt>81QC Right</dt><dd>Kensington lock</dd><dd>power/volume buttons</dd><dd>3.5mm TRRS</dd></div>
</dl>
<p class="continuation">
So this full-size computer somehow has only as much I/O as my <a href="//lfs.nabijaczleweli.xyz/0017-twitter-export/#1324083127128596481">palmtop</a>?
</p>

#define THE_LISTING <a href="//allegro.pl/oferta/lenovo-chromebook-300e-2gen-11-6-mediatek-4gb-32gb-dotyk-czarny-a109-14794069921">the listing</a>
<p class="continued indented">
The label does agree with THE_LISTING that it'<!--'-->s MTK:
</p>
<!--"--><a href="/content/assets/blogn_t/012b.01-label.jpg"><img class="continuing" alt="the product sticker from the bottom panel:
Lenovo 300e Chromebook 2nd Gen MTK

Model Name (型號):81QC
INPUT (電壓/電流):15V DC 3A
Mfg Date:19/09/02
S/N:P206RP16  MTM:81QC0004UK
Manufactured for Lenovo
Made in China 中國製造
MO:P2N0B9902007    Factory ID: HFBITLAND" src="/content/assets/blogn_t/012b.01-label.jpg"></a><!--"-->
<p class="continuation">
Incredible pog moment.
</p>


<p class="indented continued">
It appears that I'<!--'-->m pre-
</p>
HEADING_S(2, jailbroke, class="continuing", saved from chromium (chrome os (chromium os(?))))
<p class="continuing">
because it booted to the developer mode warning screen that <a href="012-debian-chromebook-lenovo-300e-gen2.html#jailbreak">took 400 words last time</a> –
</p>
<a href="/content/assets/blogn_t/012b.05-DSC_0973ccvc.jpg"><img class="continuing" alt="Title line: chrome, English; Main body: OS verifications is OFF Press SPACE to re-enable.; Footer: For help visit https://google.com/chromeos/recovery  Model HANA I4A-C2S-A6I-A66-B2U-Q3T" src="/content/assets/blogn_t/012b.05-DSC_0973ccvc.jpg"></a>
<p class="continuing">
– where two things stand out:
the serial number is one triplet shorter (the Intel one had 7),
and it says "Model: HANA".
</p>
<p class="indented continuing">
One may recall from POST012 and from the tables quoted at the top of this page that the Intel-processor laptop
<a href="012-debian-chromebook-lenovo-300e-gen2.html#jailbreak">said</a> "Model: PHASER360".
At the time I'<!--'-->d been <a href="//101010.pl/@nabijaczleweli/111716821211949630">expecting</a> "Sycamore360",
but due to the nomenclature scam "Phaser360" made sense.
</p>
<p class="indented continuing">
<a href="//docs.chrultrabook.com/docs/firmware/system-info.html#recovery-mode">Chrultrabook</a>
says this should be the board name, and lists Phaser360 as the board name for the 2<sup>nd</sup>-gen Intel 300e,
which disagrees with the ChromiumOS-branded documentation but is internally consistent.
Google-official <cite><a href="//support.google.com/chromebook/answer/1080595#zippy=step-download-a-new-copy-of-the-os">Chromebook Help, Recover your Chromebook, Recovery option 2: Use USB drive, Step 2: Download a new copy of the OS</a></cite> says
</p>
<blockquote class="continuing">
	<ol style="padding-left: 1em;" start=4>
		<li>Click <strong>Select a model from a list</strong>, or type in the model number of the Chromebook you want to recover. To find this number, look at the bottom of the error message on your Chromebook screen.</li>
	</ol>
</blockquote>
<p class="continuation">
and "model number" per se doesn'<!--'-->t appear anywhere else.
So everything is, as usual, at odds.
</p>

<p class="indented">
The "hana" board name appears to be shared between 9 identical devices
(the <a href="//www.asus.com/Laptops/ASUS-Chromebook-C202XA/">"telesu" ASUS one</a> uses a "hana" "Base board",
 all others use "oak". these appear to be unrelated hanas)
released between 2017-03-17 and 2019-12-27, which includes <q>300e</q> (first-gen), <q>300e 2nd Gen</q>, and <q>100e 2nd Gen</q> Lenovos.
There appears to be no first-generation ARM 100e variant (the Intel and AMD ones are in full swing).
This is your brain on products.
</p>

<p class="indented continued">
This is all the more weird because THE_LISTING proclaims it used, <q><b>✅Bios</b> - Ok</q>(? shit don'<!--'-->t got one, brother)
and <q lang="pl"><abbr title="Signs of use"><b>ŚLADY UŻYTKOWANIA</b></abbr></q>,
but doesn't mention anything that would imply it's in developer mode.
Maybe this was done as a reset step, but there are easier and better-documented ways to do this.
Especially since the only thing attached to the laptop in the box, beside the seals,
was a long
<q style="text-transform: uppercase; font-weight: bold; font-family: Roboto, sans-serif;">Any modifications to the software or hardware, including attempted service, void your right to a return!</q>
spiel, which wouldn'<!--'-->t go well for me if I were to return it in such an overtly-"modified" state probably.
</p>
<p class="indented continuation">
It also tries to spin
<q lang="pl"><abbr title="Battery holds minimum 1h"><b>✅Bateria trzyma minimalnie 1h</b></abbr></q> as
<q lang="pl"><abbr title="batteries checked under load">baterie sprawdzamy pod obciążeniem</abbr></q>
but one has to wonder how this could be done to a machine in freshly-triggered developer mode.
</p>

<p class="indented">
So with the innards appearing to be <em>some</em> ARM board, and a manually-confirmed boot 🙄 the magical OOBE control doesn't appear to've been clicked,
and clicking through it and through the root passphrase popup was so mindless and indistinguishable from
<a href="012-debian-chromebook-lenovo-300e-gen2.html#jailbreak">the last time</a> I forgot to shoot jpegs.
Except that the throbbers appear to be embedded videos instead of animations, but.
</p>


HEADING(2, HFBITLAND, <span class="smallcaps">hfbitland</span>)

<a href="/content/assets/blogn_t/012b.06-DSCN0564cvcc.png"><img alt='shell session, incl. uname output with version "4.19.272-14690-..." and architecture "aarch64", lscpu which notes 4 CPUs, of which two "ARM" "Cortex-A53" and two "ARM" "Cortex-A72", all CPUs have crc32' src="/content/assets/blogn_t/012b.06-DSCN0564cvcc.png"></a>

#define PATH(...) <samp class="path">__VA_ARGS__</samp>
<p class="continued"></p>
<div class="indented">
<p style="display: inline">
Beside the similarly-decroted kernel version, note how this doesn'<!--'-->t actually say what the CPU… is? Like its self-branding?
Apparently this information doesn'<!--'-->t exist in the CPU, or exists only to the extent of the same two integers that PATH(/proc/cpuinfo) shows –
</p>
<dl class="continuation linear">
  <dt><tt>CPU implementer</tt></dt> <dd><tt>0x41</tt></dd>
  <dt><tt>CPU part</tt></dt>        <dd><tt>0xd03</tt></dd> <dd><tt>0xd08</tt></dd>
</dl>
<p class="continuing" style="display: inline">
– and you (<a href="//github.com/util-linux/util-linux/pull/564/files#diff-77cdd0e3676b5148cbe3c706a0ebf616efad2424c3cbf39b5ef4e6015546915e">or <code>lscpu</code></a>) can look them up in a table.
</p>
</div>
<p class="indented continuing">
The best approximation of a CPU/device ID I found in PATH(/proc/device-tree/compatible), which listed
<tt>google,hana-rev{6,5,4,3,2,1}</tt>, <tt>google,hana</tt>, and <tt>mediatek,mt8173</tt>.
Note the lack of Lenovo's <strong>C</strong> after the model. I haven't found it attested anywhere in proc/sysfs.
</p>
<p class="indented continuing">
The only product-level branding I found in PATH(/sys/firmware/vpd/ro/)
(ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-arm-chromebook/", "//web.archive.org/web/20240207142155/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook", <q>Vital/Vendor Product Data</q>) – yes, the documentation can'<!--'-->t decide)
as PATH(model_name):
"<tt>Lenovo 300e Chromebook 2nd Gen MTK</tt>" (which miraculously agrees with Lenovo'<!--'-->s marketing and the outside!),
and PATH(customization_id) matching the ChromiumOS "Code name" with "<tt>OEM1-SYCAMORE360</tt>".
</p>
<p class="indented continuation">
There'<!--'-->s also 64 bytes of hex in a PATH(stable_device_secret_DO_NOT_SHARE) in there. idk why. funny, though
</p>

<p class="indented">
Another model difference is that on the Intel platform the μSD card slot showed up as SCSI (undoubtedly through a USB adapter)
and on this one it'<!--'-->s an MMC device, as it ought to be.
Oh and the tactiles of plugging the SD card are so ass I thought it was broken before looking at the hotplugs in the dmesg.
</p>
<p class="indented">
I'<!--'-->d <a href="012-debian-chromebook-lenovo-300e-gen2.html#HFBITLAND">complained</a> that no Home/End is agony, and it is,
but I must not'<!--'-->ve tried <kbd>🔍</kbd> and <kbd>˂</kbd> or <kbd>˃</kbd>, which does just that.
</p>


HEADING(2, bootloader, Me loading: Haha fuck yeah!!! Yes!! Me booting: Well this fucking sucks. What the fuck.)

<p class="indented continued">
Following the <a href="012-debian-chromebook-lenovo-300e-gen2.html#HFBITLAND">instruxions from PATH(/etc/issue)</a>:
</p>
<blockquote class="continuing" style="white-space: pre-wrap;"><tt>\
If you are having trouble booting a self-signed kernel, you may need to
enable USB booting.<!--"-->  <!--"-->To do so, un the following as root:
<!---->
enable_dev_usb_boot\
</tt></blockquote>
<p class="continuing">yielded</p>
<div class="bigcode">
#include "blogn_t/012b.01-usb-boot.shell-session.html"
</div>
<p class="continuing">
and it do b honkin
</p>
<video class="continuing" controls width=640><source src="/content/assets/blogn_t/012b.07-DSC_0984_8.mp4" type="video/mp4"><a href="/content/assets/blogn_t/012b.07-DSC_0984_8.mp4">Chromebook being powered on and the white recovery screen coming up; <kbd>ctrl</kbd>+<kbd>u</kbd> is pressed a few times, each time generating a harsh buzz and darkening the screen for half a second.</a></video>
<p class="continuation">
which one has to assume is good, given the lack of priors in this domain.
</p>

<p class="indented continued">
To validate this suspicion, I consulted PATH(/sys/firmware/log) which identifies itself ас
"<tt>coreboot-81de43c Mon Mar 19 23:11:07 UTC 2018 bootblock starting...</tt>",
and previously the sexion headed by
"<tt>Starting depthcharge on hana...</tt>"
had
</p>
<pre class="continuing language-plaintext" style="position: relative;"><code class="language-plaintext">\
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/new.log"><aside>full /sys/firmware/log</aside></a>\
VbAudioOpen() - note count 5
VbBootDeveloper() - user pressed Ctrl+D; skip delay
VbBootDeveloper() - trying fixed disk
VbTryLoadKernel() start, get_info_flags=0x2
VbTryLoadKernel() found 1 disks
VbTryLoadKernel() trying disk 0
GptNextKernelEntry looking at new prio partition 2
GptNextKernelEntry s1 t0 p2
GptNextKernelEntry looking at new prio partition 4
GptNextKernelEntry s1 t0 p1
GptNextKernelEntry looking at new prio partition 6
GptNextKernelEntry s0 t15 p0
GptNextKernelEntry likes partition 2
Found kernel entry at 20480 size 32768
Checking key block signature...
<!--"-->   - sig_size=512, expecting 512 for algorithm 8<!--"-->
In RSAVerify(): Padding check failed!
In RSAVerify(): Hash check failed!
Invalid key block signature.\
</code></pre>
<p class="continuing">
whereas now it saw the prefix of
</p>
<pre class="continuation language-plaintext" style="position: relative;"><code class="language-plaintext">\
<span class="token comment">VbAudioOpen() - note count 5</span>
VbBootDeveloper() - user pressed Ctrl+U; try USB
vboot_draw_screen: screen=0x0 locale=3
VbTryLoadKernel() start, get_info_flags=0x1
VbTryLoadKernel() found 1 disks
VbTryLoadKernel() trying disk 0
Primary GPT header is invalid
Secondary GPT header is invalid
Unable to read GPT data
VbTryLoadKernel() LoadKernel() = 65551
VbSetRecoveryRequest(91)
VbBootDeveloper() - no kernel found on USB
rt5645_device_init completed, codec = 5650
VbSetRecoveryRequest(0)
vboot_draw_screen: screen=0x101 locale=3
<span class="token comment">VbBootDeveloper() - user pressed Ctrl+D; skip delay</span>\
</code></pre>
<p class="continuation">
and presumably the screen being <var>0</var> is why it flashes black.
</p>

<p class="indented continued">
I can'<!--'-->t seem to find, like, first-party documentation about what a "valid" header would be.
Well, about what this bootloader looks for, in any way whatever.
It's either upstream's
ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-arm-chromebook/#usb-boot", "//web.archive.org/web/20240207142155/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook#TOC-USB-Boot", <q>Note: Only CrOS formatted images will boot via USB. Other Linux distros will not work.</q>)
(abject lie as proven by the guides)
or the guides which are "do this".
</p>
<p class="indented continuing">
Though, actually, it does seem like, for that laptop exclusively,
ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-arm-chromebook/#boot-sequence", "//web.archive.org/web/20240207142155/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook#TOC-Boot-Sequence", <cite>Chromium OS > Developer Information for Chrome OS Devices > <b>Samsung ARM Chromebook</b>, <b>Firmware</b>, <b>Boot Sequence</b></cite>)
reads:
</p>
<blockquote class="continuation">
	<ul style="padding-left: 1em;">
		<li>power on</li>
		<li>the CPU will execute u-boot from the read-only on-board SPI flash</li>
		<li>u-boot will look at the GPT layout on the 16 GiB SSD (connected via eMMC)
		    <ul><li>search for the firmware partition marked active and try to boot the u-boot that lives there</li></ul></li>
		<li>u-boot will look at the GPT layout</li>
		    <ul><li>search for the Linux kernel partition marked active and try to boot the kernel that lives there</li></ul></li>
		<li>Linux kernel boots from its corresponding rootfs partition</li>
		<li>profit!</li>
	</ul>
</blockquote>

<p class="indented continued">
Out of the 30 internal links from the
ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/", "//web.archive.org/web/20231113233836/sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices", device table)
(discounting those that don'<!--'-->t work or redirect),
</p>
<details>
	<summary>11 note anything about USB-booting</summary>
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/acer-ac700-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/acer-ac700-chromebook", <cite>Acer AC700 Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/acer-c720-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/acer-c720-chromebook", <cite>Acer C720 & C720P & C740 Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/asus-chromebox", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/asus-chromebox", <cite>Asus Chromebox</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/chromebook-pixel-2015", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/chromebook-pixel-2015", <cite>Chromebook Pixel (2015)</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/cr-48-chrome-notebook-developer-information", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/cr-48-chrome-notebook-developer-information", <cite>Cr-48 Chrome Notebook Developer Information</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/lenovo-thinkpad-x131e-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/lenovo-thinkpad-x131e-chromebook", <cite>Lenovo Thinkpad X131e Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-series-5-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-series-5-chromebook", <cite>Samsung Series 5 Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/acer-cb5-311-chromebook-13", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/acer-cb5-311-chromebook-13", <cite>Acer CB5-311 Chromebook 13</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-chromebook-2", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-chromebook-2", <cite>Samsung Chromebook 2</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/hp-chromebox", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/hp-chromebox", <cite>HP Chromebox</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-arm-chromebook/", "//web.archive.org/web/20240207142155/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook", <cite>Samsung ARM Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-sandy-bridge", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-sandy-bridge", <cite>Samsung Series 5 550 Chromebook and Series 3 Chromebox</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/chromebook-pixel", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/chromebook-pixel", <cite>Chromebook Pixel (2013)</cite>)
</details>

<details>
	<summary>3 have a <b>How to boot your own image from USB</b> sexion (mentions ChromiumOS images exclusively)</summary>
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/acer-ac700-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/acer-ac700-chromebook", <cite>Acer AC700 Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-series-5-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-series-5-chromebook", <cite>Samsung Series 5 Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-sandy-bridge", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-sandy-bridge", <cite>Samsung Series 5 550 Chromebook and Series 3 Chromebox</cite>)
</details>

<details>
	<summary>3 have a similar <b>Running Chromium OS</b> sexion identified with <q>Before you start fiddling with your own builds it is strongly recommend to</q>(sic!) (mentions ChromiumOS images exclusively)</summary>
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/acer-c720-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/acer-c720-chromebook", <cite>Acer C720 & C720P & C740 Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/asus-chromebox", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/asus-chromebox", <cite>Asus Chromebox</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/hp-chromebox", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/hp-chromebox", <cite>HP Chromebox</cite>)
</details>

<details>
	<summary>3 (two other) ARM chromebooks have the <em>entire</em> <b>Developer Mode</b> sexion <em>identical</em> (with the abject lie)</summary>
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-arm-chromebook/", "//web.archive.org/web/20240207142155/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook", <cite>Samsung ARM Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-chromebook-2", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-chromebook-2", <cite>Samsung Chromebook 2</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/acer-cb5-311-chromebook-13", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/acer-cb5-311-chromebook-13", <cite>Acer CB5-311 Chromebook 13</cite>)
</details>

<details>
	<summary>3 laptops have another set of identical <b>Developer Mode</b>s (no mention of how or what you can boot)</summary>
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/acer-c720-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/acer-c720-chromebook", <cite>Acer C720 & C720P & C740 Chromebook</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/chromebook-pixel", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/chromebook-pixel", <cite>Chromebook Pixel (2013)</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/chromebook-pixel-2015", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/chromebook-pixel-2015", <cite>Chromebook Pixel (2015)</cite>)
</details>

<details>
	<summary>2 "chromeboxes" have another set of identical <b>Developer Mode</b>s (no mention of how or what you can boot)</summary>
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/asus-chromebox", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/asus-chromebox", <cite>Asus Chromebox</cite>)
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/hp-chromebox", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/hp-chromebox", <cite>HP Chromebox</cite>)
</details>

<details>
	<summary>all <b>Developer Mode</b> sexions are habsburgian, but this device has <q>unique requirements for entering recovery mode!</q>, so it'<!--'-->s the most different one</summary>
	ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/lenovo-thinkpad-x131e-chromebook", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/lenovo-thinkpad-x131e-chromebook", <cite>Lenovo Thinkpad X131e Chromebook</cite>)
</details>

<p class="continuing">
and
ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/cr-48-chrome-notebook-developer-information", "//web.archive.org/web/20180801221915/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/cr-48-chrome-notebook-developer-information", <cite>Cr-48 Chrome Notebook Developer Information</cite>)
is the oldest, so it actually has an itemised guide called <b>How to boot your own (non-Chromium OS) image from USB</b> which nonetheless starts with
<q>(Note: This part is outdated: <samp>make_developer_script_runner.sh</samp> does not exist anymore)</q>.
Even then, a sub-<b>Create a USB disk that will boot another operating system</b>-sexion consists exclusively of
</p>
<blockquote class="continuing" style="white-space: pre-wrap;">\
TODO: This should be possible for someone skilled in the art of Linux.<!--"-->  <!--"-->The above instructions tell you how to run any arbitrary Linux program, and (with root access) you should be able to do pretty much anything you want.
<!---->
It would be nice to get some good instructions here, though.\
</blockquote>
<p class="continuing">
which actually makes sense, since the "How to" sexion doesn'<!--'-->t actually appear to do anything?
except download a "<tt>mario_recovery_kernel</tt>"(‽) from a Google CDN,
prepare an <code>exec sh</code> "developer script", and combine them it into a ChromeOS-equivalent image?
which sure as hell doesn'<!--'-->t look like <q>non-Chromium OS</q>.
</p>
<p class="indented continuation">
Naturally <em>two</em> different ways to make an actual ChromiumOS image are outlined, in spite of the page linking to the developer documentation constantly.
</p>

<p class="indented continued">
Even out of our lucky trio, the
ARCHIVE_LINK("//www.chromium.org/chromium-os/developer-library/reference/development/developer-information-for-chrome-os-devices/samsung-arm-chromebook/", "//web.archive.org/web/20240207142155/https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook", <cite>Samsung ARM Chromebook</cite>)
is the only one with the bullet list.
Even then, how are you supposed to interpret it?
How can a partition be marked "active"?
Is the "Linux kernel partition" actually "ChromeOS kernel"<small> (<tt>FE3A2A5D-4F32-41A7-B725-ACCC3285A309</tt>)</small>,
the only <code>kernel</code>-matching UUID bookworm fdisk knows about?
Assuming the image has to support the Linux boot protocol, what parameters does it pass?
Are there any other restrixions?
</p>
<p class="indented continuing">
The SD card I put in to test was actually MBR-formatted, so this probably explains why "{Primary,Secondary} GPT header is invalid".
Indeed, re-making it as GPT (with the only partition being a VFAT "Linux filesystem"<small> (<tt>0FC63DAF-8483-4772-8E79-3D69D8477DE4</tt>)</small> to copy logs to),
I got:
</p>
<pre class="continuing language-plaintext"><code class="language-plaintext">\
<span class="token comment">VbBootDeveloper() - user pressed Ctrl+U; try USB
VbTryLoadKernel() trying disk 0</span>
GptNextKernelEntry no more kernels
<span class="token comment">VbTryLoadKernel() LoadKernel() = 65551
VbSetRecoveryRequest(91)
VbBootDeveloper() - no kernel found on USB</span>\
</code></pre>
<p class="indented continuing">
Amazing, incredible, it <em>enumerated</em> no kernels this time.
Emboldened by this, I made two kernel partitions, one with the flag it hints at (it's wrong of course, "active partitions" are an MBR thing), accd'g to fdisk:
</p>
<pre class="continuing language-plaintext"><code class="language-plaintext"><!--
    "-->Device         Size Type              Name Attrs<!--"-->
<!--"-->/dev/mmcblk1p1 200M Linux filesystem<!--"-->
<!--"-->/dev/mmcblk1p2  30M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk1p3  30M ChromeOS kernel        LegacyBIOSBootable<!--"
--></code></pre>
<p class="indented continuing">
and rebooting
</p>
<pre class="continuing language-plaintext"><code class="language-plaintext">\
<span class="token comment">VbTryLoadKernel() trying disk 0</span>
GptNextKernelEntry looking at new prio partition 2
GptNextKernelEntry s0 t0 p0
GptNextKernelEntry looking at new prio partition 3
GptNextKernelEntry s0 t0 p0
GptNextKernelEntry no more kernels
<span class="token comment">VbTryLoadKernel() LoadKernel() = 65551</span>\
</code></pre>
<p class="continuation">
and the flag doesn'<!--'-->t appear to change anything, neither the iteration order nor the solaris-disk-lookin-ass statussies.
(rember that it "likes" internal <span class="smallcaps">mmc</span> partition 2 with "<tt>s1 t0 p2</tt>")
</p>

<p class="indented continued">
Just copying an arm64 kernel doesn'<!--'-->t work. Not altogether unexpected, given that PATH(mmcblk0p2) starts with
</p>
<blockquote class="continuing"><pre class="continuing" style="white-space: pre-wrap;"><!--"-->000000 43 48 52 4f 4d 45 4f 53 02 00 00 00 01 00 00 00  >CHROMEOS........&lt;<!--"--></pre></blockquote>
<p class="continuing">
(with an obvious 64k initial block boundary) and binwalk finds an LZ4 blob at <var>0x100C8</var> which decompresses to a kernel image.
</p>
<p class="indented continuation">
This puts the "search for the Linux kernel" paragraph at an 0/2 –
the legacy-bootable flag doesn'<!--'-->t do anything,
and the partition contains a ChromeOS boot bundle, not a kernel.
</p>

<p class="indented continuing">
Not altogether helpful, except I can grep out the full branding string –
</p>
<pre class="continuing" style="white-space: pre-wrap;">Linux version 4.19.272-14690-gda0c1392f4b0 (chrome-bot@chromeos-release-builder-us-central1-b-x32-59-cvr8) (Chromium OS 16.0_pre475826_p20230103-r7 clang version 16.0.0 (/var/tmp/portage/sys-devel/llvm-16.0_pre475826_p20230103-r7/work/llvm-16.0_pre475826_p20230103/clang 11897708c0229c92802e747564e7c34b722f045f)) #1 SMP PREEMPT Sun Apr 16 19:38:55 PDT 2023</pre>
<p class="indented continuation">
Which is somehow 2023-04 on this 2019 laptop? And a ChromiumOS prelease? Maybe this is why it was in developer mode.
</p>


HEADING_S(2, kernal, class="continued", how is <del>pointar formed</del> kernal loaded?)
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext" id="resort"><!--
    "--><span class="token keyword"><small>Device  </small>     Start  Sectors Size Type                  Name       Attrs</span><!--"-->
<div><!--"                       --><small>mmcblk0p</small>11      64    16384   8M unknown               RWFW       Type-UUID=<small>CAB6E88E-ABF3-4102-A07A-D4BB9BE3C1D3</small><!--"-->
<!--"                            --><small>mmcblk0p</small>6    16448        1 512B ChromeOS kernel       KERN-C     GUID:52,53,54,55<!--"-->
<!--"                            --><small>mmcblk0p</small>7    16449        1 512B ChromeOS root fs      ROOT-C<!--"-->
<!--"                            --><small>mmcblk0p</small>9    16450        1 512B ChromeOS reserved     reserved<!--"-->
<!--"                            --><small>mmcblk0p</small>10   16451        1 512B ChromeOS reserved     reserved<!--"-->
<!--"                            --><small>mmcblk0p</small>2    20480    32768  16M ChromeOS kernel       KERN-A     GUID:49,56<!--"-->
<!--"                            --><small>mmcblk0p</small>4    53248    32768  16M ChromeOS kernel       KERN-B     GUID:48,56<!--"-->
<!--"                            --><small>mmcblk0p</small>8    86016    32768  16M Microsoft basic data  OEM<!--"-->
<!--"                            --><small>mmcblk0p</small>12  249856    65536  32M EFI System            EFI-SYSTEM LegacyBIOSBootable<!--"-->
<!--"                            --><small>mmcblk0p</small>5   315392  4194304   2G ChromeOS root fs      ROOT-B<!--"-->
<!--"                            --><small>mmcblk0p</small>3  4509696  4194304   2G ChromeOS root fs      ROOT-A<!--"-->
<!--"                            --><small>mmcblk0p</small>1  8704000 52359120  25G Microsoft basic data  STATE<!--"
--></div><div class="off"><!--"  --><small>mmcblk0p</small>1  8704000 52359120  25G Microsoft basic data  STATE<!--"-->
<!--"                            --><small>mmcblk0p</small>2    20480    32768  16M ChromeOS kernel       KERN-A     GUID:49,56<!--"-->
<!--"                            --><small>mmcblk0p</small>3  4509696  4194304   2G ChromeOS root fs      ROOT-A<!--"-->
<!--"                            --><small>mmcblk0p</small>4    53248    32768  16M ChromeOS kernel       KERN-B     GUID:48,56<!--"-->
<!--"                            --><small>mmcblk0p</small>5   315392  4194304   2G ChromeOS root fs      ROOT-B<!--"-->
<!--"                            --><small>mmcblk0p</small>6    16448        1 512B ChromeOS kernel       KERN-C     GUID:52,53,54,55<!--"-->
<!--"                            --><small>mmcblk0p</small>7    16449        1 512B ChromeOS root fs      ROOT-C<!--"-->
<!--"                            --><small>mmcblk0p</small>8    86016    32768  16M Microsoft basic data  OEM<!--"-->
<!--"                            --><small>mmcblk0p</small>9    16450        1 512B ChromeOS reserved     reserved<!--"-->
<!--"                            --><small>mmcblk0p</small>10   16451        1 512B ChromeOS reserved     reserved<!--"-->
<!--"                            --><small>mmcblk0p</small>11      64    16384   8M unknown               RWFW       Type-UUID=<small>CAB6E88E-ABF3-4102-A07A-D4BB9BE3C1D3</small><!--"-->
<!--"                            --><small>mmcblk0p</small>12  249856    65536  32M EFI System            EFI-SYSTEM LegacyBIOSBootable<!--"
--></div></code></pre></div>
<button class="continuation" id="resort_button" onclick='resort.children[1].classList.toggle("off"); resort.children[2].classList.toggle("off"); resort_button.innerText = resort.children[1].classList.contains("off") ? "Sort" : "Unsort";';>Unsort</button>

<p class="indented continued">
This is how the internal flash is partitioned,
Shockingly, this just about matches the layout I saw in POST012a,
but notice how the logical partitions are in, effectively, random order.
</p>
<p class="indented continuing">
A few things jump out here:
the four <var>1</var>-sector parts are all zero-filled.
Why aren'<!--'-->t they simply Not There? who knows.
</p>
<p class="indented continuing">
Partition 8 (<tt><q>OEM</q></tt>) is a completely empty ext4, mounted on PATH(/usr/share/oem) under ChromeOS.
The purpose of this is similarly unclear.
</p>
<div class="indented">
<p style="display: inline">
Partition 11 is of a type unknown to the fdisk <em>distributed with the system</em>.
The <a href="//chromium.googlesource.com/chromiumos/docs/+/d5eefaba799595d6cd302de047325ca8295dd87e/disk_format.md">only non-forum non-code Google result</a>
(note also how it'<!--'-->s to-a-commit instead of <tt>main</tt> which reads, to me, like "no public links to this at all")
for the UUID calls it <q>ChromeOS firmware</q>.
I'<!--'-->ve <a href="//lore.kernel.org/util-linux/r3td5hqd23d4li67qtnkodkffgsduh6tehvek2kibz3yeizpck@tarta.nabijaczleweli.xyz/t/#u">taken the liberty</a>
to teach fdisk about this
(made significantly more annoying by the userland being fucking armhf; admittedly they do say
</p>
<dl class="continuing linear"><dt>User ABI</dt> <dd>arm</dd></dl>\
<p class="continuing" style="display: inline">\
, but the "arm" ABI is <a href="//wiki.debian.org/ArmPort">hard-dead</a>, so).
</p>
</div>
<p class="indented continuing">
This would presumably be where the second U-Boot is chainloaded from (<tt><q>RWFW</q></tt> – read/writeable firmware?).
But'<!--'-->s also zero-filled, so the first 10M of the flash is zeroes.
</p>
<p class="indented continuing">
Partition 12 (<tt><q>EFI-SYSTEM</q></tt>) isn'<!--'-->t actually,
but it is <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p12.gz">a 6M-used FAT</a> with
a 110B PATH(u-boot/boot.scr.uimg) identified as "u-boot legacy uImage" whose semantic content appears to be
<tt style="font-family: monospace;"><q>setenv kernelpart 2</q></tt>, <tt style="font-family: monospace;"><q>setenv rootpart 3</q></tt>
and a PATH(vmlinuz.uimg.A) which is a device tree – nice, but we already have a device tree in procfs. Are they any different?
</p>
<p class="indented continuing">
Yeah. This device tree has a kernel inside. Not as a joke, but as
</p>
<div class="continuing-inside" style="position: relative;">
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p12_vmlinuz.uimg.A.decompiled"><aside>full device tree</aside></a>
#include "blogn_t/012b.02-p12-uimg.dts.html"
</div>
<p class="continuing">
with 1448960 integers, for a total of 5660KiB.
There'<!--'-->s also a few <tt>description = "mt8173-oak-rev5.dtb";</tt>-style <tt>fdt@<var>N</var></tt> entries but they all add up to 350k.
And they're all SHA1-checksummed but the kernel isn't.
The branding for this one is
</p>
<pre class="continuing" style="padding-left: 1em; white-space: pre-wrap;">Linux version 3.18.0-12341-g91e1dfd (chrome-bot@chromeos-factory-us-central1-b-x32-31-497v) (gcc version 4.9.x 20150123 (prerelease) (4.9.2_cos_gg_2d511e9_4.9.2-r122) ) #1 SMP PREEMPT Wed Apr 24 03:31:08 PDT 2019</pre>
<p class="continuing">
which matches the shipped version documented in the big table; conversely, <tt>KERN-B</tt> is
</p>
<pre class="continuing" style="padding-left: 1em; white-space: pre-wrap;">Linux version 4.19.272-14688-g23c63bd32a8a (chrome-bot@chromeos-release-builder-us-central1-c-x32-90-i5ts) (Chromium OS 16.0_pre475826_p20230103-r7 clang version 16.0.0 (/var/tmp/portage/sys-devel/llvm-16.0_pre475826_p20230103-r7/work/llvm-16.0_pre475826_p20230103/clang 11897708c0229c92802e747564e7c34b722f045f)) #1 SMP PREEMPT Wed Apr 5 00:00:28 PDT 2023</pre>
<p class="continuing">
which is 2 commits/11 days behind the <tt>KERN-A</tt> from the previous sexion,
suggesting that this full 2023 ChromiumOS pre-release image(?) randomly includes a completely unrelated 2019 kernel.
</p>
<p class="indented continuation">
This system'<!--'-->s PATH(/proc/device-tree/compatible) precisely matches <code>conf@9</code>'<!--'-->s <code><var>compatible</var></code> string,
pointing to <code>fdt@9</code>, described as PATH(mt8173-elm-hana.dtb)
[<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.mt8173-elm-hana.dts">decompiled</a>].
</p>

<p class="indented continued">
Regardless of how odd the partitioning scheme is, it high-lights type-specific bits set in the boot bundle partitions
– just copying the boot bundle to a <q>ChromeOS kernel</q> partition on the SD card behaved identically to copying the raw kernel (<tt>s0 t0 p0</tt>, unchecked) –
so by exhaustively testing all the combinations, I arrived at the following table with a "fake" boot bundle (PATH(/sys/firmware/log) outlined).
</p>
<dl class="guid-demo">
	<dt><tt>GUID:49</tt></dt>
	<dd>instant reset to the developer mode warning screen
<pre class="continuation language-plaintext"><code class="language-plaintext">\
GptNextKernelEntry looking at new prio partition 2
GptNextKernelEntry s0 t0 p2
GptNextKernelEntry no more kernels
VbTryLoadKernel() LoadKernel() = 65551
VbSetRecoveryRequest(91)
VbBootDeveloper() - no kernel found on USB\
</code></pre>
	</dd>
	<dt><tt>GUID:56</tt></dt>
	<dd>same
<pre class="continuation language-plaintext"><code class="language-plaintext">\
<span class="token comment">GptNextKernelEntry looking at new prio partition 2</span>
GptNextKernelEntry s1 t0 p0
<span class="token comment">GptNextKernelEntry no more kernels</span>\
</code></pre>
	</dd>

	<dt><tt>GUID:49,56</tt></dt>
	<dd>significant delay before returning to the warning screen
<pre class="continuation language-plaintext"><code class="language-plaintext">\
<span class="token comment">GptNextKernelEntry looking at new prio partition 2</span>
GptNextKernelEntry s1 t0 p2
GptNextKernelEntry likes partition 2
Found kernel entry at 411648 size 81920
Checking key block signature...
<!--"-->   - sig_size=512, expecting 512 for algorithm 8<!--"-->
In RSAVerify(): Padding check failed!
In RSAVerify(): Hash check failed!
Invalid key block signature.
Verifying key block signature failed.
Checking key block hash only...
<!--"-->   - sig_size=256, expecting 256 for algorithm 4<!--"-->
Kernel preamble is good.
Key block valid: 0
Combined version: 65538
<!--"-->   - sig_size=256, expecting 256 for algorithm 4<!--"-->
In RSAVerify(): Hash check failed!
Kernel data verification failed.
Marking kernel as invalid.
GptNextKernelEntry looking at new prio partition 2
GptNextKernelEntry s1 t0 p2
<span class="token comment">GptNextKernelEntry no more kernels</span>\
</code></pre>
	</dd>

	<dt><tt>GUID:48,56</tt></dt>
	<dd>same
<pre class="continuation language-plaintext"><code class="language-plaintext">\
<span class="token comment">GptNextKernelEntry looking at new prio partition 2</span>
GptNextKernelEntry s1 t0 p1
<span class="token comment">GptNextKernelEntry likes partition 2
…
GptNextKernelEntry looking at new prio partition 2</span>
GptNextKernelEntry s1 t0 p1
<span class="token comment">GptNextKernelEntry no more kernels</span>\
</code></pre>
	</dd>
</dl>

<p class="indented continued">
If bundles copied verbatim from PATH(/dev/mmcblk0p2) are "real",
then I made "fake" by replacing the kernel with an LZ4ed Debian one
(<code>{ head -c 0x100C8 mmcblk0p2; lz4 -9 < vmlinuz-6.6.11-arm64; } > mmcblk0p2.fake</code>).
</p>
<p class="indented continuing">
Booting fakes with a measurable-but-recoverable behaviour is crucial because real bundles hard-hang the system in the black screen.
According to
<a href="//chromium.googlesource.com/chromiumos/docs/+/HEAD/debug_buttons.md#devices-with-keyboards"><cite>ChromiumOS Docs - Debug Button Shortcuts, Devices With Keyboards</cite></a>
there are at least a few combos that may'<!--'-->ve been able to trigger a warm re-boot, but they all start with <kbd>alt</kbd>+<kbd>🔊</kbd>
which <q>is treated as the <a href="//www.kernel.org/doc/html/latest/admin-guide/sysrq.html">Magic SysRq</a> key</q>
– off by default, enable it yourself –
so no logs from that one.
</p>
<p class="indented continuation">
I'm assuming it either doesn't get a rootfs or gets a bogus one, and thus panicks instantly.
No log in the firmware survives the reboot, it doesn'<!--'-->t initialise the display, and the resistors that are in stock and would let me construct
<a href="//chromium.googlesource.com/chromiumos/third_party/hdctools/+/HEAD/docs/ccd.md">the CCD cable that may show the serial console</a>
have been "in packing" for most of this week, so. idk.
</p>

<p class="indented continued">
Please ignore that I'<!--'-->ve now twice referenced the
<b>Partition attributes</b> table in the
<a href="//en.wikipedia.org/wiki/GUID_Partition_Table#Partition_entries_(LBA_2%E2%80%9333)"><cite>GUID Partition Table</cite> Wikipedia article</a>,
and the type-specific bits for <q>ChromeOS kernel</q> partitions are in the <b>ChromeOS kernel partition attributes</b> table <em>on the next screen down</em>.
</p>
<p class="indented continuation">
Still no <q>active</q> marker tho.
</p>


HEADING(2, debian, she debra on my ian '<!--'-->til I marr her dock)

<p class="indented">
Looks like I'<!--'-->d retroactively buried the lede – <tt>KERN-A</tt> and <tt>KERN-B</tt> are also in the device-tree-with-embedded-LZ4ed-kernel format.
It was very <span aria-label="sus">ඞ</span> that the LZ4 blob started at <var>0x100C8</var> instead of <var>0x10000</var>.
But there doesn'<!--'-->t appear to be a rootfs designator in the device tree, or embedded into the image – not that one would be expected, given the
<tt>root=PARTUUID=<var>uuid</var>/PARTNROFF=<var>1</var></tt>
in PATH(/proc/cmdline), and especially given the U-Boot <code>setenv</code>s of <code>{kernel,root}part</code> in the script.
</p>

<p class="indented continued">
If we are to accept booting a one-has-to-assume-backdoored kernel, and with <tt>ROOT-A</tt> and <tt>ROOT-B</tt> having no flags to distinguish them,
three possibilities of picking the rootfs when USB-🙄-booting spring to mind:
</p>
<ol class="alphalist">
	<li>it'<!--'-->ll pick anything marked <q>ChromeOS root fs</q>,</li>
	<li>the 64k <tt><q>CHROMEOS</q></tt> preamble contains the partition number,</li>
	<li>the 64k <tt><q>CHROMEOS</q></tt> preamble contains the partition UUID,</li>
	<li>a secret, fourth thing.</li>
</ol>
<p class="indented continuation">
A quick <code>head -c 0x10000 mmcblk0p[24] | od -tx1 | grep -wC1 cc | grep -w fe</code> confirms the UUID isn'<!--'-->t there, at least not in plain.
<tt>03</tt> and <tt>05</tt> also don'<!--'-->t appear swapped at the same offsets, but who knows.
</p>

<p class="indented continued">
So, using the "real" boot bundle and the worst rootfs in existence
(dpkg-deb -R libc6_2.38-5_arm64.deb faux-root; dpkg-deb -R dash_0.5.12-6_arm64.deb faux-root; ln faux-root/{bin/sh,sbin/init}; mkfs.ext2 -d faux-root faux-root.10M 10M)
I observed a significant behavioural change: <kbd>ctrl</kbd>+<kbd>u</kbd> now goes black for precisely 5 seconds and then reboots!
(Still no console so idk why it reboots, and it reboots so no log, but it'<!--'-->s definitely doing something.)
The same happens regardless of partition number, which strongly hints at option a).
</p>
<p class="indented continuing">
(Later, further testing revealed that the rootfs is <em>always</em> <tt>root=PARTUUID=<var>kernel-partition-uuid</var>/PARTNROFF=1</tt> –
 the partition <em>one after</em> the kernel.
 The partition type-UUID doesn'<!--'-->t matter.
 What I was observing was either some type of kernel panic, or the bootloader picking the kernel with a partition after it.
 A quick check also shows that this is a kernel-only (mount(8) doesn'<!--'-->t understand it) syntax,
 naturally <a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=79975f1327850ef198ada994c2fc44b7d1ea8935">authored by an @chromium.org address specifically for this use-case</a>.
</p>
<p class="indented continuation">
 So: secret, fourth thing.
 One could say that, knowing this, <q>Linux kernel boots from its corresponding rootfs partition</q> makes sense.
 But without that knowledge it means nothing at all — ½/3.)
</p>

<p class="indented continued">
Emboldened, I copied over the 2G <tt>ROOT-A</tt> instead at an incredible pace of 3.3M/s.
(During this I discovered that <a href="//youtu.be/2aipm6byd7Q">if you pause the small looped MP4 of an animation on the OOBE screen,
 <tt>chrome</tt> goes from two processes at >80% CPU each to just one at 10%</a>.)
This yields a black screen for the same 5s,
</p>
<a href="/content/assets/blogn_t/012b.08-DSCN0565cv.jpg"><img alt='top left corner: chrome logo, chrome; middle of screen: throbber next to "Your system is repairing itself.  Please wait."' src="/content/assets/blogn_t/012b.08-DSCN0565cv.jpg"></a>
<p class="continuation">
for 3-10s, and only <em>then</em> a reboot, after which my accessibility settings were globally reset.
</p>

<p class="indented continued">
Some fiddling with that rootfs yielded
</p>
<div class="continuing-inside">
#include "blogn_t/012b.03-fiddle-shell.diff.html"
</div>
<a href="/content/assets/blogn_t/012b.09-DSCN0568ccc.JPG"><img alt="The same screen, but in the top there's an overlaid shell with id output, prompt, and successful ls execution" src="/content/assets/blogn_t/012b.09-DSCN0568ccc.JPG"></a>
<p class="continuation">
which was slow as shit (on the order of 2cps max input speed) and still rebooted after a few seconds, but.
</p>

<p class="indented continued">
The real break-through was
</p>
<div class="continuing-inside">
#include "blogn_t/012b.04-fiddle-final.diff.html"
</div>
<p class="continuing">
(The PATH(ui.conf) diff doesn'<!--'-->t do anything.
 The PATH(boot-splash.conf) deletion may be exchanged for a PATH(startup.conf) deletion instead, since it also runs frecon.
 Naturally, the way to show the "ChromeOS" fade-in is by passing a tty emulator 70 PNGs, in developer mode, and keeping it running afterward.)
PATH(chromeos_startup) is what triggers the self-repair message
(rendered is by <code>pango-view</code>ing the background, the localised text, and the throbber to a PNG and giving those to frecon).
This yields
</p>
<a href="/content/assets/blogn_t/012b.10-DSCN0570cvcc.JPG"><img alt="shell session formatted identically to all the ones before, findmnt lists the root to be mounted on /dev/mmcblk1p3" src="/content/assets/blogn_t/012b.10-DSCN0570cvcc.JPG"></a>
<a href="/content/assets/blogn_t/012b.11-DSCN0573c.JPG"><img alt="top listing, the only processes under init are udevd and frecon/login/bash/top" src="/content/assets/blogn_t/012b.11-DSCN0573c.JPG"></a>

#define INTERNAL_LINK(id, ...) <a href=STR(HASH(FORCED_SPACER)id)><cite class="local-ref">__VA_ARGS__</cite></a>
#define ERRNO(num, nam)        <code><abbr title=#nam>num</abbr></code>
<p class="indented continued">
This high-lights the biggest issue with this system: there is no console.
This lede is buried in PATH(/proc/cmdline) in the INTERNAL_LINK(HFBITLAND, HFBITLAND) sexion –
<tt>console=</tt> is provided as the first parameter.
Opening PATH(/dev/console) fails with ERRNO(ENODEV, No such device).
There are no framebuffers (and no loadable fbdev modules), there are no VTs.
frecon, which is what provides the pseudo-VTs, draws the teletypes (and the PNGs) by talking to the GPU directly.
As in it has PATH(/dev/dri/card2) open.
</p>
<p class="indented continuing">
This is why the tty says it'<!--'-->s PATH(/dev/pts/0) – it'<!--'-->s an xterm, but drop the <span class="smallcaps">x</span>.
So to answer the first question from POST012a – <code>TERM=xterm</code> because it is.
It'<!--'-->s also horrendous and the ptys it gives you barely work (libreadline masks this in bash)
– i.a. backspace sends <kbd>^H</kbd> and it'<!--'-->s configured for the usual <kbd>^?</kbd>.
One syscall to fix, too hard for this trillion-dollar startup.
This also explains why you can press <kbd>ctrl</kbd>+<kbd>alt</kbd>+<kbd>←</kbd>/<kbd>→</kbd> (not the arrow keys)
to open "VT" 1/2, even though <kbd>←</kbd>/<kbd>→</kbd> are <code>XF86Back</code>/<code>XF86Forward</code> and not F1/F2.
</p>
<p class="indented continuing">
Not even serial?
Not even serial.
My resistors'<!--'-->d got here and I assembled a
<a href="//chromium.googlesource.com/chromiumos/third_party/hdctools/+/HEAD/docs/ccd.md#SuzyQ-SuzyQable"><cite>hdctools: Chrome OS Hardware Debug & Control Tools, Closed Case Debug (CCD), Communicating with Google Security Chip(GSC), SuzyQ / SuzyQable</cite></a>
(no, even they don'<!--'-->t know what it is)
accd'<!--'-->g to the instruxions in <cite>Making your own SuzyQ</cite>
(though mind the referenced 22k 1% resistor not being real and the breakout they spec seemingly being american-only)
more <a href="//101010.pl/@nabijaczleweli/111784958081841432">on mastussy</a>.
</p>
<p class="indented continuing">
<cite>Device Support</cite> says
#define ELLIPSIS <del>[…]</del>
</p>
<blockquote class="continuing" style="white-space: pre-wrap;">\
The “Closed Case Debugging” column in the <a href="//www.chromium.org/chromium-os/developer-information-for-chrome-os-devices">Chrome OS device list</a> indicates whether CCD is supported.
<!---->
If the device is ARM, the CPU/AP UART works by default in dev mode (you should see a login prompt). x86 devices disable it ELLIPSIS\
</blockquote>
<p class="continuing">
which implies to me that there'<!--'-->s some sort of activity.
And the <q>login prompt</q> really smells like <!--"-->"you get <tt>console=PATH(ttyS0)</tt>"<!--"--> or at least a getty thereon
(this is substantiated by opening PATH(ttyS0) working and PATH(ttyS[123]) ERRNO(EIO, Input/output error)ing).
Indeed, I can debug the Intel-chipped 300e (shows the PATH(ttyUSB)s, <a href="//101010.pl/@nabijaczleweli/111813860024376201">talks on all of them</a>),
but not this one.
Why?
The device list they link to is another version of the big table cited at the top of this page.
Indeed, both agree with regards to the column I omitted – <cite style="font-weight: bold; font-style: inherit;">Closed Case Debugging</cite>.
The Intel 300e has a <q>Yes</q> in that column. This Mediatek – nothing. No data.
</p>
<p class="indented continuing">
So another difference between these nominally-identical laptops is that you can debug one but not the other.
This one is either a black screen or you'<!--'-->ve magically done something right and you have a <abbr title="GPU term">gterm</abbr>.
Of course, I tried to actually run Xorg out of a Debian chroot since there'<!--'-->s a GPU exposed, and the best you get is
</p>
<div class="continuing-inside bigcode">
#include "blogn_t/012b.05-xorg.plaintext.html"
</div>
<p class="continuing">
and no, plugging in an HDMI doesn't work, it just doesn't understand the GPU or whatever.
I'<!--'-->m no eXorgpert.
</p>
<p class="indented continuation">
Given that neither guide mentions anything remotely close to this,
one has to assume that on the "Samsung ARM Chromebook" this is simply not the case,
and that it pre-dates this no-console no-framebuffer model.
</p>


HEADING_S(2, ctrl-i, class="continued", an interlude: here's a never-documented-before <kbd>ctrl</kbd>+<kbd>i</kbd> shortcut :)<!--'-->)
<a href="/content/assets/blogn_t/012b.12-DSCN0566c.JPG"><img alt="overlaid atop the recovery screen, in the top left, is a dump of some firmware variables" src="/content/assets/blogn_t/012b.12-DSCN0566c.JPG"></a>



<p class="indented continued">
This is close to as far as I can get with first-principles debugging since there just isn'<!--'-->t really a way to do anything unless everything fully works.
If only there were
</p>
HEADING_S(2, systemd, class="continuing", a way to leak post-mortem metadata)
<p class="continuing">
like when you'<!--'-->re bisecting rootfs bootability requirements and you find the cmdline listed in
PATH(/sys/fs/pstore/console-ramoops-0) (and PATH(dmesg-ramoops-0) sometimes(?) but they'<!--'-->re equivalent)
which contains the entire console output.
</p>
<p class="indented continuing">
(If you know what you'<!--'-->re looking for, this is obvious – PATH(/proc/consoles) consists of
</p>
<pre class="continuing" style="margin-left: 1em; padding-left: 1em;">
<!--"-->pstore-1             -W- (E  p a)<!--"-->
</pre>
<p class="indented continuing">
&nbsp;but <a href="/content/writing/translations/sherlock_holmes_the_published_apocrypha/#the-parodies/the-field-bazaar"><q>It is all obvious when it is explained to you.</q></a>.)
</p>

<p class="continuing"></p>
<div class="indented">
<p style="display: inline">
Which is great, but only works reliably for real co-operated reboots.
When you use the hard-reboot <kbd>alt</kbd>+<kbd>⟳</kbd> combo
#define DEBUG_BUTTON_SHORTCUTS <a href="//chromium.googlesource.com/chromiumos/docs/+/HEAD/debug_buttons.md#devices-with-keyboards"><cite>Debug Button Shortcuts</cite></a>
(which DEBUG_BUTTON_SHORTCUTS calls
 </p>
 <dl class="linear">
 	<dt>EC reset</dt> <dd><kbd class="chromiumos">Power + Refresh</kbd></dd>\
 </dl>\
 <p class="continuing" style="display: inline"><!--
 -->).
you get something to the effect of (<code>cat -A</code>-reformatted):
</p>
</div>
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext" style="white-space: pre-wrap;"><!--
    "--><span class="token comment">[    0. 00000]</span> ^Booting Linuh on physicad CPU 0x0000000000 Y0p410fd032]$<!--"-->
<!--"--><span class="token comment">^[    0.000000]</span> Hifux versin. 4.!9.272-14690-gd! c13(2f4b0 (chrome-bot@chr.mdos)be,easE-bdilder^Mus%central1-b%x32-59-cvp8) (C(romIum OS 16.0_pre47^U826_p"0230^Q03-r7 clang verSHON 12.0^N0 (/va2/tmp/`ortagd/sys-deve,/l,vi)1^V.0Wpr%474826_p20230103-^R7/uorc/dLVm^M16*0_pre475826_p2023^P103/chanc 1189'708c0229c9280^RE74^W564`7c3^Pb722f045f)) "1 SMP PREEMPT Sun Apr 16 19:38:55 PDT 2023$<!--'-->
<!--"--><span class="token comment">[    0.000000]</span> Machine model: COocld Hafa$<!--"-->
<!--"--><span class="token comment">[ ^@  0.000000L</span> Malboried early^@optiOn 'Cnnsole'$<!--"-->
<!--"--><span class="token comment">[    0.0^P0000M</span> ReSerred memory8 createD @MA memmry pool at 0x00000000b7^P0000 $ qaze 5 MiB$<!--"-->
<!--"--><span class="token comment">[    0&000^P00]</span> GF*^@beserved mem: ini4ha,IzeD nOde 6pu_dma_Mem_begio.@"70000 0, compatible id shared-dma,pool$
<!--"--><span class="token comment">[ ^@^@ 0*000000]</span> pqci: probing for ck*duit method from DT.$<!--"-->
<!--"--><span class="token comment">S  ^@ 0.0000 0]</span> psci:^@PSCIv1.0 d%tected in firMw!2e.$<!--"-->
<!--"--><span class="token comment">[    0,000000]</span> psba: Usin^G standard PSAH v0.2 functioj IDr$<!--"-->
<!--"--><span class="token comment">K    0.000000^]</span> `sci: MIFRATE_INFO_TIPE not supported*$<!--"-->
<!--"--><span class="token comment">[    0.000^P00]</span> psc!: SMC CAllinG^@Confeltion V1.1$<!--"-->
<!--"--><span class="token comment">S  ^@ 0. 00000]</span> percpu: Embedded 24 pages/cpu R41080 r81(2 D^R9032 u98304$<!--"-->
<!--"--><span class="token comment">[    0.0 0000Y</span> @etected V^IPT ^I-ca#`e .n C@^E0$<!--"-->
<!--"--><span class="token comment">[     .000000]</span> CPU features* en`bling workapnunD fob A^RM errata 826319, 827319, 824069^H<span class="token comment">[    0,000000]</span> CPU fe`turEs: enabline^@workaround fop ABM erratul 843419$<!--"-->
<!--"--><span class="token comment">[    0* 00000]</span> APU feaTureS: enAbling sorkaroqnd foR ARM erratui ^X^T%719$<!--"-->
<!--"--><span class="token comment">[^@   0,000 00]</span> Built 1 z/n%lists, m/bhLity^@group)nc on.  Todal pages^Z^@1030656$<!--"-->
<!--"--><span class="token comment">[ ^@  0.000000U</span> KernEl #/mmand^@line: crOs_seaure con^Sole5 log,Evel=7 inht=/sbin/ijit cros_recure dbM.tr!ce=0x00^V rogt=PARTUUID=fd012a^P$-54ac-dd4'-b773-73df13281aa7/PABTNROFF<0 rootvait rw dm_vdridh^N%rror_beharior=3 dm_Verity,maxZbios=-1 Dm_FerItY.dev_wAit=0 dm="1 vrokt none ro 1$0 40774^V8 veridy pay,maD=ROOT]DDV (ashtrde=HASH_DEV hashstart=4076468 alg=sha054 r'ot_hexdifest=59&5ac90'd@5cfa3f6fd%f15b166c94025a41ef4abfd0d)c6^Xdb6Ef4a2f62a48 salt=05e2c9a8dc172bc%efe0B899182b436bb89^V09a04^TeAbaaeb5ec07441cf2!122" nohnidrd vt.gdmbalWcqrSor_ddfault=0^@kern_guid=fd012a04-^U4ac%dd47,b573,77df1^Q381aa7 cpuidle.governor=tEo  $<!--"
--></code></pre></div>
<p class="continuing">
which, given that the power LED goes off for 573ms during this time,
one has to assume is DRAM bit-rot.
</p>
<p class="indented continuation">
As cool as observing a theoretical phenomenon everyone knows about but I never expected to see is in the home shop,
it'<!--'-->s less-than-helpful for trying to ascertain precise messages.
</p>

<p class="indented continued">
DEBUG_BUTTON_SHORTCUTS also says
</p>
<blockquote class="continuing">
	<table id="debug_button_shortcuts_table">
		<tr><th>Functionality</th                      ><th>Shortcut</th></tr>
		<tr><td>Warm AP reset</td                      ><td><kbd>Alt + Volume-Up + R</kbd></td></tr>
		<tr><td>Restart Chrome</td                     ><td><kbd>Alt + Volume-Up + X</kbd> *</td></tr>
		<tr><td>Kernel panic/reboot</td                ><td><kbd>Alt + Volume-Up + X + X</kbd> *</td></tr>
		<tr><td>Reboot EC but don'<!--'-->t boot AP</td><td><kbd>Alt + Volume-Up + Down-Arrow</kbd></td></tr>
		<tr><td>Force EC hibernate</td                 ><td><kbd>Alt + Volume-Up + H</kbd></td></tr>
	</table>
	<i>Notes</i>:
	<ul>
		<li>AP = Application Processor; EC = Embedded Controller.</li>
		<li><kbd class="chromiumos">Alt + Volume-Up</kbd> is treated as the Magic SysRq key.
		    When in Developer mode, you can enable SysRq key combinations as documented in the Linux kernel docs.</li>
	</ul>
</blockquote>
<p class="continuing">
and, naturally, I'<!--'-->d tried to apply this for a long time, with <kbd>alt</kbd>, the volume up button on the side, and a magick, and it never worked.
</p>
<p class="indented continuing">
It is only much later that it'<!--'-->d occurred to me that by <q><kbd class="chromiumos">Volume-Up</kbd></q> they may mean the <kbd>🔊</kbd> on the keyboard.
That does work! and as long as the ChromiumOS kernel is running,
#define SYSRQ_COMBO(last) <span style="white-space: nowrap;"><kbd>alt</kbd>+<kbd>🔊</kbd>+last</span>
SYSRQ_COMBO(<a href="//www.kernel.org/doc/html/latest/admin-guide/sysrq.html#what-are-the-command-keys"><kbd>b</kbd></a>)<a href="//www.kernel.org/doc/html/latest/admin-guide/sysrq.html#what-are-the-command-keys"> reboots</a>
and preserves the pstore log in tact,
while SYSRQ_COMBO(<kbd>c</kbd>) crashes and preserves the pstore log in tact.
</p>
<p class="indented continuation">
But SYSRQ_COMBO(<kbd>r</kbd>) <em>also</em> reboots with pstore <span class="smallcaps">ok</span>,
and not only is that not a useful SysRq (<q>Turns off keyboard raw mode ELLIPSIS</q>),
but it works regardless of a kernel running or said kernel having any hardware.
So this is documented as a SysRq but just isn'<!--'-->t, and is another, more warmer, reboot.
</p>
<p class="indented">
It's no actual interactive console, but it's a way to reliably probe whatever the fuck was happening in the black box.
Real green-field shit.
</p>


HEADING(2, systemd, a brief ado about systemd)

<p class="indented continued">
Given the above, it is tempting to boot a Debian rootfs with <tt>KERN-A</tt> – previously just a black screen – and see what falls out.
Don'<!--'-->t – you will first get
</p>
<div class="continuing-inside bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext" style="white-space: pre-wrap;"><!--
    "--><span class="token comment">[    1.95725]</span> ChbomIuM OS LSM: sb_mou.t ddv=sysf3 type=s)Qfs flAgs-xe<!--"-->
<!--"--><span class="token comment">   !.9047)8\</span> systemd[1]: F@i,ed to mount sysfs (4ypa sysfs) on /sYs (MC_NOSUID|MS_NODEV|MS_NOEXEC ""(: Too eany levels of symbklic links<!--"-->
<!--"--><span class="token comment">[    1.94304]</span> Chromi5m OR HSM: sb_moent MotNt path sith syml)nks prohibHded obj="/syr/kErned/secqrity" pid=1 cMdline=.sbin/init cros_secure"
<!--"--><span class="token comment">[   1.91301]</span> CHROlium OS LSM: 3b_mound dev=#EcuRityfs tyPa&lt;Securityfs blacs0xe<!--"-->
<!--"--><span class="token comment">    1.957065M</span> systeed[]* FrEezing exea%tiOn.<span class="token comment">[   31.19(945]</span> bl_dix`d: `ira"ling<!--
--></code></pre></div>
<p class="continuing">
wherein "Chromium OS LSM: Mount path with symlinks prohibited" appears to be from
<a href="//chromium.googlesource.com/chromiumos/third_party/kernel/+/c1884ac2c30aaa9c3c356f2e6fd0425c74608424/security/chromiumos/lsm.c#33">the eponymous module</a>
which prevents mounting on paths which were resolved via symlinks,
and after you <a href="//101010.pl/@nabijaczleweli/111795417570668617">strace systemd pid1</a> you will find out that it does
</p>
<pre class="continuing language-c"><code class="language-c">\
<span class="token function">mount</span><span class="token punctuation">(</span><span class="token string">"proc"</span><span class="token punctuation">,</span> <span class="token string">"/proc"</span><span class="token punctuation">,</span> <span class="token string">"proc"</span><span class="token punctuation">,</span> <span class="token punctuation">.</span><span class="token punctuation">.</span><span class="token punctuation">.</span><span class="token punctuation">)</span>\
</code></pre>
<p class="continuing">but</p>
<pre class="continuing language-c"><code class="language-c">\
<span class="token function">open</span><span class="token punctuation">(</span><span class="token string">"/sys"</span><span class="token punctuation">,</span> O_NOFOLLOW<span class="token punctuation">)</span> <span class="token operator">=</span> <span class="token number">0</span>
<span class="token function">mount</span><span class="token punctuation">(</span><span class="token string">"sysfs"</span><span class="token punctuation">,</span> <span class="token string">"/proc/self/fd/0"</span><span class="token punctuation">,</span> <span class="token string">"sysfs"</span><span class="token punctuation">,</span> <span class="token punctuation">.</span><span class="token punctuation">.</span><span class="token punctuation">.</span><span class="token punctuation">)</span>\
</code></pre>
<p class="continuing">and</p>
<pre class="continuing language-c"><code class="language-c">\
<span class="token function">open</span><span class="token punctuation">(</span><span class="token string">"/sys/kernel/security"</span><span class="token punctuation">,</span> O_NOFOLLOW<span class="token punctuation">)</span> <span class="token operator">=</span> <span class="token number">0</span>
<span class="token function">mount</span><span class="token punctuation">(</span><span class="token string">"securityfs"</span><span class="token punctuation">,</span> <span class="token string">"/proc/self/fd/0"</span><span class="token punctuation">,</span> <span class="token string">"securityfs"</span><span class="token punctuation">,</span> <span class="token punctuation">.</span><span class="token punctuation">.</span><span class="token punctuation">.</span><span class="token punctuation">)</span>\
</pre></code>
<p class="continuing">
as <a href="//github.com/systemd/systemd/blob/afd08d7740da1cd987739926f52e266a9d15001f/src/shared/mount-setup.c#L81">its <em>own</em> symlink mitigation</a>,
which makes the latter two ERRNO(ELOOP, Too many levels of symbolic links), as seen in the log.
</p>
<p class="indented continuing">
Given that it <a href="//github.com/systemd/systemd/blob/afd08d7740da1cd987739926f52e266a9d15001f/src/shared/mount-setup.c#L180-L186">does not remount these</a>
one may then be tempted to simply gift them.
So after you
</p>
<details>
	<summary>mount 20 API filesystems (well, fewer in the end – there'<!--'-->s some fallbacks) from PATH(/sbin/init) before execing systemd</summary>
	<div class="continuing-inside bigcode">
	#include "blogn_t/012b.06-sbin-init.sh.html"
	</div>
</details>
<p class="continuing">
you will continue to see a black screen and on reset the pstore will contain
</p>
<a href="/content/assets/blogn_t/012b.13-DSCN0579cvcc.png"><img alt='Some mount warnings, the sytemd "running in system mode" status line, "Dtetected architecture arm64", "Hostname set to <chwast>", "Chromium OS LSM: bpf syscall blocked; Mount path with symlinks prohibited: /tmp (sd-gens)", "Failed to fork off sandboxing anvironment for executing gnereators: Protocol error"' src="/content/assets/blogn_t/012b.13-DSCN0579cvcc.png"></a>

<p class="indented">
So this kernel is just
<a href="//github.com/systemd/systemd/blob/afd08d7740da1cd987739926f52e266a9d15001f/src/core/manager.c#L4043">fundamentally incompatible with systemd</a>
(at least as-configured).
woulda bin an easy short-cut, but alas
</p>


<p class="indented continued">
This, and the ChromiumOS kernels not supporting kexecing, means that we need to find
</p>
HEADING_S(2, dernal, class="continuing", a way to pack a kernel to boot)
<p class="continuing">
first (naturally, this ticks off the "backdoored kernel" issue as well).
The frecon PATH(/etc/issue) says something about <q>booting a self-signed kernel</q>,
so this ought to be viable;
luckily, <samp>crossystem</samp> output includes
</p>
<pre class="language-plaintext continuing"><code class="language-plaintext" style="white-space: pre-wrap;"><!--"-->fw_vboot2 = 1	# [RO/int] 1 if firmware was selected by vboot2 or 0 otherwise<!--"--></code></pre>
<p class="continuing">
so by applying my incredible monkey brain (
</p>
<pre style="margin-left: 0.322em;" class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token info punctuation">root@chwast:~</span><span class="token command"><span class="token shell-symbol important">#</span> apt search vboot2</span>
Sorting... Done
Full Text Search... Done
<span class="token info punctuation">root@chwast:~</span><span class="token command"><span class="token shell-symbol important">#</span> apt search vboot</span>
Sorting... Done
Full Text Search... Done
<!---->
<span class="token green">boot-kernel-utils</span>/unstable,now 0~R106-15054.B-1 arm64
  Chrome OS verified boot utils required to sign kernels
<!---->
<span class="token green">boot-utils</span>/unstable,now 0~R106-15054.B-1 arm64
  Chrome OS verified u-boot utilities\
</code></pre>
<p class="continuing">
) and rembering that i last saw this toolchain in INSTALLINGDEBIANON_SAMSUNG_ARMCHROMEBOOK as
</p>
<blockquote class="continuing"><pre class="continuing" style="white-space: pre-wrap;"><!--
    "--># Declare the kernel flags:<!--"-->
<!--"-->cat > ${MNT}/boot/kernel.flags &lt;&lt;EOF<!--"-->
<!--"-->console=tty1 printk.time=1 nosplash rootwait root=${DEV}p3 rw rootfstype=ext4 lsm.module_locking=0<!--"-->
<!--"-->EOF<!--"-->
<!--"--># Sign the kernel:<!--"-->
<!--"-->cat > ${MNT}/boot/sign-kernel.sh &lt;&lt;EOF<!--"-->
<!--"-->vbutil_kernel --repack /boot/vmlinuz.signed --keyblock \<!--"-->
<!--"-->  /usr/share/vboot/devkeys/kernel.keyblock --version 1 \<!--"-->
<!--"-->  --signprivate /usr/share/vboot/devkeys/kernel_data_key.vbprivk \<!--"-->
<!--"-->  --config /boot/kernel.flags --oldblob /boot/oldblob<!--"-->
<!--"-->EOF<!--"
--></pre></blockquote>
<p class="continuing">
this can be trivially reproduced
(after installing <samp>boot-kernel-utils</samp>, which suffers from recommending 50M of javascript via a <samp>-docs</samp> package)
by re-packing <tt>KERN-A</tt>:
</p>
<pre class="continuing" style="white-space: pre-wrap; margin-left: 1em;"><code><!--
    "-->vbutil_kernel --repack orig.repacked \<!--"-->
<!--"-->  --keyblock    /usr/share/vboot/devkeys/kernel.keyblock \<!--"-->
<!--"-->  --signprivate /usr/share/vboot/devkeys/kernel_data_key.vbprivk \<!--"-->
<!--"-->  --config <!--"-->PATH(cmdline)<!--"--> \<!--"-->
<!--"-->  --oldblob /dev/mmcblk0p2<!--"-->
<!-- -->cp orig.repacked PATH(/dev/mmcblk1p9)<!--
--></code></pre>
<p class="continuing">
which does boot as expected <em>and</em> uses the cmdline from PATH(cmdline).
binwalk didn'<!--'-->t find this, but the boot bundles, after the device tree payload, end with a string sexion containing the cmdline:
</p>
<blockquote class="continuing"><pre class="continuing"><!--
    "-->54372340  >sion.load.entry.algo.kernel.fdt.&lt;<!--"-->
<!--"-->54372400  >compatible.timestamp.value......&lt;<!--"-->
<!--"-->54372440  >................................&lt;<!--"-->
*
<!--"-->54400000  >console= loglevel=7 init=/sbin/i&lt;<!--"-->
<!--"-->54400040  >nit cros_secure drm.trace=0x106 &lt;<!--"-->
<!--"-->54400100  >root=PARTUUID=<strong>%U</strong>/PARTNROFF=1 roo&lt;<!--"-->
<!--"-->54400140  >twait rw dm_verity.error_behavio&lt;<!--"-->
<!--"-->54400200  >r=3 dm_verity.max_bios=-1 dm_ver&lt;<!--"-->
<!--"-->54400240  >ity.dev_wait=0 dm="1 vroot none &lt;
<!--"-->54400300  >ro 1,0 4077568 verity payload=RO&lt;<!--"-->
<!--"-->54400340  >OT_DEV hashtree=HA(FORCED_SPACER)SH_DEV hashsta&lt;<!--"-->
<!--"-->54400400  >rt=4077568 alg=sha256 root_hexdi&lt;<!--"-->
<!--"-->54400440  >gest=<!--"--><del>[…</del>
<!--"-->54400640            <!--"--><del>…]</del>" noinitrd vt.global_&lt;<!--"-->
<!--"-->54400700  >cursor_default=0 kern_guid=<strong>%U</strong> cp&lt;<!--"-->
<!--"-->54400740  >uidle.governor=teo  ............&lt;<!--"-->
<!--"-->54401000  >................................&lt;<!--"-->
*
100000000<!--
--></pre></blockquote>
<p class="continuation">
with the <code><var>%U</var></code>s being replaced with the boot bundle's partition's UUID by the boot-loader.
A cute scheme, which does work and does boot, so the tool-chain works.
Even if I don't know why you'd want to sign with those particular parts of some key; doesn'<!--'-->t really matter.
</p>

<p class="indented continued">
So, by plumbing the depths of the <samp>vbutil_kernel</samp> usage string
(or its equivalent 🙄 <a href="//manpages.debian.org/unstable/vboot-kernel-utils/vbutil_kernel.1.en.html">manual</a>)
we can observe that,
given <code>vbutil_kernel --get-vmlinuz /dev/mmcblk0p2 --vmlinuz-out PATH(orig)</code>,
PATH(orig) contains the whole device tree with the embedded kernel &c.
Why do they call it a <q>vmlinuz</q> then? doesn't matter, I s'pose.
</p>
<p class="indented continuing">
And by filling out the non-re-packing, I got to
</p>
<pre class="continuing" style="white-space: pre-wrap; margin-left: 1em;"><code><!--
    "-->printf '\0' > bootloader<!--"-->
<!--"-->vbutil_kernel --pack /dev/mmcblk1p9 \<!--"-->
<!--"-->  --keyblock    /usr/share/vboot/devkeys/kernel.keyblock \<!--"-->
<!--"-->  --signprivate /usr/share/vboot/devkeys/kernel_data_key.vbprivk \<!--"-->
<!--"-->  --version 1 \<!--"-->
<!--"-->  --vmlinuz <!--"-->PATH(orig) \<!---->
<!--"-->  <a href="//bugs.debian.org/1061329">--bootloader bootloader</a> \<!--"-->
<!--"-->  --config <!--"-->PATH(cmdline) \<!---->
<!--"-->  --arch arm64<!--"
--></code></pre>
<p class="continuing">
wherein it's similarly unclear to me what the version's supposed to be or mean.
I copied <var>1</var> from INSTALLINGDEBIANON_SAMSUNG_ARMCHROMEBOOK because it'<!--'-->s required for <samp>--pack</samp>.
The architecture defaults to "<tt>x86</tt>"
<a href="//sources.debian.org/src/vboot-utils/0~R106-15054.B-1/futility/cmd_vbutil_kernel.c/#L222">regardless of the host</a>.
</p>
<p class="indented continuing">
As inferrable from above, the bootloader bit is null in the shipped kernel,
but <a href="//bugs.debian.org/1061329">you can'<!--'-->t spec an empty file</a>,
so a file with a zero is minimal.
This doesn'<!--'-->t appear to be used by our bootloader, but it lives in a block after the cmdline.
</p>

<p class="indented continued">
So, near as I can tell, the boot bundle consists of:
</p>
<ol>
	<li>64k <q><tt>CHROMEOS</tt></q> parameter(?) block</li>
	<li>device tree containing the kernel and device trees matched to the host by the bootloader – vboot-utils calls this bit <q>vmlinuz</q></li>
	<li>cmdline string (with <var>%U</var>UID substitution, <tt>cros_secure</tt> also prepended if it'<!--'-->s not in there already)</li>
	<li>unused "bootloader" block</li>
</ol>

<p class="indented">
(Even if you replace the kernel carefully without re-signing the bundle,
 you get honked at and PATH(/sys/firmware/log) has the same "<tt>In RSAVerify(): Padding check failed!</tt>" error as the first time.)
</p>

HEADING(2, hifux, when im in an EXacutif'<!--'-->^@gejarators competition and my opponent is Hifux:)

<p class="indented continued">
Now we just need to get an appropriate kernel to stuff into 2..
The Debian kernel is unsuitable as-shipped because it's fully modular and we don't get an initrd.
</p>
<p class="indented continuing">
Naturally, fixing this means <tt>apt source</tt>ing the latest kernel (6.6.11-1),
copying PATH(/boot/config-6.6.11-arm64) to PATH(.config),
and either dealing with all the Kconfig UIs actively fighting you when you try to build in a component with modularised dependencies
(why can't the computer <em>also</em> build them in instead of just complaining that they're modular and doing nothing? unsolvable problem)
or just (<code>sed -i s/=m$/=y/ .config</code>) building every module into the kernel image.
</p>
<p class="indented continuing">
Unfortunately, if you <a href="//101010.pl/@nabijaczleweli/111796329282927743">do the latter</a>,
not only does <samp>make -j25 ARCH=arm64 LLVM=1 Image</samp> take eons (like an hour),
it produces an intermediate 1.7G-sized PATH(vmlinux),
and the output PATH(arch/arm64/boot/Image) (which according to <samp>make ARCH=arm64 help</samp> is the <q>Uncompressed kernel image</q>) is 154M (86M LZ4ed).
This would be perfect if it were bootable; alas, it honks with
</p>
<a href="/content/assets/blogn_t/012b.14-DSCN0582cvcc.png"><img alt="Kernel body doesn't fit in memory." src="/content/assets/blogn_t/012b.14-DSCN0582cvcc.png"></a>

<p class="indented continued">
This unfortunately means manually enabling every Mediatek-specific feature (<code>'/\(MEDIATEK\|MTK\).*=m/s/m$/y/'</code>),
all framebuffers,
all the blockdev drivers (<code>'/BLOCK.*=m/s/m$/y/'</code>) and ext4 (<code>'s/CONFIG_EXT4_FS=m/CONFIG_EXT4_FS=y/'</code>).
This is mind-numbing. A final PATH(.config) (and a diff from the Debian one) are at the end.
Here'<!--'-->s the high-lights.
</p>
<p class="indented continuing">
There'<!--'-->s a <cite>Platform selection</cite> menu at the top.
I unselected everything sans <q>MediaTek SoC Family</q>.
</p>
<p class="indented continuing">
There'<!--'-->s a whole-ass <cite>Platform support for Chrome hardware</cite> sexion,
with most of it turned off or modularised in the Debian config.
</p>
<p class="indented continuing">
Drivers for ChromeOS systems are disguised as "<tt>CHROMEOS</tt>", "<tt>CROS</tt>", and "<tt>GOOGLE</tt>".
A significant proportion of these <tt style="text-transform: uppercase;">depend on </tt><samp>X86</samp>.
</p>
<p class="indented continuing">
In the <cite>File systems, Miscellaneous filesystems</cite> sexion there'<!--'-->s <q>Persistent store support</q> (<samp>CONFIG_PSTORE</samp>).
This is crucial, since this is what provides the logs in PATH(/sys/fs/pstore).
I cranked that shit.
</p>
<p class="indented continuation">
<samp>CONFIG_CHROMEOS_PSTORE</samp><tt style="text-transform: uppercase;"> depends on </tt><samp>X86</samp>.
This is rather surprising, and proves how mind-numbing of an activity this is because I have it in my notes twice.
ARM chromebooks appear to use some standard pstore method which is covered by a generic driver.
</p>

<p class="indented continued">
This yields a much more realistic 31M PATH(Image).
There'<!--'-->s probably a, uh, right way to pack it into the device tree.
Alas, as demonstrated in the INTERNAL_LINK(kernal, how is <del>pointar formed</del> kernal loaded?) sexion, device trees can be decompiled
(though not unambiguously, since this time the kernel blob was formatted as <q><tt>data = [04 22 ELLIPSIS 74 00];</tt></q>):
</p>
<div class="bigcode continuing-inside" style="position: relative;">
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.dts"><aside>full device tree</aside></a>
#include "blogn_t/012b.08-repack.shell-session.html"
</div>
<p class="continuation">
(This is hopefully rather clear:
 splitting the file before and after the first <samp>data =</samp> line – the kernel'<!--'-->s –
 then pasting it back together with said line replaced with a hex dump from the LZ4ed image.
 The first two steps don'<!--'-->t need to be repeated and the latter two can be trivially pipelined together.)
</p>

<p class="indented continued">
So, after several identical signing rounds (with <var>orig</var> replaced with PATH(new.dtb)),
rebooting to a black screen,
letting it rip for a bit,
then <kbd>⟳</kbd>+power-buttoning:
</p>
<a href="/content/assets/blogn_t/012b.15-DSCN0583cvcc.png"><img alt="Linux version 6.6.11 (nabijaczlweli@tarta) (Debian clang version 18.0.0 ...)" src="/content/assets/blogn_t/012b.15-DSCN0583cvcc.png"></a>

<p class="indented continued">
It is now that I discovered that SYSRQ_COMBO(<kbd>r</kbd>) works,
so <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/new+pstored+sysrq.console-ramoops-0">full log</a>.
It'<!--'-->s rather inconsequential, but the interesting bits are
</p>
<pre class="continuing language-plaintext"><code class="language-plaintext" style="white-space: pre-wrap;"><!--
    "--><span class="token comment">[    0.000000]</span><!--"--> Linux version 6.6.11 (nabijaczleweli@tarta) (Debian clang version 18.0.0 (++20231231112334+c7c912cff945-1~exp1~20231231112352.433), Debian LLD 18.0.0) #8 SMP Mon Jan 22 03:42:58 CET 2024
<!--"--><span class="token comment">[    0.000000]</span><!--"--> KASLR disabled due to lack of seed
<!--"--><span class="token comment">[    0.000000]</span><!--"--> Machine model: Google Hana
<!--"--><span class="token comment">[    0.000000]</span><!--"--> efi: UEFI not found.
<!--"--><span class="token comment">[    0.000000]</span><!--"--> Reserved memory: created DMA memory pool at 0x00000000b7000000, size 5 MiB
<!--"--><span class="token comment">[    0.000000]</span><!--"--> OF: reserved mem: initialized node vpu_dma_mem_region@b7000000, compatible id shared-dma-pool
<!--"--><span class="token comment">[    0.000000]</span><!--"--> OF: reserved mem: 0x00000000b7000000..0x00000000b74fffff (5120 KiB) nomap non-reusable vpu_dma_mem_region@b7000000
<!--"--><span class="token comment">[    0.000000]</span><!--"--> NUMA: No NUMA configuration found
<!--"--><span class="token comment">[    0.000000]</span><!--"--> Initmem setup node 0 [mem 0x0000000040000000-0x000000013fffffff]
<!---->
<!--"--><span class="token comment">[    0.011840]</span><!--"--> smp: Brought up 1 node, 4 CPUs
<!--"--><span class="token comment">[    0.011902]</span><!--"--> SMP: Total of 4 processors activated.
<!--"--><span class="token comment">[    0.011910]</span><!--"--> CPU features: detected: 32-bit EL0 Support
<!--"--><span class="token comment">[    0.011917]</span><!--"--> CPU features: detected: 32-bit EL1 Support
<!--"--><span class="token comment">[    0.011925]</span><!--"--> CPU features: detected: CRC32 instructions
<!--"--><span class="token comment">[    0.012042]</span><!--"--> CPU: All CPU(s) started at EL2
<!---->
<!--"--><span class="token comment">[    0.044906]</span><!--"--> Serial: AMBA PL011 UART driver
<!--"--><span class="token comment">[    0.045354]</span><!--"--> pstore: Using crash dump compression: deflate
<!--"--><span class="token comment">[    0.045368]</span><!--"--> printk: console [ramoops-1] enabled
<!--"--><span class="token comment">[    0.045780]</span><!--"--> pstore: Registered ramoops as persistent store backend
<!--"--><span class="token comment">[    0.045791]</span><!--"--> ramoops: using 0x100000@0xb1f00000, ecc: 0<!--
--></code></pre>
<p class="continuation">
– 4G of RAM, 4 CPUs, clang trunk works, pstore works, so the device tree also works.
</p>

<p class="indented continued">
It does, however, end with a litany of expired time-outs for like every device –
</p>
<pre class="continuing" style="overflow: auto;">
<!--"-->[   10.976470]<!--"--> mtk-scpsys 10006000.scpsys: vdec: clk unavailable
<!--"-->[   10.976747]<!--"--> mt6577-uart 11002000.serial: Can'<!--'-->t get uart clock
<!--"-->[   10.978161]<!--"--> mediatek-hdmi-ddc 11012000.i2c: get ddc_clk failed: fffffffffffffdfb ,
<!--"-->[   10.978447]<!--"--> mediatek-cec 10013000.cec: Failed to get cec clock: -517
<!--"-->[   10.979634]<!--"--> mtk_vpu 10020000.vpu: get vpu clock failed
<!--"-->[   10.979742]<!--"--> mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
<!--"-->[   10.982016]<!--"--> platform 10212000.mailbox: deferred probe pending
<!--"-->[   10.982039]<!--"--> platform 11290000.usb-phy: deferred probe pending
<!--"-->[   10.982055]<!--"--> platform 10209100.hdmi-phy: deferred probe pending
<!--"-->[   10.982069]<!--"--> platform 1401e000.pwm: deferred probe pending
<!--"-->[   10.982083]<!--"--> platform backlight: deferred probe pending
<!--"-->[   10.982097]<!--"--> platform 1000d000.pwrap: deferred probe pending
</pre>
<p class="continuation">
Unclear to me what "deferred probe pending" means (do I need to <a href="//forum.chrultrabook.com/t/help-me-please-i-buyed-incorrect-drivers/218">buy a driver</a>?);
this is the hard part.
</p>

<p class="indented continued">
Actually the hard part turned out to be "getting Hifux to execute an init from an embedded »early userspace« initramfs"
(apparently it wants PATH(/init) (<code>rdinit=</code>) instead of PATH(/sbin/init) (<code>init=</code>)
 and only runs it if it exists and silently ignores everything if not;
 I only got to this with significant debugging),
since <a href="//blog.dowhile0.org/2022/06/21/how-to-troubleshoot-deferred-probe-issues-in-linux/"><cite>How to troubleshoot deferred probe issues in Linux</cite></a>
notes <a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d090b70ede02370014a1cf8acd211d1ed0fa9fd9">commit d090b70ede02: <cite>driver core: add deferring probe reason to devices_deferred property</cite></a>,
which <code>6.6</code> includes, puts the reason into PATH(/sys/kernel/debug/devices_deferred)
– while we aren'<!--'-->t at a real interactive userland yet
  (and can't embed one due to the Linux image limit, and the "bootloader" block doesn't appear to be forwarded as an initrd),
  a minimal "<code>cp /s/k/d/d_d /dev/kmsg</code>"-style cpio is 1.7M zstded –
dash, mount, libc6, libblkid1, libmount1, libpcre2, libselinux1 debs, a Makefile
</p>
<div class="continuing-inside">
#include "blogn_t/012b.09-faux-root.Makefile.html"
</div>
<p class="continuing">a simple init script to log the file every second</p>
<div class="continuing-inside">
#include "blogn_t/012b.10-faux-root.init.sh.html"
</div>
<p class="continuing">
and
<tt>CONFIG_INITRAMFS_SOURCE="<!--"--><span class="roboto-unscale"><span class="ell roboto">ELLIPSIS</span></span>/faux/root"<!--"--></tt>,
with a little ergonomic <tt>panic=1</tt> yields
</p>
<pre class="continuing" style="overflow: auto;"><!--
    "-->[   23.083931] Run /init as init process<!--"-->
<!--"-->[   23.145830] 23.14 69.15<!--"-->
<!--"-->[   23.181712] mtk-cpufreq	<!--"-->
<!--"-->[   23.209648] backlight	platform: supplier fixedregulator2 not ready<!--"-->
<!--"-->[   23.284973] 11230000.mmc	platform: wait for supplier /soc/pwrap@1000d000/mt6397/mt6397regulator/buck_vio18<!--"-->
<!--"-->[   23.387265] 11240000.mmc	platform: wait for supplier /soc/pwrap@1000d000/mt6397/mt6397regulator/ldo_vmc<!--"-->
<!--"-->[   23.501618] 1401d000.dpi	mediatek-dpi: Failed to get bridge<!--"-->
<!--"-->[   23.572462] 11260000.mmc	platform: wait for supplier /soc/pwrap@1000d000/mt6397/mt6397regulator/ldo_vgp3<!--"-->
<!--"-->[   23.681601] 1401b000.dsi	platform: wait for supplier /soc/i2c@11007000/edp-bridge@8/ports/port@0/endpoint<!--"-->
<!--"-->[   23.794384] 14025000.hdmi	<!--"-->
<!--"-->[   23.837822] panel	platform: wait for supplier /soc/i2c@11007000/edp-bridge@8/ports/port@1/endpoint<!--"-->
…
<!--"-->[   32.777145] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000<!--"
--></pre>
<p class="continuing">
which naturally points to <code>CONFIG_REGULATOR_MT6397</code>.
Re-building, re-signing, re-rebooting again shows
</p>
<pre class="continuing" style="overflow: auto;"><!--
    "-->[   24.315189] mtk-cpufreq	<!--"-->
<!--"-->[   24.342813] backlight	platform: supplier fixedregulator2 not ready<!--"-->
<!--"-->[   24.412245] 1401d000.dpi	mediatek-dpi: Failed to get bridge<!--"-->
<!--"-->[   24.473247] 11260000.mmc	platform: supplier fixedregulator0 not ready<!--"-->
<!--"-->[   24.559623] 1401b000.dsi	platform: wait for supplier /soc/i2c@11007000/edp-bridge@8/ports/port@0/endpoint<!--"-->
<!--"-->[   24.665648] 14025000.hdmi	<!--"-->
<!--"-->[   24.708081] panel	platform: wait for supplier /soc/i2c@11007000/edp-bridge@8/ports/port@1/endpoint<!--"
--></pre>
<p class="continuing">
which is already quite good, with both MMCs showing up
</p>
<pre class="continuing" style="overflow: auto;"><!--
    "-->[   17.525454] mmcblk0: mmc0:e624 SU08G 7.40 GiB<!--"-->
<!--"-->[   17.688381]  mmcblk0: p1 p5 p6 p9 p10 p15<!--"-->
<!---->
<!--"-->[   18.167701] mmc1: new HS400 MMC card at address 0001<!--"-->
<!--"-->[   18.269237] mmcblk1: mmc1:0001 DA4032 29.1 GiB<!--"-->
<!--"-->[   18.379454] GPT:partition_entry_array_crc32 values don't match: 0x9d2a6879 != 0xef8dd269<!--"-->
<!--"-->[   18.499823] GPT:Primary header thinks Alt. header is not at the end of the disk.<!--"-->
<!--"-->[   18.648561] GPT:61063167 != 61071359<!--"-->
<!--"-->[   18.648566] GPT:Alternate GPT header not at the end of the disk.<!--"-->
<!--"-->[   18.648569] GPT:61063167 != 61071359<!--"-->
<!--"-->[   18.735943] GPT: Use GNU Parted to correct GPT errors.<!--"-->
<!--"-->[   18.735978]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12<!--"-->
<!--"-->[   18.853013] mmcblk1boot0: mmc1:0001 DA4032 4.00 MiB<!--"-->
<!--"-->[   18.963993] mmcblk1boot1: mmc1:0001 DA4032 4.00 MiB<!--"-->
<!--"-->[   19.088099] mmcblk1rpmb: mmc1:0001 DA4032 16.0 MiB, chardev (238:0)<!--"
--></pre>
<p class="continuing">
(though note the now-randomised MMC order, and the explicit-by-name parted call-out. more like GNU Partition Table!)
but they still want, uh
</p>
<pre class="continuing" style="margin-left: 1em; overflow: auto;"><!--
    '-->$ grep -A1 fixedregulator <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.mt8173-elm-hana.dts">mt8173-elm-hana.dts</a><!--'-->
<!--'-->		fixedregulator0 {<!--'-->
<!--'-->			compatible = "regulator-fixed";<!--'-->
<!--'-->$ grep -r regulator-fixed | grep c:<!--'-->
<!--'-->drivers/regulator/fixed.c:              .compatible = "regulator-fixed",<!--'-->
<!--'-->$ grep fixed drivers/regulator/Makefile<!--'-->
<!--'-->obj-$(CONFIG_REGULATOR_FIXED_VOLTAGE) += fixed.o<!--'
--></pre>
<p class="continuing">
<samp>CONFIG_REGULATOR_FIXED_VOLTAGE</samp>:
</p>
<pre class="continuing" style="overflow: auto;"><!--
    "-->[   24.483011] mtk-cpufreq	<!--"-->
<!--"-->[   24.522681] 1401d000.dpi	mediatek-dpi: Failed to get bridge<!--"-->
<!--"-->[   24.587404] 1401b000.dsi	platform: wait for supplier /soc/i2c@11007000/edp-bridge@8/ports/port@0/endpoint<!--"-->
<!--"-->[   24.696106] 14025000.hdmi	<!--"-->
<!--"-->[   24.739520] panel	platform: wait for supplier /soc/i2c@11007000/edp-bridge@8/ports/port@1/endpoint<!--"
--></pre>
<p class="continuing">so</p>
<pre class="continuing" style="overflow: auto;"><!--
    '-->$ grep -A1 edp-bridge <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.mt8173-elm-hana.dts">mt8173-elm-hana.dts</a><!--'-->
<!--'-->			edp-bridge@8 {<!--'-->
<!--'-->				compatible = "parade,ps8640";<!--'-->
<!--'-->$ grep -r parade,ps8640<!--'-->
<!--'-->drivers/gpu/drm/bridge/parade-ps8640.c: { .compatible = "parade,ps8640" },<!--'-->
<!--'-->$ grep ps8640 drivers/gpu/drm/bridge/Makefile<!--'-->
<!--'-->obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o<!--'-->
<!--'-->$ grep DRM_PARADE_PS8640 .config<!--'-->
<!--'-->CONFIG_DRM_PARADE_PS8640=y<!--'
--></pre>
<p class="continuing">hm</p>
<pre class="continuing" style="overflow: auto;"><!--
    '-->$ grep -m1 -A1 11007000 <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.mt8173-elm-hana.dts">mt8173-elm-hana.dts</a><!--'-->
<!--'-->		i2c@11007000 {<!--'-->
<!--'-->			compatible = "mediatek,mt8173-i2c";<!--'-->
<!--'-->$ grep -r mediatek,mt8173-i2c | grep c:<!--'-->
<!--'-->drivers/i2c/busses/i2c-mt65xx.c:        { .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },<!--'-->
<!--'-->$ grep i2c-mt65xx drivers/i2c/busses/Makefile<!--'-->
<!--'-->obj-$(CONFIG_I2C_MT65XX)        += i2c-mt65xx.o<!--'-->
<!--'-->$ grep CONFIG_I2C_MT65XX .config<!--'-->
<!--'-->CONFIG_I2C_MT65XX=m<!--'
--></pre>
<p class="continuing">
which still doesn'<!--'-->t actually get us the screen due to the unchanging bridge issues, but
</p>
HEADING_S(2, mmc, class="continuation", <a style="font-size: .9em;" lang="de" href="//youtu.be/HqxKVQqoL5o">Mein Gott Leute, mein neu Linux hat mir einfach erlaubt dass ich MMC booten darf! Wie cool ist das bitte? Jetzt zocke ich Systemd und boote von MMC! <span style="text-transform: uppercase;">Yippee</span>!</a>)

<p class="indented continued">
But only after disabling <samp>CONFIG_INITRAMFS_SOURCE</samp> because if there is an initramfs embedded,
even if you don'<!--'-->t unpack it (<code>noinitrd</code>),
the rootfs mount willl ERRNO(ENOENT, No such file or directory) regardless,
which means you can get a panic with a blockdev dump listing available partition UUIDs when root= <em>already contains one of them</em>:
</p>
<!-- new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c.console-ramoops-0.no-initrd -->
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext" style="white-space: pre-wrap;"><!--
    '-->[   24.530570] VFS: Cannot open root device "PARTLABEL=chwast-root" or unknown-block(179,778): error -2<!--'-->
<!--'-->                                         (or "PARTUUID=b8c64d3b-7752-4132-a244-5a85fc14157a")<!--'-->
<!--'-->                                         (or "0b3:0030a")<!--'-->
<!--'-->[   24.639808] Please append a correct "root=" boot option; here are the available partitions:<!--'-->
<!--'-->[   24.739687] b300        30535680 mmcblk2 <!--'-->
<!--'-->[   24.739696]  driver: mmcblk<!--'-->
<!--'-->[   24.820866]   b301        26179560 mmcblk2p1 d8331ad0-ed78-f442-87f4-78df0130895a<!--'-->
…
<!--'-->[   26.001792]   b30c           32768 mmcblk2p12 bcf61070-764a-004f-8abd-590a44996a91<!--'-->
<!--'-->[   26.001798] <!--'-->
<!--'-->[   26.110005] 0b3:00100       4096 mmcblk2boot0 <!--'-->
<!--'-->[   26.110012]  (driver?)<!--'-->
<!--'-->[   26.191177] 0b3:00200       4096 mmcblk2boot1 <!--'-->
<!--'-->[   26.191183]  (driver?)<!--'-->
<!--'-->[   26.272335] 0b3:00300    7761920 mmcblk1 <!--'-->
<!--'-->[   26.272342]  driver: mmcblk<!--'-->
<!--'-->[   26.353498]   0b3:00301     204800 mmcblk1p1 1aa8056f-1357-6c45-a2f2-cb8bb98338e6<!--'-->
<!--'-->[   26.460663]   0b3:00305      16384 mmcblk1p5 8865bf3d-d8ea-574a-9c55-3aabefc1e84d<!--'-->
<!--'-->[   26.567834]   0b3:00306    2097152 mmcblk1p6 a0464221-9912-f146-ac7b-c6f489c25176<!--'-->
<!--'-->[   26.675000]   0b3:00309     102400 mmcblk1p9 1e061a8c-6159-4486-add1-988e88a06acf<!--'-->
<!--'-->[   26.782169]   0b3:0030a    1046872 mmcblk1p10 b8c64d3b-7752-4132-a244-5a85fc14157a<!--'-->
<!--'-->[   26.890374]   0b3:0030f      10240 mmcblk1p15 b6bbcc50-e420-4032-a2d2-ea69fce9cb53<!--'-->
<!--'-->[   26.890381] <!--'-->
<!--'-->[   26.998582] List of all bdev filesystems:<!--'-->
<!--'-->[   27.046449]  ext3<!--'-->
<!--'-->[   27.046453]  ext2<!--'-->
<!--'-->[   27.069350]  ext4<!--'-->
<!--'-->[   27.092248]  fuseblk<!--'-->
<!--'-->[   27.115147] <!--'-->
<!--'-->[   27.158861] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(179,778)<!--'
--></code></pre></div>
<p class="continuation">
and since it says <tt>unknown-block(179,778)</tt> (rather than "<samp>0,0</samp>") it <em>knows what it is!</em> but just can'<!--'-->t.
</p>

<p class="indented continued">
But rebuilding without, enabling <tt>serial-getty@ttyUSB0.service</tt>, plugging in a USB/serial adapter, and building and installing modules, we are greeted with
</p>
<!-- new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2 -->
<!--"--><a href="/content/assets/blogn_t/012b.16-ttyUSB0-login.png"><img alt="Debian GNU/Linux trixie/sid chwast ttyUSB0
(U+200B)
chwast login: nabijaczleweli
Password:
(U+200B)
Linux chwast 6.6.11 #73 SMP Thu Jan 25 08:06:59 CET 2024 aarch64
$ free -h
Mme: total 3.8Gi  used 220Mi  free 3.4Gi  shared 952Ki  buff/cache 295Mi  available 3.6Gi
$ cat /proc/device-tree compatible ; echo
google,hana-rev6 google,hana-rev5 google,hana-rev4 google,hana-rev3 google,hana-rev2 google,hana-rev1 google,hana mediatek,mt8173
$ lscpu
Architecture: aarch64
Vendor ID: ARM
Model name: Cortex-A53
Model: 2
Model name: Cortex-A72
Model: 0
Flags: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
NUMA node0 CPU(s): 0-3" src="/content/assets/blogn_t/012b.16-ttyUSB0-login.png"></a><!--"-->
<p class="continuation">
at a blazing 9600 bits per second.
You know it'<!--'-->s a modern system because that speed was achieved over <em>USB 3</em>.
</p>

<p class="indented continued">
This kinda mostly works, vaguely;
since the other end is a <a href="//lfs.nabijaczleweli.xyz/0017-twitter-export/#1184835796681023488">real RS232</a>,
the maximum speed is 115200 baud and oh boy is 11k/s (8k/s for binary data) fucking horrendous in year of the hog 2024!
</p>
<p class="indented continuation">
Wi-Fi <a href="//lore.kernel.org/linux-wireless/xebnh5c5rnfequ6khyhieugefrtt5mdftr6rsw522ocpg3yvln@tarta.nabijaczleweli.xyz/t/#u">backtraces with a warning</a>
and doesn'<!--'-->t work even after loading firmware (PATH(mrvl/sd8897_uapsta.bin) from firmware-libertas).
Neither does the screen in any meaningful way, even with firmware-misc-nonfree PATH(mediatek/mt8173/vpu_p.bin).
</p>

<p class="indented">
Concept proven: Debian PATH(new+<wbr />pstored+<wbr />sysrq+<wbr />clock-uvesa+<wbr />clk+<wbr />mmc+<wbr />devices_deferred2+<wbr />rtc+<wbr />6397+<wbr />fixed+<wbr />i2c+<wbr />usbsh2) runs in only 73 kernels,
a significant proportion of which I don'<!--'-->t think made it to the testing stage; this is probably like the twentieth in this lineage.
</p>


HEADING(2, foreign-config, Fraerin'<!--'--> ex%butinn^N)

<p class="indented continued">
But no matter what I do or what combination of seemingly-relevant configs I flip, shit don'<!--'-->t work.
This either means booting normally to the rootfs, or freezing completely with an inocuous log or one that doesn'<!--'-->t stand out at all.
<!-- new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy.console-ramoops-0 -->
This is exemplified by <a href="//101010.pl/@nabijaczleweli/111819728243407140">the latter happening</a> when turning on <code>CONFIG_DRM_FBDEV_EMULATION</code>.
Post factum I know for a fact this isn'<!--'-->t the issue,
but at one point it became obvious that this is some proxy-interactive behaviour with no way to validate it.
</p>
<p class="indented continuation">
If only someone had a validated-funxional config to test or diff against!
</p>

<p class="indented continued">
<a href="//www.google.com/search?client=firefox-b-d&q=google+hana+chromebook+linux"><cite>google hana chromebook linux - Google Search</cite></a>
</p>
<blockquote class="continuing">
	<h5 class="continuing"><a href="//github.com/hexdump0815/linux-mainline-on-arm-chromebooks">running linux mainline on arm chromebooks - for example</a></h5>
	lenovo <strong>chromebook</strong> n23 - <strong>hana</strong>; acer <strong>chromebook</strong> r13 - elm; lenovo <strong>chromebook</strong> ... https://support.<strong>google</strong>.com/chrome/a/answer/9139543?hl=en · https://chromium ...
</blockquote>

<p class="continuing">→</p>

<p class="indented continuing">
<a href="//github.com/hexdump0815/linux-mainline-on-arm-chromebooks"><cite>hexdump0815/linux-mainline-on-arm-chromebooks: running linux mainline on arm chromebooks - for example: ELLIPSIS acer r13 (oak elm and hana)ELLIPSIS and most probably many many more over time ...</cite></a>
</p>
<blockquote class="continuing">
	<h3 class="continuing">running linux mainline on arm chromebooks</h3>
	<h4 class="continuing">supported devices and linux distributions</h4>
	<ul>
		<li>chromebook oak:
		    <ul>
		    	<li>lenovo chromebook 300e (mt8173 version) - hana</li>
		    	<li><a href="//github.com/hexdump0815/imagebuilder/blob/main/systems/chromebook_oak/readme.md">https://github.com/hexdump0815/imagebuilder/blob/main/systems/chromebook_oak/readme.md</a></li>
		    </ul>
		</li>
	</ul>
</blockquote>

<p class="continuing">→</p>

<p class="indented continuing">
<a href="//github.com/hexdump0815/imagebuilder/blob/main/systems/chromebook_oak/readme.md"><cite>imagebuilder/systems/chromebook_oak/readme.md at main · hexdump0815/imagebuilder</cite></a>
</p>
<blockquote class="continuing">
	<h3 class="continuing">chromebook oak</h3>
	<h4 class="continuing">tested systems - working</h4>
	<ul><li>lenovo chromebook 300e (mt8173 version) - hana</li></ul>
	<h4 class="continuing">kernel build notes</h4>
	<ul><li><a href="//github.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/blob/master/readme.mt7">https://github.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/blob/master/readme.mt7</a></li></ul>
</blockquote>

<p class="continuing">in many ways it'<!--'-->s a program that builds it, making it the best type of notes, so →</p>

<p class="indented continuing">
<a href="//github.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/blob/master/readme.mt7"><cite>linux-mainline-mediatek-mt81xx-kernel/readme.mt7 at master · hexdump0815/linux-mainline-mediatek-mt81xx-kernel</cite></a>
</p>
<blockquote class="continuation">
	<pre class="continuing" style="white-space: pre-wrap;"><!--
	  	'--># patches for mt8173/oak<!--'-->
<!--	'-->for i in /compile/doc/stable-mt/misc.cbm/patches/v6.6/mt8173*.patch; do<!--'-->
<!--	'-->  echo === $i<!--'-->
<!--	'-->  patch -p1 < $i<!--'-->
<!--	'-->done<!--'
	--></pre>
	ELLIPSIS
	<pre class="continuing" style="white-space: pre-wrap;">scripts/kconfig/merge_config.sh -m arch/arm64/configs/defconfig /compile/doc/kernel-config-options/chromebooks-aarch64.cfg /compile/doc/kernel-config-options/mediatek.cfg /compile/doc/kernel-config-options/docker-options.cfg /compile/doc/kernel-config-options/options-to-remove-generic.cfg /compile/doc/stable-mt/misc.cbm/options/options-to-remove-special.cfg /compile/doc/kernel-config-options/additional-options-generic.cfg /compile/doc/kernel-config-options/additional-options-aarch64.cfg /compile/doc/stable-mt/misc.cbm/options/additional-options-special.cfg</pre>
</blockquote>

<p class="indented continued">
The patches are superficially worrying, but they all just touch the device tree –
</p>
#define HEXPATCH(nm) <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/blob/ef833e9d47339e2841afc4638b87180fade207e0/misc.cbm/patches/v6.6/nm)>PATH(nm)</a>
<dl class="continuing patch-list">
	<dt>HEXPATCH(mt8173-fix-mmc-order.patch)</dt>
	<dd>MMCs in the fixed ChromiumOS
	<dl class="linear">
		<dt>0</dt> <dd>internal</dd>
		<dt>1</dt> <dd>external</dd>
		<dt>2</dt> <dd>Wi-Fi</dd>
	</dl>
	order in the alias list
	</dd>

	<dt>HEXPATCH(mt8173-fix-mmc1-speed.patch)</dt>
	<dd><q>remove even more high speed mmc stuff to get it working stable</q></dd>

	<dt>HEXPATCH(mt8173-higher-temps.patch)</dt>
	<dd>PATH(/thermal-zones/cpu_thermal/trips/trip-point0) 60000⇒70000m°C and
	    PATH(…/trip-point1) 65000⇒75000m°C</dd>
</dl>
<p class="continuing">
– whereas the same cannot be said for the MT8183 patches, but thankfully none of them are relevant here.
It is of interest to evaluate these against the PATH(mt8173-elm-hana.dtb) [<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.mt8173-elm-hana.dts">decompiled</a>] device tree distributed by ChromiumOS
</p>
<dl class="continuation patch-list">
	<dt>HEXPATCH(mt8173-fix-mmc-order.patch)</dt>
	<dd>the ordering <em>is</em> somehow stable but <em>not</em> via the alias list</dd>

	<dt>HEXPATCH(mt8173-fix-mmc1-speed.patch)</dt>
	<dd>the patch quarters the maximum clock frequency of <samp>mmc1</samp> – the pluggable one – to 50MHz
	    and removes <code>sd-uhs-sdr{50,104}</code> tags therefrom,
	    upstream doesn'<!--'-->t do this.</dd>

	<dt>HEXPATCH(mt8173-higher-temps.patch)</dt>
	<dd>matches Linux'<!--'-->s 60°C and 65°C;
		  unclear to me why the patch raises it – this originates in
	    <a href="//github.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/commit/7c0cea812b7cabcf1b35527030c47999c259bcdd">commit <tt style="font-family: monospace;">7c0cea8</tt> (<q><cite>raise temps for elm a bit</cite></q>)</a>
	    with no further commentary;
	    upstream, they were added in
	    <a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=689b937beddebf2d7c57249206428b8eecf4646b">commit <tt style="font-family: monospace;">689b937bedde</tt> (<q><cite>arm64: dts: mediatek: add mt8173 elm and hana board</cite>></q></a>
	    already as 60/65;
	    giving it another 10° here <em>probably</em> isn'<!--'-->t gonna <em>super</em> fuck it up,
	    but it'd've been nice to see some reasoning and maybe measurements and potentially a list of considerations given :v</dd>
</dl>

<p class="indented continued">
Merging the configs per the crusty-ass spec works and produces a boot bundle that doesn'<!--'-->t work.
But given that the blob in <tt><q>EFI-SYSTEM</q></tt> also contains a different set of device trees paired with its older kernel
(indeed, a set so different it doesn'<!--'-->t even include PATH(mt8173-elm-hana.dtb)
 and the only <code>description</code> that'<!--'-->s vaguely similar is <code>"mt8173-hana-rev0.dtb"</code>),
a quick re-pack after the prescribed <samp>make dtbs</samp>
</p>
<div class="bigcode continuing-inside">
#include "blogn_t/012b.11-repack-full.shell-session.html"
</div>
<p class="continuing">
— you may notice or rember the DTB is SHA1ed. This doesn'<!--'-->t do jack shit, <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd&mwifiex+mmc1.sys-firmware-log">not even as a logged diagnostic</a>. I even forgor 💀 at the time —
shows
</p>
<a href="/content/assets/blogn_t/012b.17-DSCN0586cvcc.JPG"><img alt="Screen of the Chromebook showing four penguins and a systemd boot-up log." src="/content/assets/blogn_t/012b.17-DSCN0586cvcc.JPG"></a>


HEADING(2, 🐧, 🐧🐧🐧🐧)

<p class="indented continued">
That'<!--'-->s an okay start, but as exemplified by the penguins this is a vajazzled defconfig instead of the reasonable Debian config,
so Wi-Fi still doesn'<!--'-->t work (though that may just be the way iwd drives it and it may work with another userland),
and mounting EXT4s <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/stb+dtb.dmesg-fkern">throws warnings (final lines)</a>,
so beside the screen working it'<!--'-->s not a great kernel.
</p>
<p class="indented continuing">
One would hope that just repacking the best kernel to date with the new device tree would work (it doesn'<!--'-->t).
Or that applying the same set of diffs to PATH(/boot/config-6.6.11-arm64) would (also no).
</p>
<p class="indented continuing">
Why? well,
</p>
HEADING_S(3, days, class="continuing", this is where I spend two further straight days building kernels to find out.)
<p class="continuing">
And that is a very literal "straight" – given this final <code>ls -rtlh *.dtb</code> of my PATH(newkernel) directory
(also <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel">browsable and downloadable with corresponing configs, modules, and logs</a>):
</p>
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
21M 01-22 03:44 new+pstored+sysrq.dtb
20M 01-23 05:40 debian.dtb
21M 01-23 06:04 new+pstored+sysrq+clock.dtb
21M 01-23 07:07 new+pstored+sysrq+clock-uvesa.dtb
22M 01-23 16:01 new+pstored+sysrq+clock-uvesa+clk.dtb
22M 01-23 19:02 new+pstored+sysrq+clock-uvesa+clk+initrd.dtb
22M 01-23 20:16 new+pstored+sysrq+clock-uvesa+clk+mmc.dtb
24M 01-24 02:29 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred.dtb
24M 01-24 02:36 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2.dtb
24M 01-24 02:47 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc.dtb
24M 01-24 20:42 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397.dtb
24M 01-24 22:47 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed.dtb
24M 01-25 00:13 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c.dtb
24M 01-25 01:06 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c@mount.dtb
23M 01-25 03:24 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c-initrd.dtb
23M 01-25 08:18 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2.dtb
<span class="token important"><!--'-->#               ^ first serial-interactive session<!--'--></span>
23M 01-25 21:02 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy.dtb
22M 01-26 02:38 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy.dtb
18M 01-26 07:27 stb+dtb.dtb
<span class="token important"><!--'-->#               ^ the 🐧🐧🐧🐧 config<!--'--></span>
22M 01-26 21:37 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma.dtb
22M 01-26 22:17 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple.dtb\
</code></pre></div>
<p class="continuation">
we are currently here.
</p>

<p class="indented continued">
This followed:
</p>
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
17M 01-26 23:54 deb+options-to-remove-special.cfg+mediatek.cfg+additional-options-special.cfg.dtb
18M 01-27 00:30 deb+options-to-remove-special.cfg+mediatek.cfg+additional-options-special.cfg+full.dtb
18M 01-27 01:19 deb+options-to-remove-special.cfg+mediatek.cfg+additional-options-special.cfg+full+all.dtb
17M 01-27 01:46 deb+options-to-remove-special.cfg+mediatek.cfg+additional-options-special.cfg+full+all+gen.dtb
17M 01-27 02:29 deb2+1.dtb
18M 01-27 02:44 deb2+2.dtb
18M 01-27 02:56 deb2+3.dtb
18M 01-27 03:08 deb2+4.dtb
18M 01-27 03:13 deb2+5.dtb
18M 01-27 03:20 deb2+6.dtb
18M 01-27 03:25 deb2+7.dtb
18M 01-27 03:30 deb2+8.dtb
18M 01-27 03:34 deb2+9.dtb
18M 01-27 03:37 deb2+11.dtb
18M 01-27 03:37 deb2+10.dtb
18M 01-27 03:46 deb2+12.dtb
<span class="token important"><!--'-->#               ^ ./tools/testing/ktest/config-bisect.pl 1 (jack shit)<!--'--></span>
22M 01-27 04:35 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+bi.dtb
<span class="token important"><!--'-->#               ^ bisexion diff applied to the previous one (still jack shit)<!--'--></span>
15M 01-27 04:51 bis.dtb
17M 01-27 05:02 bis+2.dtb
17M 01-27 05:48 bis+3.dtb
17M 01-27 06:57 bis+4.dtb
18M 01-27 08:05 bis+5.dtb
18M 01-27 08:51 bis+6.dtb
18M 01-27 08:55 bis+7.dtb
18M 01-27 09:13 bis+8.dtb
18M 01-27 09:17 bis+9.dtb
18M 01-27 09:37 bis+10.dtb
18M 01-27 09:40 bis+11.dtb
<span class="token important"><!--'-->#               ^ ./tools/testing/ktest/config-bisect.pl 2 (also jack shit, and different variable)<!--'--></span>\
</code></pre></div>
<!-- https://101010.pl/@nabijaczleweli/111827127924897644 -->
<!-- https://discord.com/channels/@me/576788179441680394/1200727231090131024 -->
<p class="indented continuing">
And this is where the first issue that made applying the diffs not work finally became apparent:
they <a href="//github.com/hexdump0815/kernel-config-options/blob/b343fac366111080b042ab078eb29b9e8b28e35d/mediatek.cfg#L13">set</a>,
for example
</p>
<blockquote class="continuing"><pre class="continuing">\
CONFIG_DRM_MEDIATEK_HDMI=y
CONFIG_DRM_MEDIATEK_DP=y
CONFIG_DRM_MEDIATEK=y\
</pre></blockquote>
<p class="continuing">
but <code>make oldconfig</code> (or <code>olddefconfig</code>, or any <code><var>*</var>config</code>, or any build job),
which updates the existing PATH(.config) to match both the current kernel and its invariants updates it to
</p>
<blockquote class="continuing"><pre class="continuing">\
CONFIG_DRM_MEDIATEK=m
CONFIG_DRM_MEDIATEK_DP=m
CONFIG_DRM_MEDIATEK_HDMI=m\
</pre></blockquote>
<p class="continuing">
because <code>CONFIG_DRM_MEDIATEK</code> depends on <code>CONFIG_DRM</code>, which is also built as a module.
</p>
<p class="indented continuation">
So instead of transitively updating the dependency tree to comply with the "build this in" spec, it just silently downgrades them all to be modules.
Observant readers may note that this is the second time this mentality manifests within this post.
</p>

<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
17M 01-27 16:57 hm+p.dtb
23M 01-27 18:54 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+merged.dtb
<span class="token important"><!--'-->#               ^ {chromebooks-aarch64,mediatek,additional-options-aarch64,additional-options-special}.cfg applied mechanically<!--'--></span>
<span class="token important"><!--'-->#                 and the other cfgs applied manually<!--'--></span>
23M 01-27 19:22 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+merged-svs.dtb
22M 01-27 19:31 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+merged-svs+fb.dtb
22M 01-27 19:50 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+merged-svs+fb+df.dtb
21M 01-27 20:13 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+merged-svs+fb+df+drm.dtb
22M 01-27 20:36 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+merged-svs+fb+df+drm+more.dtb
22M 01-27 20:48 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+merged-svs+fb+df+drm+more+nogoog.dtb\
</code></pre></div>
<p class="continuing"><em>finally</em> yielded</p>
<!-- https://discord.com/channels/@me/576788179441680394/1200890782056456352 -->
<!-- https://101010.pl/@nabijaczleweli/111830159292264671 -->
<a href="/content/assets/blogn_t/012b.18-DSCN0589cvcc.JPG"><img alt="Four monochrome penguins and am all-green systemd boot log displayed on the chromebook" src="/content/assets/blogn_t/012b.18-DSCN0589cvcc.JPG"></a>

<p class="indented continued">
This marks the first Debian-derived, and thus meaningfully diffable, config.
(You can'<!--'-->t really pick the interesting bits out of the relentless torrent of defconfig diff.)
</p>
<p class="indented continuing">
The key?
Turning <em>off</em> <code>GOOGLE_FRAMEBUFFER_COREBOOT</code>!
</p>
<p class="indented continuing">
With it you see
</p>
<pre class="continuing" style="white-space: pre-wrap;"><!--
    "-->[    0.386886]<!--"--> simple-framebuffer simple-framebuffer.0: simplefb: cannot reserve video memory at [mem 0x00000000-0x00400fff]
<!--"-->[    0.386911]<!--"--> simple-framebuffer simple-framebuffer.0: framebuffer at 0x0, 0x401000 bytes
<!--"-->[    0.386919]<!--"--> simple-framebuffer simple-framebuffer.0: format=a8r8g8b8, mode=1366x768x32, linelength=5464<!--
--></pre>
<p class="continuing">
at the end of the dmesg and then it hangs.
The "cannot reserve video memory" is just a warning that it can'<!--'-->t lock it exclusively,
and it then, presumably, initialises the range [0, 0x400FFF], razing the interrupt table that'<!--'-->s probably unmoved from <var>0</var>.
</p>
<p class="indented continuing">
Without it it just boots and logs
</p>
<pre class="continuing" style="white-space: pre-wrap;"><!--
    "-->[    1.098264] [drm] Initialized mediatek 1.0.0 20150513 for mediatek-drm.12.auto on minor 0<!--"-->
<!--"-->[    1.303268] Console: switching to colour frame buffer device 170x48<!--"-->
<!--"-->[    1.334367] mediatek-drm mediatek-drm.12.auto: [drm] fb0: mediatekdrmfb frame buffer device<!--"
--></pre>
<p class="continuing">
as it ought to.
</p>
<p class="indented continuing">
The Debian config is such that this automatically turns on/off when toggling <code>CONFIG_FB_SIMPLE</code> (or whatever); the defconfig isn'<!--'-->t.
This is not obvious because the warning looks like an error,
and there are like seven different drivers that log as "simple-framebuffer",
and approximately twenty "simple framebuffer"s.
Not to mention the spoopy axion at a distance with the actual driver – <tt>framebuffer-coreboot</tt> – not logging as itself.
</p>
<p class="indented continuing">
Naturally, one wants to enable all the <samp>GOOGLE</samp>/<samp>CROS</samp> configs, and you should; just not this one.
</p>

<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
22M 01-27 23:17 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+merged-svs+fb+df+drm+more+nogoog+somegoog.dtb
22M 01-28 01:38 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+nogoog.dtb
22M 01-28 01:51 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+nogoog+emul.dtb
23M 01-28 02:24 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+nogoog+emul+paneldrm.dtb
23M 01-28 02:40 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+nogoog+emul+paneldrm+spi.dtb
22M 01-28 03:31 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+nogoog+emul+paneldrm+spi+pins+regulator.dtb
22M 01-28 04:22 new+pstored+sysrq+clock-uvesa+clk+mmc+devices_deferred2+rtc+6397+fixed+i2c+usbsh2+legacy-legacy+dtb+dma+simple+nogoog+emul+paneldrm+spi+pins+regulator+noemul+emul.dtb
18M 01-28 17:57 mandeb.dtb
20M 01-28 18:35 mandeb+initrd.dtb
20M 01-28 18:46 mandeb+initrd+1.dtb
20M 01-28 19:03 mandeb+initrd+1+tabs.dtb
20M 01-28 19:09 mandeb+initrd+1+tabs1.dtb
20M 01-28 19:28 mandeb+initrd+1+tabs2+reg.dtb
20M 01-28 19:51 mandeb+initrd+1+tabs2+reg+drm.dtb
20M 01-28 20:03 mandeb+initrd+1+tabs2+reg+drm+adc.dtb\
</code></pre></div>
<p class="indented continuing">
This was my limit for the
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/mandeb+initrd+1+tabs2+reg+drm+adc.pmsg-ramoops-0">useless PATH(/sys/kernel/debug/devices_deferred) dumps</a>,
and where finally instead of thinking "if only there were a way to have a config contain what's in my device tree"
I found and applied PATH(scripts/dtc/dt_to_config).
Of course, it wants to be in a git checkout
(which I have, but is annoying –
 you could probably replace the <a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/dtc/dt_to_config?id=861c0981648f5b64c86fd028ee622096eb7af05a#n805"><code><q>git grep</q></code></a> with <code>grep -rI</code> with the same effect of not looking into artifacts),
but even beside that it produces a <a href="//www.youtube.com/shorts/-Tzxx0XFrjI">brain destroyer</a> format:
</p>
<pre class="continuation" style="position: relative; overflow: auto; margin-left: 1em;">\
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/dt_to_config.log"><aside>full log</aside></a>\
-dD----H----- : /backlight : pwm-backlight : arch/arm/mach-s3c/mach-crag6410.c : no_config : none
-dDc---H----- : /backlight : pwm-backlight : drivers/video/backlight/pwm_bl.c : CONFIG_BACKLIGHT_PWM : none
<!---->
-dDc--------- : /connector : hdmi-connector : drivers/gpu/drm/bridge/display-connector.c : CONFIG_DRM_DISPLAY_CONNECTOR : none
-dDc--------- : /connector : hdmi-connector : drivers/gpu/drm/bridge/lontium-lt8912b.c : CONFIG_DRM_LONTIUM_LT8912B : none
-dDc----x---- : /connector : hdmi-connector : drivers/gpu/drm/mediatek/mtk_hdmi.c : mediatek-drm-hdmi-objs : none
-dDc----x---- : /connector : hdmi-connector : drivers/gpu/drm/sun4i/sun4i_drv.c : sun4i-drm-y : none
<!---->
------------- : /cpus/cpu@0 : arm,cortex-a53 : no_driver : no_config : none
<!---->
------------- : /cpus/cpu@1 : arm,cortex-a53 : no_driver : no_makefile : none
<!---->
-d-c----x---- : /cpus/cpu@100 : arm,cortex-a72 : drivers/soc/bcm/brcmstb/biuctrl.c : obj-y : none
<!---->
-d-c----x---- : /cpus/cpu@101 : arm,cortex-a72 : drivers/soc/bcm/brcmstb/biuctrl.c : obj-y : none\
</pre>

<p class="indented continued">
Thankfully this can be avoided with <code>--config-format</code> which is less arcane –
</p>
<pre class="continuing" style="position: relative; overflow: auto; margin-left: 1em;">\
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/dt_to_config"><aside>full config</aside></a>\
<!----># -dD----H----- : /backlight : pwm-backlight : arch/arm/mach-s3c/mach-crag6410.c : no_config : none
<!----># no_config
<!----># -dDc---H----- : /backlight : pwm-backlight : drivers/video/backlight/pwm_bl.c : CONFIG_BACKLIGHT_PWM : none
<!----># CONFIG_BACKLIGHT_PWM is not set
<!----># CONFIG_BACKLIGHT_PWM=y
<!---->
<!----># -dDc--------- : /connector : hdmi-connector : drivers/gpu/drm/bridge/display-connector.c : CONFIG_DRM_DISPLAY_CONNECTOR : none
<!----># CONFIG_DRM_DISPLAY_CONNECTOR is not set
<!----># CONFIG_DRM_DISPLAY_CONNECTOR=y
<!----># -dDc--------- : /connector : hdmi-connector : drivers/gpu/drm/bridge/lontium-lt8912b.c : CONFIG_DRM_LONTIUM_LT8912B : none
<!----># CONFIG_DRM_LONTIUM_LT8912B is not set
<!----># CONFIG_DRM_LONTIUM_LT8912B=y
<!----># -dDc----x---- : /connector : hdmi-connector : drivers/gpu/drm/mediatek/mtk_hdmi.c : mediatek-drm-hdmi-objs : none
<!----># mediatek-drm-hdmi-objs
<!----># -dDc----x---- : /connector : hdmi-connector : drivers/gpu/drm/sun4i/sun4i_drv.c : sun4i-drm-y : none
<!----># sun4i-drm-y\
</pre>
<p class="continuing">
and can be quite trivially analysed against the current-best with something like
</p>
<div class="continuing-inside">
#include "blogn_t/012b.12-d_t_c-analysis.shell-session.html"
</div>
<p class="continuing">
to then upgrade
<code>CONFIG_{ARM_MEDIATEK_CPUFREQ{,_HW},<wbr />BACKLIGHT_PWM,<wbr />CPUFREQ_DT,<wbr />DRM_DISPLAY_CONNECTOR,<wbr />I2C_HID_{CORE,OF},<wbr />I2C_MT65XX,<wbr />KEYBOARD_GPIO,<wbr />MFD_ROHM_BD718XX}</code>
and enable
<code>I2C_HID_OF_{ELAN,GOODIX}</code>,
yielding
</p>
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
20M 01-28 20:37 mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c.dtb
18M 01-28 20:43 mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd.dtb\
</code></pre></div>
<p class="continuing">i.e.</p>
<a href="/content/assets/blogn_t/012b.19-DSCN0591cvcc.png"><img style="max-height: 30em;" alt="listing of some paths under sysfs, a few times a second apart, then a listing of MMC devices, displayed on the Chromebook's display" src="/content/assets/blogn_t/012b.19-DSCN0591cvcc.png"></a>
<p class="continuing">
which, with no missing devices and, well, showing up on the screen, bodes very well!
and
</p>
<a href="/content/assets/blogn_t/012b.20-DSCN0592cvcc.JPG"><img alt="an all-green systemd boot log with fsck running, on the chromebook screen" src="/content/assets/blogn_t/012b.20-DSCN0592cvcc.JPG"></a>
<p class="continuing">
which may be one of this generation'<!--'-->s yippeeest moments.
</p>
<p class="indented continuing">
(The ERRNO(ENODEV, Invalid argument)s at the top are from a lack of modules on this first boot.)
(Also note how <samp>modprobe@efi_pstore.service</samp> succeeds.
 I don't really know how or why, given that this system lacks EFI (and ACPI for that matter) and they're both configured away completely.)
And after a quick module installation, I'<!--'-->ve achieved
</p>
HEADING(2, speedrun, arm64 Chromebook Debian port any% 17-day RTA/#137 IGT WR)
<a href="/content/assets/blogn_t/012b.21-DSCN0597c.JPG"><img alt="the chromebook screen showing a getty login prompt, then 'Linux chwast 6.6.11 #137 SMP Sun Jan 28 20:42:40 CET 2024 aarch64' from /etc/issue after login, with last login on ttyUSB0; also I'm in the reflection pulling a face" src="/content/assets/blogn_t/012b.21-DSCN0597c.JPG"></a>
<p class="indented continuation">
(I'<!--'-->m even in the clip!)
All these bundles listed above accumulate to 74 and I lost at most like 4 images, so a few sequence numbers were spent on QEMU pre-testing.
</p>

<p class="indented continued">
Even X.Org works!
</p>
<iframe width="640" height="360" src="//www.youtube.com/embed/uKeGmKpOosA" title="Debian on the Lenovo 300e 2nd-gen MTK arm64 Chromebook (hana) (real)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

<p class="indented continued">
But there'<!--'-->s three obvious issues:
</p>
<ol>
	<li>no local sound output devices (speakers or headphone jack) – well, they show up as
<pre class="continuing" style="white-space: pre-wrap;">\
input: mtk-rt5650 Headset Jack as /devices/platform/sound/sound/card0/input8
input: mtk-rt5650 HDMI Jack as /devices/platform/sound/sound/card0/input9\
</pre>
		  in the dmesg but pipewire doesn'<!--'-->t see them
	</li>
	<li>wi-fi driver still <a href="//lore.kernel.org/linux-wireless/xebnh5c5rnfequ6khyhieugefrtt5mdftr6rsw522ocpg3yvln@tarta.nabijaczleweli.xyz/t/#u">backtraces with a warning</a></li>
	<li>the fucking SD card is horrendous</li>
</ol>

<p class="indented continued">
3. is the most pressing for both usability reasons (it'<!--'-->s bound to be slow, but not <em>that</em> slow)
and because sometimes I/O will just, like, effectively hang, with kilobyte-sized mmaps taking seconds, and the dmesg complaining that the card is "stuck busy",
all with a blatant culprit – HEXPATCH(mt8173-fix-mmc1-speed.patch).
The SD card was solid under <tt>KERN-A</tt> which has all the full-speed stuff this patch disables.
</p>
<p class="indented continuing">
By performing a speed-running trick called "forwarding to the list while modules were building four days ago",
I already have a <a href="//lore.kernel.org/linux-wireless/59378600-8d36-4958-8882-fa693fcad4d6@yandex.ru/t/#u">prospective patch</a> for 2.,
so I can be oh-so-brave (with only a <em>quick</em> glance at if it'<!--'-->d be catastrophic!) and update the module while at it –
re-building <samp>dtbs modules</samp> with <em>just</em> HEXPATCH(mt8173-higher-temps.patch) and the diff from the mail yields
</p>
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
18M 01-31 00:00 <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd&mwifiex+mmc1.journalctl-b" style="color: inherit;">mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd&mwifiex+mmc1.dtb</a>\
</code></pre></div>
<p class="continuing">
and while the Wi-Fi warning <a href="//lore.kernel.org/linux-wireless/dygt52o6wj4u7a2b4k7uew2g2hym7j5bxyavkafjk4vue6b2ue@tarta.nabijaczleweli.xyz/t/#u">goes away</a>,
the SD card rootfs experience is as shit as ever.
</p>
<p class="indented continuing">
But this may well be because my SD card is not fast enough to qualify for any of the speed boosts – the two internal ones are
<tt><q>new HS400 MMC card</q></tt> and <tt><q>new ultra high speed SDR104 SDIO card</q></tt> but this one is just <tt><q>new high speed SDHC card</q></tt>;
maybe we need to actually install Debian because this is horrendous.
This may be fixable with an SD card worth as much as the laptop instead of my drawer special,
but that still kinda defeats the purpose of a laptop with an internal <del>disk</del>rectangle.
</p>
<p class="indented continuing">
Testing with such a card on the 4.19 ChromiumOS kernel,
I could reproduce the "instability" with a simple test (<code>b2sum /dev/mmcblk1</code>),
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/4.19-SDR104-panic">presenting itself as a kernel segfault</a>
and <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/6.6.11-SDR104">likewise on the 6.6.11 kernel</a>.
Applying the patch fixes it (and runs the card at "high speed").
</p>
<p class="indented continuation">
The MMC ordering appears to already be stable, so while it was random with the original device tree,
that one'<!--'-->s for 4.19, so it may just be and old-device-tree issue?
The patch itself blames back to
<a href="//github.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/commit/01101e3501aef9191109e464af458f2382232ac5">commit <tt style="font-family: monospace;">01101e3</tt> (<q><cite>promising experiments based on apline linux-elm apk</cite></q>)</a>
as PATH(misc.cbm/patches/alpine/fix-mmc-order.patch).
Not that "identical device enumeration order" is a sensible goal unto itself in a.d. 2020 regardless.
</p>

#define PACKAGE(p) <a href=STR(httpsCOLON_SLASH_SLASHpackages.debian.org/sid/p)><cite style="font-style: inherit;">p</cite></a>
<blockquote class="continued"><pre style="white-space: pre-wrap;" class="continued">\
<!--"--> rt5650 Playback: ASoC: no backend DAIs enabled for rt5650 Playback, possibly missing ALSA mixer-based routing or UCM profile<!--"-->\
</pre></blockquote>
<p class="continuing">
is the lead for issue 1.
A quick <a href="//packages.debian.org/search?suite=sid&mode=filename&searchon=contents&keywords=rt5650">search for files matching <code>*rt5650*</code></a> in sid
shows an unbounded amount of linuxes but starts with PACKAGE(firmware-sof-signed)
and PATH(/lib/firmware/intel/sof-tplg/sof-adl-rt5650.tplg),
whose description says it
<q>Provides the Intel SOF audio firmware and topology needed for audio functionality on some Intel system.</q>,
which this isn't, so it's not it (not that I didn'<!--'-->t try).
</p>
<p class="indented continuing">
Searching locally instead via <samp>dpkg -S rt5650</samp> actually reveals PACKAGE(alsa-ucm-conf), with
</p>
<ul style="padding-left: 1em;">
	<li>PATH(/usr/share/alsa/ucm2/MediaTek/mtk-rt5650/HDMI.conf)</li>
	<li>PATH(/usr/share/alsa/ucm2/MediaTek/mtk-rt5650/HiFi.conf)</li>
	<li>PATH(/usr/share/alsa/ucm2/MediaTek/mtk-rt5650/init.conf)</li>
	<li>PATH(/usr/share/alsa/ucm2/MediaTek/mtk-rt5650/mtk-rt5650.conf)</li>
	<li>PATH(/usr/share/alsa/ucm2/conf.d/mtk-rt5650/mtk-rt5650.conf)</li>
</ul>
<p class="continuing">
which sure looks like it'<!--'-->d match what the driver complains about not having! but has.
</p>
<p class="indented continuing">
This kinda smells like the bluetooth situation where you need libspa-0.2-bluetooth to have bluetooth audio.
Indeed, <code>apt search pipewire</code> reveals
</p>
<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token green">PACKAGE(pipewire-alsa)</span>/unstable 1.0.1-2 arm64
<!--"-->  <!--"-->Pipewire ALSA plugin\
</code></pre>
<p class="continuing">
but this is actually a plugin <em>for</em> ALSA to output <em>to</em> pipewire.
Not that you'<!--'-->d know this from the package description.
I know it from the damn arch wiki.
Reported as <a href="//bugs.debian.org/1062262"><cite>Bug#1062262: pipewire-alsa: adversarial description</cite></a>.
</p>
<p class="indented continuing">
Further <code>apt search alsa</code>ing shows
</p>
<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token green">PACKAGE(alsa-tools)</span>/unstable 1.2.5-3 arm64
<!--"-->  <!--"-->Console based ALSA utilities for specific hardware
<!---->
<span class="token green">PACKAGE(alsa-utils)</span>/unstable 1.2.10-1.1 arm64
<!--"-->  <!--"-->Utilities for configuring and using ALSA\
</code></pre>
<p class="continuing">
can you guess which one is a sussy baka amongus and which one is the chad taskpilled crewmatecel?
The latter lists
</p>
<blockquote class="continuing"><pre class="continuing"><tt>\
Included tools:
 - alsaucm: alsa use case manager\
</tt></pre></blockquote>
<p class="continuing">
so if you voted for the latter you will not be ejected.
Amazingly, during the emergency meeting <code>aplay -l</code> and <code>arecord -l</code> corroborated <samp>mtkrt5650</samp> venting:
</p>
<pre class="continuing language-plaintext"><code class="language-plaintext">\
**** List of PLAYBACK Hardware Devices ****
card 0: mtkrt5650 [mtk-rt5650], device 0: rt5650 Playback (*) []
<!--"-->  <!--"-->Subdevices: 1/1
<!--"-->  <!--"-->Subdevice #0: subdevice #0
card 0: mtkrt5650 [mtk-rt5650], device 2: HDMI PCM (*) []
<!--"-->  <!--"-->Subdevices: 1/1
<!--"-->  <!--"-->Subdevice #0: subdevice #0\
</code></pre>
<pre class="continuing language-plaintext"><code class="language-plaintext">\
**** List of CAPTURE Hardware Devices ****
card 0: mtkrt5650 [mtk-rt5650], device 1: rt5650 Capture (*) []
<!--"-->  <!--"-->Subdevices: 1/1
<!--"-->  <!--"-->Subdevice #0: subdevice #0\
</code></pre>
<p class="continuing">
but <code>aplay</code> doesn'<!--'-->t and <code>arecord</code> records all zeroes.
</p>
<p class="indented continuing">
<code>alsaucm</code> is one of those programs that definitely make sense to the authors.
But by clicking around –
running everything, in order, from <a href="//manpages.debian.org/unstable/alsa-utils/alsaucm.1.en.html"><cite>alsaucm(1)</cite></a>
(only real science on da blog):
</p>
<div class="continuing-inside">
#include "blogn_t/012b.13-alsaucm.shell-session.html"
</div>
<p class="continuing">
(why the fuck does it all have underscores?
 why is "HiFi" a verb?
 why is the "verb" denoted as optional after <code>_devices</code> and <code>_modifiers</code> but isn'<!--'-->t?
 why can I not know what the current "verb" is?
 what would doing the verb even <em>do</em>?)
</p>
<p class="continuing">
and unloading and inserting every sound module (or rebooting! presumably the "verb" gets persisted somewhere up them guts)
now replaced <a href="//bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=1062213;msg=5">"Dummy Output"</a> in <code>wpctl status</code> with
</p>
<div class="bigcode continuing-inside"><pre class="continuing language-ANSI"><code class="language-ANSI">\
<!--"-->Audio<!--"-->
<!--"--> ├─ Sinks:<!--"-->
<!--"--> │      56. Built-in Audio HDMI Audio           [vol: 0.40]<!--"-->
<!--"--> │  *   57. Built-in Audio Headphones + Speaker [vol: 1.00]<!--"-->
<!--"--> │<!--"-->
<!--"--> └─ Sources:<!--"-->
<!--"-->    *   58. Built-in Audio Headset Microphone + Internal Microphone [vol: 0.63]<!--"-->
<!---->
<!--"-->Settings<!--"-->
<!--"--> └─ Default Configured Node Names:<!--"-->
<!--"-->         0. Audio/Sink    alsa_output.platform-sound.HiFi__hw_mtkrt5650_0__sink<!--"-->
<!--"-->         1. Audio/Source  alsa_input.platform-sound.HiFi__hw_mtkrt5650_1__source<!--"-->\
</code></pre></div>
<p class="continuing">
(why are they grouped and not split?) and neither <code>aplay</code> nor <code>pw-play</code> do anything.
But at this time I noticed the tab expansion list for <tt>a</tt> has an <code>alsamixer</code> which has drip –
</p>
<a href="/content/assets/blogn_t/012b.22-DSCN0608cvcc.JPG"><img alt="Curses menu titled AlsaMixer v1.2.10, noting Card: mtk-rt5650; there's a plethora of bars labelled Headphon, Speaker, Speaker, I2S2 Fun, Mono ADC, and Mono DAC" src="/content/assets/blogn_t/012b.22-DSCN0608cvcc.JPG"></a>
<p class="continuing">
– but more importantly has a <tt>Headphon</tt> output with green <tt>OO</tt> and a <tt>Speaker</tt> one is <tt>MM</tt>,
which is, respectively, not muted and muted, apparently.
Plugging in headphones actually plays to the headphones.
Amazing!
But recording gets just noise (it'<!--'-->s possible the mic is shot on the headphones but that the internal one is as well? no way).
And unmuting the <tt>Speaker</tt> output doesn'<!--'-->t make it go.
</p>
<p class="indented continuing">
The only solution to this is multivariable bisexion, defined as
"going to the end of the like eight pages of increasingly-cryptically-named outputs, unmuting a few, then playing again".
This is how I know that unmuting the <tt>Ext Spk</tt> output lets the internal speakers go.
It's also how I know that when you're expecting a tinny voice to say
"<a style="color: inherit;" href="//hinfo.network">The <span class="sunfont">HINFO</span><span class="topaz">.network.</span></a>" (which you should join!)
but get a square wave and a mild whiff of burning lacquer that shit'<!--'-->s fucking terrifying mang.
It'<!--'-->s also also how I know that expecting the same and getting a 600Hz whine also is.
At least I was ready on the reset that time.
</p>
<p class="indented continuing">
Naturally, the mixer settings are persisted across reboots,
so fuck knows which ones of the other 10 outputs I toggled made it be a daemon,
or whether just flipping <tt>Ext Spk</tt> will make it output cleanly to the speakers.
Or if some of those outputs start driving the speakers with a DC offset regardless of whether there'<!--'-->s audio playing.
I know I'<!--'-->m not trynna find out at 2am again.
</p>
<p class="indented continuing">
A quick purge of the ALSA state from PATH(/var/lib/alsa/asound.state) thankfully reverted this, and also contained
</p>
<div class="continuing-inside">
#include "blogn_t/012b.14-alsa-state.javascript.html"
</div>
<p class="continuing">
which <code>amixer</code> lists as
</p>
<div class="continuing-inside" style="position: relative;">
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/amixer.scontents"><aside>full <code>amixer scontents</code></aside></a>
#include "blogn_t/012b.15-amixer-scontents.javascript.html"
</div>
<p class="continuing">
and either pressing <kbd>m</kbd> on it in <code>alsamixer</code> or running <code>amixer sset 'Ext Spk',0 on</code> (or <code>off</code>)
made sound play from the speakers, with the counter-intuitive muted/<samp>off</samp> ⇒ headphones and unmuted/<samp>on</samp> ⇒ speakers.
If only there were a way to make this happen automatically like normal!
</p>
<p class="continuing">
A quick peep with <code>amixer events</code> yields
</p>
<div class="continuing-inside"><pre class="continuing language-javascript"><code class="language-javascript">\
event value: numid=<span class="token number">24</span>,iface=<span class="token string">CARD</span>,name=<span class="token string">'Headphone Jack'</span>
event value: numid=<span class="token number">24</span>,iface=<span class="token string">CARD</span>,name=<span class="token string">'Headphone Jack'</span>
event value: numid=<span class="token number">24</span>,iface=<span class="token string">CARD</span>,name=<span class="token string">'Headphone Jack'</span>
event value: numid=<span class="token number">25</span>,iface=<span class="token string">CARD</span>,name=<span class="token string">'Headset Mic Jack'</span>\
</code></pre></div>
<p class="continuing">
with the first two corresponding to plugging/unplugging a TRS jack, and the latter two corresponding to plugging a TRRS jack.
<code>amixer contents</code>, then:
</p>
<div class="continuing-inside" style="position: relative;">
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/amixer.contents"><aside>full <code>amixer contents</code></aside></a>
#include "blogn_t/012b.16-amixer-contents.javascript.html"
</div>
<p class="continuing">
(note that it does also have <tt><q>Headphone Switch</q></tt> and <tt><q>Headphone Playback Switch</q></tt> (and the same for <tt>Speaker</tt>) as double-bools
 but they appear to be only readable as part of a full dump – reading/writing via <code>cget</code>/<code>cset</code> just hangs).
Unfortunately <code>amixer monitor</code> doesn't include the new data and the on/off is inverted hence the crusty-ass xor, but it's nevertheless a trivial program:
</p>
<div class="bigcode continuing-inside">
#include "blogn_t/012b.17-auto-output.sh.html"
</div>
<p class="continuing">
Further testing shows that if the <tt><q>Headset Mic</q></tt> control is set to <var>off</var> it expectedly cuts out the TRRS microphone,
and this yields an all-zero recording – I haven't managed to get any input from the internal microphone, but this isn't really a big feature loss for me personally.
</p>
<p class="indented continuing">
It'<!--'-->s rather quite likely something like this is possible within the ALSA config itself.
</p>
<p class="indented continuing">
I left both <tt>Headphon</tt> and <tt>Speaker</tt> at 33/59 (-12dB/0dB)
but dropped down the second <tt>Speaker</tt> (full name <tt><q>Speaker ClassD</q></tt>) down from 92 (+1.58dB) to 72 (0dB).
There'<!--'-->s a whole lot of dynamic range in the pipewire volume control.
</p>
<p class="indented continuing">
And with all this we can
</p>
<iframe width="640" height="360" src="//www.youtube.com/embed/T8olJZWewI0" title="enter the chrome zone" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

<p class="continued"></p>
<div class="indented">
	<p style="display: inline">
	Further testing (triggered by wireplumber restarts causing <tt><q>Speaker</q></tt> and <tt><q>Ext Spk</q></tt> to mute again)
	reveals you need to select
	</p>
	<dl class="continuation linear">
		<dt>Port</dt> <dd>Speaker</dd>
	</dl>
	<p style="display: inline">
	from the default
	</p>
	<dl class="continuation linear">
		<dt>Port</dt> <dd>Headphones</dd>
	</dl>
	<p style="display: inline">
	in the pavucontrol Output Devices panel and it works.
	</p>
</div>
<a href="/content/assets/blogn_t/012b.31-pavucontrol-output.png"><img alt='pavucontrol "Volume Control" window, "Output Devices" tab, "Built-in Audio Headphones + Speaker" device, Port: picker open, Speaker highlighted' src="/content/assets/blogn_t/012b.31-pavucontrol-output.png"></a>

<p class="continued"></p>
<div class="indented">
	<p style="display: inline">
	The HiFi "verb" appears to be
	</p>
	<dl class="continuation linear">
		<dt>Profile</dt> <dd>Default</dd>
	</dl>
	<p style="display: inline">
	and selecting "Off" showed just dummy devices, and "Pro Audio" – two real devices that don'<!--'-->t do anything.
	</p>
</div>
<a href="/content/assets/blogn_t/012b.32-pavucontrol-configuration.png"><img alt='pavucontrol "Volume Control" window, "Configuration" tab, "Built-in Audio" device, Profile: picker open, Default highlighted' src="/content/assets/blogn_t/012b.32-pavucontrol-configuration.png"></a>

<p class="indented">
The former does not appear to correspond to <em>anything</em> visible via pipewire (nor do I see it in the ALSA state),
These settings are persistent (at last) but do not automatically switch when headphones are plugged in.
Still no mic though.
</p>

<p class="indented continued">
All that'<!--'-->s left is
</p>
HEADING_S(2, install, class="continuing", installing Debian)
<p class="continuing">
because running off an SD card still sucks ass and continues to defeat the purpose.
Thankfully, we'<!--'-->ve already analysed bootloader discovery and the lay-out of the internal flash in
INTERNAL_LINK(kernal, how is <del>pointar formed</del> kernal loaded?),
but out of the
<a href="//chromium.googlesource.com/chromiumos/platform/vboot/+/2d30a2f5b1c81eb61de4bf82180a910d45f22e81/_vboot_reference/firmware/lib/vboot_api_kernel.c#339">many shortcuts the developer menu understands</a>
not one of them is "boot kernel b actually",
which makes the ideal "add debian kernel and rootfs as default priority, keep <tt>KERN-A</tt>&<tt>ROOT-A</tt> with a downgraded priority as a recovery system"
configuration unworkable.
Indeed, if
<a href="//chromium.googlesource.com/chromiumos/docs/+/HEAD/disk_format.md#Selecting-the-kernel"><cite>ChromiumOS Docs - Disk Format, Selecting the kernel</cite></a>
is to be trusted, the entire "ChromeOS Kernel"-partition flag mechanism is used exclusively for effectively-one-time boot bundle verification after an update
and latches on the good kernel afterward.
This means two possibilities remain:
</p>
<ul style="padding-left: 1em;">
	<li>having the rootfs on the eMMC and the kernel on a boot <del>floppy</del>SD card – inherently funny and least invasive, but possibly the worst UX of all time</li>
	<li>doing the ideal setup but keeping a kernel and minimal rootfs on an SD card to flip the priority bit manually for recovery 🙄</li>
</ul>
<p class="continuing">
and the choice is obvious, since we already have that recovery image, and the path presents itself rather overtly:
</p>
<figure class="bigcode" id="0init">
	<figcaption><p class="indented continued">Initial state</p></figcaption>
	<!--"--><a target="_blank" href="/content/assets/blogn_t/012b.23-0init.png"><img class="dark-invert" alt="\
Partition 11: RWFW, 8M
Partition 6: KERN-C, 512
Partition 7: ROOT-C, 512
Partition 9: ?, 512
Partition 10: ?, 512
2014k of empty space
Partition 2: KERN-A, 16M
Partition 4: KERN-B, 16M
Partition 8: OEM, 16M
64k of empty space
Partition 12: EFI-SYSTEM, 32M
Partition 5: ROOT-B, 2G
Partition 3: ROOT-A, 2G
Partition 1: STATE, 25G\
" src="/content/assets/blogn_t/012b.23-0init-crop.png"></a><!--"-->
</figure>

#define FDISK_PROMPT(result)   <span class="token shell-symbol important">Command (m for help):</span> result
#define FDISK_PROMPT_X(result) <span class="token shell-symbol important">Expert command (m for help):</span> result
<figure class="bigcode" id="1killpurp">
	<figcaption>
		<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">#</span> fdisk /dev/mmcblk0
Welcome to fdisk (util-linux 2.39.3).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.
<!---->
<span class="token red">GPT PMBR size mismatch (61063167 != 61071359) will be corrected by write.
The backup GPT table is not on the end of the device. This problem will be corrected by write.</span>
<!---->
FDISK_PROMPT(d)
Partition number (1-12, default 12): 6
<!---->
Partition 6 has been deleted.
<!---->
FDISK_PROMPT(d)
Partition number (1-5,7-12, default 12): 7
<!---->
Partition 7 has been deleted.
<!---->
FDISK_PROMPT(d)
Partition number (1-5,8-12, default 12): 9
<!---->
Partition 9 has been deleted.
<!---->
FDISK_PROMPT(d)
Partition number (1-5,8,10-12, default 12): 10
<!---->
Partition 10 has been deleted.
<!---->
FDISK_PROMPT(p)
<span class="token bold">Disk /dev/mmcblk0: 29.12 GiB, 31268536320 bytes, 61071360 sectors</span>
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 8648551F-D8FC-AC44-AA00-C0CA32C4A9BC
<!---->
<!--"--><span class="token bold">Device            Start      End  Sectors Size Type</span><!--"-->
<!--"-->/dev/mmcblk0p1  8704000 61063119 52359120  25G Microsoft basic data<!--"-->
<!--"-->/dev/mmcblk0p2    20480    53247    32768  16M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p3  4509696  8703999  4194304   2G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk0p4    53248    86015    32768  16M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p5   315392  4509695  4194304   2G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk0p8    86016   118783    32768  16M Microsoft basic data<!--"-->
<!--"-->/dev/mmcblk0p11      64    16447    16384   8M ChromeOS firmware<!--"-->
<!--"-->/dev/mmcblk0p12  249856   315391    65536  32M EFI System<!--"-->
<!---->
Partition table entries are not in disk order.
<!---->
FDISK_PROMPT(w)
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.\
</code></pre>
		<p class="continuing">(these are all cruft)</p>
	</figcaption>
	<a target="_blank" href="/content/assets/blogn_t/012b.24-1killpurp.png"><img class="dark-invert" alt="Partitions 6, 7, 9, 10 deleted, accrued together into 2016k of empty space" src="/content/assets/blogn_t/012b.24-1killpurp-crop.png"></a>
</figure>

<figure class="bigcode" id="2killgreen">
	<figcaption>
		<pre class="continuing language-ANSI"><code class="language-ANSI">\
FDISK_PROMPT(d)
Partition number (1-5,8,11,12, default 12): 8
Partition 8 has been deleted.
FDISK_PROMPT(d)
Partition number (1-5,11,12, default 12):
Partition 12 has been deleted.
FDISK_PROMPT(p)
<!--"--><span class="token bold">Device            Start      End  Sectors Size Type</span><!--"-->
<!--"-->/dev/mmcblk0p1  8704000 61063119 52359120  25G Microsoft basic data<!--"-->
<!--"-->/dev/mmcblk0p2    20480    53247    32768  16M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p3  4509696  8703999  4194304   2G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk0p4    53248    86015    32768  16M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p5   315392  4509695  4194304   2G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk0p11      64    16447    16384   8M ChromeOS firmware<!--"-->\
</code></pre>
		<p class="continuing">
			(neither of these have anything of interest;
			 I did make <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p12.gz">a backup of <tt>EFI-SYSTEM</tt></a>
			 for completeness'<!--'--> sake)
		</p>
	</figcaption>
	<a target="_blank" href="/content/assets/blogn_t/012b.25-2killgreen.png"><img class="dark-invert" alt="Partitions 8 (OEM) and 12 (EFI-SYSTEM) deleted, accrued together into 48M of empty space" src="/content/assets/blogn_t/012b.25-2killgreen-crop.png"></a>
</figure>


<figure class="bigcode" id="3killB">
	<figcaption>
		<pre class="continuing language-ANSI"><code class="language-ANSI">\
FDISK_PROMPT(d)
Partition number (1-5,11, default 11): 4
Partition 4 has been deleted.
FDISK_PROMPT(d)
Partition number (1-3,5,11, default 11): 5
Partition 5 has been deleted.
FDISK_PROMPT(p)
<!--"--><span class="token bold">Device            Start      End  Sectors Size Type</span><!--"-->
<!--"-->/dev/mmcblk0p1  8704000 61063119 52359120  25G Microsoft basic data<!--"-->
<!--"-->/dev/mmcblk0p2    20480    53247    32768  16M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p3  4509696  8703999  4194304   2G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk0p11      64    16447    16384   8M ChromeOS firmware<!--"-->\
</code></pre>
		<p class="continuing">(of course, kill <tt>KERN-A</tt>/<tt>ROOT-A</tt> instead if <tt>KERN-B</tt> is the winner on your machine)</p>
	</figcaption>
	<a target="_blank" href="/content/assets/blogn_t/012b.26-3killB.png"><img class="dark-invert" alt="Partitions 4 (KERN-B) and 5 (ROOT-B) deleted, accrued together into 2⅛M of empty space" src="/content/assets/blogn_t/012b.26-3killB-crop.png"></a>
</figure>


#define BOLD(...) <span class="token bold">__VA_ARGS__</span>
<figure class="bigcode" id="4expussy">
	<figcaption><pre class="continuing language-ANSI"><code class="language-ANSI" style="tab-size: 8 !important; -moz-tab-size: 8 !important;">\
<span class="token shell-symbol important">localhost#</span> df -Th
<!--"-->Filesystem              Type  Size  Used Avail Use% Mounted on<!--"-->
<!--"-->/dev/root               ext2  2.0G  1.6G  418M  79% /<!--"-->
<!--"-->/dev/mmcblk0p1          ext4   25G  659M   23G   2% /mnt/stateful_partition<!--"-->
<!--"-->/dev/mapper/encstateful ext4  7.2G  145M  7.0G   2% /mnt/stateful_partition/encrypted<!--"-->
<!---->
<span class="token shell-symbol important">localhost#</span> lsblk
<!--"-->NAME          MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS<!--"-->
<!--"-->loop1           7:1    0   7.3G  0 loop<!--"-->
<!--"-->`-encstateful 254:1    0   7.3G  0 dm   /home/chronos<!--"-->
<!--"-->                                        /var<!--"-->
<!--"-->                                        /mnt/stateful_partition/encrypted<!--"-->
<!--"-->mmcblk0       179:0    0  29.1G  0 disk<!--"-->
<!--"-->|-mmcblk0p1   179:1    0    25G  0 part /var/cache/dlc-images<!--"-->
<!--"-->|                                       /usr/local<!--"-->
<!--"-->|                                       /home<!--"-->
<!--"-->|                                       /mnt/stateful_partition<!--"-->
<!--"-->`-mmcblk0p3   179:3    0     2G  0 part /<!--"-->
<!---->
<span class="token shell-symbol important">localhost#</span> du -haxd1 /mnt/stateful_partition
<!--"-->28K	/mnt/stateful_partition/etc<!--"-->
<!--"-->4.0K	/mnt/stateful_partition/dev_image<!--"-->
<!--"-->12K	/mnt/stateful_partition/shutdown_umount_failure.log<!--"-->
<!--"-->4.0K	/mnt/stateful_partition/encrypted.key<!--"-->
<!--"-->40K	/mnt/stateful_partition/home<!--"-->
<!--"-->33M	/mnt/stateful_partition/unencrypted<!--"-->
<!--"-->12K	/mnt/stateful_partition/var_overlay<!--"-->
<!--"-->0	/mnt/stateful_partition/.developer_mode<!--"-->
<!--"-->4.0K	/mnt/stateful_partition/umount-encrypted.log<!--"-->
<!--"-->16K	/mnt/stateful_partition/lost+found<!--"-->
<!--"-->8.0K	/mnt/stateful_partition/reboot_vault<!--"-->
<!--"-->489M	/mnt/stateful_partition/encrypted.block<!--"-->
<!--"-->522M	/mnt/stateful_partition<!--"-->
<!---->
<span class="token shell-symbol important">localhost#</span> dmsetup table
encstateful: 0 15355208 crypt aes-cbc-essiv:sha256 :32:logon:dmcrypt:656e63737461746566756c 0 7:1 0 1 allow_discards\
</code></pre></figcaption>
	<!--"--><a target="_blank" href="/content/assets/blogn_t/012b.27-4expussy.png"><img class="dark-invert" alt="\
Partition 3 (ROOT-A): 1.6G/2G used, ext2, mounted on /
(U+200B)
Partition 1 (STATE): 659M/25G used, ext4, mounted on /mnt/stateful_partition
on it: /encrypted.block and .key: 489M/7.4G allocated
from it derived /dev/loop1 through dmcrypt into /dev/mapper/encstateful
mounted on /mnt/stateful_partition/encrypted, ext4, 146M/7.2G used\
" src="/content/assets/blogn_t/012b.27-4expussy.png"></a><!--"-->
</figure>

<figure class="bigcode" id="5reduce">
	<figcaption>
		<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">localhost#</span> fstrim -v /mnt/stateful_partition/encrypted
/mnt/stateful_partition/encrypted: 7 GiB (7480754176 bytes) trimmed
<!---->
<span class="token shell-symbol important">localhost#</span> du -h /mnt/stateful_partition/encrypted.block
323M	/mnt/stateful_partition/encrypted.block
<!---->
<span class="token shell-symbol important">localhost#</span> df -Th
<!--"-->Filesystem     Type  Size  Used Avail Use% Mounted on<!--"-->
<!--"-->/dev/mmcblk0p1 ext4   25G  355M   23G   2% /mnt/stateful_partition<!--"-->
</code></pre>\
<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">chwast#</span> e2fsck -f /dev/disk/by-partlabel/ROOT-A
e2fsck 1.47.0 (5-Feb-2023)
Filesystem did not have a UUID; generating one.

ROOT-A: 11702/32000 files (9.7% non-contiguous), 402764/509696 blocks
<span class="token shell-symbol important">chwast#</span> resize2fs /dev/disk/by-partlabel/ROOT-A 1.7G
resize2fs 1.47.0 (5-Feb-2023)
resize2fs: Invalid new size: 1.7G
<span class="token shell-symbol important">chwast#</span> resize2fs /dev/disk/by-partlabel/ROOT-A 1704M
resize2fs 1.47.0 (5-Feb-2023)
The filesystem on /dev/disk/by-partlabel/ROOT-A is now BOLD(445440) (4k) blocks long.
<!---->
<span class="token shell-symbol important">chwast#</span> e2fsck -f /dev/disk/by-partlabel/STATE
Pass 1: Checking inodes, blocks, and sizes
Inode 14 extent tree (at level 2) could be narrower.  Optimize&lt;y>? no

/dev/disk/by-partlabel/STATE: 152/1638400 files (2.0% non-contiguous), 238667/6544890 blocks
<span class="token shell-symbol important">chwast#</span> resize2fs /dev/disk/by-partlabel/STATE 384M
resize2fs: New size smaller than minimum (239160)\
</code></pre>
		<p class="continuing">
			That's 940M! df and du agree on 355M used but e2fsck's block count also resolves to 932M!
			This means almost tripled usage of space vs the data inside; no fiddling around got me anywhere. How? What'<!--'-->s in those 577M?
		</p>
<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">chwast#</span> resize2fs /dev/disk/by-partlabel/STATE 960M
The filesystem on /dev/disk/by-partlabel/STATE is now 245760 (4k) blocks long.
<span class="token shell-symbol important">chwast#</span> mount /dev/disk/by-partlabel/STATE /mnt
<span class="token shell-symbol important">chwast#</span> fstrim -v /mnt
/mnt/: 400.5 MiB (419946496 bytes) trimmed.
<span class="token shell-symbol important">chwast#</span> umount /dev/disk/by-partlabel/STATE /mnt
<span class="token shell-symbol important">chwast#</span> e2fsck -fy /dev/disk/by-partlabel/STATE
/dev/mmcblk0p1: 152/65536 files (1.3% non-contiguous), 129018/245760 blocks\
</code></pre>
		<p class="continuing">
			And that'<!--'-->s 503M.
			Where did 437M go?
			Mysterium tytsei.
		</p>
<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">chwast#</span> resize2fs /dev/disk/by-partlabel/STATE 512M -fz /tmp/undo
Overwriting existing filesystem; this can be undone using the command:
    e2undo /tmp/undo /dev/disk/by-partlabel/STATE

The filesystem on /dev/disk/by-partlabel/STATE is now BOLD(131072) (4k) blocks long.
<span class="token shell-symbol important">chwast#</span> e2fsck -fyz /tmp/undo2 /dev/disk/by-partlabel/STATE
/dev/mmcblk0p1: 152/32768 files (2.6% non-contiguous), 124912/BOLD(131072) blocks
<!---->
<span class="token shell-symbol important">chwast#</span> resize2fs /dev/disk/by-partlabel/STATE 480M -fz /tmp/undo3
Overwriting existing filesystem; this can be undone using the command:
<!--"-->    <!--"-->e2undo /tmp/undo3 /dev/disk/by-partlabel/STATE

Resizing the filesystem on /dev/disk/by-partlabel/STATE to 122880 (4k) blocks.
resize2fs: No space left on device while trying to resize /dev/disk/by-partlabel/STATE
Please run 'e2fsck -fy /dev/disk/by-partlabel/STATE' to fix the filesystem
after the aborted resize operation.
<span class="token shell-symbol important">chwast#</span> e2undo /tmp/undo3 /dev/disk/by-partlabel/STATE && rm /tmp/undo3
<span class="token shell-symbol important">chwast#</span> mount -r /dev/disk/by-partlabel/STATE /mnt
<span class="token shell-symbol important">chwast#</span> df -h /mnt
<!--"-->Filesystem      Size  Used Avail Use% Mounted on<!--"-->
<!--"-->/dev/mmcblk0p1  364M  340M     0 100% /mnt<!--"-->\
</code></pre>
	</figcaption>
	<!--"--><a target="_blank" href="/content/assets/blogn_t/012b.28-5reduce.png"><img class="dark-invert" alt="\
ROOT-A resized to 1.7G
(U+200B)
/encrypted.block discarded down to 323M
so STATE usage reduced to 355M and reduced 512M\
" src="/content/assets/blogn_t/012b.28-5reduce.png"></a><!--"-->
</figure>

<figure class="bigcode" id="6move">
	<figcaption>
		<p class="indented continuing">
			Usually this would be a slightly more involved process because we'<!--'-->d want to keep it all on disk,
			but in this case they all easily fit in RAM, even all at once.
		</p>
		<dl class="guid-demo continuing">
			<dt><tt>KERN-A</tt></dt>
			<dd><pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">chwast:/tmp#</span> cp /dev/disk/by-partlabel/KERN-A .
<span class="token shell-symbol important">chwast:/tmp#</span> cmp /dev/disk/by-partlabel/KERN-A KERN-A
<!---->
<span class="token shell-symbol important">chwast:/tmp#</span> fdisk /dev/mmcblk0
FDISK_PROMPT(p)
<!--"-->Device            Start      End  Sectors Size Type<!--"-->
<!--"-->/dev/mmcblk0p1  8704000 61063119 52359120  25G Microsoft basic data<!--"-->
<!--"-->/dev/mmcblk0p2    20480    53247    <!--"-->BOLD(32768)<!--"-->  16M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p3  4509696  8703999  4194304   2G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk0p11      64    16447    16384   8M ChromeOS firmware<!--"-->
FDISK_PROMPT(x)
FDISK_PROMPT_X(p)
<!--"-->Device            Start      End  Sectors <small>Type-UUID                            UUID                                </small> Name   Attrs<!--"-->
<!--"-->/dev/mmcblk0p1  8704000 61063119 52359120 <small>EBD0A0A2-B9E5-4433-87C0-68B6B72699C7 D8331AD0-ED78-F442-87F4-78DF0130895A</small> STATE<!--"-->
<!--"-->/dev/mmcblk0p2    20480    53247    <!--"-->BOLD(32768)<!--"--> <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 CCFE5BD8-BBE4-A840-9C0B-BBA6427B6309</small> KERN-A GUID:49,56<!--"-->
<!--"-->/dev/mmcblk0p3  4509696  8703999  4194304 <small>3CB8E202-3B7E-47DD-8A3C-7FF2A13CFCEC E71F6E02-1BC3-9D43-9EDD-2C7CA20D512A</small> ROOT-A<!--"-->
<!--"-->/dev/mmcblk0p11      64    16447    16384 <small>CAB6E88E-ABF3-4102-A07A-D4BB9BE3C1D3 530A6C46-BDFA-7C40-A446-FC05001BDA82</small> RWFW<!--"-->
FDISK_PROMPT_X(r)
<!---->
FDISK_PROMPT(d)
Partition number (1-3,11, default 11): 2
Partition 2 has been deleted.
<!---->
FDISK_PROMPT(n)
Partition number (2,4-10,12-128, default 2): 2
First sector (BOLD(16448)-61071326, default 18432): BOLD(16448)<!--"-->  <!--"--><span class="token comment"># doesn'<!--'-->t need to be aligned</span>
Last sector, +/-sectors or +/-size{K,M,G,T,P} (16448-4509695, default 4509695): +32767
<!--"-->           <!--"--><span class="token bold comment"># BOLD(32768) − 1 for fdisk +-based arithmetic</span>
Created a new partition 2 of type 'Linux filesystem' and of size 16 MiB.
<!---->
FDISK_PROMPT(t)
Partition number (1-3,11, default 11): 2
Partition type or alias (type L to list all): 180
Changed type of partition 'Linux filesystem' to 'ChromeOS kernel'.
<!---->
FDISK_PROMPT(x)
FDISK_PROMPT_X(n)
Partition number (1-3,11, default 11): 2
New name: KERN-A
Partition name changed from '<!---->' to 'KERN-A'.
<!---->
FDISK_PROMPT_X(S)
Partition number (1-3,11, default 11): 2
Enter GUID specific bit (48-63, default 48): 49
The GUID specific bit 49 on partition 2 is enabled now.
FDISK_PROMPT_X(S)
Partition number (1-3,11, default 11): 2
Enter GUID specific bit (48-63, default 48): 56
The GUID specific bit 56 on partition 2 is enabled now.
<!---->
FDISK_PROMPT_X(p)
<!--"-->Device            Start      End  Sectors <small>Type-UUID                            UUID                                </small> Name   Attrs<!--"-->
<!--"-->/dev/mmcblk0p2    16448    49215    32768 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B9393B88-B27F-438D-BF88-93BE6E66E4A9</small> KERN-A GUID:49,56<!--"-->
FDISK_PROMPT_X(r)
FDISK_PROMPT(p)
<!--"-->Device            Start      End  Sectors Size Type<!--"-->
<!--"-->/dev/mmcblk0p2    16448    49215    32768  16M ChromeOS kernel<!--"-->
FDISK_PROMPT(w)
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
<!---->
<span class="token shell-symbol important">chwast:/tmp#</span> cp KERN-A /dev/disk/by-partlabel/KERN-A
<span class="token shell-symbol important">chwast:/tmp#</span> cmp KERN-A /dev/disk/by-partlabel/KERN-A\
</code></pre><p></p></dd>

			<dt><p></p><tt>ROOT-A</tt></dt>
			<dd>A properly-sized dd would also be fine, but e2image my beloved does it best.
				<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">chwast:/tmp#</span> e2image -rap /dev/disk/by-partlabel/ROOT-A ROOT-A
Copied 402500 / 402503 blocks (100%) in 00:00:08 at 196.53 MB/s
<span class="token shell-symbol important">chwast:/tmp#</span> ls -lh ROOT-A
<!--"-->-rw------- 1 root root 1.7G Feb  3 16:12 ROOT-A<!--"-->
<span class="token shell-symbol important">chwast:/tmp#</span> du -h ROOT-A
1.6G	ROOT-A
<span class="token shell-symbol important">chwast:/tmp#</span> mount -r ROOT-A /mnt
<span class="token shell-symbol important">chwast:/tmp#</span> ls /mnt
<!--"-->bin  dev  etc  home  lib  <small>lost+found  media  mnt  opt  postinst  proc  root  run  sbin	sys  tmp  usr  var</small><!--"-->
<span class="token shell-symbol important">chwast:/tmp#</span> df -h /mnt/
<!--"-->Filesystem      Size  Used Avail Use% Mounted on<!--"-->
<!--"-->/dev/mmcblk0p3  1.7G  1.6G  168M  91% /mnt<!--"-->
<span class="token shell-symbol important">chwast:/tmp#</span> <span class="token comment"># all good!</span>
<span class="token shell-symbol important">chwast:/tmp#</span> umount /mnt/
<!---->
<span class="token shell-symbol important">chwast:/tmp#</span> fdisk /dev/mmcblk0
FDISK_PROMPT(d)
Partition number (1-3,11, default 11): 3
Partition 3 has been deleted.
FDISK_PROMPT(n)
Partition number (3-10,12-128, default 3): 3
First sector (49216-61071326, default 51200):<!--"-->  <!--"--><span class="token comment"># <em>does</em> need to be aligned</span>
Last sector, +/-sectors or +/-size{K,M,G,T,P} (51200-8703999, default 8703999): +3563519
<!--"-->           <!--"--><span class="token comment"># resize2fs said "<!--"-->BOLD(445440) (4k) blocks long"<!--"--> – 445440*4096/512 − 1</span>
Created a new partition 3 of type 'Linux filesystem' and of size 1.7 GiB.
FDISK_PROMPT(t)
Partition number (1-3,11, default 11): 3
Partition type or alias (type L to list all): 181
Changed type of partition 'Linux filesystem' to 'ChromeOS root fs'.
FDISK_PROMPT(x)
FDISK_PROMPT_X(n)
Partition number (1-3,11, default 11): 3
New name: ROOT-A
Partition name changed from '<!---->' to 'ROOT-A'.
<!---->
FDISK_PROMPT_X(p)
<!--"-->Device            Start      End  Sectors <small>Type-UUID                            UUID                                </small> Name   Attrs<!--"-->
<!--"-->/dev/mmcblk0p3    51200  3614719  3563520 <small>3CB8E202-3B7E-47DD-8A3C-7FF2A13CFCEC ACB76082-35D1-46F0-A8E9-97006C40B632</small> ROOT-A<!--"-->
FDISK_PROMPT_X(r)
FDISK_PROMPT(p)
<!--"-->Device            Start      End  Sectors Size Type<!--"-->
<!--"-->/dev/mmcblk0p3    51200  3614719  3563520  1.7G ChromeOS root fs<!--"-->
FDISK_PROMPT(w)
<!---->
<span class="token shell-symbol important">chwast:/tmp#</span> wc -c ROOT-A /dev/disk/by-partlabel/ROOT-A
1824522240 ROOT-A
1824522240 /dev/disk/by-partlabel/ROOT-A
<span class="token shell-symbol important">chwast:/tmp#</span> cp ROOT-A /dev/disk/by-partlabel/ROOT-A
<!---->
<span class="token shell-symbol important">chwast:/tmp#</span> cmp ROOT-A /dev/disk/by-partlabel/ROOT-A
<span class="token shell-symbol important">chwast:/tmp#</span> mount -r /dev/disk/by-partlabel/ROOT-A /mnt
<span class="token shell-symbol important">chwast:/tmp#</span> ls /mnt
<!--"-->bin  dev  etc  home  lib  <small>lost+found  media  mnt  opt  postinst  proc  root  run  sbin	sys  tmp  usr  var</small><!--"-->
<span class="token shell-symbol important">chwast:/tmp#</span> df -h /mnt/
<!--"-->Filesystem      Size  Used Avail Use% Mounted on<!--"-->
<!--"-->/dev/mmcblk0p1  364M  340M     0 100% /mnt<!--"-->\
</code></pre></dd>

			<dt><p></p><tt>STATE</tt></dt>
			<dd>likewise
				<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">chwast:/tmp#</span> e2image -rap /dev/disk/by-partlabel/STATE STATE
Copied 122867 / 122871 blocks (100%) in 00:00:02 at 239.97 MB/s
<span class="token shell-symbol important">chwast:/tmp#</span> ls -lh STATE
-rw------- 1 root root 512M Feb  3 16:19 STATE
<span class="token shell-symbol important">chwast:/tmp#</span> du -h STATE
355M	STATE
<span class="token shell-symbol important">chwast:/tmp#</span> mount -r STATE /mnt
<span class="token shell-symbol important">chwast:/tmp#</span> ls /mnt
<!--"-->dev_image  encrypted  encrypted.block  encrypted.key  <small>etc  home  lost+found  reboot_vault  shutdown_umount_failure.log	umount-encrypted.log  unencrypted  var_overlay</small><!--"-->
<span class="token shell-symbol important">chwast:/tmp#</span> df -h /mnt/
<!--"-->Filesystem      Size  Used Avail Use% Mounted on<!--"-->
<!--"-->/dev/loop0      364M  340M     0 100% /mnt<!--"-->
<span class="token shell-symbol important">chwast:/tmp#</span> <span class="token comment"># likewise!</span>
<span class="token shell-symbol important">chwast:/tmp#</span> umount /mnt/
<!---->
<span class="token shell-symbol important">chwast:/tmp#</span> fdisk /dev/mmcblk0
FDISK_PROMPT(d)
Partition number (1-3,11, default 11): 1
Partition 1 has been deleted.
FDISK_PROMPT(n)
Partition number (1,4-10,12-128, default 1): 1
First sector (34-61071326, default 3614720):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (3614720-61071326, default 61069311): +1048575
<!--"-->           <!--"--><span class="token comment"># resize2fs: "<!--"-->BOLD(131072)"<!--"--> – 131072*4096/512 − 1</span>
Created a new partition 1 of type 'Linux filesystem' and of size 512 MiB.
FDISK_PROMPT(t)
Partition number (1-3,11, default 11): 1
Partition type or alias (type L to list all): 11
Changed type of partition 'Linux filesystem' to 'Microsoft basic data'.
FDISK_PROMPT(x)
FDISK_PROMPT_X(n)
Partition number (1-3,11, default 11): 1
New name: STATE
Partition name changed from '<!---->' to 'STATE'.
<!---->
FDISK_PROMPT_X(p)
<!--"-->Device            Start     End Sectors <small>Type-UUID                            UUID                                </small> Name   Attrs<!--"-->
<!--"-->/dev/mmcblk0p1  3614720 4663295 1048576 <small>EBD0A0A2-B9E5-4433-87C0-68B6B72699C7 DE9260C7-B796-4681-82E1-6BF5E1DDC405</small> STATE<!--"-->
<!--"-->/dev/mmcblk0p2    16448   49215   32768 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B9393B88-B27F-438D-BF88-93BE6E66E4A9</small> KERN-A GUID:49,56<!--"-->
<!--"-->/dev/mmcblk0p3    51200 3614719 3563520 <small>3CB8E202-3B7E-47DD-8A3C-7FF2A13CFCEC ACB76082-35D1-46F0-A8E9-97006C40B632</small> ROOT-A<!--"-->
<!--"-->/dev/mmcblk0p11      64   16447   16384 <small>CAB6E88E-ABF3-4102-A07A-D4BB9BE3C1D3 530A6C46-BDFA-7C40-A446-FC05001BDA82</small> RWFW<!--"-->
FDISK_PROMPT_X(r)
FDISK_PROMPT(p)
<!--"-->Device            Start     End Sectors Size Type<!--"-->
<!--"-->/dev/mmcblk0p1  3614720 4663295 1048576  512M Microsoft basic data<!--"-->
<!--"-->/dev/mmcblk0p2    16448   49215   32768   16M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p3    51200 3614719 3563520  1.7G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk0p11      64   16447   16384    8M ChromeOS firmware<!--"-->
FDISK_PROMPT(w)
<!---->
<span class="token shell-symbol important">chwast:/tmp#</span> cp STATE /dev/disk/by-partlabel/STATE
<span class="token shell-symbol important">chwast:/tmp#</span> cmp STATE /dev/disk/by-partlabel/STATE\
</code></pre></dd>
		</dl>
		<p class="continued">
			And at this point booting to ChromeOS with <kbd>ctrl</kbd>+<kbd>d</kbd> still works!
			Amazing.
		</p>
	</figcaption>
	<a target="_blank" href="/content/assets/blogn_t/012b.29-6move.png"><img class="dark-invert" alt="Partitions moved to the start of the disk, with a 26.5G accrued of empty space at the end" src="/content/assets/blogn_t/012b.29-6move-crop.png"></a>
</figure>

<figure class="bigcode" id="7install">
	<figcaption>
		<p class="indented continuing">Rename the SD card – now recovery – rootfs so it doesn'<!--'-->t get picked up for booting later.</p>
		<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">localhost#</span> fdisk /dev/mmcblk1
FDISK_PROMPT(p)
Disk /dev/mmcblk1: 7.4 GiB, 7948206080 bytes, 15523840 sectors
<!--"-->Device             Start      End Sectors   Size Type<!--"-->
<!--"-->/dev/mmcblk1p1   4864000  5839843  975844 476.5M Microsoft basic data<!--"-->
<!--"-->/dev/mmcblk1p5    411648   444415   32768    16M Linux filesystem<!--"-->
<!--"-->/dev/mmcblk1p6    444416  4638719 4194304     2G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk1p9   4638720  4843519  204800   100M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk1p10 11329502 15521791 4192290     2G Linux root (ARM-64)<!--"-->
<!--"-->/dev/mmcblk1p15  4843520  4863999   20480    10M Solaris alternate sector<!--"-->
FDISK_PROMPT(x)
FDISK_PROMPT_X(p)
<!--"-->Device             Start      End Sectors <small>Type-UUID                            UUID                                </small> Name        Attrs<!--"-->
<!--"-->/dev/mmcblk1p1   4864000  5839843  975844 <small>EBD0A0A2-B9E5-4433-87C0-68B6B72699C7 90330FF3-B8B8-124F-8285-416E7A627F64</small><!--"-->
<!--"-->/dev/mmcblk1p5    411648   444415   32768 <small>0FC63DAF-8483-4772-8E79-3D69D8477DE4 8865BF3D-D8EA-574A-9C55-3AABEFC1E84D</small>             GUID:49,56<!--"-->
<!--"-->/dev/mmcblk1p6    444416  4638719 4194304 <small>3CB8E202-3B7E-47DD-8A3C-7FF2A13CFCEC A0464221-9912-F146-AC7B-C6F489C25176</small><!--"-->
<!--"-->/dev/mmcblk1p9   4638720  4843519  204800 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 1E061A8C-6159-4486-ADD1-988E88A06ACF</small>             GUID:49,56<!--"-->
<!--"-->/dev/mmcblk1p10 11329502 15521791 4192290 <small>B921B045-1DF0-41C3-AF44-4C6F280D3FAE 525C4783-84CA-B249-ABC8-4635B19103BF</small> chwast-root<!--"-->
<!--"-->/dev/mmcblk1p15  4843520  4863999   20480 <small>6A9283A5-1DD2-11B2-99A6-080020736631 D733780B-EC52-3B4A-B568-FEB45F3C4903</small><!--"-->
<!---->
FDISK_PROMPT_X(n)
Partition number (1,5,6,9,10,15, default 15): BOLD(10)
New name: chwast-recovery-root
Partition name changed from 'chwast-root' to 'chwast-recovery-root'.
FDISK_PROMPT_X(r)
FDISK_PROMPT(w)
</code></pre>

#define KBDOLD(...) BOLD(<kbd style="font-family: inherit;">__VA_ARGS__</kbd>)
		<p class="continued">and install – by copying – to the eMMC:</p>
		<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">localhost#</span> fdisk /dev/mmcblk0
FDISK_PROMPT(n)
Partition number (4-10,12-128, default 4): KBDOLD(100)
First sector (4663296-61071326, default 4663296):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (4663296-61071326, default 61069311): KBDOLD(+24M)
Created a new partition 100 of type 'Linux filesystem' and of size 24 MiB.
FDISK_PROMPT(t)
Partition number (1-3,11,100, default 100):
Partition type or alias (type L to list all): KBDOLD(174)
Changed type of partition 'Linux filesystem' to 'ChromeOS kernel'.
FDISK_PROMPT(x)
FDISK_PROMPT_X(n)
Partition number (1-3,11,100, default 100):
New name: KBDOLD(chwast-kernel)
FDISK_PROMPT_X(S)
Partition number (1-3,11,100, default 100):
Enter GUID specific bit (48-63, default 48): KBDOLD(49)
The GUID specific bit 49 on partition 100 is enabled now.
FDISK_PROMPT_X(S)
Partition number (1-3,11,100, default 100):
Enter GUID specific bit (48-63, default 48): KBDOLD(56)
The GUID specific bit 56 on partition 100 is enabled now.
<!---->
FDISK_PROMPT_X(p)
<!--"-->Device             Start     End Sectors <small>Type-UUID                            UUID                                </small> Name          Attrs<!--"-->
<!--"-->/dev/mmcblk0p100 4663296 4712447   49152 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B404D487-BF0B-A842-B93F-742DFB050BA5</small> chwast-kernel GUID:49,56<!--"-->
FDISK_PROMPT_X(r)
FDISK_PROMPT(p)
<!--"-->Device             Start      End  Sectors   Size Type<!--"-->
<!--"-->/dev/mmcblk0p100 4663296  4712447    49152   24M  ChromeOS kernel<!--"-->
<!---->
FDISK_PROMPT(n)
Partition number (4-10,12-99,101-128, default 4): KBDOLD(101)
First sector (4712448-61071326, default 4712448):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (4712448-61071326, default 61069311): KBDOLD(-4G)
Created a new partition 101 of type 'Linux filesystem' and of size 22.9 GiB.
FDISK_PROMPT(t)
Partition number (1-3,11,100,101, default 101):
Partition type or alias (type L to list all): KBDOLD(27)
Changed type of partition 'Linux filesystem' to 'Linux root (ARM-64)'.
FDISK_PROMPT(x)
FDISK_PROMPT_X(n)
Partition number (1-3,11,100,101, default 101):
New name: KBDOLD(chwast-root)
Partition name changed from '<!---->' to 'chwast-root'.
<!---->
FDISK_PROMPT_X(p)
<!--"-->Device             Start      End  Sectors <small>Type-UUID                            UUID                                </small> Name          Attrs<!--"-->
<!--"-->/dev/mmcblk0p101 4712448 52682751 47970304 <small>B921B045-1DF0-41C3-AF44-4C6F280D3FAE A1A44681-9DB6-5640-81F7-F469F51EAA7B</small> chwast-root<!--"-->
FDISK_PROMPT_X(r)
FDISK_PROMPT(p)
Device             Start      End  Sectors   Size Type
/dev/mmcblk0p101 4712448 52682751 47970304  22.9G Linux root (ARM-64)
<!---->
FDISK_PROMPT(n)
Partition number (4-10,12-99,102-128, default 4): KBDOLD(102)
First sector (52682752-61071326, default 52682752):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (52682752-61071326, default 61069311):
Created a new partition 102 of type 'Linux filesystem' and of size 4 GiB.
FDISK_PROMPT(t)
Partition number (1-3,11,100-102, default 102):
Partition type or alias (type L to list all): KBDOLD(swap)
Changed type of partition 'Linux filesystem' to 'Linux swap'.
FDISK_PROMPT(x)
FDISK_PROMPT_X(n)
Partition number (1-3,11,100-102, default 102):
New name: KBDOLD(chwast-swap)
Partition name changed from '<!---->' to 'chwast-swap'.
<!---->
FDISK_PROMPT_X(p)
<!--"-->Device              Start      End  Sectors <small>Type-UUID                            UUID                                </small> Name          Attrs<!--"-->
<!--"-->/dev/mmcblk0p1    3614720  4663295  1048576 <small>EBD0A0A2-B9E5-4433-87C0-68B6B72699C7 DE9260C7-B796-4681-82E1-6BF5E1DDC405</small> STATE<!--"-->
<!--"-->/dev/mmcblk0p2      16448    49215    32768 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B9393B88-B27F-438D-BF88-93BE6E66E4A9</small> KERN-A        GUID:48,56<!--"-->
<!--"-->/dev/mmcblk0p3      51200  3614719  3563520 <small>3CB8E202-3B7E-47DD-8A3C-7FF2A13CFCEC ACB76082-35D1-46F0-A8E9-97006C40B632</small> ROOT-A<!--"-->
<!--"-->/dev/mmcblk0p11        64    16447    16384 <small>CAB6E88E-ABF3-4102-A07A-D4BB9BE3C1D3 530A6C46-BDFA-7C40-A446-FC05001BDA82</small> RWFW<!--"-->
<!--"-->/dev/mmcblk0p100  4663296  4712447    49152 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B404D487-BF0B-A842-B93F-742DFB050BA5</small> chwast-kernel GUID:49,56<!--"-->
<!--"-->/dev/mmcblk0p101  4712448 52682751 47970304 <small>B921B045-1DF0-41C3-AF44-4C6F280D3FAE A1A44681-9DB6-5640-81F7-F469F51EAA7B</small> chwast-root<!--"-->
<!--"-->/dev/mmcblk0p102 52682752 61069311  8386560 <small>0657FD6D-A4AB-43C4-84E5-0933C84B4F4F 0AAF87E8-B293-964A-8073-605103B71460</small> chwast-swap<!--"-->
FDISK_PROMPT_X(r)
FDISK_PROMPT(p)
<!--"-->Device             Start       End  Sectors  Size Type<!--"-->
<!--"-->/dev/mmcblk0p1    3614720  4663295  1048576  512M Microsoft basic data<!--"-->
<!--"-->/dev/mmcblk0p2      16448    49215    32768   16M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p3      51200  3614719  3563520  1.7G ChromeOS root fs<!--"-->
<!--"-->/dev/mmcblk0p11        64    16447    16384    8M ChromeOS firmware<!--"-->
<!--"-->/dev/mmcblk0p100  4663296  4712447    49152   24M ChromeOS kernel<!--"-->
<!--"-->/dev/mmcblk0p101  4712448 52682751 47970304 22.9G Linux root (ARM-64)<!--"-->
<!--"-->/dev/mmcblk0p102 52682752 61069311  8386560    4G Linux swap<!--"-->
FDISK_PROMPT(w)
<!---->
<span class="token shell-symbol important">localhost#</span> cp /dev/mmcblk1p9 /dev/disk/by-partlabel/chwast-kernel
cp: error writing '/dev/disk/by-partlabel/chwast-kernel': No space left on device
<span class="token comment"># benign: overprovisioned at 100M, the actual bundle is <20M</span>
<span class="token shell-symbol important">localhost#</span> blkdiscard /dev/disk/by-partlabel/chwast-root
<span class="token shell-symbol important">localhost#</span> e2image -rap /dev/mmcblk1p10 /dev/disk/by-partlabel/chwast-root
e2image 1.46.5 (30-Dec-2021)
Scanning inodes...
<!--"-->Copied 1852984 / 1852984 blocks (100%) in 00:01:56 at 15.60 MB/s       s<!--"-->
<span class="token shell-symbol important">localhost#</span> mkswap -L chwast-swap /dev/disk/by-partlabel/chwast-swap
Setting up swapspace version 1, size = 4 GiB (4293914624 bytes)
LABEL=chwast-swap, UUID=d88296c6-5438-41f2-866a-e1e9e01b77b3\
</code></pre>
	</figcaption>
	<!--"--><a target="_blank" href="/content/assets/blogn_t/012b.30-7install.png"><picture><source srcset="/content/assets/blogn_t/012b.30-7install-crop+inv.png" media="(prefers-color-scheme: dark)"><img alt="
Partition 100 (chrust-kernel): 24M
Partition 101 (chrust-root): 22.875G
Partition 100 (chrust-swap): 4G
added\
" src="/content/assets/blogn_t/012b.30-7install-crop.png"></picture></a><!--"-->
</figure>

<p class="indented">
<tt>chwast-kernel</tt> on partition 100 has priority <var>2</var> (49=<var>1</var>, 48=<var>0</var> ⇔ <var>0b10</var>) with its <q>Successful Boot Flag</q> set,
and will thus be chosen over <tt><q>KERN-A</q></tt> (partition 2) with priority <var>1</var>.
</p>

HEADING_S(2, speedrun-install, class="continued", arm64 Chromebook Debian port install% 23-day RTA/#137 IGT WR)
<iframe width="640" height="360" src="//www.youtube.com/embed/gJilDg6ghq8" title="arm64 Chromebook Debian port install% 23-day RTA/#137 IGT WR" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

<p></p>
<pre class="language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">chwast#</span> resize2fs /dev/dev/disk/by-partlabel/chwast-root
resize2fs 1.47.0 (5-Feb-2023)
Filesystem at /dev/disk/by-partlabel/chwast-root is mounted on /; on-line resizing required
old_desc_blocks = 8, new_desc_blocks = 92

The filesystem on /dev/dev/disk/by-partlabel/chwast-root is now 5926272 (4k) blocks long.
<span class="token shell-symbol important">chwast#</span> df -h
<!--"-->Filesystem       Size  Used Avail Use% Mounted on<!--"-->
<!--"-->/dev/mmcblk0p100  22G  1.7G   19G   8% /<!--"-->\
</code></pre>


HEADING_S(3, recovery, class="continued", ChromeOS as a recovery system)
<p class="continuation">
has a propensity to shuffle the priorities, but it'<!--'-->s nothing major.
</p>

<figure class="bigcode">
	<figcaption>
		<p class="indented continuing">Disable the successful boot flag on the Debian kernel:</p>
	</figcaption>
	<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">chwast#</span> fdisk /dev/mmcblk0
FDISK_PROMPT(x)
FDISK_PROMPT_X(p)
<!--"-->Device             Start     End Sectors <small>Type-UUID                            UUID                                </small> Name          Attrs<!--"-->
<!--"-->/dev/mmcblk0p2     16448   49215   32768 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B9393B88-B27F-438D-BF88-93BE6E66E4A9</small> KERN-A        GUID:48,56<!--"-->
<!--"-->/dev/mmcblk0p100 4663296 4712447   49152 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B404D487-BF0B-A842-B93F-742DFB050BA5</small> chwast-kernel GUID:49,56<!--"-->
<!---->
FDISK_PROMPT_X(S)
Partition number (1-3,11,100-102, default 102): 100
Enter GUID specific bit (48-63, default 48): 56
The GUID specific bit 56 on partition 100 is disabled now.
<!---->
<span class="token shell-symbol important">chwast#</span> reboot\
	</code></pre>
</figure>

<figure class="bigcode">
	<figcaption>
		<p class="indented continuing">After rebooting, now to ChromeOS, note how the priorities were automatically inverted.</p>
	</figcaption>
	<pre class="continuing language-ANSI"><code class="language-ANSI">\
<span class="token shell-symbol important">localhost#</span> fdisk /dev/mmcblk0
FDISK_PROMPT(x)
FDISK_PROMPT_X(p)
<!--"-->Device              Start      End  Sectors <small>Type-UUID                            UUID                                </small> Name          Attrs<!--"-->
<!--"-->/dev/mmcblk0p2      16448    49215    32768 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B9393B88-B27F-438D-BF88-93BE6E66E4A9</small> KERN-A        GUID:49,56<!--"-->
<!--"-->/dev/mmcblk0p100  4663296  4712447    49152 <small>FE3A2A5D-4F32-41A7-B725-ACCC3285A309 B404D487-BF0B-A842-B93F-742DFB050BA5</small> chwast-kernel GUID:48<!--"-->
<!---->
FDISK_PROMPT_X(S)
Partition number (1-3,11,100-102, default 102): 100
Enter GUID specific bit (48-63, default 48): 56
The GUID specific bit 56 on partition 100 is enabled now.
<!---->
FDISK_PROMPT_X(S)
Partition number (1-3,11,100-102, default 102): 2
Enter GUID specific bit (48-63, default 48): 49
The GUID specific bit 49 on partition 2 is disabled now.
<!---->
<span class="token shell-symbol important">localhost#</span> reboot\
	</code></pre>
</figure>

<p class="continued"></p>
<div class="indented">
	<p style="display: inline;">
	And with
	</p>
	<dl class="linear">
		<dt><tt>KERN-A</tt></dt>        <dd><tt>GUID:56</tt></dd>
		<dt><tt>chwast-kernel</tt></dt> <dd><tt>GUID:48,56</tt></dd>
	</dl>
	<p style="display: inline;">
	the re-boot chooses the Debian kernel again.
	For a subsequent recovery run, toggling <tt>KERN-A</tt>'<!--'-->s bit 49 would also work.
	</p>
</div>


HEADING_S(2, hid, class="continued", they unfucked the HIDs bro its crazy)
<p class="indented continuation">
In pointed contrast to
<a href="012a-installing-debian-chromebook-lenovo-300e-gen2-intel.html#installing-post-install-linux-general-qol-fixes-cros-keyboard-map"><cite>POST012aC, <span class="local-ref">Post Install</span>, <span class="local-ref">General QOL Fixes</span>, Run the cros-keyboard-map script<!---->ELLIPSIS</cite></a>.
</p>

<dl class="keyboard continuing">
  <dt><kbd>esc</kbd></dt><dd><code>Escape</code></dd>
  <dt><kbd>←</kbd></dt><dd><code>F1</code></dd>
  <dt><kbd>→</kbd></dt><dd><code>F2</code></dd>
  <dt><kbd>⟳</kbd></dt><dd><code>F3</code></dd>
  <dt><kbd>TABLEAU</kbd></dt><dd><code>F4</code></dd>
  <dt><kbd>FASTRECTANGLE</kbd></dt><dd><code>F5</code></dd>
  <dt><kbd><small>☀️</small></kbd></dt><dd><code>F6</code></dd>
  <dt><kbd>☀️</kbd></dt><dd><code>F7</code></dd>
  <dt><kbd>🔇</kbd></dt><dd><code>F8</code></dd>
  <dt><kbd>🔉</kbd></dt><dd><code>F9</code></dd>
  <dt><kbd>🔊</kbd></dt><dd><code>F10</code></dd>
  <dt><kbd>🔒</kbd></dt><dd><code>XF86Sleep</code></dd>
</dl>
<p class="continuing">
(🔒 is the Suspend Key and handled by logind by default.)
Caps Lock is replaced with
</p>
<dl class="keyboard continuation">
  <dt><kbd>🔍</kbd></dt><dd><code>Super_L</code></dd>
</dl>

<p class="indented">
<kbd>esc</kbd>, <kbd>🔒</kbd>, and <kbd>🔍</kbd> are the same as on the Intel 300e.
All the other ones aren'<!--'-->t, and this is for the best – you can switch VTs normally!
You almost wouldn't notice the keyboard's fucked! sans the usual omissions of Home/End/Delete of course.
</p>

<p class="continued"></p>
<div class="indented">
	<p style="display: inline">
	The clicky buttons on the side –
	</p>
	<dl class="continuation linear">
	  <dt>volume up</dt>   <dd><code>XF86AudioRaiseVolume</code></dd>
	  <dt>volume down</dt> <dd><code>XF86AudioLowerVolume</code></dd>
	  <dt>power</dt>       <dd>power key logind understands</dd>
	</dl>
	<p style="display: inline">
	–	are distinguished from <kbd>🔉</kbd>/<kbd>🔊</kbd> this time!
	Imagine!
	</p>
</div>


<p class="indented continued">
For these same inputs <a href="//github.com/rvaiya/keyd">keyd</a> yields
</p>
<pre class="continuing" style="overflow: auto;">\
device added: 0000:0000 cros_ec (/dev/input/event0)
device added: 06cb:1a10 hid-over-i2c 06CB:1A10 (/dev/input/event1)
device added: 04f3:009f Elan Touchpad (/dev/input/event3)
cros_ec	0000:0000	esc down
cros_ec	0000:0000	f1 down
cros_ec	0000:0000	f2 down
cros_ec	0000:0000	f3 down
cros_ec	0000:0000	f4 down
cros_ec	0000:0000	f5 down
cros_ec	0000:0000	f6 down
cros_ec	0000:0000	f7 down
cros_ec	0000:0000	f8 down
cros_ec	0000:0000	f9 down
cros_ec	0000:0000	f10 down
cros_ec	0000:0000	sleep down
cros_ec	0000:0000	leftmeta down\
</pre>
<p class="continuing">
– note that the side buttons don'<!--'-->t generate any input event!
But this agrees with our other findings, and thus,
for the <a href="012a-installing-debian-chromebook-lenovo-300e-gen2-intel.html#cros2.conf">same mapping as last time</a>,
a simple PATH(/etc/keyd/cros_ec.conf) of
</p>
<div class="bigcode continuing-inside tab8-inside">
#include "blogn_t/012b.18-keyd.ini.html"
</div>
<p class="continuing">
suffices.
</p>

HEADING(3, hid-touchpad, naaah no they fuckin didn'<!--'-->t)

<p class="indented">
Yeah so the touchpad has one button.
</p>

<p class="continued"></p>
<div class="indented">
	<p style="display: inline">
	This by itself is baffling, but since the "Tapping" mode basically a necessity for the modern user anyway
	(the methodology in
	 <a href="012a-installing-debian-chromebook-lenovo-300e-gen2-intel.html#xorg.conf.d"><cite>POST012aC, <span class="local-ref">Installing Linux</span>, PATH(/etc/X11/xorg.conf.d/touchpad.conf)</cite></a>
	 applies)
	it'<!--'-->s only an issue for the first 10min because clicking touchpads sucks on a good day
	so the
	</p>
	<dl class="continuation linear">
	  <dt>1 finger</dt>  <dd>left click</dd>
	  <dt>2 fingers</dt> <dd>right click</dd>
	  <dt>3 fingers</dt> <dd>middle click</dd>
	</dl>
	<p style="display: inline">
	mapping thus enabled is all-'round better than only having two buttons would've been.
	Plus, there'<!--'-->s already a 75-big pad for clicking just above.
	</p>
</div>


HEADING(2, hdmi, <abbr title="Horny Demon Mangling Interface">HDMI</abbr>)

<p class="indented continued">
Doesn'<!--'-->t work.
</p>
<p class="indented continuing">
But it <em>does</em> work under ChromeOS, with <code>dmesg | grep -i hdmi</code> yielding
</p>
<div class="bigcode" style="position: relative;"><pre class="continuing language-plaintext"><code class="language-plaintext">\
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/KERN-A.dmesg"><aside>full dmesg</aside></a>\
<!--"-->[    0.130803]<!--"--> mediatek-hdmi-phy 10209100.hdmi-phy: Using default TX DRV impedance: 4.2k/36
<!--"-->[    0.131789]<!--"--> mediatek-drm-hdmi 14025000.hdmi: Waiting for external bridge
<!--"-->[    0.133463]<!--"--> gpio-display-mux hdmi_mux: GPIO lookup for consumer detect
<!--"-->[    0.133468]<!--"--> gpio-display-mux hdmi_mux: using device tree for GPIO lookup
<!--"-->[    0.133485]<!--"--> of_get_named_gpiod_flags: parsed 'detect-gpios' property of node '/hdmi_mux[0]' - status (0)
<!--"-->[    0.133519]<!--"--> gpio-display-mux hdmi_mux: Waiting for external bridge anx7688
<!--"-->[    0.960402]<!--"--> mediatek-drm-hdmi 14025000.hdmi: Waiting for external bridge
<!--"-->[    0.960636]<!--"--> gpio-display-mux hdmi_mux: GPIO lookup for consumer detect
<!--"-->[    0.960638]<!--"--> gpio-display-mux hdmi_mux: using device tree for GPIO lookup
<!--"-->[    0.960645]<!--"--> of_get_named_gpiod_flags: parsed 'detect-gpios' property of node '/hdmi_mux[0]' - status (0)
<!--"-->[    0.967421]<!--"--> [drm] hdmi-audio-codec driver bound to HDMI
<!--"-->[    0.968986]<!--"--> mtk-rt5650 sound: snd-soc-dummy-dai <-> HDMI mapping ok
<!--"-->[    0.969679]<!--"--> mtk-rt5650 sound: i2s-hifi <-> HDMIO mapping ok
<!--"-->[    1.025253]<!--"--> input: mtk-rt5650 HDMI Jack as /devices/platform/sound/sound/card0/input6
<!--"-->[    1.025521]<!--"--> mediatek-dpi 1401d000.dpi: Found bridge node: /soc/hdmi@14025000
<!--"-->[   11.742614]<!--"--> udevd[2142]: Process '/usr/sbin/hdcp_pass_key.sh /devices/platform/soc/14025000.hdmi' failed with exit code 1.
<!--"-->[   11.895324]<!--"--> udevd[2145]: Process '/usr/sbin/hdcp_pass_key.sh /devices/platform/soc/14025000.hdmi/hdmi-audio-codec.11.auto' failed with exit code 1.
</code></pre></div>
<p class="continuing">
whereas the same under 6.6.11 #137 is only
</p>
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
<!--"-->[    18:20:17]<!--"--> platform 14025000.hdmi: Fixed dependency cycle(s) with /soc/dpi@1401d000/port/endpoint
<!--"-->[    18:20:17]<!--"--> platform connector: Fixed dependency cycle(s) with /soc/hdmi@14025000/ports/port@1/endpoint
<!--"-->[    18:20:17]<!--"--> <span class="token comment">mediatek-hdmi-phy 10209100.hdmi-phy: Using default TX DRV impedance: 4.2k/36</span>
<!--"-->[    18:20:17]<!--"--> <span class="token comment">[drm] hdmi-audio-codec driver bound to HDMI</span>
<!--"-->[    18:20:17]<!--"--> <span class="token comment">mediatek-dpi 1401d000.dpi: Found bridge node: /soc/hdmi@14025000</span>
<!--"-->[    18:20:20]<!--"--> <span class="token comment">input: mtk-rt5650 HDMI Jack as /devices/platform/sound/sound/card0/input9</span>\
</code></pre></div>
<p class="continuing">
(matching lines lowlighted).
So only the audio goop is common.
</p>
<p class="indented continuing">
Fortuitously, while a grep for <tt><q>of_get_named_gpiod_flags</q></tt> was uneventful,
a grep for <tt><q>gpio-display-mux</q></tt> yielded nothing – not one single reult – in the 6.6.11 tree.
Well then!
</p>
<p class="indented continuing">
<tt><q>gpio-display-mux</q></tt> figures in the
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.mt8173-elm-hana.dts">ChromeOS device tree</a> as
</p>
<div class="bigcode continuing-inside" style="position: relative;">
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.mt8173-elm-hana.dts"><aside>full device tree</aside></a>
#include "blogn_t/012b.19-mux.dts.html"
</div>
<p class="continuing">
and not at all in the 6.6.11 one;
the first google result is
<a href="//patchwork.kernel.org/project/linux-mediatek/patch/20230218111712.2380225-5-treapking@chromium.org/"><cite>[v3,4/5] dt-bindings: display: bridge: Add GPIO display mux binding</cite></a>,
part of the
<a href="//lore.kernel.org/all/20230218111712.2380225-1-treapking@chromium.org/t/"><cite>[PATCH v3 0/5] Add generic-display-mux driver and bindings</cite></a>,
series from 2023-02-18.
(Attentive readers may remember this is a 2019 device.)
All great,
except <a href="//lore.kernel.org/all/20230218111712.2380225-1-treapking@chromium.org/t/#mb0efcb6d9c20529b7ffa234d68cf84c1de988130">this series is dropped</a>
because it doesn'<!--'-->t do something-or-other cromulently enough for the DRM subsystem.
If only you could'<!--'-->ve arrived at this <em>before</em> you shipped hundreds of thousands of units!
</p>
<p class="indented continuing">
The <a href="//patchwork.kernel.org/series/723172/mbox/">series from patchwork</a> applies with minimal fuzz;
this also references the <tt>analogix,anx7688</tt> device –
</p>
<div class="bigcode continuing-inside" style="position: relative;">
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/mmcblk0p2.mt8173-elm-hana.dts"><aside>full device tree</aside></a>
#include "blogn_t/012b.20-analogix.dts.html"
</div>
<p class="continuation">
– also not present (incl. the tunnel) in the 6.6.11 device tree, also with no compatible module.
There'<!--'-->s <a href="//lore.kernel.org/all/Zbt1dIByBZ2stzjm@mobian/t/#u">an extrmely crusty patch</a> for it (targetting the PinePhone) from <em>this Thursday</em>;
it also applies with no fuzz.
</p>

<pre class="continued" style="overflow: auto;">\
$ make -j25 ARCH=arm64 LLVM=1 oldconfig
Generic GPIO-controlled mux (DRM_GENERIC_GPIO_MUX) [N/m/y/?] (NEW) y
Analogix ANX7688 Type-C DRP Port controller and mux driver (TYPEC_ANX7688) [N/m/y/?] (NEW) y\
</pre>
<p class="continuing">
and it builds fine as well.
Neither of them change the device tree, however, so I
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/hdmi_mux+anx7688.dts">carefully grafted both devices thereinto</a>,
yielding
</p>
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
18M 02-04 19:44 mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd&mwifiex+mmc1+gpio-display-mux.dtb
18M 02-04 19:53 mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd&mwifiex+mmc1+gpio-display-mux2.dtb
18M 02-04 20:09 mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd&mwifiex+mmc1+gpio-display-mux3.dtb
18M 02-04 20:29 mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd&mwifiex+mmc1+gpio-display-mux3+anx.dtb\
</code></pre></div>
<p class="continuation">
which boots to black screen, neither SYSRQ_COMBO(<kbd>r</kbd>) nor <kbd>⟳</kbd>+power button leave anything in the pstore.
</p>


HEADING(2, blob, blob-free boot bundle real)

<p class="indented continued">
Heretofore the device trees to sign/bundle and boot were <a href="#hifux">a bastardised version of the ChromeOS boot bundle'<!--'-->s device tree</a>.
This works, but is both plain odd <em>and</em> existentially problematic –
what is the boot bundles contain <a href="#kernal">device trees without the right <samp>compatible =</samp> stanza like in <tt><q>EFI-SYSTEM</q></tt></a>?
</p>
<p class="indented continuing">
Given that <a href="#bootloader">the bootloader coughs up</a> to <q><tt>Starting depthcharge on hana...</tt></q>,
a quick "site:manpages.debian.org depthcharge" search yields
<a href="//manpages.debian.org/unstable/depthcharge-tools/mkdepthcharge.1.en.html">mkdepthcharge(1)</a>
(as part of depthcharge-tools,
 which <a href="//packages.debian.org/sid/all/depthcharge-tools/filelist">also includes kernel/initrd hooks</a>,
       <a href="//packages.debian.org/sid/depthcharge-tools#pdeps">pulls in a tremendous amount of dependencies</a>,
   and <a href="//sources.debian.org/src/depthcharge-tools/0.6.2-1/systemd/depthchargectl-bless.service/">ships a service to massage the partition table on boot</a>
 – absolutely not happening, sorry),
pointing at <a href="//manpages.debian.org/unstable/u-boot-tools/mkimage.1.en.html">mkimage(1)</a> (u-boot-tools),
and <code>mkimage -l PATH(mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd\&mwifiex+mmc1-sdr.dtb)</code> starts with
</p>
<div class="bigcode"><pre class="continuing language-plaintext"><code class="language-plaintext">\
<!--"-->Image contains unit addresses @, this will break signing<!--"-->
<!--"-->FIT description: Chrome OS kernel image with one or more FDT blobs<!--"-->
<!--"-->Created:         Mon Apr 17 04:48:47 2023<!--"-->
<!--"--> Image 0 (kernel@1)<!--"-->
<!--"-->  Description:  unavailable<!--"-->
<!--"-->  Created:      Mon Apr 17 04:48:47 2023<!--"-->
<!--"-->  Type:         Kernel Image (no loading done)<!--"-->
<!--"-->  Compression:  lz4 compressed<!--"-->
<!--"-->  Data Size:    15550846 Bytes = 15186.37 KiB = 14.83 MiB<!--"-->
<!--"--> Image 1 (fdt@1)<!--"-->
<!--"-->  Description:  mt2712-evb.dtb<!--"-->
<!--"-->  Created:      Mon Apr 17 04:48:47 2023<!--"-->
<!--"-->  Type:         Flat Device Tree<!--"-->
<!--"-->  Compression:  uncompressed<!--"-->
<!--"-->  Data Size:    8174 Bytes = 7.98 KiB = 0.01 MiB<!--"-->
<!--"-->  Architecture: AArch64<!--"-->
<!--"-->  Hash algo:    sha1<!--"-->
<!--"-->  Hash value:   2cb3b42d319ed9579540b17d7c2c68863329e8fe<!--"-->
…
<!--"--> Configuration 0 (conf@1)<!--"-->
<!--"-->  Description:  unavailable<!--"-->
<!--"-->  Kernel:       kernel@1<!--"-->
<!--"-->  FDT:          fdt@1<!--"-->\
</code></pre></div>
<p class="continuation">
– certainly promising.
</p>

<p class="indented continuing">
By adapting an example from the manual,
<samp>mkimage -f auto -A arm64 -T kernel -C lz4 -d Image.lz4 -b mt8173-elm-hana.dtb Image.dtb</samp>
(naturally, here the architecture defaults to PowerPC; the kernel must already be pre-LZ4ed <em>and</em> not a pipe)
produces PATH(Image.dtb), which, after decompilation, looks like
</p>
<div class="bigcode continuing-inside">
#include "blogn_t/012b.21-mkimage.dts.html"
</div>
<p class="continuation">
(note the differences from <a href="#kernal">ChromeOS'<!--'-->s</a> –
 both are hashed, but with CRC32;
 IDs delimited with <samp>-</samp>es instead of <samp>@</samp>s).
The type is <samp>kernel</samp> rather than <samp>kernel_noload</samp> (<q><tt>Kernel Image (no loading done)</tt></q>)
because if you use <samp>kernel_noload</samp> then it doesn'<!--'-->t boot because it calls the node <tt>kernel_noload-1</tt>.
You could decompile/re-tag to <samp>type = "kernel_noload"</samp>/recompile to match ChromeOS, which works,
and <a href="//sources.debian.org/src/depthcharge-tools/0.6.2-1/depthcharge_tools/mkdepthcharge.py/#L860">mkdepthcharge appears convinced is required</a>,
but it doesn'<!--'-->t appear to change anything,
and <samp>-T kernel</samp> just works.
</p>

<p class="indented continued">
This makes the final kernel installation look like
</p>
<div class="bigcode continuing-inside">
#include "blogn_t/012b.22-fullkern.shell-session.html"
</div>
<p class="continuing">
which provides for a <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/boot/">roughly-normal PATH(/boot)</a>
and a <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/boot/bundle">simple installation script</a>,
</p>
<div class="bigcode"><pre class="language-plaintext continuation"><code class="language-plaintext">\
18M 02-04 21:36 mandeb+initrd+1+tabs2+reg+drm+adc+d_t_c-initrd&mwifiex+mmc1-sdr.dtb
13M 02-05 04:24 6.6.11.bundle\
</code></pre></div>

<p class="continued">
The firmware, which logged
</p>
<div class="bigcode" style="position: relative;"><pre class="continuing language-plaintext"><code class="language-plaintext">\
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/new.log"><aside>full /sys/firmware/log</aside></a>\
Boot policy: Match for type 0 with cmdline 1
Modified kernel command line: cros_secure console= loglevel=7 init=/sbin/init cros_secure drm.trace=0x106 root=PARTUUID=ccfe5bd8-bbe4-a840-9c0b-bba6427b6309/PARTNROFF=1 rootwait rw dm_verity.error_behavior=3 dm_verity.max_bios=-1 dm_verity.dev_wait=0 dm="1 vroot none ro 1,0 4077568 verity payload=ROOT_DEV hashtree=HASH_DEV hashstart=4077568 alg=sha256 root_hexdigest=59f5ac907dd5cfa3f6fdef15b166c94065a41ef4abfd0d9c68db6ef4a2f62a68 salt=05e2c9a8dc172bc5efe0c899186b436bb89609a064eabcaeb5ec07441cf2a122" noinitrd vt.global_cursor_default=0 kern_guid=ccfe5bd8-bbe4-a840-9c0b-bba6427b6309 cpuidle.governor=teo
Loading FIT.
Image fdt@54 has 61778 bytes.
…
Image fdt@1 has 8174 bytes.
Image kernel@1 has 8706585 bytes.
Compat preference: google,hana-rev5
Config conf@54, kernel kernel@1, fdt fdt@54, compat google,willow-sku1 google,willow mediatek,mt8183
…
Config conf@9, kernel kernel@1, fdt fdt@9, compat google,hana-rev6 google,hana-rev5 BOLD((match)) google,hana-rev4 google,hana-rev3 google,hana-rev2 google,hana-rev1 google,hana mediatek,mt8173
…
Config conf@1, kernel kernel@1, fdt fdt@1, compat mediatek,mt2712-evb mediatek,mt2712
Choosing best match conf@9.
Shutting down all USB controllers.
Exiting depthcharge with code 4 at timestamp: 5889734
Decompressing LZ4 kernel to 0x40080000
jumping to kernel\
</code></pre></div>
<p class="continuing">
now logs
</p>
<div class="bigcode" style="position: relative;"><pre class="continuation language-plaintext"><code class="language-plaintext">\
<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/newkernel/6.6.11.sys-firmware-log"><aside>full /sys/firmware/log</aside></a>\
<span class="token comment">Boot policy: Match for type 0 with cmdline 1</span>
Modified kernel command line: cros_secure root=PARTLABEL=chwast-root rootwait console=pstore-1 console=tty1
<span class="token comment">Loading FIT.</span>
Image fdt-1 has 43853 bytes.
Image kernel-1 has 12611929 bytes.
<span class="token comment">Compat preference: google,hana-rev5</span>
Config conf-1 (default), kernel kernel-1, fdt fdt-1, compat google,hana-rev6 google,hana-rev5 BOLD((match)) google,hana-rev4 google,hana-rev3 google,hana mediatek,mt8173
Choosing best match conf-1.
<span class="token comment">Shutting down all USB controllers.</span>
Exiting depthcharge with code 4 at timestamp: 2759765
<span class="token comment">Decompressing LZ4 kernel to 0x40000000
jumping to kernel</span>\
</code></pre></div>


HEADING_S(2, miscellanea, class="continued", Miscellanea:)
<ul style="padding-left: 0;">
	<li>PATH(/dev/rtc0) wasn'<!--'-->t set to a physical time at all (2024-01-06 on 2024-01-31).
	    It doesn't have to be, and it doesn't matter,
	    but it was surprising when firefox complained it was too out-of-date to do TLS just days after recording the video where it did TLS.</li>
	<li>If already suspended, shutting the lid switch wakes up.</li>
	<li>The battery (SBS driver – <code>"sbs-%s"</code>) reports time-to-empty and time-to-full in seconds.
	    The APM driver (<code>"BAT%d"</code>, commonly used on x86) reports them in minutes.
	    As the only manifestation of the amd64 monoculture I really encountered,
	    userspace software may not expect this,
	    and <a href="//github.com/i3/i3status/issues/521">i3status reports 974 hours to drain and 1032:15 to charge</a>.</li>
	<li>In addition to the aforementioned, DEBUG_BUTTON_SHORTCUTS'<!--'--> SYSRQ_COMBO(<kbd>h</kbd>) appears to power off the device instantly;
	    none of the other shortcuts appear to do anything, and <span style="white-space: nowrap;"><kbd>alt</kbd>+<kbd>🔊</kbd></span> doesn'<!--'-->t appear to be <q>the <a href="//www.kernel.org/doc/html/latest/admin-guide/sysrq.html">Magic SysRq</a> key</q> at all.</li>
</ul>


HEADING_S(2, install-guide, class="continued", How to get Debian on your Google Hana 2023 (real (working (no virus))))
<ol class="bigcode" style="padding-left: 1em;">
	<li>Partition an SD card with <a href="#kernal">a "ChromeOS kernel"-type partition with type-specific GUID bits 56 (Successful Boot Flag) and 48 (priority 1) set</a>
		  and some space for the rootfs
	    (<a href="#7install">similarly to how the installed state looks</a>)</li>
	<li>Strap or install an arm64 to that rootfs (ext[234], or set <code>CONFIG_XFS=y</code> or whatever in the config below); mount on PATH(/mnt)</li>
	<li><code>apt source linux</code></li>
	<li>Generate the Debian config (à la <code>cp /boot/config-6.6.11-arm64 .config</code>; paths per PATH(debian/rules.gen)):
	    <pre class="continuing" style="padding-left: 1em; overflow: auto;"><code>\
debian/bin/kconfig.py .config debian/config/config debian/config/arm64/config
make ARCH=arm64 olddefconfig\
	    </code></pre></li>
	<li><code>scripts/kconfig/merge_config.sh -m .config <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/boot/config-6.6.11.diff-m">config-6.6.11.diff-m</a></code></li>
	<li><code style="white-space: pre-wrap;">patch -p1 < <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/patches/mwifiex.patch">mwifiex.patch</a><!--"-->                <!--"--># <a href="#speedrun">warning backtrace</a>; from <a href="//lore.kernel.org/lkml/59378600-8d36-4958-8882-fa693fcad4d6@yandex.ru/t/#u">Dmitry Antipov</a>, though the patch in the mail is damaged</code></li>
	<li><code style="white-space: pre-wrap;">patch -p1 < <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/patches/mt8173-fix-mmc1-speed.patch">mt8173-fix-mmc1-speed.patch</a><!--"-->  <!--"--># <a href="#speedrun">oops when using SDR104 cards</a>; from HEXPATCH(mt8173-fix-mmc1-speed.patch)</code></li>
	<li><code style="white-space: pre-wrap;">patch -p1 < <a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/patches/mt8173-higher-temps.patch">mt8173-higher-temps.patch</a><!--"-->    <!--"--># <a href="#foreign-config"><q>raise temps for elm a bit</q></a>;<!--"-->  <!--"-->from HEXPATCH(mt8173-higher-temps.patch)</code></li>
	<li><code>make ARCH=arm64 Image modules dtbs</code></li>
	<li><code>make ARCH=arm64 modules_install INSTALL_MOD_PATH=/mnt INSTALL_MOD_STRIP=1</code></li>
	<li><code>lz4 -9 < arch/arm64/boot/Image > /mnt/boot/Image-<var>6.6.11</var>.lz4</code> (or whatever the version)</li>
	<li><code>cp arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb /mnt/boot/mt8173-elm-hana-<var>6.6.11</var>.dtb</code></li>
	<li>In PATH(/mnt/boot): <code>echo console=pstore-1 console=tty1 rootwait root=<var>as appropriate for the rootfs</var> > cmdline</code> &c.</li>
	<li>With u-boot-tools and vboot-kernel-utils (very much <samp>--no-install-recommends</samp>ed): <code><a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/boot/bundle">./bundle</a> <var>6.6.11</var> > /dev/<var>the-kernel-partition</var></code></li>
	<li><a href="012-debian-chromebook-lenovo-300e-gen2.html#jailbreak">Developer-mode-ify the Chromebook</a></li>
	<li>Insert the SD card and press <kbd>ctrl</kbd>+<kbd>u</kbd> to boot</li>
	<li>See the <a href="#install"><cite class="local-ref">installing Debian</cite></a> sexion for booting the same from the eMMC</li>
</ol>


HEADING_S(2, functional-summary, class="continued", Funxional summary)
HEADING_S(3, functional-summary-functional, class="continuing", Funxional)
<ul style="padding-left: 0;">
	<li>CPU/RAM/&c.</li>
	<li>PATH(/sys/firmware/log) & PATH(/sys/fs/pstore)</li>
	<li>PATH(/sys/class/power_supply/sbs-6-000b) (the battery)</li>
	<li>PATH(/sys/class/power_supply/CROS_USBPD_CHARGER0) (the charger) @ 15V/2A (max 3A)</li>
	<li>eMMC</li>
	<li>SD card (with mt8173-fix-mmc1-speed.patch) to make SDR104-speed cards not oops)</li>
	<li>USBs</li>
	<li>Wi-Fi (WPA2 iwd)</li>
	<li>Bluetooth</li>
	<li>Audio: speakers, headphones (ALSA and pipewire)</li>
	<li>framebuffer, X.Org, &c.</li>
	<li>screen (<a href="//lfs.nabijaczleweli.xyz/0018-debian-chromebook-lenovo-300e-gen2-mtk-real/probes/edid">EDID</a> says it'<!--'-->s the same exact device as the x86 platform) and accoutrements</li>
	<li><a href="hid">keyboard and side buttons</a>; <a href="#miscellanea">lid switch</a></li>
	<li>touchpad (<a href="#hid-touchpad">one button only</a>, 3-way multitouch)</li>
	<li>touchscreen (10-way multitouch)</li>
	<li>webcam (it'<!--'-->s the same exact device as the Intel-processor 300e)</li>
	<li>PATH(/dev/rtc0)</li>
	<li><details>
	    <summary>sensors</summary>
	    <pre class="continuing">\
<!--"-->sbs_6_000b-i2c-6-0b<!--"-->
<!--"-->Adapter: cros-ec-i2c-tunnel<!--"-->
<!--"-->in0:          11.37 V<!--"-->
<!--"-->temp:         +22.6°C<!--"-->
<!--"-->curr1:       -386.00 mA (avg =  -0.38 A)<!--"-->
<!---->
<!--"-->cpu_thermal-virtual-0<!--"-->
<!--"-->Adapter: Virtual device<!--"-->
<!--"-->temp1:        +45.6°C<!--"-->
<!---->
<!--"-->CROS_USBPD_CHARGER0-isa-0000<!--"-->
<!--"-->Adapter: ISA adapter<!--"-->
<!--"-->in0:           0.00 V<!--"-->
<!--"-->curr1:            N/A  (max =  +0.00 A)<!--"-->\
	    </pre></details></li>
</ul>

HEADING_S(3, functional-summary-dysfunctional, class="continued", Dysfunxional)
<ul style="padding-left: 0;">
	<li>Audio: internal mic (it'<!--'-->s possible mine is just broken), headset mic (when clicking the mic button on one headset I got clicks but nothing past that)</li>
	<li><a href="#hdmi"><cite class="local-ref"><abbr title="Horny Demon Mangling Interface">HDMI</abbr></cite></a> (shows up as a video and audio output, never pops up with any available resolutions, connected display never sees a signal)</li>
	<li>Tablet mode switch (which would disable the keyboard) doesn'<!--'-->t seem to exist</li>
	<li>Hibernation (loads image for a bit then blackscreens, no pstore)</li>
</ul>


HEADING_S(2, summary, class="continued", Summary)
<p class="indented continuing">
A successful non-invasive reversible methodology to install Debian on a presently-still-novel ARM64 Chromebook platform,
all possible because the MT8173 platform is well-supported by Linux and because the elm/hana platform is reasonably-supported by Linux
(sans the <a href="#hdmi"><cite class="local-ref"><abbr title="Horny Demon Mangling Interface">HDMI</abbr></cite></a> thing).
</p>
<p class="indented continuing">
A top-down and bottom-up analysis of the Chromebook bootloader stack with effectively no a priori knowledge,
and attempts at replication of various documentation showing mostly negative results.
</p>
<p class="indented continuing">
1.94W idle (at a reasonable indoor backlight brightess) is the lowest power consumption I'<!--'-->ve seen on a computer.
This is maintained at around 2.3W during static web browsing,
and extends to >12h projected times-to-empty at around 70% battery capacity (~23h at ~100%)..
There are no hardware accelerators that Firefox understands; there'<!--'-->s no OpenGL; fullscreen glxgears (llvmpipe) gets 57FPS, half-screen gets 140FPS, both at around 7W.
</p>
<p class="indented continuing">
Issues identified (chronological order):
</p>
<ol style="padding-left: 0;">
	<!--2024-01-13T22:35--><li><a href="//lore.kernel.org/util-linux/utso6yacwbluj5pou2vwllxfb5dxmhbly5qaumlshga3o5fbgg@tarta.nabijaczleweli.xyz/t/#u">[PATCH] libfdisk: fdisk_deassign_device: only sync(2) blockdevs</a></li>
	<!--2024-01-18T19:11--><li><a href="//lore.kernel.org/util-linux/utso6yacwbluj5pou2vwllxfb5dxmhbly5qaumlshga3o5fbgg@tarta.nabijaczleweli.xyz/t/#u">[PATCH] gpt-partnames: add "ChromeOS firmware" & doc link</a></li>
	<!--2024-01-22T20:20--><li><a href="//bugs.debian.org/1061329">Bug#1061329: /usr/bin/futility: "FATAL: do_vbutil_kernel: Error reading bootloader file." when --bootloader points to empty file</a></li>
	<!--2024-01-26T03:46--><li><a href="//bugs.debian.org/1061537">Bug#1061537: kexec-tools: non-text error output</a></li>
	<!--2024-01-26T19:47--><li><a href="//lore.kernel.org/lkml/xebnh5c5rnfequ6khyhieugefrtt5mdftr6rsw522ocpg3yvln@tarta.nabijaczleweli.xyz/t/#u">memcpy: detected field-spanning write (size 101) of single field "ext_scan->tlv_buffer" at drivers/net/wireless/marvell/mwifiex/scan.c:2251 (size 1)</a></li>
	<!--2024-01-28T05:53--><li><a href="//lore.kernel.org/lkml/lq6gstev3sd7i4iw2btiq3gg7lhsraj5w74fkbp6lpbl6nkyff@tarta.nabijaczleweli.xyz/t/#u">[PATCH] spi: Kconfig: cap[c]ability</a></li>
	<!--2024-01-31T19:23--><li><a href="//bugs.debian.org/1062208">Bug#1062208: /usr/sbin/fsck: exits 0 with no output (just version) when it doesn'<!--'-->t find a type-specific fsck</a></li>
	<!--2024-01-31T19:47--><li><a href="//bugs.debian.org/1062213">Bug#1062213: /usr/bin/wpctl: "status" draws output table with garbage</a></li>
	<!--2024-01-31T21:09--><li><a href="//bugs.debian.org/1062262">Bug#1062262: pipewire-alsa: adversarial description</a></li>
	<!--2024-02-03T20:49--><li><a href="//github.com/systemd/systemd/issues/31199">#31199: systemd-gpt-auto-generator automatically generates units, manual says it oughtn'<!--'-->t on the count of (a) not being EFI and (b) not/or having an ESP</a></li>
	<!--2024-02-04T02:35--><li><a href="//github.com/i3/i3status/issues/521">#521: Bogus battery time left (nine hundred hours) – POWER_SUPPLY_TIME_TO_EMPTY_NOW taken as minutes when it is seconds: driver compatibility?</a></li>
	<!--2024-02-04T02:44--><li><a href="//github.com/i3/i3status/pull/522">#522: man: . at end of sentence</a></li>
	<!--2024-02-04T03:00--><li><a href="//github.com/i3/i3status/issues/523">#523: Neither "battery all" nor "battery sbs-6-000b" work</a></li>
	<!--2024-02-05T03:24--><li><a href="//bugs.debian.org/1063097">Bug#1063097: /usr/bin/mkimage: opens image and device trees (-d, -b) O_RDONLY, then O_RDWR, and fails if they're read-only (it doesn't write to them)</a></li>
</ol>

<div class="bigcode"><pre class="language-plaintext"><code class="language-plaintext">\
13M 02-06 19:18 6.6.15.bundle\
</code></pre></div>

<p class="indented">
25 straight days well spent on <!-- 320h :v -->
<a href="//git.sr.ht/~nabijaczleweli/snappy-tools/commit/9628372ce87270213c7b4b3aacf869a5d063049c">commit 9628372: Add hardware-accellerated crc32c() for ARM64</a>.
<br />
Buy <a href="//nabijaczleweli.bandcamp.com/album/fluorescent-heart">my album</a> buy <a href="//store.nabijaczleweli.xyz/">my stickers</a>.
</p>


BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()