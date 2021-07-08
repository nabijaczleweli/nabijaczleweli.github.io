<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../fontawesome.h"
#include "../heading.h"
#include "../common.h"


#define STYLESHEETS MAIN_HEADING_STYLE FONTAWESOME_LINK                                                                  FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet" />                      FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet" />                       FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" /> FORCED_NEWLINE \
                    <link href="/content/assets/image-header.css" rel="stylesheet" />
BOILERPLATE(Mathematics, Various mathematics-based things, en-GB, STYLESHEETS)


<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../indent.css"

HASHwiggly-circle-header {
	background-image: url(/content/assets/wiggly-circle/output_r0_lines_2x_w1.5.png);
	background-size: 450px;
	background-position: calc((450px + 10em) / 2) calc((450px + 10em) / 2);
	margin-right: -10em;
}
</style>


MAIN_HEADING((Pretty?) Maths-based things)
<span class="roboto">


<div class="has-header">
<p></p>
<a href="mandalas.html">
	<img src="/content/assets/mandalas/900x900.png" class="header" /></a>
Mandalas generated with Tonči Juričev-Grgin's method.<!--'--><br />
Algorithm, examples, etc. <a href="mandalas.html">inside</a>.<br />
Videos of more complex mandalas over at
  <a href="https://www.youtube.com/watch?v=D2Xk6O9x-yk&list=PL3chI5PWwNA_c1nG57ittUq4op7ZmIveC">YouTube</a>
  <a href="https://www.youtube.com/watch?v=D2Xk6O9x-yk&list=PL3chI5PWwNA_c1nG57ittUq4op7ZmIveC">FAB(youtube)</a>.<br />
<p></p>
</div>


<div class="has-header">
<p></p>
<a href="wiggly-circle.html">
	<span class="header" id="wiggly-circle-header"></span>
	<img src="/content/assets/wiggly-circle/output_r0_lines_2x_w1.5.png" class="header" style="opacity: 0;" /></a>
Winding wiggly oft-colourful mostly-circles.<br />
Inspired by <a href="//inconvergent.net">Inconvergent</a>'s <a href="//twitter.com/inconvergent/status/1122463283586510848">"path test"</a>.<br /><!--'-->
The code and more circles <a href="wiggly-circle.html">inside</a>.<br />
<p></p>
</div>


</span>
BOILERPLATE_END()
