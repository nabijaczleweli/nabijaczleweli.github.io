<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../util.h"
#include "../common.h"
#include "../heading.h"
#include "blogn_t.h"


#define POST(post_id, post_time, post_time_2, ...)                                                                                        \
	<samp id=STR(post_id)><a href=STR(post_id.html)>__VA_ARGS__</a>; <span style="white-space: nowrap">post_time, post_time_2</span></samp>


#define STYLESHEETS MAIN_HEADING_STYLE                                                                 FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet" />                       FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet" />                        FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />  FORCED_NEWLINE \
                    <link href="//fonts.googleapis.com/css?family=Droid+Sans+Mono" rel="stylesheet">   FORCED_NEWLINE \
                    <style>samp { font-family: "Droid Sans Mono", monospace; }</style>
BOILERPLATE(blognꞌt, itꞌs not a blog‚ but then again‚ what is?, en-US, STYLESHEETS)
<span class="roboto">


<p></p>
MAIN_HEADING(blogn't<!--'-->)

I <a href="https://crates.io/crates/bloguen">wrote</a> a blog generator but never deployed it because I'<!--'-->m not proud of it,
 so here'<!--'-->s some non-blogue blogue posts, I guess.

<p class="roboto-unscale">
	POST(001-x32-in-2020, Thu, 9 Apr 2020 01:44:47 +0200, 001. Installing Debian'<!--'-->s x32 port in 2020)
</p>

BLOGN_T_FOOTER()

</span>
BOILERPLATE_END()
