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
#include "../fontawesome.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Thu, 17 Nov 2022 22:36:33 +0100" -->
#define POST_DATE      Thu, 17 Nov 2022 22:36:33 +0100
#define POST_POST_DATE ; <a href="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/">go wild</a> <a href="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/">FA(external-link-alt)</a>


#define STYLESHEETS BLOGN_T_STYLESHEETS FONTAWESOME_LINK <link href="/content/assets/blogn_t/008.01-amix-fonts.css" rel="stylesheet" />

BOILERPLATE(008. AMIX fonts — blognꞌt, 008. AMIX fonts, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

/* Measured against merriweather in the heading. */
.sunfont {
	font-family: sunfont;
	font-size: 1.25em; /* 60/48 */
}

.topaz {
	font-family: topaz;
	font-size: 0.80em; /* 55/69 */
}

img {
	max-width: 100%;
}
</style>


BLOGN_T_HEADING(008. <span class="topaz">AMIX</span> <span class="sunfont">fonts</span>)

<p class="indented continued">
Have been
<a href="//lfs.nabijaczleweli.xyz/0017-twitter-export#1297339377786511360">featured</a>
<a href="//lfs.nabijaczleweli.xyz/0017-twitter-export#1590177344467390465">before</a>,
even
<a href="006-UNIX-r-ATT.html">on this blog</a>,
but never in such style:
</p>
<center>
<a href="/content/assets/blogn_t/008.02-sunfont-allchars-freetype.png"><img class="continuing" alt="Terminal screenshot with sunfont's all 96 glyphs displayed alongside the Unicode characters they represent in 2 columns" src="/content/assets/blogn_t/008.02-sunfont-allchars-freetype.png" /></a>
<a href="/content/assets/blogn_t/008.03-topaz-allchars-freetype.png"><img class="continuing" alt="Terminal screenshot with topaz's all 224 glyphs displayed alongside the Unicode characters they represent in 2 columns" src="/content/assets/blogn_t/008.03-topaz-allchars-freetype.png" /></a>
<p class="continuation">
As rendered by libfreetype 2.10.4+dfsg-1+deb11u1/libfontconfig 2.13.1-4.2.
</p>

<a href="/content/assets/blogn_t/008.04-winword.png"><img class="continued dark-invert" alt="Microsoft Word screenshot with lowercase vowels and uppercase consonants in both fonts" src="/content/assets/blogn_t/008.04-winword.png" /></a>
<p class="continuation">
As rendered by <tt>WINWORD.EXE</tt> (yes, they're kinda goopy here; needs a skilled operator probably).  <!--'-->
</p>

<a href="/content/assets/blogn_t/008.05-photoshop.png"><img class="continued" alt="Blocks of all characters in topaz and sunfont, surrounded in an ellipse by /* THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF */ in topaz /* UNIX System Laboratories, Inc. */ in sunfont" src="/content/assets/blogn_t/008.05-photoshop.png" /></a>
<p class="continuation">
As rendered by Photoshop CS6
(AA disabled; the lines/checker-board from SYMBOLS FOR LEGACY COMPUTING got turned into flat squares, presumably because they post-date this product).
</p>

<p class="sunfont continued" style="font-size: 3em; overflow-wrap: anywhere;">
&nbsp;!"#$%&'()*+,-./0123456789:;<=>?<br /> <!--"-->
@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_<br />
`abcdefghijklmnopqrstuvwxyz{|}~▁<br />
</p>
<p class="topaz continued" style="font-size: 1.5em; overflow-wrap: anywhere;">
&nbsp;!"#$%&'()*+,-./0123456789:;<=>?<br /> <!--"-->
@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_<br />
`abcdefghijklmnopqrstuvwxyz{|}~🮕<br />
▯¡¢£¤¥¦§¨©ª«¬―®¯˚±²³´µ¶·¸¹º»¼½¾¿<br />
ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß<br />
àáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ<br />
◆■␉␌␍␊°∓␤␋┘┐┌└┼▔🭷🭸🭺▁├┤┴┬│≤≥ ≠₤⋅▒
</p>
<p class="continuation">
As rendered by your browser, hopefully.
</p>
</center>

<p class="indented continued">
The procedure can be found <a href="//git.sr.ht/~nabijaczleweli/amix.fonts">here</a>,
and is pretty much the same as I used in <a href="//git.sr.ht/~nabijaczleweli/amix.x">2020</a>,
and generally uninteresting, except that it uses a <a href="//git.sr.ht/~nabijaczleweli/amix.fonts/tree/trunk/item/02imagise.blk">novel</a> (instead of awful) approach to integer-scaling the images, so if you disagree with my design/assignment decisions, you can trivially re-generate them.
</p>
<p class="indented continuation">
Not that I expect those to matter much, given that these fonts suck shit for normal use.
sunfont only covers 7-bit <span class="smallcaps">ascii</span>; topaz mostly covers the Latin-1 Supplement
+ box-drawing and <a href="//git.sr.ht/~nabijaczleweli/amix.fonts/tree/trunk/item/07strike.map-topaz">some dupes</a>,
which sounds great except that means no slavic languages, no greek, no…
It's fun, the ducky <span class="topaz">g</span> is cute, it's an art font, it's unsuitable for general use.  <!--'-->
</p>

<p class="indented continued">
This distribution is made possible by potrace being configurable to not attempt to fix the paths,
and generate 1:1 traces, including hard corners.
It is additionally made easier by the image formats involved being entirely text, which makes hard-integer-scaling them trivial.
</p>
<p class="indented continuing">
The distribution contains:
</p>
<center>
<a href="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/sunfont-montage.png"><img class="continuing" src="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/sunfont-montage.png"></a>
<p class="continuation">
sunfont, a 96-character monospace 25x12px font, with baseline at 20px.
(<a href="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/sunfont-montage.svg">SVG</a>)
</p>

<a href="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/topaz-montage.png"><img class="continued" src="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/topaz-montage.png"></a>
<p class="continuation">
sunfont, a 224-character monospace 8x8px font, with baseline at 7px.
(<a href="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/topaz-montage.svg">SVG</a>)
</p>
</center>

<p class="continued">
Both fonts include:
</p>
<ul class="continuation">
<li>Bitmap strikes at integer increments of [1, 16]x their original size, embedded in their respective OTFs.</li>
<li>BDFs of all of the above are also exported, if of dubious usefulness.</li>
<li>The original FontForge <tt>.sfd</tt> files are also included, for export to other formats.</li>
<li>Images of the bitmap strikes at all sizes (in PBM P1 format, understood globally by all tooling).</li>
<li>A montage of all the characters in the fonts (from 4x scale), and an SVG tracing thereof.</li>
<li>FontForge demo PDFs.</li>
</ul>

<p class="indented">
It is worth-while to note that the <a class="topaz" style="color: white; background: black; text-decoration: none; padding: 1.5mm;" href="006-UNIX-r-ATT.html">¹UNIX® is a registered trademark of AT&T.</a>
stickers consist of pasted-together PNGs from <a href="//git.sr.ht/~nabijaczleweli/amix.x">the first iteration</a> of this extraction,
and this technique is both sufficient and superiour, if you don't need to drag these along a path in Photoshop.  <!--'-->
</p>

<p class="indented continued">
Go wild: <a href="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/">https://lfs.nabijaczleweli.xyz/0013-AMIX-fonts/</a>.
</p>
<p class="continuation">
For the purposes of traceability, these were generated with bullseye programs, with the exception of patched FontForge,
see the <a href="//lfs.nabijaczleweli.xyz/0013-AMIX-fonts/amix.fonts.fulldump/typescript">generation transcript</a>.
</p>


BLOGN_T_FOOTER()
WORD_COUNTER_END()
BOILERPLATE_END()
