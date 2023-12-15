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
#include "../fontawesome.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Thu, 08 Jul 2021 20:26:38 +0200" -->
#define POST_DATE      Thu, 08 Jul 2021 20:26:38 +0200
#define POST_POST_DATE ; <a href="//store.nabijaczleweli.xyz/001-UNIX-r-ATT.html">get one</a> <a href="//store.nabijaczleweli.xyz/001-UNIX-r-ATT.html">FA(external-link-alt)</a>

#undef unix


BOILERPLATE(006. ¹UNIX® is a registered trademark of AT&T. — blognꞌt, 006. ¹UNIX® is a registered trademark of AT&T., en-GB, BLOGN_T_STYLESHEETS FONTAWESOME_LINK WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

.main-screenshot {
	margin-top: 0.2em;
	margin-bottom: 0.15em;
	width: 100%;
}

.main-font {
	margin-top: 0.15em;
	margin-bottom: 0.15em;
	max-width: 100%;
}

@media all and (min-device-width: 400px) {
	.main-font {
		width: 100%;
	}
}

@media all and (min-device-width: 800px) {
	.main-font {
		margin-left: 1em;
		min-width: 75%;
	}
}
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(006. ¹UNIX® is a registered trademark of AT&T.)

<p class="indented">
It isn'<!--'-->t, of course – <span class="smallcaps">unix</span> belongs to the Open Group nowadays,
but it wouldn'<!--'-->t be unheard of to have a note like this on the first page of a document in the bad old days,
and the concept of unironically encountering this in the wild in year of the hog 2020 was too hilarious to pass up
as a terrible urge <a href="//lfs.nabijaczleweli.xyz/0017-twitter-export#1408975129707794434">came over</a> me.
</p>

<p class="indented continued">
Indeed, what better font to celebrate with than with something from the <span class="smallcaps">amix</span> distribution
(this will be a link when I finally publish those).
My first thought was, of course, <samp>sunfont.s</samp>:
</p>
<img class="continuing main-font dark-invert" alt="'UNIX is a registered trademark of AT&T.' in a tall, proportional, narrow-stroke font with typewriter-like typography and a really goofy ampersand." src="/content/assets/blogn_t/006.01-isunfont-tp.png" />
<p class="continuation">
but it'<!--'-->s way too thin, and lacks both <samp>®</samp> and <samp>¹</samp>.
The latter could be emulated, of course, but it'<!--'-->d render the already-hardly-legible digit unreadable and the width would just scream off
(and it's a difficult problem to solve in an obviously-correct mechanical fashion; I'm assembling these with ImageMagick in stitch mode on individual 4x glyphs).
</p>

<p class="indented continued">
The next obvious direxion to go (rather, the last font before I fell back to trying something with cursed groff invocations) was <samp>topaz.s</samp>:
</p>
<img class="continuing main-font dark-invert" alt="'UNIX is a registered trademark of AT&T.' in a square, thick-stroke 8x8 font, the g is kinda goofy" src="/content/assets/blogn_t/006.02-itopaz-tp.png" />
<p class="continuing">
or, rather,
</p>
<img class="continuing main-font dark-invert" alt="'¹UNIX® is a registered trademark of AT&T.' in that same font." src="/content/assets/blogn_t/006.03-itopaz-tp+r-sp.png" />
<p class="continuation">
Now, if that ain'<!--'-->t perfect.
</p>

<img class="main-screenshot" alt="Variations of UNIX is a registered trademark of AT&T printed in multiple orientations and fonts on an A4 sheet" src="/content/assets/blogn_t/006.04-preprints.jpg" />

<p class="indented continued">
The final dimensions are 3.5mm text + 3mm padding, based on 12dpmm,
as that worked out well for the native resolution and the 300-350dpi restrixion from my local print shop,
pictured here with 1px(=1pt) cut line and 3mm padding:
</p>
<!-- Firefox does not like (any/multilayer/CMYK) TIFFs; yes, it's a JPEG: no other browser format supports CMYK '-->
<img class="continuing main-font" alt="'¹UNIX® is a registered trademark of AT&T.' in that same font, white on black, surrounded by green, a single-pixel black line, and another layer of red" src="/content/assets/blogn_t/006.05-UNIX-tp+r-sp-120dpcm+3mm.jpg" />
<p class="continuation">
Properly-dimensioned print-ready CMYK TIFFs and measurements can be had <a href="//lfs.nabijaczleweli.xyz/0009-UNIX-r-ATT">here</a>. CC BY 4.0.
Works out to 9.5x149.5, which my shop tiled to 40 stickers to SRA3 sheet.
</p>

<p class="indented continued">
Anyway, glam shots.
</p>
<img class="continuing main-screenshot" alt="A small black anodised aluminium laptop on a light wood floor, a window very softly reflects on the chassis, which has a OneMix logo stickered over with a neon orange BONELESS sticker, and a ¹UNIX® is a registered trademark of AT&T. sticker in the bottom left, crooked, near the hinge" src="https://lfs.nabijaczleweli.xyz/0009-UNIX-r-ATT/glam/DSC_7479ccc.png" />
<img class="continuing main-screenshot" alt="Same laptop, but on a dark wood floor in direct hard summer sun. The edges of the sticker meld into the texture of the chassis in the highlight, and are lost in the shadow" src="https://lfs.nabijaczleweli.xyz/0009-UNIX-r-ATT/glam/DSC_7491ccc.png" />
<img class="continuation main-screenshot" alt="Two matt SRA3 sheets in the same spot, one on top of the other, at a slight angle, with ¹UNIX® is a registered trademark of AT&T. stickers tiled on them. The left is entirely opaque, but shows a tiny bit through the right." src="https://lfs.nabijaczleweli.xyz/0009-UNIX-r-ATT/glam/DSC_7497ccc.png" />

BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()
