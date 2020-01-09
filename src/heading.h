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


#include "util.h"


#define CMT Based on gen-epub-book'<!--'-->s hash-on-the-left, make sure to update both if fixing something
#undef CMT

#define MAIN_HEADING_ALT(level, back_url, ...) <h##level id="go-back" class="merriweather"><a id="go-back-link" href=STR(back_url)>↩</a> __VA_ARGS__</h##level>
#define MAIN_HEADING(...)                      MAIN_HEADING_ALT(2, .., __VA_ARGS__)


#define MAIN_HEADING_STYLE                        \
<style>                            FORCED_NEWLINE \
	#go-back > a#go-back-link {      FORCED_NEWLINE \
	float: left;                     FORCED_NEWLINE \
	visibility: hidden;              FORCED_NEWLINE \
	opacity: 0;                      FORCED_NEWLINE \
	padding-right: calc(1em / 5.5);  FORCED_NEWLINE \
	margin-left: calc(-1em / 0.9);   FORCED_NEWLINE \
	transition: all 0.5s;            FORCED_NEWLINE \
                                                  \
	color: black;                    FORCED_NEWLINE \
	text-decoration: none;           FORCED_NEWLINE \
}                                  FORCED_NEWLINE \
                                                  \
#go-back:hover > a#go-back-link {  FORCED_NEWLINE \
	visibility: visible;             FORCED_NEWLINE \
	opacity: 1;                      FORCED_NEWLINE \
}                                  FORCED_NEWLINE \
</style>
