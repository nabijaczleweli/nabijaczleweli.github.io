#define __LICENSE                                                  \
// nabijaczleweli.xyz (c) by nabijaczleweli                        \
​//                                                                 \
// nabijaczleweli.xyz is licensed under a                          \
// Creative Commons Attribution 4.0 International License.         \
​//                                                                 \
// You should have received a copy of the license along with this  \
// work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
#undef __LICENSE


#pragma once


#include "../heading.h"


#define BLOGN_T_HEADING(...)  MAIN_HEADING_ALT(2, ., <samp>__VA_ARGS__</samp>)  FORCED_NEWLINE \
                              <h4 id="post-date"><span style="white-space: nowrap">POST_DATE</span>POST_POST_DATE</h4>
#define BLOGN_T_FOOTER()                                                                                                                                             \
<p>                                                                                                                                                   FORCED_NEWLINE \
	<br />                                                                                                                                              FORCED_NEWLINE \
	Nit-pick? Correction? Improvement? Annoying? Cute? Anything? Don'<!--'-->t hesitate to <a href="mailto:nabijaczleweli@nabijaczleweli.xyz">post</a>  FORCED_NEWLINE \
		or <a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/issues/new">open</a> an issue!                                                   FORCED_NEWLINE \
</p>


#define BLOGN_T_STYLESHEETS MAIN_HEADING_STYLE                                                                 FORCED_NEWLINE \
                            <link href="/kaschism/assets/column.css" rel="stylesheet" />                       FORCED_NEWLINE \
                            <link href="/content/assets/blogn_t.css" rel="stylesheet" />                       FORCED_NEWLINE \
                            <link href="../writing/Roboto-font.css" rel="stylesheet" />                        FORCED_NEWLINE \
                            <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />  FORCED_NEWLINE \
                            <link href="//fonts.googleapis.com/css?family=Droid+Sans+Mono" rel="stylesheet">
