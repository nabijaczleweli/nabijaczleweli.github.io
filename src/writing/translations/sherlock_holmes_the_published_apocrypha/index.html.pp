<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../../variable-selectors.h"
#include "../../../common.h"
#include "../../writing.h"


<!-- TODO RSS_PUB_DATE -->


#define STYLESHEETS <link href="../../Roboto-font.css" rel="stylesheet" />                        FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet" />                  FORCED_NEWLINE \
                    <link href="/kaschism/assets/pagebreak.css" rel="stylesheet" />               FORCED_NEWLINE \
                    <link href="../../the_taste_of_mi/MathJax-font.css" rel="stylesheet" />       FORCED_NEWLINE \
                    <link href="../../the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />  FORCED_NEWLINE \
                    <style>                                                                       FORCED_NEWLINE \
                    .smallcaps {                                                                  FORCED_NEWLINE \
                    	font-variant: small-caps;                                                   FORCED_NEWLINE \
                    }                                                                             FORCED_NEWLINE \
                    </style>
BOILERPLATE(Sherlock Holmes，the Published Apocrypha (ew. Sherlock Holmes，Opublikowane Apokryfy), Polish translation of Sherlock Holmes，the Published Apocrypha, pl, WORD_COUNT_SCRIPT STYLESHEETS)


<style>
#include "headings.css"
#include "../../../indent.css"
#include "Roboto-additions.css"
#include "../../the_taste_of_mi/spacing.css"
</style>


#include "title.html"
<h1>&nbsp;</h1>
#include "dedication.html"
<h1>&nbsp;</h1>
#include "contents.html.eppe"
<h1>&nbsp;</h1>
#include "introduction.html.eppe"
<h1>&nbsp;</h1>
#include "the-parodies/index.html.eppe"
#include "the-parodies/the-field-bazaar.html.eppe"
#include "the-parodies/how-watson-learned-the-trick.html.eppe"
#include "the-parodies/the-adventure-of-the-two-collaborators.html.eppe"
<h1>&nbsp;</h1>
#include "the-stories-of-mystery/index.html.eppe"
#include "the-stories-of-mystery/the-man-with-the-watches.html.eppe"


WORD_COUNTER_END()
WRITING_END()
BOILERPLATE_END()