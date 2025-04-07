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


#define MFIZZ_LINK <link href="//rawcdn.githack.com/fizzed/font-mfizz/v2.4.1/dist/font-mfizz.css" rel="stylesheet"> FORCED_NEWLINE


#define CMT // D = only decorative
#undef CMT  // "Note: to improve web accessibility, we recommend using aria-hidden="true" to hide icons used purely for decoration."

#define MFIZZ(iconname, ...) <i class=STR(icon-iconname) __VA_ARGS__></i>
#define MFIZZ_D(iconname, ...) OCTICON(iconname, aria-hidden="true" __VA_ARGS__)
