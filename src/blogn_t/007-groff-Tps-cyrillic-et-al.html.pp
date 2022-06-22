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


   <!-- RSS_PUB_DATE: "Sat, 28 Aug 2021 18:36:44 +0200" -->
#define POST_DATE      Sat, 28 Aug 2021 18:36:44 +0200
#define POST_POST_DATE , updated Thu, 02 Sep 2021 20:41:02 +0200 and Wed, 22 Jun 2022 18:33:54 +0200


#define STYLESHEETS BLOGN_T_STYLESHEETS                                                      FORCED_NEWLINE \
                    <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" />

BOILERPLATE(007. Cleanly enabling Cyrillic and broad Unicode output in groff -Tps — blognꞌt, 007. Cleanly enabling Cyrillic and broad Unicode output in groff -Tps, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

.fragment {
	max-width: 100%;
}

.main-font {
	margin-top: 0.15em;
	margin-bottom: 0.15em;
	max-width: 100%;
}

ol.wide-explanation {
	padding-left: 1em;  /* matches .indented  */
}

ol.wide-explanation > li {
	margin-bottom: 0.9em;
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
BLOGN_T_HEADING(<code>007. Cleanly enabling Cyrillic and broad Unicode output in groff -Tps</code>)

<!-- With manual corrections and welding the separately-highlit AWK bits:
for f in {C,T}{R,B,I,BI}; do
	in="$(awk '$1 == "internalname" {print $2; exit}' "/usr/share/groff/current/font/devps/$f")";
	echo $f: $in;
	src="$(awk -v cur="/$in" '   #"
		$1 ~ /^\// && $2 ~ /^[\/\(]/ {
			if($2 ~ /^\//)
				aliases[$1] = $2;
			else
				paths[$1] = $2;
		}
		END {
			while(cur in aliases)
				cur = aliases[cur];
			if(cur in paths) {
				sub(/^\(/, "", paths[cur]);
				sub(/(pfb)?\)$/, "", paths[cur]);
				print paths[cur]
			} else {
				print "last: " cur > "/dev/stderr";
				exit 1
			}
		}' /var/lib/ghostscript/fonts/Fontmap)";  #'
	echo "${src}afm; $(expr "$f" : C > /dev/null && echo -nk)"
	afmtodit $([ "${f#C}" = "$f" ] || echo -nk) -cmi0 \
		-d /usr/share/groff/current/font/devps/DESC \
		-e /usr/share/groff/current/font/devps/text.enc \
		"${src}afm" /usr/share/groff/current/font/devps/generate/textmap "$f";
done
-->
<div class="bigcode continued">
<pre class="language-shell-session"><code class="language-shell-session"><span class="token command"><span class="token shell-symbol important">$</span> <span class="token bash language-bash"><span class="token function">mkdir</span> devps</span><span class="token punctuation">;</span> <span class="token bash language-bash"><span class="token keyword">cd</span> devps</span></span>
<span class="token command"><span class="token shell-symbol important">$</span> <span class="token bash language-bash"><span class="token keyword">for</span> <span class="token for-or-select variable">f</span> <span class="token keyword">in</span> <span class="token punctuation">{</span>C,T<span class="token punctuation">}</span><span class="token punctuation">{</span>R,B,I,BI<span class="token punctuation">}</span><span class="token punctuation">;</span> <span class="token keyword">do</span></span></span>
<span class="token info punctuation">  TAB_INDENTin="</span><span class="token command"><span class="token shell-symbol important">$</span><span class="token bash language-bash"><span class="token punctuation">(</span>awk <span class="token string">'</span><span class="language-awk">$1 == <span class="token string">"internalname"</span> {<span class="token builtin">print</span> $2; <span class="token keyword">exit</span>}</span><span class="token string">'</span> <span class="token string">"/usr/share/groff/current/font/devps/<span class="token variable">$f</span>"</span><span class="token punctuation">)</span><span class="token info punctuation">"</span><span class="token punctuation">;</span></span></span>
  TAB_INDENT<span class="token builtin class-name">echo</span> <span class="token command"><span class="token shell-symbol important">$</span><span class="token bash language-bash">f: <span class="token shell-symbol important">$</span>in<span class="token punctuation">;</span></span></span>
<span class="token info punctuation">  TAB_INDENTsrc="</span><span class="token command"><span class="token shell-symbol important">$</span><span class="token bash language-bash"><span class="token punctuation">(</span>awk -v <span class="token assign-left variable">cur</span><span class="token operator">=</span><span class="token string">"/<span class="token variable">$in</span>"</span> <span class="token string">'</span>  <!--"-->
<span class="language-awk">  TAB_INDENTTAB_INDENT$1 ~ <span class="token regex">/^\//</span> &amp;&amp; $2 ~ <span class="token regex">/^[\/\(]/</span> {
  TAB_INDENTTAB_INDENTTAB_INDENT<span class="token keyword">if</span>($2 ~ <span class="token regex">/^\//</span>)
  TAB_INDENTTAB_INDENTTAB_INDENTTAB_INDENTaliases[$1] = $2;
  TAB_INDENTTAB_INDENTTAB_INDENT<span class="token keyword">else</span>
  TAB_INDENTTAB_INDENTTAB_INDENTTAB_INDENTpaths[$1] = $2;
  TAB_INDENTTAB_INDENT}
  TAB_INDENTTAB_INDENT<span class="token keyword">END</span> {
  TAB_INDENTTAB_INDENTTAB_INDENT<span class="token keyword">while</span>(cur <span class="token keyword">in</span> aliases)
  TAB_INDENTTAB_INDENTTAB_INDENTTAB_INDENTcur = aliases[cur];
  TAB_INDENTTAB_INDENTTAB_INDENT<span class="token keyword">if</span>(cur <span class="token keyword">in</span> paths) {
  TAB_INDENTTAB_INDENTTAB_INDENTTAB_INDENT<span class="token builtin">sub</span>(<span class="token regex">/^\(/</span>, <span class="token string">""</span>, paths[cur]);
  TAB_INDENTTAB_INDENTTAB_INDENTTAB_INDENT<span class="token builtin">sub</span>(<span class="token regex">/(pfb)?\)$/</span>, <span class="token string">""</span>, paths[cur]);
  TAB_INDENTTAB_INDENTTAB_INDENTTAB_INDENT<span class="token builtin">print</span> paths[cur]
  TAB_INDENTTAB_INDENTTAB_INDENT} <span class="token keyword">else</span> {
  TAB_INDENTTAB_INDENTTAB_INDENTTAB_INDENT<span class="token builtin">print</span> <span class="token string">"last: "</span> cur > <span class="token string">"/dev/stderr"</span>;
  TAB_INDENTTAB_INDENTTAB_INDENTTAB_INDENT<span class="token keyword">exit</span> 1
  TAB_INDENTTAB_INDENTTAB_INDENT}
  TAB_INDENTTAB_INDENT}</span><span class="token string">'</span> /var/lib/ghostscript/fonts/Fontmap<span class="token punctuation">)</span><span class="token info punctuation">"</span><span class="token punctuation">;</span></span></span>  <!--'-->
  TAB_INDENT<span class="token builtin class-name">echo</span> <span class="token command"><span class="token shell-symbol important">$</span><span class="token bash language-bash"><span class="token punctuation">{</span>src<span class="token punctuation">}</span>afm<span class="token punctuation">;</span></span></span>
  TAB_INDENTafmtodit <span class="token command"><span class="token shell-symbol important">$</span><span class="token bash language-bash"><span class="token punctuation">(</span><span class="token keyword">[</span> <span class="token string">"<span class="token variable">${f#C}</span>"</span> = <span class="token string">"<span class="token variable">$f</span>"</span> <span class="token keyword">]</span> <span class="token operator">||</span> <span class="token builtin class-name">echo</span> -kn<span class="token punctuation">)</span> -cmi<span class="token number">0</span> \FORCED_NEWLINE
  TAB_INDENTTAB_INDENT-d /usr/share/groff/current/font/devps/DESC \FORCED_NEWLINE
  TAB_INDENTTAB_INDENT-e /usr/share/groff/current/font/devps/text.enc \FORCED_NEWLINE
  TAB_INDENTTAB_INDENT<span class="token string">"<span class="token variable">${src}</span>afm"</span> /usr/share/groff/current/font/devps/generate/textmap <span class="token string">"<span class="token variable">$f</span>"</span><span class="token punctuation">;</span></span></span>
  <span class="token keyword">done</span>
CR: Courier
/usr/share/fonts/type1/gsfonts/n022003l.afm
CB: Courier-Bold
/usr/share/fonts/type1/gsfonts/n022004l.afm
CI: Courier-Oblique
/usr/share/fonts/type1/gsfonts/n022023l.afm
CBI: Courier-BoldOblique
/usr/share/fonts/type1/gsfonts/n022024l.afm
TR: Times-Roman
/usr/share/fonts/type1/gsfonts/n021003l.afm
TB: Times-Bold
/usr/share/fonts/type1/gsfonts/n021004l.afm
TI: Times-Italic
/usr/share/fonts/type1/gsfonts/n021023l.afm
TBI: Times-BoldItalic
/usr/share/fonts/type1/gsfonts/n021024l.afm

</span><span class="token command"><span class="token shell-symbol important">#</span> <span class="token bash language-bash"><span class="token function">ln</span> -s /usr/local/share/groff/site-font /usr/share/groff</span></span>
<span class="token command"><span class="token shell-symbol important">#</span> <span class="token bash language-bash"><span class="token function">mkdir</span> -p /usr/local/share/groff/site-font</span></span>
<span class="token command"><span class="token shell-symbol important">#</span> <span class="token bash language-bash"><span class="token function">cp</span> -r ../devps /usr/local/share/groff/site-font</span></span>
</pre></code>
</div>
<p class="indented continuing">
That's it. Same exact fonts as groff was already using, but with the appropriate metrics;  <!--'-->
on Debian — where all of these are Nimbus variants — this includes Cyrillic and the extended Latin planes, among others,
because unlike <code>Times</code>, Nimbus is an actual font.
<a href="/content/assets/blogn_t/007.01-result.pdf">Render</a> with <code>groff -Kutf8 …</code>:
</p>
<!-- gs -d{Text,Graphics}AlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pngmono -r600  -sOutputFile=976.png  ~/PDF/job_976-stdin___jaczleweli_PDF.pdf -->
<a href="/content/assets/blogn_t/007.01-result.png"><img class="continuation main-font" alt="Example manual page with Cyrillic and Polish characters" src="/content/assets/blogn_t/007.01-result.png" /></a>
<p class="indented">
Versions of this document prior to
Wed, 22 Jun 2022 18:33:54 +0200
didn't specify  <!--'-->
<kbd>-k</kbd>
to remove kerning on fixed-width fonts,
which <a href="//twitter.com/nabijaczleweli/status/1539638664548044800">broke</a> alignment in space-delimited tables.
We apologise for the error.
</p>


HEADING_S(2, prior-art, class="continued", Prior art)
<p class="indented continuing">
We've all been there, writing a manual that needs example text wider than US-ASCII, or to accredit a Russian.  <!--'-->
groff provides <samp>ć</samp> as <kbd>\['c]</kbd> and <samp>ł</samp> as <kbd>\[/l]</kbd>, gracefully noting that the latter is Polish, and that's about it.
It, of course, is rather tempting to, then, "just write something", as it is, after all, anno domini twenty twenty.
This yields:
</p>
<div class="bigcode continuing">
#include "blogn_t/007.02-original.shell-session.html"
</div>
<p class="continuing">
<a href="/content/assets/blogn_t/007.02-original.pdf">And</a>:
</p>
<a href="/content/assets/blogn_t/007.02-original.png"><img class="continuation main-font" alt="Same page, but non-ASCII characters are replaced with garbage, usually variant on the 'Å'" src="/content/assets/blogn_t/007.02-original.png" /></a>

<p class="indented continued">
A great time!
The Arch Wiki says that to <a href="//wiki.archlinux.org/title/Groff#Correctly_display_Polish_diacritics">"Correctly display Polish diacritics"</a>,
you can <code>groff -Kutf8 -Tdvi -mec -ms test.ms > test.dvi</code>, so:
</p>
<div class="bigcode continuing">
#include "blogn_t/007.03-Kutf8.shell-session.html"
</div>
<p class="continuing">
<a href="/content/assets/blogn_t/007.03-Kutf8.pdf">And</a>:
</p>
<a href="/content/assets/blogn_t/007.03-Kutf8.png"><img class="continuation main-font" alt="Same page, the ellipsis is rendered, but non-ASCII characters apart from ŁĆ are entirely missing" src="/content/assets/blogn_t/007.03-Kutf8.png" /></a>

<p class="indented">
This is, arguably, not better – <kbd>ł</kbd>, <kbd>ć</kbd>, and the ellipsis have appeared, but everything else <em>dis</em>appeared.
It's unclear why exactly those three, considering the ellipsis can't be reached by a classic <samp>groff_char(7)</samp> escape,
and all three become <code>\[uXXXX]</code>-style escapes after passing through preconv.
</p>

<p class="indented continued">
The same Arch Wiki article says that as part of "Adding support for cyrillic fonts",
you can preprocess with <code>iconv -f utf-8 -t koi8-r</code>.
<!-- ftp://ftp.kapella.gpi.ru/pub/cyrillic/psfonts -->
This is preceded by downloading an unspecified font pack out of about 8 from a Russian FTP,
aided by the READMEs therein also being in KOI8-R (i.e. '<samp>�</samp>' in UTF-8),
and mangling the Ghostscript font map into pointing at that font for <samp>Times-Roman</samp>.
</p>
<p class="indented continuation">
It's impossible to tell how the author expects literally any other Times variant (<samp>TI</samp>, <samp>TB</samp>, <samp>TBI</samp>),  <!--'-->
or any of the four fixed-width fonts, to render Cyrillic.
And it ignores the obvious point that it <em>replaces the font</em>, which means the pages <em>will</em> look different.
</p>

<p class="indented continued">
It's only reasonable to expect the Russosphere to have some sort of answer to this, and,   <!--'-->
indeed, <a href="//linuxtravel.blogspot.com/2015/03/cygwin-groff-cyrillic-russian-fonts.html">a 2015 post</a> has a workable solution;
it rambles and arrives at its point round-aboutly, converting to <em>and</em> from KOI8-R, as well as requiring a <code>ru.tmac</code> package
(not included, but can be found on the groff mailing list, as can a plethora of other hacks of varying insanity) which isn't required at all; however:  <!--'-->
</p>
<blockquote class="continuing">
More formally, <b>groff</b> does not have metrics for russian fonts. But I do have! I have metrics for Times fonts and I need to put them into /usr/share/groff/current/font/devps, replacing already existing. My metrics are in <u>devps.tar</u> attach.
</blockquote>
<p class="continuing">
Indeed! <code>devps.tar</code> contains a perfectly serviceable set of <code>usr/share/groff/current/font/devps/T{R,B,I,BI}</code> metrics:
</p>
<div class="bigcode continuing">
#include "blogn_t/007.04-linuxtravels.shell-session.html"
</div>
<p class="continuing">
<a href="/content/assets/blogn_t/007.04-linuxtravels.pdf">Rendering to</a>:
</p>
<a href="/content/assets/blogn_t/007.04-linuxtravels.png"><img class="continuation main-font" alt="Same page, proportional non-ASCII characters rendered, monospace ones missing" src="/content/assets/blogn_t/007.04-linuxtravels.png" /></a>

<p class="indented">
A cursory inspection of the metric reveals that they're for <code>internalname NimbusRomNo9L-Regu</code> and friends,  <!--'-->
generated Thu Aug  2 13:14:49 2007, as was the Nimbus in Buster;
a cursory correlation with the provided <code>Fontmap</code> reveals that the mappings are as today.
But it's still undistributable, still missing the Courier variants, and, regardless, still quite different from a metric generated with up-to-date groff.  <!--'-->
</p>

HEADING_S(2, current-art, class="continued", Current art)
<p class="continuing">
This is the bit where I vaguely explain how that big hunk at the top generates the unsolvable:
</p>
<ol class="wide-explanation continuation">
	<li><code>/usr/share/groff/current/font/devps/DESC</code> says that there's the usual four styles  <!--'-->
	    (<code>R</code>, <code>B</code>, <code>I</code>, and <code>BI</code>),
	    and that the default family is <code>T</code>; there's no point in getting cute and parsing this.</li>  <!--'-->
	<li>groff font metrics have an <code>internalname</code> directive, corresponding to the PostScript font requested
	    (for <code>TI</code> it's <code>Times-Italic</code>, for <code>CI</code> it's <code>Courier-Oblique</code>, &amp;c.).</li>
	<li>The Ghostscript font map (<code>/var/lib/ghostscript/fonts/Fontmap</code> from <code>/etc/ghostscript/fontmap.d/‌*</code> by <code>update-gsfontmap</code>)
	    is used to override font paths and alias fonts to others (well, it's arbitrary Ghostscript code that happens to match font names,  <!--'-->
	    but doing anything besides name/alias/path mapping has thankfully <a href="//wiki.debian.org/gs-undefoma#line-254">died down</a> as a practice),
	    with the interesting mappings being in the format:
			<div class="bigcode continuing">
#include "blogn_t/007.05-Fontmap.plaintext.html"
	    </div>
	    This can be trivially walked by first exhausting all name/name mappings, then resolving the final name/path mapping.</li>
	<li>For each font in <code>/usr/share/fonts/type1/gsfonts/</code>, there are three files:
	    <div class="bigcode continuing">
#include "blogn_t/007.06-u-s-f-t1-gsfonts.shell-session.html"
	    </div>
	    The second is the actual font, the other two are metrics.</li>
	<li>These metrics must be converted to groff's internal format,  <!--'-->
	    the flags gracefully provided by <code>/usr/share/groff/current/font/devps/generate/Makefile</code>;
	    <code>-n</code>, disabling <code>ligature</code> output, only applies to monospace fonts, because ligaturised tables are nightmarish:
<a href="/content/assets/blogn_t/007.07-ligaturised.png"><img class="fragment" alt="Tab-aligned /etc/passwd, one of the usernames is 'fifl', both pairs ligaturised throwing the second through fourth columns two columns left out of alignment, and the fifth four" src="/content/assets/blogn_t/007.07-ligaturised.png" /></a>
	    ).</li>
	<li>groff searches for site-specific fonts in <code>/usr/share/groff/site-font/dev<em>DEV</em></code>.</li>
</ol>

<p class="continued">
This is not without its own delta from the original:
</p>
<a href="/content/assets/blogn_t/007.08-diff.png"><img class="continuing main-font" alt="Visual diff between the page with no non-ASCII characters and the one with them; the differences stack up most toward the end of the line on about half of the lines, and are within antialiasing noise on the other half" src="/content/assets/blogn_t/007.08-diff.png" /></a>
<p class="continuing">
But these differences are not only minute even at their worst (1.92pt in the synopsis line, 0.96pt in the third description line),
but a result of the tighter kerning matching the font better.
</p>


HEADING_S(2, alternative-art, class="continued", Alternative art)
<p class="indented continuation">
In the three-day process of "printing a cyrillic document in 2020", I've also done what <code>grops(1)</code> says you can,  <!--'-->
but is clasically unhelpful in achieving, so:
</p>


HEADING_S(3, alternative-art-foreign-font, class="continued", A foreign font)
<p class="indented continuing">
In this case: <a href="//dimkanovikov.pro/courierprime/">Курьер Прайм</a>, a Courier Prime with Cyrillic characters, that, unlike the latter,
isn't in Debian (merging them is an <a href="//bugs.debian.org/992739">ongoing adventure</a>):  <!--'-->
</p>

<!-- This, but manually fixed:
$ unzip ../courierprime.zip
Archive:  ../courierprime.zip
  inflating: Courier-Prime-Italic.ttf
  inflating: Courier-Prime-Bold.ttf
  inflating: Courier-Prime.ttf
  inflating: Courier-Prime-Bold-Italic.ttf
$ for v in "" -Bold -Italic -Bold-Italic; do
  	for f in afm pfa; do
  		fontforge -c 'import sys; fontforge.open(sys.argv[1]).generate(sys.argv[2])' Courier-Prime$v.ttf Courier-Prime$v.$f &
  	done
  done
‌# ...
Warning: Mac and Windows entries in the 'name' table differ for the
 Fullname string in the language English (US)
 Mac String: Courier Prime Bold Italic
Windows String: CourierPrime-BoldItalic
‌# cp *.pfa /usr/local/share/groff/site-font/devps/

$ for v in "" -Bold -Italic -Bold-Italic; do
  	afmtodit -ncmi0 \
  		-d /usr/share/groff/current/font/devps/DESC \
  		-e /usr/share/groff/current/font/devps/text.enc \
  		Courier-Prime$v.afm /usr/share/groff/current/font/devps/generate/textmap "C$(expr "$(echo $v | tr -d '[:lower:]-')" \| R)";
  done
‌# cp C{R,B,I,BI} /usr/local/share/groff/site-font/devps/

‌# {
  	cat /usr/share/groff/current/font/devps/download; echo;
  	for v in "" -Bold -Italic -Bold-Italic; do
  		printf "%s\t%s\n" CourierPrime${v/d-I/dI} Courier-Prime$v.pfa;
  	done;
  } | tee /usr/local/share/groff/site-font/devps/download
‌# List of downloadable fonts
‌# PostScript-name       Filename

Symbol-Slanted          symbolsl.pfa
ZapfDingbats-Reverse    zapfdr.pfa
FreeEuro                freeeuro.pfa

CourierPrime    Courier-Prime.pfa
CourierPrime-Bold       Courier-Prime-Bold.pfa
CourierPrime-Italic     Courier-Prime-Italic.pfa
CourierPrime-BoldItalic Courier-Prime-Bold-Italic.pfa
-->
<div class="bigcode continuing">
<pre class="language-shell-session"><code class="language-shell-session"><span class="token command"><span class="token shell-symbol important">$</span> <span class="token bash language-bash"><span class="token function">unzip</span> <span class="token punctuation">..</span>/courierprime.zip</span></span>
<span class="token output">Archive:  ../courierprime.zip
  inflating: Courier-Prime-Italic.ttf
  inflating: Courier-Prime-Bold.ttf
  inflating: Courier-Prime.ttf
  inflating: Courier-Prime-Bold-Italic.ttf
<span class="token command"><span class="token shell-symbol important">$</span> <span class="token bash language-bash"><span class="token keyword">for</span> <span class="token for-or-select variable">v</span> <span class="token keyword">in</span> <span class="token string">""</span> -Bold -Italic -Bold-Italic<span class="token punctuation">;</span> <span class="token keyword">do</span></span></span>
<span class="token output">  TAB_INDENT<span class="token keyword">for</span> <span class="token for-or-select variable">f</span> <span class="token keyword">in</span> afm pfa<span class="token punctuation">;</span> <span class="token keyword">do</span></span></span>
</span>  TAB_INDENTTAB_INDENT<span class="token bash language-bash">fontforge -c <span class="token string">'import sys; fontforge.open(sys.argv[1]).generate(sys.argv[2])'</span> </span></span><span class="token output">\FORCED_NEWLINE
</span>  TAB_INDENTTAB_INDENTTAB_INDENT<span class="token string">Courier-Prime$v.ttf</span> <span class="token string">Courier-Prime<span class="token variable">$v</span>.<span class="token variable">$f</span></span> <span class="token shell-symbol important">&amp;</span></span>
<span class="token output">  TAB_INDENT<span class="token keyword">done</span>
  <span class="token keyword">done</span>
</span><span class="token output"><span class="token comment"># ...</span>
Warning: Mac and Windows entries in the 'name' table differ for the
 Fullname string in the language English (US)
 Mac String: Courier Prime Bold Italic
Windows String: CourierPrime-BoldItalic
<span class="token command"><span class="token shell-symbol important">#</span> <span class="token bash language-bash">cp *.pfa /usr/local/share/groff/site-font/devps/</span></span></code>

<span class="token command"><span class="token shell-symbol important">$</span> <span class="token bash language-bash"><span class="token keyword">for</span> <span class="token for-or-select variable">v</span> <span class="token keyword">in</span> <span class="token string">""</span> -Bold -Italic -Bold-Italic<span class="token punctuation">;</span> <span class="token keyword">do</span></span></span>
  TAB_INDENTafmtodit -ncmi<span class="token number">0</span> \FORCED_NEWLINE
  TAB_INDENTTAB_INDENT-d /usr/share/groff/current/font/devps/DESC \FORCED_NEWLINE
  TAB_INDENTTAB_INDENT-e /usr/share/groff/current/font/devps/text.enc \FORCED_NEWLINE
  TAB_INDENTTAB_INDENT<span class="token string">Courier-Prime<span class="token variable">$v</span>.afm</span> /usr/share/groff/current/font/devps/generate/textmap <span class="token string">"C$(expr "<span class="token variable"><span class="token variable">$(</span><span class="token builtin class-name">echo</span> $v <span class="token operator">|</span> <span class="token function">tr</span> -d <span class="token string">'[:lower:]-'</span><span class="token variable">)</span></span>"</span> <span class="token punctuation">\</span><span class="token operator">|</span> R<span class="token punctuation">)</span><span class="token string">"</span><span class="token punctuation">;</span></span></span>
  <span class="token keyword">done</span>
<span class="token command"><span class="token shell-symbol important">#</span> <span class="token bash language-bash">cp C{R,B,I,BI} /usr/local/share/groff/site-font/devps/</span></span></code>

<span class="token command"><span class="token shell-symbol important">#</span> <span class="token punctuation">{</span>
  TAB_INDENTcat /usr/share/groff/current/font/devps/download<span class="token punctuation">;</span> <span class="token builtin">echo</span><span class="token punctuation">;</span>
  TAB_INDENT<span class="token keyword">for</span> <span class="token for-or-select variable">v</span> <span class="token keyword">in</span> <span class="token string">""</span> -Bold -Italic -Bold-Italic<span class="token punctuation">;</span> <span class="token keyword">do</span>
  TAB_INDENTTAB_INDENT<span class="token builtin class-name">printf</span> <span class="token string">"%s<span class="token entity" title="\t">\t</span>%s<span class="token entity" title="\n">\n</span>"</span> CourierPrime<span class="token variable">${v<span class="token operator">/</span>d-I<span class="token operator">/</span>dI}</span> Courier-Prime<span class="token variable">$v</span>.pfa<span class="token punctuation">;</span>
<span class="token output">  TAB_INDENT<span class="token keyword">done</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span> <span class="token operator">|</span> tee /usr/local/share/groff/site-font/devps/download
</span><span class="token output"># List of downloadable fonts
‌# PostScript-name       Filename

Symbol-Slanted          symbolsl.pfa
ZapfDingbats-Reverse    zapfdr.pfa
FreeEuro                freeeuro.pfa

CourierPrime    Courier-Prime.pfa
CourierPrime-Bold       Courier-Prime-Bold.pfa
CourierPrime-Italic     Courier-Prime-Italic.pfa
CourierPrime-BoldItalic Courier-Prime-Bold-Italic.pfa
</span></pre></code>
</div>
<p class="continuing">
<a href="/content/assets/blogn_t/007.09-Курьер.pdf">Yielding</a>:
</p>
<a href="/content/assets/blogn_t/007.09-Курьер.png"><img class="continuation main-font" alt="Same page, monospace non-ASCII characters rendered in a different, rounder, heavier font, with a long f, and proportional ones missing" src="/content/assets/blogn_t/007.09-Курьер.png" /></a>


HEADING_S(3, alternative-art-distribution-font, class="continued", A distribution font)
<p class="continuing indented">
GhostScript can directly load TrueType and OpenType fonts, so for a properly-packaged one all that's needed is:  <!--'-->
</p>
<div class="bigcode continuing">
#include "blogn_t/007.10-liberation2.shell-session.html"
</div>
<p class="continuing">
<a href="/content/assets/blogn_t/007.10-liberation2.pdf">And just like that</a>:
</p>
<a href="/content/assets/blogn_t/007.10-liberation2.png"><img class="continuation main-font" alt="Same page, proportional non-ASCII characters rendered in a serifless font with busted kerning and regular and bold-italic cyrillic replaced by boxes, and monospace ones missing" src="/content/assets/blogn_t/007.10-liberation2.png" /></a>


<!-- https://twitter.com/nabijaczleweli/status/1429503115947020297 -->
HEADING_S(2, jajco, class="continued", <a style="color: inherit;" href="//twitter.com/kgbcatboy/status/1429605955994533889">\nЯЙЦО</a>) <!-- https://web.archive.org/web/20210823140236/twitter.com/kgbcatboy/status/1429605955994533889 -->
<!-- HEADING_S(2, jajco, class="continued", \nЯЙЦО) -->
<p class="continuing indented">
A <del>powerful</del> sufficient diagnostic tool can also be plainly piping groff into Ghostscript:
</p>
<div class="bigcode continuation">
#include "blogn_t/007.11-diag.shell-session.html"
</div>

<p class="continued indented">
<code>frag.1</code> in question, as minimised from <a href="//git.sr.ht/~nabijaczleweli/voreutils">voreutils</a>'  <!--'-->
<a href="//srhtcdn.githack.com/~nabijaczleweli/voreutils/blob/man/man1/cut.1.html"><code>cut.1</code></a>:
</p>
<div class="bigcode continuation">
#include "blogn_t/007.12-frag.1.plaintext.html"
</div>


BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()
