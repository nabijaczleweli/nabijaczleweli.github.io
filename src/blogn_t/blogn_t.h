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


#define BLOGN_T_HEADING(...)  MAIN_HEADING_ALT(2, ., <samp>__VA_ARGS__</samp>)                                         FORCED_NEWLINE \
                              <h4 id="post-date"><span style="white-space: nowrap">POST_DATE</span>POST_POST_DATE</h4> FORCED_NEWLINE \
                              <!--BLOGN_T_TOC_PLACEHOLDER-->
#define BLOGN_T_FOOTER()                                                                                                                                 \
<p>                                                                                                                                       FORCED_NEWLINE \
	<br />                                                                                                                                  FORCED_NEWLINE \
	Nit-pick? Correction? Improvement? Annoying? Cute? Anything?                                                                            FORCED_NEWLINE \
  <a href=STR(mailto:nabijaczleweli@nabijaczleweli.xyz?subject=Notes on FILE_NAME)>Mail</a>,                                              FORCED_NEWLINE \
	<a href="//101010.pl/@nabijaczleweli">post</a>, or <a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/issues/new">open</a>!  FORCED_NEWLINE \
</p>


#define CMT Also used in heading.h, make sure to update both with fixes
#undef CMT
#define HEADING_LINK(id)                  <a class="hash-link" href=STR(HASH##id)>HASH</a>
#define HEADING_S(level, hid, style, ...) <h##level id=STR(hid) style>HEADING_LINK(hid) __VA_ARGS__</h##level>
#define HEADING(level, id, ...)           HEADING_S(level, id, , __VA_ARGS__)


#define BLOGN_T_STYLESHEETS MAIN_HEADING_STYLE                                                                 FORCED_NEWLINE \
                            <link href="/kaschism/assets/column.css" rel="stylesheet" />                       FORCED_NEWLINE \
                            <link href="/content/assets/blogn_t.css" rel="stylesheet" />                       FORCED_NEWLINE \
                            <link href="/content/assets/contents.css" rel="stylesheet" />                      FORCED_NEWLINE \
                            <link href="../writing/Roboto-font.css" rel="stylesheet" />                        FORCED_NEWLINE \
                            <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />  FORCED_NEWLINE \
                            <link href="//fonts.googleapis.com/css?family=Droid+Sans+Mono" rel="stylesheet">
