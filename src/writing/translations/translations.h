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


#include "../../util.h"


#define TRANSLATION_RAW(semiurl, title, lang, date, ...)                                    \
	<li><a href=STR(/content/writing/translations/semiurl)>title</a> [lang] —  FORCED_NEWLINE \
				__VA_ARGS__;                                                         FORCED_NEWLINE \
				<span class="math-font-normal roboto-unscale">date</span>.</li>      FORCED_NEWLINE


#define TRANSLATIONS_LIST()                                                                                                                                          \
	TRANSLATION_RAW(funeral_blues.html, Funeral Blues (ew. Pogrzebowy Blues),                                                                                          \
		              PL, 19.04.2018, Translation of W. H. Auden's<!--'--> "Funeral Blues" for a contest)                                                                \
	TRANSLATION_RAW(sherlock_holmes_the_published_apocrypha/, Sherlock Holmes，the Published Apocrypha (ew. Sherlock Holmes，Opublikowane Apokryfy),                    \
	                PL, 07.12.2017–WIP, Ongoing effort to translate the entirety of "Sherlock Holmes, the Published Apocrypha"，currently roughly on page 22 of 330)   \
	TRANSLATION_RAW(erotica, Erotica,                                                                                                                                  \
		              PL, 18.11.2018–WIP, Ongoing translation of some of my faves from Reynolds'<!--'--> "Erotica")
