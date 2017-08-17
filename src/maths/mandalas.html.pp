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


#define RSS_PUB_DATE Tue, 13 Jun 2017 22:42:51 +0200

#define MATHJAX(...) [​[​__VA_ARGS__​]​]

#define SCANS_CSS_LINK    <link href="/capitalism/assets/scan.css" rel="stylesheet" />
#define SCANS_SHOW_SCRIPT <script type="text/javascript" src="/capitalism/assets/scans_show.js"></script>
#define MATHJAX_SCRIPT    <script type="text/javascript" \
                                  src="//cdn.rawgit.com/mathjax/MathJax/master/MathJax.js?config=/capitalism/assets/MathJax-config.js"></script>
BOILERPLATE(Mandalas, Tonči Juričev-Grginꞌs Mandalas, en-GB, SCANS_CSS_LINK SCANS_SHOW_SCRIPT MATHJAX_SCRIPT)

<style>
#include "../indent.css"
</style>


<div>
<p class="indented">
The Tonči Juričev-Grgin mandala generation algorithm can be used to, <em>drumroll please</em>, generate mandalas like this one:
</p>
<a href="/capitalism/assets/mandalas/900x900.png" target="_blank">
	<img src="/capitalism/assets/mandalas/900x900.png" class="bigimage" /></a><br />
<small>Click for big version.</small>
<p class="indented">
It uses a very simple process (see <a href="#show-scans">below</a>), which can be used in any
MATHJAX(beta in NN ∖ {0})-dimensional space, so, as an example, the same-sized mandala,
but in one more dimension (also with classical music atop it because it'd be unbearably bloody boring otherwise):<!--'-->
</p>
&emsp;<iframe width="560" height="315" src="//youtube.com/embed/D2Xk6O9x-yk?list=PL3chI5PWwNA_c1nG57ittUq4op7ZmIveC" frameborder="0" allowfullscreen
              style="max-width: 100%;">
      </iframe>
<p></p>
</div>

<p>
<strong>"How long does rendering a thing such as this take?"</strong>, one might ask.
	Two answers, the short one - too sodding long, the not-quite-as-short one is that due to the process' inherent randomness<!--'-->
  one need run the algorithm body many times, an acceptable amount I found was:<br />
	MATHJAX(log(n_max) = |~log(prod_i size_i)~| + 1),<br />
	(which still doesn't perfectly fill more complex corner setups), so for<!--'-->
	MATHJAX(size = [900, 900, 900] => n_max = 10^10),
	which takes about MATHJAX(7 1/2 h) on my PC if I try to not cook it (and I generally do).
</p>

<p>
A different question to be asked is
	<strong>"How does one</strong><!--"-->
	<span style="text-decoration: line-through;">laugh at the shitty code</span>
	<strong>play around with the code that generates these myself?"</strong>.<!--"-->
	Well, thanks to the wonders of the MATHJAX(fr "Internet"), you can! In most-to-least bad order:<br />
&emsp;<a href="//github.com/nabijaczleweli/mandalas" target="_blank">Here</a>'s an early version in C++,<!--'-->
	featuring layers upon layers of terrible code from late-2015/early-2016. You probably don't want to try to build it, headaches afore.<!--'--><br />
&emsp;<a href="/capitalism/assets/mandalas/mandalas-js.zip" target="_blank">Here</a>'s the very first version, in JavaScript,<!--'-->
	used to demostrate as PoC to Tonči himself. You probably want to fuck around, if at all, in that version.<br />
&emsp;<a href="//github.com/nabijaczleweli/mandalas-rs" target="_blank">Here</a>'s a pretty-much release version in Rust,<!--'-->
	used to generate all here-featured examples. You probably want to use this if you want to generate your own mandalas or
	make things based on the algorithm. Will work and build pretty much anywhere.<br />
</p>

<p>
<strong>"I don't care, I just wanna look at more cool shit!"</strong> — I got you covered on this front, too:<br />
&emsp;<a href="//gist.github.com/nabijaczleweli/8c408e706c097850f5b7b4260035f45c" target="_blank">Here</a>'s<!--'-->
	just a lot of mandalas in various sizes, colours, and shapes. Make sure to be on Wi-Fi, because they get really,
	<em>really</em> big in a couple places.<br />
&emsp;<a href="//youtu.be/D2Xk6O9x-yk&list=PL3chI5PWwNA_c1nG57ittUq4op7ZmIveC" target="_blank">Here</a>'s<!--'-->
	a playlist with some 3-dimensional mandalas and classical music atop.<br />
&emsp;I'm out of things to put here, because I'm not a cool person <em>en general</em>.
	<small>(What else did you expect, I do maths for fun)</small><br />
</p>

<p>
<strong>"I like/don't like this thing and/or would like to tell/contact you about it/something else."</strong>,
	then reach me over at anything listed <a href="/" target="_blank">here</a>. I don't have a life so I'll probably respond uncannily quickly.
</p>

<div class="indented">
<p></p>
<strong>"But where's the <em>algorithm</em>?"</strong> – Here's the raw version:<br /> <!--'-->
<br />
<br />
&emsp;MATHJAX(sf "Mandala Generation - Ton" hat(sf "c") sf "i Juri" hat(sf "c") sf "ev-Grgin")<br />
<br />
MATHJAX(alpha in NN ∖ {0} - sf "colour space dimensionality (e.g. 3 for RGB, 4 for CMYK, 1 for LUMA)")<br />
MATHJAX(c nn (: 3, +oo ) - sf "amount of corners in c-gonal mandala base")<br />
MATHJAX(C - sf "set of point" - sf "corner points of c-gon mandala base")<br />
MATHJAX(bar C = c)<br />
<br />
MATHJAX(n in NN nn (: alpha + 2; +oo ) - sf "current point number")<br />
MATHJAX(d = ra\nd((:0, c) nn NN) - sf "current chosen corner")<br />
<br />
MATHJAX(P_n = (C_d + P_(n-1)) / 2 => a = |C_d P_(n-1)| and b = a/2 = |C_d P_n| = |P_(n-1) P_n|)<br />
<br />
MATHJAX(e_m = |P_n P_(n-m)|)<br />
MATHJAX(E = so\rt(map(f(x) = e_x, NN nn (: 1; alpha + 1 :))))<br />
<br />
MATHJAX(colour P_n = map(f(x) = E_x / E_alpha; E ∖ {E_alpha}))<br />
MATHJAX(or)<br />
MATHJAX(f = max E)<br />
MATHJAX(colour P_n = map(f(x) = x / f; E ∖ {f}) => bar(E ∖ {f}) = alpha)<br />
<br />
<br />
(I'm not a real mathematician, so it's most likely not done properly.)<br />
<br />
And <span id="show-scans">here</span>'s a scanned handdrawn version with examples (warning, <em>very</em> big, expand at own risk): <!--'-->
<p></p>
<div id="scans" class="hidden">
&emsp;<a href="/capitalism/assets/mandalas/scan-page1.png" target="_blank"><img src="/capitalism/assets/mandalas/scan-page1.png" class="scan" /></a><br />
&emsp;<a href="/capitalism/assets/mandalas/scan-page2.png" target="_blank"><img src="/capitalism/assets/mandalas/scan-page2.png" class="scan" /></a><br />
&emsp;<small>Click for big version.</small>
</div>
</div>


BOILERPLATE_END()
