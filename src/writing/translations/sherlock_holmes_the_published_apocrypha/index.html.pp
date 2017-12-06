<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../../../common.h"
#include "../../writing.h"


#define MATH(...) <span class="math-font-normal roboto-unscale">__VA_ARGS__</span>

<!-- TODO RSS_PUB_DATE -->


#define STYLESHEETS <link href="/kaschism/assets/column.css" rel="stylesheet" />                  FORCED_NEWLINE \
                    <link href="../../the_taste_of_mi/MathJax-font.css" rel="stylesheet" />       FORCED_NEWLINE \
                    <link href="../../Roboto-font.css" rel="stylesheet" />                        FORCED_NEWLINE \
                    <link href="../../the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />  FORCED_NEWLINE \
                    <style>                                                                       FORCED_NEWLINE \
                    .smallcaps {                                                                  FORCED_NEWLINE \
                    	font-variant: small-caps;                                                   FORCED_NEWLINE \
                    }                                                                             FORCED_NEWLINE \
                    </style>
BOILERPLATE(Sherlock Holmes，the Published Apocrypha (ew. Sherlock Holmes，Opublikowane Apokryfy), Polish translation of Sherlock Holmes，the Published Apocrypha, pl, WORD_COUNT_SCRIPT STYLESHEETS)


<style>
#include "../../../indent.css"
#include "../../the_taste_of_mi/spacing.css"
</style>
<span>


#include "title.html"
<h1>&nbsp;</h1>
<span class="roboto">
#include "dedication.html"
<h1>&nbsp;</h1>
#include "contents.html.eppe"
</span>

</span>

WORD_COUNTER_END_NON_ENGLISH()
WRITING_END()
BOILERPLATE_END()
