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
#include "../fontawesome.h"
#include "translations/translations.h"
#include "../writing_prompts/writing_prompts.h"


#define MATH(...) <span class="math-font-normal roboto-unscale">__VA_ARGS__</span>


#define STYLESHEETS MAIN_HEADING_STYLE FONTAWESOME_LINK                                     FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet">            FORCED_NEWLINE \
                    <link href="the_taste_of_mi/MathJax-font.css" rel="stylesheet">       FORCED_NEWLINE \
                    <link href="Roboto-font.css" rel="stylesheet">                        FORCED_NEWLINE \
                    <link href="the_taste_of_mi/Merriweather-font.css" rel="stylesheet">
BOILERPLATE(Prose, Prose, en-GB, STYLESHEETS)


<style>
#include "../indent.css"
</style>
<span class="roboto">


MAIN_HEADING(Prose)


<p class="indented" style="margin-bottom: 0;">
If it's not on <a href="/content/blogue">the blogue</a> and it's not a post,
it's<!--'--> probably under the umbrella of <a href="//sr.ht/~nabijaczleweli/voreutils">voreutils</a>,
which is my love letter to the UNIX userland or whatever,
with a context preface of the current implementation and academia (literature review, historiosophic analysis) in HISTORY;
most notably:
</p>
<ul style="padding-left: 1em;">
	<li><a href="//ro.ws.co.ls/man1/stty.1.pdf#page=9">stty(1) — inspect and alter teletype and window attributes</a> —
	    monograph about the UNIX teletype;
	    MATH(9+72pg; 08–10.2022),</li>
	<li><a href="//ro.ws.co.ls/man1/hostid.1.pdf">hostid(1) — get host ID</a> —
	    this is a destruction of the host ID concept as it's<!--'--> ever been implemented;
	    MATH(0+6pg; 15.06.2022),</li>
	<li>and <a href="//ro.ws.co.ls">like 80 others</a> written MATH(2022–2025).</li>
</ul>

<p></p>

<details>
<summary>Not Good zone. Bad zone. Horrendous zone actually. We were all 15 once.</summary>

<div>
	<p></p>
	Short stories:
	<ul>
		<li><a href="każdy_koniec_to_nowy_początek/">"Każdy koniec to nowy początek"</a> [PL] —
			wherein sociological (r)evolutions happen and we're<!--'--> there to observe it;
			MATH(~31.03.2016).</li>
		<li><a href="наган/">"Наган"</a> [PL] —
			slightly soviet sniper girlfriends win battle, but at what cost?;
			MATH(04.2016–30.09.2016).</li>
		<li><a href="świat_to_kilka_takich_pokoi/">"Świat to kilka takich pokoi"</a> [PL] —
			wherein I abstract the causes of WWI in the context of a stereotypical social building;
			MATH(01.06.2016–03.06.2016).</li>
		<li><a href="moments/">"A Widow's Trace"</a> —
			Overwatch smut, enter at own risk;
			MATH(~10-20.03.2017).</li>
		<li><a href="the_taste_of_mi/">"The Taste of MI"</a> [PL] —
			lass reminsces about her key life points while lying in wait for her wife;
			MATH(30.06.2017–12.08.2017).</li>
	</ul>
	<p></p>
</div>

<div>
	<p></p>
	Translations:
	<ul>
		TRANSLATIONS_LIST()
	</ul>
	<p></p>
</div>

<div>
	<p></p>
	<a href="https://www.reddit.com/r/WritingPrompts">Writing prompts</a>:
	<ul>
		WRITING_PROMPT_LIST()
	</ul>
	<p></p>
</div>

<div>
	<p></p>
	Things otherwise existent:
	<ul>
		<li><a href="//4kulturka.blogspot.com/2017/06/moon-is-harsh-mistress.html">Moon Is Harsh Mistress</a> [PL] —
			Review of Robert A. Heinlein's "Moon Is Harsh Mistress"; <!--'-->
			MATH(06.04.2017).</li>
		<li><a href="poetry/ПИПА/">ПИПА</a> [PL] —
			an actively developing collection of the creations of Felicia – the artistic cooperative Поезия Интригующия Поетов Анахронических;
			MATH(02.11.2018–?).</li>
	</ul>
	<p></p>
</div>
</details>


</span>
BOILERPLATE_END()
