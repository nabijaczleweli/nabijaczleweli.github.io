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


#define POST(post_id, post_time, post_time_2, ...)  \
	<p><samp id=STR(post_id)><a href=STR(post_id.html)>__VA_ARGS__</a>; <span style="white-space: nowrap">post_time, post_time_2</span></samp></p>


#define STYLESHEETS MAIN_HEADING_STYLE                                                                 FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet" />                       FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet" />                        FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />  FORCED_NEWLINE \
                    <link href="//fonts.googleapis.com/css?family=Droid+Sans+Mono" rel="stylesheet">   FORCED_NEWLINE \
                    <style>samp { font-family: "Droid Sans Mono", monospace; }</style>
BOILERPLATE(blognꞌt, itꞌs not a blog‚ but then again‚ what is?, en-GB, STYLESHEETS)
<span class="roboto">


<p></p>
MAIN_HEADING(blogn't<!--'-->)

I <a href="https://crates.io/crates/bloguen">wrote</a> a blog generator but never deployed it for a reason or another,
 so here'<!--'-->s some non-blogue blogue posts, I guess.

<p class="roboto-unscale">
	POST(001-x32-in-2020,          Thu, 9 Apr 2020 01:44:47 +0200,  001. Installing Debian'<!--'-->s x32 port in 2020)
	POST(002-ncurses-gpm-segfault, Mon, 25 May 2020 00:12:30 +0200, 002. An overlong analysis of ^Z+fg crashing ncurses programs for gpm users)
	POST(003-maircl-poc,           Sat, 11 Jul 2020 00:34:50 +0200, 003. A proof-of-concept IRC/mail bridge)
	POST(004-cinque,               Sat, 18 Jul 2020 22:14:33 +0200, 004. New album: cinque)
</p>

BLOGN_T_FOOTER()

</span>
BOILERPLATE_END()
