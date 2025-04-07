<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "translations.h"
#include "../../common.h"
#include "../../heading.h"


#define STYLESHEETS MAIN_HEADING_STYLE                                                         FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet">               FORCED_NEWLINE \
                    <link href="../the_taste_of_mi/MathJax-font.css" rel="stylesheet">       FORCED_NEWLINE \
                    <link href="../Roboto-font.css" rel="stylesheet">                        FORCED_NEWLINE \
                    <link href="../the_taste_of_mi/Merriweather-font.css" rel="stylesheet">
BOILERPLATE(Translations, Some things набꞌs translated, en-GB, STYLESHEETS)


<style>
#include "../../indent.css"
</style>
<span class="roboto">


MAIN_HEADING((Bad?) Translations)


<p class="indented">
As an operator of several languages, I sometimes find the need to move data between them, usually for a contest, because translating things is not great fun.
As usual, no quality is guaranteed besides the standard <em>I tried my best</em> stamp (available at your local convenience store and all good bookshops).
</p>

<div>
	<p></p>
	Poems:
	<ul>
		TRANSLATIONS_LIST()
	</ul>
	<p></p>
</div>


</span>
BOILERPLATE_END()
