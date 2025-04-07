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


#define OCTICONS_SCRIPT      <script src="/content/assets/octicons.js"></script> FORCED_NEWLINE
#define OCTICONS_LINK        <link href="/content/assets/octicons.min.css" rel="stylesheet">          FORCED_NEWLINE
#define OCTICONS_PLACEHOLDER <span class="hidden" id="octicons-placeholder"></span>
#define OCTICONS_DATA OCTICONS_SCRIPT OCTICONS_LINK


#define CMT // D = only decorative
#undef CMT  // "Note: to improve web accessibility, we recommend using aria-hidden="true" to hide icons used purely for decoration."

#define OCTICON(iconname, ...)                                                                                   \
	<svg version="1.1" width="12" height="16" viewBox="0 0 12 16" class=STR(octicon octicon-iconname) __VA_ARGS__> \
		<use xlink:href=STR(HASH##iconname) />                                                                         \
	</svg>
#define OCTICON_D(iconname, ...) OCTICON(iconname, aria-hidden="true" __VA_ARGS__)
