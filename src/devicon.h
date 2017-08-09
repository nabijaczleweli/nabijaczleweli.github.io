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


#define DEVICON_LINK <link href="//cdn.rawgit.com/konpa/devicon/v2.2/devicon.min.css" rel="stylesheet" /> FORCED_NEWLINE


#define DEVICON(iconname, ...)               <i class=STR(devicon-iconname-plain) __VA_ARGS__></i>
#define DEVICON_LINE(iconname, ...)          <i class=STR(devicon-iconname-line) __VA_ARGS__></i>
#define DEVICON_WORDMARK(iconname, ...)      <i class=STR(devicon-iconname-plain-wordmark) __VA_ARGS__></i>
#define DEVICON_LINE_WORDMARK(iconname, ...) <i class=STR(devicon-iconname-line-wordmark) __VA_ARGS__></i>

#define DEVICON_COLOURED(iconname, ...)               <i class=STR(devicon-iconname-plain colored) __VA_ARGS__></i>
#define DEVICON_LINE_COLOURED(iconname, ...)          <i class=STR(devicon-iconname-line colored) __VA_ARGS__></i>
#define DEVICON_WORDMARK_COLOURED(iconname, ...)      <i class=STR(devicon-iconname-plain-wordmark colored) __VA_ARGS__></i>
#define DEVICON_LINE_WORDMARK_COLOURED(iconname, ...) <i class=STR(devicon-iconname-line-wordmark colored) __VA_ARGS__></i>

#define CMT // D = only decorative
#undef CMT  // "Note: to improve web accessibility, we recommend using aria-hidden="true" to hide icons used purely for decoration."

#define DEVICON_D(iconname, ...)               DEVICON(iconname, aria-hidden="true" __VA_ARGS__)
#define DEVICON_LINE_D(iconname, ...)          DEVICON_LINE(iconname, aria-hidden="true" __VA_ARGS__)
#define DEVICON_WORDMARK_D(iconname, ...)      DEVICON_WORDMARK(iconname, aria-hidden="true" __VA_ARGS__)
#define DEVICON_LINE_WORDMARK_D(iconname, ...) DEVICON_LINE_WORDMARK(iconname, aria-hidden="true" __VA_ARGS__)

#define DEVICON_COLOURED_D(iconname, ...)               DEVICON_COLOURED(iconname, aria-hidden="true" __VA_ARGS__)
#define DEVICON_LINE_COLOURED_D(iconname, ...)          DEVICON_LINE_COLOURED(iconname, aria-hidden="true" __VA_ARGS__)
#define DEVICON_WORDMARK_COLOURED_D(iconname, ...)      DEVICON_WORDMARK_COLOURED(iconname, aria-hidden="true" __VA_ARGS__)
#define DEVICON_LINE_WORDMARK_COLOURED_D(iconname, ...) DEVICON_LINE_WORDMARK_COLOURED(iconname, aria-hidden="true" __VA_ARGS__)
