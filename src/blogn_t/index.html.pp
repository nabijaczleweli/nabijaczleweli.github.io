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


#define PPOST(post_id, post_time, post_time_2, ...)  \
	<div><samp id=STR(post_id)><a href=STR(post_id.html)>__VA_ARGS__</a>; <span style="white-space: nowrap;">post_time, post_time_2</span></samp></div>
#define POST(post_id, post_time, post_time_2, ...)  \
	<p></p>PPOST(post_id, post_time, post_time_2, __VA_ARGS__)

#define B(n) n##.<span style="white-space: pre-wrap;"><!--"-->  <!--"--></span>

#define STYLESHEETS MAIN_HEADING_STYLE                                                                 FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet">                       FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet">                        FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet">  FORCED_NEWLINE \
                    <link href="//fonts.googleapis.com/css?family=Droid+Sans+Mono" rel="stylesheet">   FORCED_NEWLINE \
                    <link href="/content/assets/blogn_t/008.01-amix-fonts.css" rel="stylesheet">     FORCED_NEWLINE \
                    <link href="/content/assets/blogn_t/016.01-BSDi-fonts.css" rel="stylesheet">     FORCED_NEWLINE \
                    <style>samp { font-family: "Droid Sans Mono", monospace; }</style>

#undef linux
#undef unix

BOILERPLATE(blognꞌt, itꞌs not a blog‚ but then again‚ what is?, en-GB, STYLESHEETS)
<style>
/* For 008 */
/* Measured against merriweather in the heading. */
.sunfont {
	font-family: sunfont;
	font-size: 1.25em; /* 60/48 */
}

.topaz {
	font-family: topaz;
	font-size: 0.80em; /* 55/69 */
}

/* For 016 */
/* Measured against merriweather in the heading. */
.qfont {
	font-family: qfont;
	font-size: 1.06349206349206em; /* 67/63 */
}
</style>

<span class="roboto">


<p></p>
MAIN_HEADING(blogn't<!--'-->)

<p>
Not banged out in an hour. <button style="float: right;" onclick="reverse();">Reverse</button>
</p>

<span class="roboto-unscale" id="posts">
	PPOST(001-x32-in-2020,                         Thu, 9 Apr 2020 01:44:47 +0200,  001. Installing Debian'<!--'-->s x32 port in 2020)
	 POST(002-ncurses-gpm-segfault,                Mon, 25 May 2020 00:12:30 +0200, 002. An overlong analysis of ^Z+fg crashing ncurses programs for gpm users)
	 POST(003-maircl-poc,                          Sat, 11 Jul 2020 00:34:50 +0200, 003. A proof-of-concept IRC/mail bridge)
	 POST(004-cinque,                              Sat, 18 Jul 2020 22:14:33 +0200, 004. New album: cinque)
<p></p>
	PPOST(005-low-curse-zfs-on-root,               Mon, 14 Sep 2020 00:20:20 +0200, B(005)Low-curse ZFS-on-root for new Debian installations on multi-disk systems)
	PPOST(005a-zfs-on-root-single-disk-corollary,  Thu, 05 Nov 2020 22:06:30 +0100, 005a. A single-disk but slightly more cursed ZFS-on-root corollary)
	 POST(006-UNIX-r-ATT,                          Thu, 08 Jul 2021 20:26:38 +0200, 006. ¹UNIX® is a registered trademark of AT&T.)
	 POST(007-groff-Tps-cyrillic-et-al,            Sat, 28 Aug 2021 18:36:44 +0200, 007. Cleanly enabling Cyrillic and broad Unicode output in groff -Tps)
	 POST(008-amix-fonts,                          Thu, 17 Nov 2022 22:36:33 +0100, 008. <span class="topaz">AMIX</span> <span class="sunfont">fonts</span>)
	 POST(009-XEROX-SIGMA-9-balls,                 Thu, 01 Dec 2022 17:16:50 +0100, 009. XEROX SIGMA 9 balls)
	 POST(010-tme-Sun-2-SunOS3-2023,               Mon, 19 Jun 2023 23:53:58 +0200, 010. tme booting SunOS 3 on Sun-2 in 2023)
	 POST(011-linux-splice-exclusion,              Fri, 07 Jul 2023 01:42:34 +0200, 011. pipe exclusion with splice() under Linux)
<p></p>
	PPOST(012-debian-chromebook-lenovo-300e-gen2,  Mon, 08 Jan 2024 16:06:34 +0100, B(012)Debian on the Lenovo 300e 2<sup>nd</sup>-gen arm64 Chromebook)
	PPOST(012a-installing-debian-chromebook-lenovo-300e-gen2-intel, Thu, 11 Jan 2024 04:04:28 +0100, 012a. Installing Debian on the Lenovo 300e 2<sup>nd</sup>-gen Chromebook (Intel))
	PPOST(012b-debian-chromebook-lenovo-300e-gen2-mtk-real, Wed, 07 Feb 2024 01:09:33 +0100, 012b. Debian on the Lenovo 300e 2<sup>nd</sup>-gen MTK arm64 Chromebook (hana) (real))
	 POST(013-linux-a.out-quine,                   Sun, 17 Mar 2024 04:57:16 +0100, 013. Linux a.out quine in 44 bytes)
	 POST(014-unix-pre-v4-pid0-corollary,          Mon, 10 Jun 2024 01:04:14 +0200, 014. PID 0 in V1 UNIX (and V4 nsys, and the PDP-7 proto-UNIX))
	 POST(015-ranlib,                              Tue, 01 Oct 2024 11:09:48 +0200, 015. where da lib runnin)
	 POST(016-BSDi-qfont,                          Sat, 05 Oct 2024 21:56:06 +0200, 016. <span class="qfont">BSDi qfont</span>)
	 POST(017-malloc0,                             Thu, 17 Oct 2024 03:42:06 +0200, 017. malloc(0) & realloc(…，0) ≠ 0)
	 POST(018-mean-shift-clusterer,                Tue, 29 Apr 2025 16:32:56 +0200, 018. Mean-shift clustering)
	 POST(019-aphantasia,                          Thu, 18 Sep 2025 18:34:15 +0200, 019. aphantasia.)
	 POST(020-sizeof-division,                     Sun, 28 Sep 2025 01:02:48 +0200, 020. Pre-modern-UNIX sizeof division)
	<!-- Remember to update latest post in toplevel index -->
</span>

BLOGN_T_FOOTER()

<script>
function reverse() {
	for(let i = 1; i < posts.childNodes.length; ++i)
		posts.insertBefore(posts.childNodes[i], posts.firstChild);
}

reverse();
</script>

</span>
BOILERPLATE_END()
