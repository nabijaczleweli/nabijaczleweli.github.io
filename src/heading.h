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


#define MAIN_HEADING_STYLE          <link href="/content/assets/heading.css" rel="stylesheet" />
#define MAIN_HEADING_STYLE_ALT(...) MAIN_HEADING_STYLE <style> HASHgo-back > aHASHgo-back-link { __VA_ARGS__ } </style>
