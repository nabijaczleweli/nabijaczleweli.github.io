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


#define GEB(...)          <code class="nowrap" style="font-variant: normal;">gen-epub-book(U+200B)__VA_ARGS__</code>
#define GEB_HREF(...)     href=STR(httpsCOLON_SLASH_SLASHgithub.com/nabijaczleweli/gen-epub-book(FORCED_SPACER)__VA_ARGS__)
#define GEB_CDN_HREF(...) href=STR(httpsCOLON_SLASH_SLASHrawcdn.githack.com/nabijaczleweli/gen-epub-book(FORCED_SPACER)__VA_ARGS__)

#define CSPAN(clas, ...)        <span class=STR(clas)>__VA_ARGS__</span>
#define HIGHLIT_CODE(clas, ...) <kbd class="highlit-code nowrap">CSPAN(clas,__VA_ARGS__)</kbd>

#define CMT Also used in heading.h and the blogue, make sure to update both with fixes
#undef CMT
#define HEADING_LINK(id)                  <a class="hash-link" href=STR(HASH##id)>HASH</a>
#define HEADING_S(level, hid, style, ...) <h##level id=STR(hid) class="smallcaps" style>HEADING_LINK(hid) __VA_ARGS__</h##level>
#define HEADING(level, id, ...)           HEADING_S(level, id, , __VA_ARGS__)

#define AWK_ICON(...)                                                                                               \
	<span style="font-weight: normal;" class="icon nowrap" __VA_ARGS__>                                FORCED_NEWLINE \
		<strong>A</strong><!--                                                                           FORCED_NEWLINE \
 --><span class="overlay-container">                                                                 FORCED_NEWLINE \
			<sup class="overlay-target smallcaps" style="top: calc(-1em / 4); left: calc(-1em/6);">w</sup> FORCED_NEWLINE \
			<sub class="smallcaps" style="margin-left: calc(1em / 16);">k</sub>                            FORCED_NEWLINE \
		</span>                                                                                          FORCED_NEWLINE \
	</span>


#define SCRIPTS     <script src="/content/assets/numberise-code.js"></script>  FORCED_NEWLINE
#define STYLESHEETS MAIN_HEADING_STYLE FONTAWESOME_LINK MFIZZ_LINK DEVICON_LINK                       FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet">                      FORCED_NEWLINE \
                    <link href="//fonts.googleapis.com/css?family=Droid+Sans+Mono" rel="stylesheet">  FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet">                       FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet">   FORCED_NEWLINE
