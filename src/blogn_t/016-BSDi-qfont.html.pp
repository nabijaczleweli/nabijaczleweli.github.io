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


   <!-- RSS_PUB_DATE: "Sat, 05 Oct 2024 21:56:06 +0200" -->
#define POST_DATE      Sat, 05 Oct 2024 21:56:06 +0200
#define POST_POST_DATE ; <a href="//lfs.nabijaczleweli.xyz/0023-BSDi-fonts/">go wild</a> <a href="//lfs.nabijaczleweli.xyz/0023-BSDi-fonts/">FA(external-link-alt)</a>


#define STYLESHEETS BLOGN_T_STYLESHEETS FONTAWESOME_LINK FORCED_NEWLINE \
                    <link href="/content/assets/blogn_t/008.01-amix-fonts.css" rel="stylesheet" /> FORCED_NEWLINE \
                    <link href="/content/assets/blogn_t/016.01-BSDi-fonts.css" rel="stylesheet" />

BOILERPLATE(016. BSDi qfont — blognꞌt, 016. BSDi qfont, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

/* Measured against merriweather in the heading. */
.qfont {
	font-family: qfont;
	font-size: 1.06349206349206em; /* 67/63 */
}

/* For 008 */
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


BLOGN_T_HEADING(016. <span class="qfont">BSDi qfont</span>)

<p class="indented">
This in many ways mirrors <a href="008-amix-fonts"><samp>008. <span class="topaz">AMIX</span> <span class="sunfont">fonts</span></samp></a>,
sans la fonte du jour est qfont, which has been waiting for a similar length of time (since 2021-07) to get processed thusly.
</p>

<center>
<a href="/content/assets/blogn_t/016.02-best.png"><img class="continuing" alt="Terminal screenshot with qfont's all 177 glyphs displayed alongside the Unicode characters they represent in 2 columns" src="/content/assets/blogn_t/016.02-best.png" /></a>
<p class="continuation">
The greatest hits:
an overgrown <samp>@</samp>,
asymmetric <samp>/\</samp>,
an offensive <samp>&</samp> that'<!--'-->s clearly just an 8 with a moustache,
but an <samp>8</samp> that'<!--'-->s nearing double-width,
and a heavy set of punctuation (the first one is a <samp>`</samp>, the second an <samp>'<!--'--></samp>).
</p>

<a href="/content/assets/blogn_t/016.03-allchars-freetype.png"><img class="continuing" alt="Terminal screenshot with qfont's all 177 glyphs displayed alongside the Unicode characters they represent in 2 columns" src="/content/assets/blogn_t/016.03-allchars-freetype.png" /></a>
<p class="continuation">
Full demo, as rendered by libfreetype 2.12.1+dfsg-5+deb12u3/libfontconfig 2.14.1-4.
</p>

<a href="/content/assets/blogn_t/016.04-winword.png"><img class="continued dark-invert" alt="Microsoft Word screenshot with lowercase vowels and uppercase consonants" src="/content/assets/blogn_t/016.04-winword.png" /></a>
<p class="continuation">
As rendered by <tt>WINWORD.EXE</tt>.
</p>

<a href="/content/assets/blogn_t/016.05-photoshop.png"><img class="continued" alt='Block of all characters in qfont, surrounded in an ellipse by /*	BSDI $Id: qfont.c,v 1.2 1994/02/06 20:14:06 karels Exp $	*/    derived from:  "@(#)qfont.c	6.2	ULTRIX	2/4/88"' src="/content/assets/blogn_t/016.05-photoshop.png" /></a>
<p class="continuation">
As rendered by Photoshop CS6 (AA disabled).
</p>

<p class="qfont continued" style="font-size: 3em; overflow-wrap: anywhere;">
&nbsp;!"#$%&'()*+,-./0123456789:;<=>?<br /> <!--"-->
@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_<br />
`abcdefghijklmnopqrstuvwxyz{|}~&nbsp;<br />
¡¢£⸮¥§¤©ª«°±²³µ¶·¹º»¼½¿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÑÒÓÔÕÖŒØÙÚÛÜÝß&nbsp;&nbsp;<br />
àáâãäåæçèéêëìíîïñòóôõöœøùúûüý&nbsp;&nbsp;&nbsp;
</p>
<p class="continuation">
As rendered by your browser, hopefully.
</p>
</center>

<p class="indented continued">
The procedure can be found <a href="//git.sr.ht/~nabijaczleweli/bsdi.fonts">here</a>,
and is adapted trivially from the <a href="//git.sr.ht/~nabijaczleweli/amix.fonts"><span class="sunfont">AMIX</span> <span class="topaz">one</span></a>.
</p>
<p class="indented continuing">
Indeed, much more trivially because <a href="//git.sr.ht/~nabijaczleweli/bsdi.fonts/tree/trunk/item/BSDI-1.1-qfont.c">the font is in C</a>, so you can just link to it.
This C file bears four kilobytes of licence headers (even though bitmap fonts are not subject to copyright protection),
and it turns out to be retained in NetBSD as
<a href="http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/qbus/qfont.c?rev=1.8&content-type=text/x-cvsweb-markup"><tt>src/sys/dev/qbus/qfont.c</tt></a>
(but stamped BSD-3-Clause).
</p>
<p class="indented continuation">
qfont covers 7-bit <span class="smallcaps">ascii</span> and most of ISO-8859-1 (with some substitutions).
Like previously, it'<!--'-->s an art font unsuitable for general use.
</p>

<p class="indented continued">
The distribution contains:
</p>
<center>
<a href="//lfs.nabijaczleweli.xyz/0023-BSDi-fonts/qfont-montage.png"><img class="continuing" src="//lfs.nabijaczleweli.xyz/0023-BSDi-fonts/qfont-montage.png"></a>
<p class="continuation">
qfont, a 177-character monospace 8x15px font, with baseline at 12px.
(<a href="//lfs.nabijaczleweli.xyz/0023-BSDi-fonts/qfont-montage.svg">SVG</a>)
</p>
</center>

<p class="continued">
The font includes:
</p>
<ul class="continuation">
<li>Bitmap strikes at integer increments of [1, 16]x their original size, embedded in their respective OTFs.</li>
<li>BDFs of all of the above are also exported, if of dubious usefulness.</li>
<li>The original FontForge <tt>.sfd</tt> files are also included, for export to other formats.</li>
<li>Images of the bitmap strikes at all sizes (in PBM P1 format, understood globally by all tooling).</li>
<li>A montage of all the characters in the fonts (from 4x scale), and an SVG tracing thereof.</li>
<li>FontForge demo PDFs.</li>
</ul>

<p>
Go wild: <a href="//lfs.nabijaczleweli.xyz/0023-BSDi-fonts/">https://lfs.nabijaczleweli.xyz/0023-BSDi-fonts/</a>.
Built on bookworm.
</p>


BLOGN_T_FOOTER()
WORD_COUNTER_END()
BOILERPLATE_END()
