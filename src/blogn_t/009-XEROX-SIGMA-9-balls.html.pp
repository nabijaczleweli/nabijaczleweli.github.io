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


   <!-- RSS_PUB_DATE: "Thu, 01 Dec 2022 17:16:50 +0100" -->
#define POST_DATE      Thu, 01 Dec 2022 17:16:50 +0100
#define POST_POST_DATE ; <a href="//store.nabijaczleweli.xyz/002-XEROX-SIGMA-9-tape-deck.html">get one</a> <a href="//store.nabijaczleweli.xyz/002-XEROX-SIGMA-9-tape-deck.html">FA(external-link-alt)</a>

#define Tn(...) <span class="smallcaps">__VA_ARGS__</span>


#define STYLESHEETS BLOGN_T_STYLESHEETS FONTAWESOME_LINK <link href="/content/assets/blogn_t/008.01-amix-fonts.css" rel="stylesheet" />


BOILERPLATE(009. XEROX SIGMA 9 balls — blognꞌt, 009. XEROX SIGMA 9 balls, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

.main-screenshot {
	margin-top: 0.2em;
	margin-bottom: 0.15em;
	width: 100%;
}

.overlay {
	position: relative;
}
.overlay > * {
	width: 100%;
}
.overlay :first-child {
	position: absolute;
}
.overlaid {
	position: relative;
	top: -100%;
	opacity: 0;

  animation-duration: 10s;
  animation-name: overlaid;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

@keyframes overlaid {
  0% {
    opacity: 0;
  }

  2% {
    opacity: 0;
  }

  80% {
    opacity: 1;
  }

  100% {
    opacity: 1;
  }
}

.side-by-each {
	width: 100%;
}

.side-by-each > * {
	display: inline-block;
	width: 48%;
	vertical-align: top;
}

.side-by-each > *:nth-child(2) {
	margin-left: 1.5%;
}


.grid-by-each {
	width: 100%;
}

.grid-by-each > * {
	display: inline-block;
	width: 50%;
}


/* Measured against merriweather in the heading. */
.sunfont {
	font-family: sunfont;
	font-size: 1.25em; /* 60/48 */
}

.topaz {
	font-family: topaz;
	font-size: 0.80em; /* 55/69 */
}
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(<code>009. XEROX SIGMA 9 balls</code>)

<p class="indented">
I was quite taken by the Tn(xerox sigma 9) tape decks, in particular the right one from
<a href="//www.livingcomputers.org/Computer-Collection/Vintage-Computers/Mainframes/Xerox-Sigma-9.aspx">Tn(lcm+l)'s collection</a>.  <!--'-->
Naturally, it was gonna be for a different thing, but after spending >10h modeling it in everyone's favourite  <!--'-->
<span style="white-space: nowrap;">Computer-Hindered</span> Modelling suite (Illustrator),
it's no longer fit for purpose therefor.  <!--'-->
</p>

<center class="side-by-each">
   <img src="/content/assets/blogn_t/009-ref1.png" alt="LCM+L attachment 1, cropped to just the right tape-deck" /><!--
--><div class="overlay">
   	<img src="/content/assets/blogn_t/009-ref2a.png" alt="" />
   	<img src="/content/assets/blogn_t/009-ref2b.png" class="overlaid" alt="LCM+L attachment 3, cropped to just the right tape-deck, construction lines visible" />
   </div>
   The references.
</center>


<p class="indented continued">
Some may call this "shit", and it is, but it's also sufficient, if you dis-count the text, any details below the fold, and perfect dimensional accuracy:  <!--'-->
</p>
<center class="continuation"><a href="//lfs.nabijaczleweli.xyz/0014-sigma-balls/unmarred/sigma balls.svg"><img src="//lfs.nabijaczleweli.xyz/0014-sigma-balls/unmarred/sigma balls.svg" alt="The tape-deck from above, but rendered as an idealised vector rendering" class="main-screenshot" /></a></center>

<p class="indented continued">
The keen-eyed viewer might also notice that the text above the buttons is missing.
I've also just noticed, so call this an erratum.  <!--'-->
</p>
<p class="indented continuing">
The only very obvious text is the big Tn(xds) branding
(represented by <span class="topaz">AMIX topaz</span>,
previously featured <a href="008-amix-fonts.html">on this blog</a>,
with squished kerning and horizontal scaling),
and the Tn(3m) on the removable spool (likewise, but nominal proportions).
</p>
<p class="indented continuing">
The text on the name-plate is, naturally, just rectangles, but both pieces of text on the spool are
(represented by <span class="sunfont">AMIX sunfont</span>,
<a href="008-amix-fonts.html">likewise</a>, nominal proportions.
They are sensibly lorem ipsumed to reproduce the average colour of the original.
I overfit to "<!--"-->Tn(tops-10)<!--"-->" for some reason in my late-hour delirium.
Given that this isn'<!--'-->t a Tn(dec) system, it definitely isn'<!--'-->t that; but it fits dimensionally, so.
</p>
<p class="indented continuation">
One bit that may not be obvious (well, I know from looking at it that it isn't, especially in blue winter lighting)  <!--'-->
is that the tape itself has a ferric tint, which doesn't come out all that amazingly when actually printing, and I appear to've been mis-led by the deCMYKer.
</p>

<p class="indented continued">
Naturally, I hesitate to call Illustrator a CAM program not for no good reason:
the cut-outs on the permanent spool, well,
aren't, because you only get <em>one</em> level of booleans at any time, so it's actually just the back-drop repeated on top of it.
Like-wise, the tape going from that spool to the vacuum column is two different chunks, because the bottom one is at a layer below the spool,
and the top one is at the front.
Booleaning that correctly turned out to be impossible as well, so the clip mask consists of vertices cut out from the intersection
of the rhombus that limits the circumferences and the double-circle that defines the radial dimension, and pasted together.
</p>
<p class="indented continuation">
Originally, my complaints were limited to "waa why can't I actually spec any dimensions", but maybe I'<!--'-->m spoiled by actual parametric CAMs,
or "why do I have to bang in the <code>sin</code>/<code>cos</code> to get a line with a precise angle or length",
or "why can't make a line's stroke be on one side"
(you may notice that the tape coming off the removable spool actually leaves it from within the body, rather than tangentially, for this reason),
but this is, frankly, embarrassing; is this really what the monopoly's Best (only?) Vector Lay-out Product is capable of?  <!--'-->
</p>

<p class="indented continued">
This can then be scaled to a height of 85 (derived, naturally, from "what'd fit on my palmtop"), yielding a width of 44.13.
Given the five natural columns and the 5-character length of Tn(xerox) and Tn(sigma), the obvious ligma can be added, as well
(<span class="sunfont">AMIX sunfont</span>, even ⅑<sup>th</sup> font-height, nominal proportions won the popular vote):
</p>
<center class="side-by-each continuing">
   <img src="//lfs.nabijaczleweli.xyz/0014-sigma-balls/for-print-notext.png"  alt="same as above" /><!--
--><img src="//lfs.nabijaczleweli.xyz/0014-sigma-balls/for-print-yestext.png" alt='likewise, but with "XEROX SIGMA 9 BALLS" in an archaic font across the bottom half' />
</center>
<p class="indented continuing">
Yes, these are PNGs; post-scaling, the <a href="//lfs.nabijaczleweli.xyz/0014-sigma-balls/for-print-yestext.svg">SVG export</a> suffers horrific precision loss,
esp. on the name-plate.
</p>
<p class="indented continuation">
Print-ready CMYK PDFs, raw Illustrator models, &c. can be had <a href="//lfs.nabijaczleweli.xyz/0014-sigma-balls">here</a>. CC BY 4.0.
</p>

<p class="indented">
But, if printing, and scaling text that's supposed to be normally-readable on a roll with a, like, 400 physical dimension or whatever,  <!--'-->
just how small is it gonna be?
Thankfully, all is possible through the power of НАТУРАЛИСТ микроскоп детский 60<sup>×</sup>,
which passed its factory QC in <a href="//lfs.nabijaczleweli.xyz/0016-cohost-export/https://cohost.org/nabijaczleweli/post/460108-nevermind-im-a-lyin#post-439952">January 1987</a>.
</p>

<center class="grid-by-each continued" style="line-height: 0;">
   <a href="/content/assets/blogn_t/009-micro-date.png"       ><img class="grid-by-each" src="/content/assets/blogn_t/009-micro-date.png"        alt="A microscopic section of the printed model, including a sector of the spool with the manufacturer's branding in center frame, incl. 'date' in very blurry single-ink-dot text" /></a><!--
--><a href="/content/assets/blogn_t/009-micro-date+dimms.png" ><img class="grid-by-each" src="/content/assets/blogn_t/009-micro-date+dimms.png"  alt="Likewise, but dimensions drawn atop – 200μm for 'a', 293μm for 'd', 584μm for the width of the white circle" /></a>
</center>

<center class="grid-by-each continued" style="line-height: 0;">
   <a href="/content/assets/blogn_t/009-micro-label.png"      ><img class="grid-by-each" src="/content/assets/blogn_t/009-micro-label.png"       alt="A microscopic section of the printed model, including a vertical slice of a sector of the spool with the user's label; barely anything is visible; the text appears to be an 'i', but it consists of a total of 5+1 lone dark dots in a sea of yellow" /></a><!--
--><a href="/content/assets/blogn_t/009-micro-label+dimms.png"><img class="grid-by-each" src="/content/assets/blogn_t/009-micro-label+dimms.png" alt="Likewise, but a dimension drawn across most of the dots, being the ı part, of 150μm" /></a>
</center>

<center class="grid-by-each continued">
   <a href="/content/assets/blogn_t/009-micro-knob.png"       ><img class="grid-by-each" src="/content/assets/blogn_t/009-micro-knob.png"        alt="A microscopic section of the printed model, including the top half of the control panel, with most of the knob in frame" /></a><!--
--><a href="/content/assets/blogn_t/009-micro-knob+dimms.png" ><img class="grid-by-each" src="/content/assets/blogn_t/009-micro-knob+dimms.png"  alt="Likewise, but dimensions drawn atop – 375μm between the top of the control panel and the knob legend, 50μm for the legend, and 369μm for the black bit of the knob, for a total of 794μm" /></a>
   Resp. the manufacturer's label on the removable spool (200-micron x-height), the user's label (150-micron x-height), and the knob at the top control panel.
</center>

<p class="indented continued">
The manufacturer's label is just about sharp enough to read it with the naked eye  <!--'-->
(undoubtedly assisted by taking my glasses off, since comparative analysis against mother's fresh surgically-implanted zeroed lenses shows that she can't see shit).
Conversely, the 50-micron drop and black-on-white to beige-grey-on-beige contrast downgrade yields absolutely nothing, it's a wisp, and that's better.
</p>
<p class="indented continuation">
Given this analysis, we can make another observation, namely that the top resolution of this process ends up at appx. 50μm.
The nominal advertised resolution is 300-350DPI, which is 85-72.5μm, for a ⅔<sup>rds'</sup> bump of black-on-white resolution over advertised; pretty good.  <!--'-->
Additionally, we can observe on <a href="//www.copyshop.krakow.pl/produkt/kalkulator-naklejek/#tab-technology">my print shop's process listing</a>  <!--'-->
that they printed this on a Tn(xerox versant 180 press), which funi.
</p>

<p class="indented continued">
Anyway, glam shots.
</p>
<a href="//lfs.nabijaczleweli.xyz/0014-sigma-balls/glam/DSC_0803ccc.JPG"><img class="continuing main-screenshot" alt="A small black anodised aluminium laptop on a light wood floor in over-cast winter lighting. The outline of the sticker cuts sharply out of the back-ground, losing a large amount of dynamic range, but the text, which ends up roughly the same size as other stickers &a. on the back of the laptop, is equally as sharp. If you really try you can just about make out the microscopic text on the roll" src="//lfs.nabijaczleweli.xyz/0014-sigma-balls/glam/DSC_0803ccc.JPG" /></a>
<a href="//lfs.nabijaczleweli.xyz/0014-sigma-balls/glam/DSC_0792ccc.JPG"><img class="continuing main-screenshot" alt="Same laptop, but the image of the sky washes out the colours, highlighting the very slight ferric tint on the tape itself" src="//lfs.nabijaczleweli.xyz/0014-sigma-balls/glam/DSC_0792ccc.JPG" /></a>
<a href="//lfs.nabijaczleweli.xyz/0014-sigma-balls/glam/DSC_0807cc.JPG"><img class="continuing main-screenshot" alt="Likewise, but this time under incandescent lighting on a dark wood surface; it does show a bit more I think" src="//lfs.nabijaczleweli.xyz/0014-sigma-balls/glam/DSC_0807cc.JPG" /></a>
<a href="//lfs.nabijaczleweli.xyz/0014-sigma-balls/glam/DSC_0780cc.JPG"><img class="continuation main-screenshot" alt='Two SRA4 sheets with the XDS XEROX SIGMA 9 stickers, side-by-each so as to produce a single SRA3 one; the only difference between them is that the left half has "XEROX SIGMA 9 BALLS" written on it' src="//lfs.nabijaczleweli.xyz/0014-sigma-balls/glam/DSC_0780cc.JPG" /></a>

BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()