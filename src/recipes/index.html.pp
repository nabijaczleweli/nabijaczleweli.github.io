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
#define REPLICATION(date, url) <a href=STR(httpsCOLON_SLASH_SLASH##url)>NUM(date)</a>
#define PREPLICATION(date)     NUM(date)

#define HEADING_LINK(id)  <a class="hash-link" href=STR(HASH##id)>HASH</a>
#define SUMMARY(hid, ...) <summary id=STR(hid) class="roboto-unscale" style="font-weight: bold;">HEADING_LINK(hid)__VA_ARGS__</summary>



<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"

details {
	margin-top: 1em;
}
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
	Latest replication: REPLICATION(2023-05-03, cohost.org/nabijaczleweli/post/1440206-leek-multi-laye)</a>.
	<button id="togglupa">Toggle all</button>
</p>

<details open>
	SUMMARY(leek-cake, Leek multi-layer cake)

	<p class="continuing">
		<a href="//youtu.be/2rNbXgnnyQg">Leek multi-layer cake is delicious and no skill
		                                 (<span lang="zh-CN"><!--"-->韭菜多层饼好吃无技巧，层层有饼层层有馅，咸香味美满嘴香！【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-03, cohost.org/nabijaczleweli/post/1440206-leek-multi-laye):</p>
	<ol class="continuing">
		<li>NUM(500g) of flour, NUM(~2g) of salt, flock with NUM(150g) of boiling water then NUM(130g) of normal</li>
		<li>NUM(60g) egg – I had good results with an uncompensated NUM(70g) one</li>
		<li>knead via pulling</li>
		<li>roll into cylinder, cut into NUM(8) guys, spin each guy flat then ball him; they all sleep on a tray for NUM(1h), oiled and plasticked</li>
		<li>with oiled counter, stick, and hands, roll each guy into like a NUM(2:5) rectangle</li>
		<li>"not too thin", but you do want it quite thin, presumably the difference here is "not paper-thin"</li>
		<li>dispense gloop, omit NUM(~1-1.5cm) from the edge, fold thrice (NUM(4) sections), roll and press the loose ends toward the face with the last fold</li>
		<li>these go on a hot oiled leccy pan, weld side down, NUM(~1min) on the first side until they set, then flip 1/min for NUM(~6min) total –
		    filling ought to be visible from the edges here but may not be if the dough's thick and you don't have much contrast in the gloop</li>
	</ol>
	<p class="continuing">with a spec gloop of</p>
	<ol class="continuing">
		<li>cold fried minced hog</li>
		<li>minced ginger, "dark soy" (miso?), soy sus, thirteen spices, "chicken essence" (bit of a boullion cube?), oyster sus, salt</li>
		<li>rough-chopped scallions</li>
	</ol>
	<p class="continuing">and I had good (if lightly-loaded, wants more matter) results with</p>
	<ol class="continuation">
		<li>NUM(400g) of fried minced hog, most fat drained</li>
		<li>most of the white bit of a leek</li>
		<li>most of a big shallot</li>
		<li>half a big carrot</li>
		<li>a forefinger'<!--'-->s worth of ginger – go for the first two knuckles (or more meat) next time</li>
		<li>a NUM(15g) miso packet</li>
		<li>soy sus, fish sus, salt</li>
	</ol>
</details>

<details open>
	SUMMARY(topinambur-cream-soup, Topinambur cream soup)

	<p class="continuing">
		Top-most recipe from
		<a href="//www.ugotowanepozamiatane.pl/top-5-potraw-topinambur/">Top 6 najlepszych przepisów na topinambur</a>,
		by Ugotowane, Pozamiatane,
		replicated PREPLICATION(2023-05-01):</p>
	<ol class="continuation">
		<li>NUM(1kg) of topinambur, NUM(1l) of milk, boil until "soft", and normal potato heuristics work –
		    I had closer to NUM(700g) so everything'<!--'-->s scaled appropriately, with a small turmeric to generate the piss colour</li>
		<li>drain of milk, put in NUM(1l) of boullion, NUM(100ml) of amaretto, a gloop of maple syrup, big pinch each of nutmeg, salt, and pepper</li>
		<li>NUM(500ml) of NUM(36%) cream – this would be unbearably fat. for the scaled amount I used a NUM(400g) bucket of NUM(12%) and that worked well</li>
		<li>blend</li>
	</ol>
</details>

<details open>
	SUMMARY(corn-freamed-buns, Corn freamed (fried steamed) rolls (buns), rose-shaped)

	<p class="continuing">
		<a href="//youtu.be/7tZEh6uzcOo">Cornmeal for rolls? Easy to make fluffy and soft
		                                 (<span lang="zh-CN"><!--"-->玉米面不蒸馒头做花卷？蓬松柔软做法简单，全程无难度【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-04-29, cohost.org/nabijaczleweli/post/1413956-okay-these-are-pog-c),
		           REPLICATION(2023-05-02, cohost.org/nabijaczleweli/post/1433335-little-secondary-ris),
		           REPLICATION(2023-05-02, cohost.org/nabijaczleweli/post/1434488-okay-these-ones-rose):</p>
	<ol class="continuation">
		<li>NUM(200g) of <a href="//cohost.org/nabijaczleweli/post/1404618-this-user-just-got">corn</a>,
		    flock with NUM(200g) of boiling water,
		    let cool until not hot to second knuckle – with the eggs you want to get a good yeast temp</li>
		<li>NUM(3g) of yeast, spoon of sugar, two eggs – mine are NUM(~70g)</li>
		<li>NUM(200g) of flour – maybe my eggs are huge, maybe idk, but starting with NUM(250g) and likely adding slightly more to get to a reasonable "dough" consistency
		    — instead of a paste, which doesn'<!--'-->t rise; the spec is to <em>maybe add water</em> which is insane to me —
		    worked for me to avoid the REPLICATION(2023-05-02, cohost.org/nabijaczleweli/post/1433335-little-secondary-ris) incident again</li>
		<li>flock, accrue, knead in bowl for NUM(5min), he sleeps in the covered bowl for NUM(40min)</li>
		<li>knead a bit on floured counter to de-gas, roll into cylinder, cut into NUM(~12) guys –
		    there's a critical mass above which they won't re-rise(?), and NUM(9) left them too big
		    (again, REPLICATION(2023-05-02, cohost.org/nabijaczleweli/post/1433335-little-secondary-ris)),
		    NUM(13) and NUM(12) worked very well, and she does NUM(12)</li>
		<li>for each guy:
			<ol>
				<li>spin spin him flat – thus averaging the crust that'<!--'-->s inevitably developed</li>
				<li>cylindrise, flatten, roll out long –
				    you want a high aspect ratio and relatively thin;
				    if he sticks to the counter then unstick him, flour the counter, and zoom him around so he'<!--'-->s free for the next step</li>
				<li>start a cut through the middle NUM(~.5-1cm) from one edge, and through the other</li>
				<li>"braid him like a braid", i.e. keep passing one over the other,
				                                   keep the top-facing faces facing the top and the counter-facing faces facing the counter</li>
				<li>at the end, weld the halves together again – the best-kept secret here is that no matter how badly you do any of this it'<!--'-->ll turn out great</li>
				<li>flip (dry side up wet side down now),
				    roll from the welded bit to the uncut bit,
				    stick the tongue that'<!--'-->s left to the side, may need water assist</li>
				<li>ass-down spin him around a bit to ensure flat perpendicular ass</li>
				<li>hide under a cover</li>
			</ol>
			  – this took me like NUM(50) minutes the first time, and like NUM(40) the third
			</li>
		<li>oil a pan, lay them there, they sleep covered for NUM(15min)</li>
		<li>crank to medium for three minutes –
		    maybe her leccy pan is more powerful than my stove, I need like NUM(1min) on 9 then NUM(4min) on 6,
		    you'<!--'-->re shooting for a well-developed brown crust on the ass</li>
		<li>pour water NUM(⅓)<sup>rd</sup> way up – the guys? the pan? idk. – kill the heat, they steam until the water gets sucked off (NUM(~10min))</li>
	</ol>

	<p>
		These came out just about perfect REPLICATION(2023-04-29, cohost.org/nabijaczleweli/post/1413956-okay-these-are-pog-c),
		but the water level is finnicky, and pouring in more and turning the heat back on turns out badly for me
		(stuck to bottom; REPLICATION(2023-05-02, cohost.org/nabijaczleweli/post/1433335-little-secondary-ris),
		                  REPLICATION(2023-05-02, cohost.org/nabijaczleweli/post/1434488-okay-these-ones-rose)).
		Maybe this is easier if you have a plastic pan the right size, but my biggest (NUM(Φ245)) is stainless (but the right size).
		Operator error.
	</p>
</details>

<details open>
	SUMMARY(flower-rolls, Flower rolls (round steamed bread with an oil))

	<p class="continuing">
		<a href="//youtu.be/hpYrnQiGd6w">Homemade flower rolls are delicious and no skills, suitable for novice making
		                                 (<span lang="zh-CN"><!--"-->家常花卷好吃无技巧，松软白亮方法简单，适合新手制作【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-04-15, cohost.org/nabijaczleweli/post/1341136-he-is-risen-to-an-un),
		           REPLICATION(2023-04-23, cohost.org/nabijaczleweli/post/1383268-who-need-they-brussy):</p>
	<ol class="continuation">
		<li>NUM(500g) of flour,
		    NUM(4g) of yeast,
		    spoon of sugar,
		    flock with NUM(300g) of NUM(40°) water,
		    accrue,
		    knead in bowl for NUM(5min),
		    he sleeps in the covered bowl for NUM(40min)</li>
		<li>knead a bit on floured counter to de-gas, roll into cylinder, cut at NUM(⅖)<sup>th</sup>s or like a NUM(⅓)<sup>rd</sup></li>
		<li>both parts (small first, big goes around it):
			<ol>
				<li>flatten, roll out rectangularly –
				    the major dimension will inform the output NUM(Φ), but it'<!--'-->s relatively forgiving,
				    and you can shorten and obversely elongate segments as required</li>
				<li>thoroughly brush with oil – it "had better be cooked"; olive and a smelly one are fine, blank kujawski sucks</li>
				<li>stochastically dust with dry flour a bit –
				    unclear what this achieves, the splotches achieved don'<!--'-->t form a coherent layer and are not enough to influence adhesion in any way</li>
				<li>roll tightly into a cylinder, preserving the major dimension</li>
				<li>make sure it's not stuck and won't easily stick to the counter</li>
				<li>cut <em>most</em> of the way through every NUM(~3cm) – you wanna leave like two layers alone</li>
				<li>push down stick A on an edge segment, then stick B on the next one, and squeeze them downward and together, thus exposing the internal edges</li>
				<li>apply stick C similarly on the subsequent segment, and squeeze it downward and together with stick B, then free stick A</li>
				<li>repeat through-out all the segments</li>
				<li>assemble into a circle in situ in a papered steamer</li>
			</ol>
		</li>
		<li>give him half a date – this is life advice</li>
		<li>put the steamer on the pot, he sleeps for NUM(10min)</li>
		<li>boil the water, then let rip for NUM(15min), kill the heat and leave alone for NUM(3min), extract</li>
	</ol>

	<p>
		The title'<!--'-->s right: suitable for completely inept imbeciles like me. 0 failure 0 technique.
	</p>
</details>

<details open>
	SUMMARY(bubliki, Бублики)

	<p class="continuing">
		Originally derived from
		<a href="//youtu.be/PPHy_1R7Xu4">Making the slavic bagel</a>,
		by Life of Boris.
		First replicated
		REPLICATION(2022-06-06, twitter.com/nabijaczleweli/status/1533929176725594118),
		but this was my sole bread in-take for the
		REPLICATION(2022-07-06–2022-10-28, twitter.com/nabijaczleweli/status/1584894789878587392)
		period (at which point I sustained multiple hand wounds, which don'<!--'-->t really cooperate well with this):</p>
	<ol class="continuation">
		<li>NUM(~400g) of flour,
		    NUM(~100g) of water,
		    NUM(2) eggs,
		    NUM(1) spoon of malt,
		    NUM(1) small spoon of salt,
		    yeast;
		    knead, adding flour until dry</li>
		<li>ballify like six-wise and let rip for a bit – my notes just say "let rip", natch; cover with a rag, spray with water; either half an hour or an hour</li>
		<li>unstick, gently skrungle and expand the hole in the middle, boil each guy NUM(30s)/side, flip once –
		    you probably wanna dump some salt and the remaining flour to the medium;
		    I do two at a time, whereupon they move to a plate and new guys enter, the plate ones get doused in salt/sesame/poppy, and</li>
		<li>why do they call it oven when you of in the cold food of out the NUM(~185°) for NUM(15-40min) –
		    harder flours rise less and need longer, full-pump white is the lower bound here</li>
	</ol>
</details>


</span>
BOILERPLATE_END()
