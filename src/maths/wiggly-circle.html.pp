<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../common.h"


<!-- RSS_PUB_DATE: "Thu, 9 May 2019 22:54:19 +0200" -->


#define PIECE(pid, fname, ...)                                                   \
	<div class="art-box">                                                          \
		<h4 class="merriweather label"><a href=STR(HASH##pid)>__VA_ARGS__</a></h4>   \
		                                                                             \
		<a href=STR(/content/assets/wiggly-circle/output_##fname.png)>               \
			<img id=#pid src=STR(/content/assets/wiggly-circle/output_##fname.png) />  \
		</a>                                                                         \
	</div>

#define LINKS <link href="/content/assets/unobtrusive-art.css" rel="stylesheet" />               \
              <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" />            \
              <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />
BOILERPLATE(wiggly-circle, A selexion of circles‚ most of them wiggly‚ some of them colourful, en-GB, LINKS)


<div class="art-box">
	<h2 class="merriweather label" id="top"><a href="#top">wiggly-circle</a></h2>

	<p class="merriweather">
		Inspired by <a href="//inconvergent.net">Inconvergent</a>'s <a href="//twitter.com/inconvergent/status/1122463283586510848">"path test"</a>.<!--'-->
	</p>
</div>


PIECE(lines                                      , lines_2x_w1.5,                                       the return to the fight)
PIECE(r0_pts                                     , r0_pts,                                              centrism)
PIECE(r0_lines                                   , r0_lines_2x_w1.5,                                    pointless breadth)
PIECE(r0_lines_40__2                             , r0_lines_2x_w1.5_40__2,                              volumous)
PIECE(r0_lines_1600x900_40                       , r0_lines_2x_w1.5_1600x900_40,                        breathe)
PIECE(r0_pts_o.8_1600x900_60                     , r0_pts_2x_w1.5_o.8_1600x900_60,                      pointedly degenerative)
PIECE(r0_lines_rgba_1600x900_60                  , r0_lines_2x_w1.5_rgba_1600x900_60,                   trans-gressive)
PIECE(r0_sngllines_rgba_1600x900_60              , r0_sngllines_2x_w1.5_rgba_1600x900_60,               pointedly home-of-sexual)
PIECE(r0_skiplines_rgba_1600x900_60              , r0_skiplines_2x_w1.5_rgba_1600x900_60,               drop-ped)
PIECE(r0_skiplines_comp-step_rgba_1600x900_60__2 , r0_skiplines_2x_w1.5_comp-step_rgba_1600x900_60__2,  c o m p e n s a t e)
PIECE(r0_skiplines2..4_comp-step_rgba_1600x900_60, r0_skiplines2..4_2x_w1.5_comp-step_rgba_1600x900_60, {2,3,4}-drop)


<div class="art-box">
	<h2 class="merriweather label" id="code"><a href="#code">Code</a></h2>

#include "maths/wiggly-circle.cpp.html"

</div>


<span id="arrow"></span>


BOILERPLATE_END()
