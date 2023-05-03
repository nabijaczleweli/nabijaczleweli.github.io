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


<!-- RSS_PUB_DATE: "Wed, 3 May 2023 23:16:48 +0200" -->


#define STYLESHEETS MAIN_HEADING_STYLE FONTAWESOME_LINK                                               FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet" />                      FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet" />                       FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/MathJax-font.css" rel="stylesheet">        FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />
BOILERPLATE(Recipes, My answer to the replicaiton crisis, en-GB, STYLESHEETS)

#define NUM(...) <span class="roboto-unscale math-font-normal">__VA_ARGS__</span>


<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../indent.css"
</style>

<script>
window.addEventListener("load", function() {
	var all = Array.from(document.getElementsByTagName("details"));
	var cur = true;
	document.getElementById("togglupa").addEventListener("click", function() {
		cur = !cur;
		all.forEach(function(el) {
			el.open = cur;
		});
	});
});
</script>


MAIN_HEADING(My answer to the replication crisis)
<span class="roboto">

<p>
	Latest replication: <a href="https://cohost.org/nabijaczleweli/post/1440206-leek-multi-laye">NUM(2023-05-03)</a>.
	<button id="togglupa">Toggle all</button>
</p>

<details open>
	<summary class="merriweather roboto-unscale">Leek multi-layer cake</summary>

	<p class="continued">
		<a href="//youtu.be/2rNbXgnnyQg">Leek multi-layer cake is delicious and no skill</a>,
		by Haijuan Food,
		replicated <a href="https://cohost.org/nabijaczleweli/post/1440206-leek-multi-laye">NUM(2023-05-03)</a>:</p>
	<ol class="continuing">
		<li>NUM(500g) of flour, NUM(~2g) of salt, flock with NUM(150g) of boiling water then NUM(130g) of normal</li>
		<li>NUM(60g) egg – I had good results with an uncompensated NUM(70g) one</li>
		<li>knead via pulling</li>
		<li>roll into cylinder, cut into NUM(8) guys, spin each guy flat then ball him; they all sleep on a tray for NUM(1h), oiled and plasticked</li>
		<li>with oiled counter, stick, and hands, roll each guy into like a NUM(2:5) rectangle</li>
		<li>"not too thin", but you do want it quite thin, presumably the difference here is "not paper-thin"</li>
		<li>dispense gloop, omit NUM(~1-1.5cm) from the edge, fold thrice, roll and press the loose ends toward the face with the last fold</li>
		<li>these go on a hot oiled leccy pan, weld side down, NUM(~1min) on the first side until they set, then flip 1/min for NUM(~6min) total –
		    filling ought to be visible from the edges here but may not be if the dough's thick and you don't have much contrast in the gloop</li>
	</ol>
	<p class="continuing">with a spec gloop of</p>
	<ol class="continuing">
		<li>cold fried minced hog</li>
		<li>minced ginger, "dark soy" (miso?), soy sus, thirteen spices, "chicken essence" (bit of a bullion cube?), oyster sus, salt</li>
		<li>rough-chopped scallions</li>
	</ol>
	<p class="continuing">and I had good (if lightly-loaded, wants more matter) results with</p>
	<ol class="continuation">
		<li>NUM(400g) of fried minced hog, most fat drained</li>
		<li>most of the white bit of a leek</li>
		<li>most of a big shallot</li>
		<li>a forefinger'<!--'-->s worth of ginger – go for the first two knuckles (or more meat) next time</li>
		<li>a NUM(15g) miso packet</li>
		<li>soy sus, fish sus, salt</li>
	</ol>
</details>


</span>
BOILERPLATE_END()
