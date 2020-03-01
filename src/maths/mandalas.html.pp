<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../common.h"
#include "../heading.h"


<!-- RSS_PUB_DATE: "Tue, 13 Jun 2017 22:42:51 +0200" -->

#define MATHJAX(...) [​[​__VA_ARGS__​]​]

#define SCANS_CSS_LINK    <link href="/content/assets/scan.css" rel="stylesheet" />
#define COLUMN_LINKS      <link href="/kaschism/assets/column.css" rel="stylesheet" />                       \
                          <link href="../writing/Roboto-font.css" rel="stylesheet" />                        \
                          <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />
#define SCANS_SHOW_SCRIPT <script type="text/javascript" src="/content/assets/scans_show.js"></script>
#define MATHJAX_SCRIPT    <script type="text/javascript" \
                                  src="//rawcdn.githack.com/mathjax/MathJax/2.7.6/MathJax.js?config=/content/assets/MathJax-config.js"></script>
#define ZIPPING_SCRIPTS   <script type="text/javascript" src="//rawcdn.githack.com/Stuk/jszip/v3.1.3/dist/jszip.min.js"></script>          \
                          <script type="text/javascript" src="//rawcdn.githack.com/eligrey/FileSaver.js/1.3.3/FileSaver.min.js"></script>  \
                          <script type="text/javascript" src="/content/assets/pack_specified.js"></script>
BOILERPLATE(Mandalas, Tonči Juričev-Grginꞌs Mandalas, en-GB, SCANS_CSS_LINK COLUMN_LINKS SCANS_SHOW_SCRIPT MATHJAX_SCRIPT ZIPPING_SCRIPTS MAIN_HEADING_STYLE)

<style>
#include "../indent.css"
#include "../writing/the_taste_of_mi/spacing.css"
</style>


<span class="roboto">
MAIN_HEADING_ALT(2, ., Tonči Juričev-Grgin mandalas)

<p class="indented continued" id="intro">
The Tonči Juričev-Grgin mandala generation algorithm can be used to, <em>drumroll please</em>, generate mandalas like this one:
</p>
<a href="/content/assets/mandalas/900x900.png" target="_blank">
	<img src="/content/assets/mandalas/900x900.png" alt="Two-dimensional RGB mandala" class="bigimage zoomable" /></a>
