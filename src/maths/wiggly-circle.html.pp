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
#include "../heading.h"


<!-- RSS_PUB_DATE: "Thu, 9 May 2019 22:54:19 +0200" -->


#define PIECE(pid, fname, ...)                                                                  \
	<div class="art-box">                                                          FORCED_NEWLINE \
		<h4 class="merriweather label"><a href=STR(HASH##pid)>__VA_ARGS__</a></h4>   FORCED_NEWLINE \
		                                                                             FORCED_NEWLINE \
		<a href=STR(/content/assets/wiggly-circle/output_##fname.png)>               FORCED_NEWLINE \
			<img id=#pid src=STR(/content/assets/wiggly-circle/output_##fname.png) />  FORCED_NEWLINE \
		</a>                                                                         FORCED_NEWLINE \
	</div>

#define LINKS MAIN_HEADING_STYLE_ALT(color: #acacac;)                                            FORCED_NEWLINE \
              <link href="/content/assets/unobtrusive-art.css" rel="stylesheet" />               FORCED_NEWLINE \
              <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" />            FORCED_NEWLINE \
              <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />
BOILERPLATE(wiggly-circle, A selexion of circles‚ most of them wiggly‚ some of them colourful, en-GB, LINKS)


<div class="art-box">
	<span id="top">MAIN_HEADING_ALT(2, ., wiggly-circle)</span>

	<p class="merriweather">
		Inspired by <a href="//inconvergent.net">Inconvergent</a>'s <a href="//twitter.com/inconvergent/status/1122463283586510848">"path test"</a>.<!--'-->
	</p>
</div>


PIECE(lines                                              , lines_2x_w1.5,                                               the return to the fight)
PIECE(r0_pts                                             , r0_pts,                                                      centrism)
PIECE(r0_lines                                           , r0_lines_2x_w1.5,                                            pointless breadth)
PIECE(r0_lines_40__2                                     , r0_lines_2x_w1.5_40__2,                                      volumous)
PIECE(r0_lines_1600x900_40                               , r0_lines_2x_w1.5_1600x900_40,                                breathe)
PIECE(r0_pts_o.8_1600x900_60                             , r0_pts_2x_w1.5_o.8_1600x900_60,                              pointedly degenerative)
PIECE(r0_lines_rgba_1600x900_60                          , r0_lines_2x_w1.5_rgba_1600x900_60,                           trans-gressive)
PIECE(r0_sngllines_rgba_1600x900_60                      , r0_sngllines_2x_w1.5_rgba_1600x900_60,                       pointedly home-of-sexual)
PIECE(r0_skiplines_rgba_1600x900_60                      , r0_skiplines_2x_w1.5_rgba_1600x900_60,                       drop-ped)
PIECE(r0_skiplines_comp-step_rgba_1600x900_60__2         , r0_skiplines_2x_w1.5_comp-step_rgba_1600x900_60__2,          c o m p e n s a t e)
PIECE(r0_skiplines2..4_comp-step_rgba_1600x900_60        , r0_skiplines2..4_2x_w1.5_comp-step_rgba_1600x900_60,         {2,3,4}-drop)
PIECE(r0_lines_flagtrans_1600x900_60                     , r0_lines_2x_w1.5_flagtrans_1600x900_60,                      back and ready for more trans jokes)
PIECE(r0_lines_flagbi-wgh_1600x900_60                    , r0_lines_2x_w1.5_flagbi-wgh_1600x900_60,                     from beyond the bilines)
PIECE(r0_sngllines2_flagpan_1600x900_60                  , r0_sngllines2_2x_w1.5_flagpan_1600x900_60,                   pancontinental)
PIECE(r0_skiplines2..4_flagace_1600x900_60               , r0_skiplines2..4_2x_w1.5_flagace_1600x900_60,                amorphous)
PIECE(r0_skiplines2..4_flaggay_alpha_1600x900_60         , r0_skiplines2..4_2x_w1.5_flaggay_alpha_1600x900_60,          re-homing)
PIECE(r0_sngllines7_comp-step_flagace_alpha.5_1600x900_60, r0_sngllines7_2x_w1.5_comp-step_flagace_alpha.5_1600x900_60, anachronistic)


<div class="art-box">
	<h2 class="merriweather label" id="code"><a href="#code">Code</a></h2>

#include "maths/wiggly-circle.cpp.html"

</div>


<span id="arrow"></span>


BOILERPLATE_END()