<p class="indented continuation">
<small>Click for big version.</small>
</p>
<p class="indented continued">
It uses a very simple process (see <a href="#algorithm">below</a>), which can be used in any
MATHJAX(beta in NN ∖ {0})-dimensional space, so, as an example, the same-sized mandala,
but in one more dimension (also with classical music atop it because it'd be unbearably bloody boring otherwise):<!--'-->
</p>
<div class="indented continuation">
<iframe width="560" height="315" src="//youtube.com/embed/D2Xk6O9x-yk?list=PL3chI5PWwNA_c1nG57ittUq4op7ZmIveC" frameborder="0" allowfullscreen style="max-width: 100%;">
</iframe>
</div>

<p class="indented continued" id="render-time">
<strong>"How long does rendering a thing such as this take?"</strong>, one might ask.
	Two answers, the short one - too sodding long, the not-quite-as-short one is that due to the process' inherent randomness<!--'-->
  one need run the algorithm body many times, an acceptable amount I found was:
</p>
<p class="continuing">
	MATHJAX(log(n_max) = |~log(prod_i size_i)~| + 1),
</p>
<p class="continuation">
	(which still doesn't perfectly fill more complex corner setups), so for<!--'-->
	MATHJAX(size = [900, 900, 900] => n_max = 10^10),
	which takes about MATHJAX(7 1/2 h) on my PC if I try to not cook it (and I generally do).
</p>

<p class="indented continued" id="code">
A different question to be asked is
	<strong>"How does one</strong><!--"-->
	<span style="text-decoration: line-through;">laugh at the shitty code</span>
	<strong>play around with the code that generates these myself?"</strong>.<!--"-->
	Well, thanks to the wonders of the MATHJAX(fr "Internet"), you can! In most-to-least bad order:
</p>
<p class="indented continuing">
<a href="//github.com/nabijaczleweli/mandalas" target="_blank">Here</a>'s an early version in C++,<!--'-->
	featuring layers upon layers of terrible code from late-2015/early-2016. You probably don't want to try to build it, headaches afore.<!--'-->
</p>
<p class="indented continuing">
<a href="/content/assets/mandalas/mandalas-js/mandele.html">Here</a>'s the very first version, in JavaScript, <!--'-->
	used to demostrate as PoC to Tonči himself. You probably want to fuck around, if at all, in that version
	(<a href="javascript:pack_specified_fileset('/content/assets/mandalas/mandalas-js.json')">download as ZIP</a>).
</p>
<p class="indented continuation">
<a href="//github.com/nabijaczleweli/mandalas-rs" target="_blank">Here</a>'s a pretty-much release version in Rust,<!--'-->
	used to generate all here-featured examples. You probably want to use this if you want to generate your own mandalas or
	make things based on the algorithm. Will work and build pretty much anywhere.
</p>

<p class="indented continued" id="more">
<strong>"I don't care, I just wanna look at more cool shit!"</strong> — I got you covered on this front, too:
</p>
<p class="indented continuing">
<a href="//gist.github.com/nabijaczleweli/8c408e706c097850f5b7b4260035f45c" target="_blank">Here</a>'s<!--'-->
	just a lot of mandalas in various sizes, colours, and shapes. Make sure to be on Wi-Fi, because they get really,
	<em>really</em> big in a couple places.
</p>
<p class="indented continuing">
<a href="//youtu.be/D2Xk6O9x-yk&list=PL3chI5PWwNA_c1nG57ittUq4op7ZmIveC" target="_blank">Here</a>'s<!--'-->
	a playlist with some 3-dimensional mandalas and classical music atop.
</p>
<p class="indented continuation">
I'm out of things to put here, because I'm not a cool person <em>en general</em>.
	<small>(What else did you expect, I do maths for fun)</small>
</p>

<p class="indented" id="contact">
<strong>"I like/don't like this thing and/or would like to tell/contact you about it/something else."</strong>,
	then reach me over at anything listed <a href="/" target="_blank">here</a>. I don't have a life so I'll probably respond uncannily quickly.
</p>

<p class="indented" id="algorithm">
<strong>"But where's the <em>algorithm</em>?"</strong> – Here's the raw version: <!--'-->
</p>
<p class="indented">
MATHJAX(sf "Mandala Generation - Ton" hat(sf "c") sf "i Juri" hat(sf "c") sf "ev-Grgin")
</p>
<p class="continued">
MATHJAX(alpha in NN ∖ {0} - sf "colour space dimensionality (e.g. 3 for RGB, 4 for CMYK, 1 for LUMA)")
</p>
<p class="continuing">
MATHJAX(c nn (: 3, +oo ) - sf "amount of corners in c-gonal mandala base")
</p>
<p class="continuing">
MATHJAX(C - sf "set of point" - sf "corner points of c-gon mandala base")
</p>
<p class="continuation">
MATHJAX(bar C = c)
</p>

<p class="continued">
MATHJAX(n in NN nn (: alpha + 2; +oo ) - sf "current point number")
</p>
<p class="continuation">
MATHJAX(d = ra\nd((:0, c) nn NN) - sf "current chosen corner")
</p>

<p>
MATHJAX(P_n = (C_d + P_(n-1)) / 2 => a = |C_d P_(n-1)| and b = a/2 = |C_d P_n| = |P_(n-1) P_n|)
</p>

<p class="continued">
MATHJAX(e_m = |P_n P_(n-m)|)
</p>
<p class="continuation">
MATHJAX(E = so\rt(map(f(x) = e_x, NN nn (: 1; alpha + 1 :))))
</p>

<p class="continued">
MATHJAX(colour P_n = map(f(x) = E_x / E_alpha; E ∖ {E_alpha}))
</p>
<p class="continuing">
MATHJAX(or)
</p>
<p class="continuing">
MATHJAX(f = max E)
</p>
<p class="continuation">
MATHJAX(colour P_n = map(f(x) = x / f; E ∖ {f}) => bar(E ∖ {f}) = alpha)
</p>

<p>
(I'm not a real mathematician, so it's most likely not done properly.)
</p>

<p class="continued">
And <span id="show-scans">here</span>'s a scanned hand-drawn version with examples <!--'-->
	(warning: <em>very</em> big, expand at own risk)<span id="show-scans-punctuation">.</span>
</p>
<div id="scans" class="continuation hidden">
<p class="indented continuing">
<a href="/content/assets/mandalas/scan-page1.jpg" target="_blank">
	<img src="/content/assets/mandalas/scan-page1.jpg" alt="Page 1 of mandala generation algorithm, including hand-drawn step-by-step sketches" class="zoomable" /></a>
</p>
<p class="indented continuing">
<a href="/content/assets/mandalas/scan-page2.jpg" target="_blank">
	<img src="/content/assets/mandalas/scan-page2.jpg" alt="Page 2 of mandala generation algorithm, including hand-drawn step-by-step sketches" class="zoomable" /></a>
</p>
<p class="indented continuation">
<small>Click for big version.</small>
</p>
</div>

<p class="continued" id="colourspace">
<strong>On some of the more arbitrary colourspaces.</strong>
</p>
<p class="indented continuation">
Since the output image format (PNG) and the video format (H.264) only support RGB
	(<em>nota bene</em>: I am omitting a scheissload of detail and specificites I either do not know or that are not relevant
	<!-- (I mean, there's probably some gamut narrowing depending on the output colour range of your display device, but that is really not useful data) --> <!--'-->
	because <a href="//xkcd.com/1882" target="_blank">colours are hard</a>)
	a conversion is required when going from e.g. CMYK or YUV thereto.
	More often than not (which is to say, in all spaces but LUMA), that conversion is lossy, which means that "in <code class="roboto-unscale">colourspace</code>" is a lie,
	whereas the non-lie version is closer to "in an RGB approximation to <code class="roboto-unscale">colourspace</code>".
	However, most conversions were already set in stone well before I was born and are therefore widely accepted as accurate enough.
	Some, however, like ROYGBP or, <em>ahem</em>, RPPDIBLCTGLLYAODBGB, have been made up by yours truly upon the following basis:
</p>
<p class="continued">
MATHJAX(S - sf "set of 3-dimensional vectors" - sf "RGB samples of each colour in a space")
</p>
<p class="continuing">
MATHJAX(bar S = alpha)
</p>
<p class="continuation">
MATHJAX(colour P_n - sf "as above")
</p>
<p>
MATHJAX(AA c in {r,g,b} : C_(out_c) = (sum_(theta=1)^alpha colour P_(ntheta) S_(theta_c))/(sum_(theta=1)^alpha S_(theta_c)))
</p>
<p class="indented continued">
A full list of conversions and their implementations can be found at the
	<a href="//rawcdn.githack.com/nabijaczleweli/mandalas-rs/doc/mandalas/util/index.html" target="_blank">mandalas-rs API documentation</a>.
</p>

</span>


BOILERPLATE_END()
