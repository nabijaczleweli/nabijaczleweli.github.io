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


<!-- RSS_PUB_DATE: "Sat, 10 Jun 2023 18:25:29 +0200" -->


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
#define IMAGUS(i1, o1, i2, o2)                                                                                                       \
  <center class="grid-by-each continued">                                                                             FORCED_NEWLINE \
     <a href=STR(httpsCOLON_SLASH_SLASH##o1)><img class="grid-by-each" src=STR(httpsCOLON_SLASH_SLASH##i1) /></a><!-- FORCED_NEWLINE \
  --><a href=STR(httpsCOLON_SLASH_SLASH##o2)><img class="grid-by-each" src=STR(httpsCOLON_SLASH_SLASH##i2) /></a>     FORCED_NEWLINE \
  </center>
#define ONE_IMAGUS(i1, o1)                                                                                        \
  <center class="grid-by-each continued">                                                                         \
     <a href=STR(httpsCOLON_SLASH_SLASH##o1)><img class="grid-by-each" src=STR(httpsCOLON_SLASH_SLASH##i1) /></a> \
  </center>
#define NO_IMAGUS() \
  <center class="grid-by-each continued"></center>



<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"

details {
	margin-top: 1em;
}

center {
	margin-top: 2em;
}


ol li ol {
  list-style-type: lower-greek;  /* can't seem to get a functional 6.1., so this will have to do */
}
ol li ol li ol {
  list-style-type: gujarati;
}


.grid-by-each {  /* derived from 009-XEROX-SIGMA-9-balls */
	width: 100%;
	line-height: 0;
}

.grid-by-each > * {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}
</style>

<script>
window.addEventListener("load", function() {
	Array.from(document.getElementsByTagName("button")).forEach(function(butt) {
		var all = Array.from(document.getElementsByTagName(butt.attributes["toggle-tag"].value));
		var cur = true;
		butt.addEventListener("click", function() {
			cur = !cur;
			all.forEach(butt.attributes["toggle-tag"].value == "details" ? function(el) { el.open = cur; } : function(el) { el.hidden = !cur; });
		});
	});
});
</script>


MAIN_HEADING(My answer to the replication crisis)
<span class="roboto">

<p>
	Latest replication: REPLICATION(2023-06-10, cohost.org/nabijaczleweli/post/1658603-this-user-is-like)</a>.
	<button toggle-tag="details">Toggle all</button>
	<button toggle-tag="center" >Toggle images</button>
</p>


IMAGUS(staging.cohostcdn.org/attachment/833db54b-f39d-4278-998d-167856b153cb/DSC_2655a.JPG, cohost.org/nabijaczleweli/post/1619105-one-day-they-ll-inve,
       staging.cohostcdn.org/attachment/81fc99fc-d95a-4cd4-b69d-5eed4470c701/DSC_2656.JPG,  cohost.org/nabijaczleweli/post/1619105-one-day-they-ll-inve)
<details open>
	SUMMARY(dumpy, Steamed dumpling)

	<p class="continuing">
		<a href="//youtu.be/kwx-qZd9Epw">Home version of big steamed dumplings learn to do this, soft and chewy
		                                 (<span lang="zh-CN"><!--"-->家庭版大蒸饺学会这样做，柔软筋道不破皮不漏馅，适合新手【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-06-04, cohost.org/nabijaczleweli/post/1619105-one-day-they-ll-inve),
		           REPLICATION(2023-06-06, cohost.org/nabijaczleweli/post/1636148-actually-fun-moment),
		           REPLICATION(2023-06-08, cohost.org/nabijaczleweli/post/1647533-dzia-zy),
		           REPLICATION(2023-06-10, cohost.org/nabijaczleweli/post/1658603-this-user-is-like):</p>
	<ol class="continuation">
		<li>NUM(500g) of flour. NUM(3g) of salt, mix</li>
		<li>flock in NUM(150g) of boiling water in one half</li>
		<li>flock in NUM(150g) of cold water in the other half</li>
		<li>drizzle oil, knead roughly</li>
		<li>he sleeps for NUM(10min), knead, he sleeps hidden for NUM(30min)</li>
		<li>halve, roll out each into thick cylinder, divide each into NUM(~12), flatten each directly, hide</li>
		<li>for each guy: flatten directly, roll out radially, deploy NUM(3) spoons of filling, close, deploy on boiling water for NUM(10min) –
		    small scoops maybe? or my potatoes are small</li>
	</ol>
	<p class="continuing">with a spec gloop of</p>
	<ol class="continuation">
		<li>big potato and carrot grated long, washed twice in cold water, blanched for NUM(30s), extracted into cold water, squeezed, roughly shredded</li>
		<li>half a sweet pepper and some green onion shredded</li>
		<li>ginger, thirteen spices, bullion cube, salt</li>
		<li>pour hot oil overtop, stir</li>
	</ol>
</details>


IMAGUS(staging.cohostcdn.org/attachment/2e864867-f252-4c51-9ea4-126fd8e1a5e9/DSC_2637a.JPG, cohost.org/nabijaczleweli/post/1534159-idk-whose-home-town,
       staging.cohostcdn.org/attachment/bb5f12d8-8cd5-47a2-980e-55501950da44/DSC_2635a.JPG, cohost.org/nabijaczleweli/post/1534159-idk-whose-home-town)
<details open>
	SUMMARY(brown-sugar-shortbread, Old-fashioned brown sugar short-bread)

	<p class="continuing">
		<a href="//youtu.be/wzMPdyUy99g">Hometown gourmet brown sugar shortbread, step-by-step explanation
		                                 (<span lang="zh-CN"><!--"-->家乡美食红糖酥饼，步骤详细讲解，酥脆香甜不用出去买【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-21, cohost.org/nabijaczleweli/post/1534159-idk-whose-home-town):</p>
	<ol class="continuation">
		<li>NUM(500g) of flour. NUM(1g) of yeast, NUM(1g) of baking soda, mix – I ended up wanting like half a hand more</li>
		<li>flock in NUM(125g) of sesame oil, rub together in hands for full dispersal</li>
		<li>flock in NUM(200g) of like NUM(40°) water</li>
		<li>knead roughly, he sleeps in a bag for NUM(10min), shortly knead smooth, he sleeps hidden for NUM(30min)</li>
		<li>gloop Ш: NUM(100g) of flour, NUM(65g) of sesame oil – I again needed a half-spoon to get the desired thick consistency</li>
		<li>gloop Ё: NUM(100g) of flour, a few grams of water, mix, NUM(250g) of brown sugar, mix –
		    hers is absolutely sodden and very dark; mine isn't and I don't think it'<!--'-->s available here; you need a reasonably wet-adsorbed gloop for it to set</li>
		<li>flatten the dough directly, roll out rectangularly –
		    keep in mind the post-cylindrisation aspect to be relatively square instead of long;
		    I did it essentially the same aspect as for <a href="#flower-rolls">flower rolls</a> because it'<!--'-->s a happy one for the table and it was too wide</li>
		<li>spackle gloop Ш</li>
		<li>roll into tight cylinder, even out diameter</li>
		<li>cut into NUM(8) guys, hide</li>
		<li>for each guy:
			<ol class="continuing">
				<li>pull into hand-sized roughly-equal-thickness hemisphere</li>
				<li>deploy three spoons of gloop Ё</li>
				<li>close like a bun, but really press it</li>
				<li>spin around weld-side down to enforce the ass</li>
			</ol>
		</li>
		<li>for each guy:
			<ol class="continuing">
				<li>spin around ass-down, flatten directly</li>
				<li>roll out and quarter-turn thrice</li>
				<li>flip</li>
				<li>roll out and quarter-turn more than thrice – you really can'<!--'-->t go too thin but you can go too thick</li>
				<li>deploy ass-down on hot oiled leccy pan, brush with oil</li>
				<li>flip when bottom brown</li>
				<li>flip when bottom brown</li>
				<li>flip when bottom browner – "<!--"-->overall NUM(8-9min)<!--"-->" was about right for me</li>
			</ol>
		</li>
	</ol>
</details>


IMAGUS(staging.cohostcdn.org/attachment/7339792a-7d19-4344-acc1-4f0b2f928cef/DSC_2647.JPG,  cohost.org/nabijaczleweli/post/1538182-yes-im-still-working,
       staging.cohostcdn.org/attachment/64a8b45c-13e5-4a1f-8bcc-1564da55fcd5/DSC_2630a.JPG, cohost.org/nabijaczleweli/post/1525544-okay-thats-kinda-pog)
<details open>
	SUMMARY(pumpkin-hanamaki, Pumpkin hanamaki)

	<p class="continuing">
		<a href="//youtu.be/7_VBad4AzWI">Homemade Hanamaki is simple and practical, you can learn it in a minute
		                                 (<span lang="zh-CN"><!--"-->家常花卷简单实用，一分钟就能学会，营养丰富层多柔软【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-17, cohost.org/nabijaczleweli/post/1525544-okay-thats-kinda-pog),
		           REPLICATION(2023-05-22, cohost.org/nabijaczleweli/post/1538182-yes-im-still-working):</p>
	<ol class="continuation">
		<li>half a pumpkin in NUM(4mm) slices, steamed for NUM(20min), blended with water for a loose gloop –
		    I used an NUM(850g) <a href="//cohost.org/nabijaczleweli/post/1512219-this-is-half-a-pumpk">dynia piżmowa</a>,
		    which is just about what her half a pumpkin looked like, but do not be fooled: she did not use the whole half a pumpkin</li>
		<li>define dough over Ш as
			<ol class="continuing">
				<li>NUM(300g) of flour, NUM(2g) of yeast, NUM(1.5g) of baking powder, mixed</li>
				<li>flock in NUM(180g) of like NUM(40°) Ш</li>
				<li>knead, he sleeps for NUM(5min)</li>
			</ol>
		</li>
		<li>dough over the gloop</li>
		<li>dough over water</li>
		<li>roll gloop dough into big NUM(1:2) rectangle – NUM(38×35cm)'<!--'-->s much too thick, NUM(32×55cm) is better</li>
		<li>flour and roll up on a broom handle</li>
		<li>roll water dough to same size</li>
		<li>spray water</li>
		<li>extract the broom rectangle, weld by light rolling</li>
		<li>brush with oil</li>
		<li>roll into tight cylinder, preserving the major dimension</li>
		<li>cut into like NUM(6cm) pieces with something sharp</li>
		<li>for each guy:
			<ol class="continuing">
				<li>squeeze the center third parallel to the cut edges</li>
				<li>squeeze the corners belonging to the same uncut edge together</li>
				<li>twist in opposite direxions and weld on the opposite side to the freshly-formed edge-face</li>
				<li>hide for NUM(20min)</li>
				<li>boil the water, deploy, let rip for NUM(15min), kill the heat and leave alone for NUM(2min)</li>
			</ol>
		</li>
	</ol>
</details>


IMAGUS(staging.cohostcdn.org/attachment/85fc5b38-c64e-4c56-8323-4b6aae087473/1683924925110.JPEG, cohost.org/nabijaczleweli/post/1488951-quite-pog-for-a-brus,
       staging.cohostcdn.org/attachment/6401196b-c17e-478d-9249-9593555e5531/DSC_2615a.JPG,      cohost.org/nabijaczleweli/post/1488951-quite-pog-for-a-brus)
<details open>
	SUMMARY(butter-bread, Butter bread)

	<p class="continuing">
		<a href="//youtu.be/i8fGjFvwNN0?t=441">How to make Haijuan Gourmet'<!--'-->s big white steamed buns with bright surface?
		                                       (<span lang="zh-CN"><!--"-->【面食合集】表面光亮的大白馒头怎么做？蓬松柔软又好吃，看一遍就会做！【海娟美食】<!--"--></span>)</a>,
		at 7:21,
		by Haijuan Food,
		replicated REPLICATION(2023-05-12, cohost.org/nabijaczleweli/post/1488951-quite-pog-for-a-brus),
		           REPLICATION(2023-05-15, cohost.org/nabijaczleweli/post/1504203-remaining-4-5-not-p):</p>
	<ol class="continuation">
		<li>NUM(50g) egg, NUM(260g) of water, NUM(100g) of milk, NUM(20g) of sugar, NUM(4g) of salt, NUM(5g) of yeast, NUM(50g) of corn oil, whisk –
		    olive oil works fine; she doesn't say "warm water" so I used normal and it didn't really rise that well, so;
		    doing all but water and yeast first, then hot water to compensate the cold milk and eggs to a sensible temperature, then the yeast worked well</li>
		<li>whisk in NUM(650g) of flour –
		    again, I needed like NUM(55g) more; she gets a floculent out of the whisking which is very much not what I got; normal stick-based flocking worked better</li>
		<li>knead – "a little longer" is once again sensible</li>
		<li>he sleeps for NUM(40min)</li>
		<li>knead to de-gas, halve, cylindrise both, cut each nine-wise, ballise each</li>
		<li>lay out in three rows, deploy a gloop of clarified butter on two – for lack of clarified, normal worked fine</li>
		<li>flatten each guy directly</li>
		<li>stack column-wise, unbuttered on buttered on buttered</li>
		<li>they sleep covered for NUM(5min)</li>
		<li>for each stack:
			<ol class="continuing">
				<li>flatten directly, flip, flatten directly, &c.</li>
				<li>fold a point on the perimeter to the middle</li>
				<li>repeat NUM(7) times NUM(45°) apart</li>
				<li>hide weld-side down</li>
			</ol>
		</li>
		<li>for each guy:
			<ol class="continuing">
				<li>flatten directly – you want them really quite flat, otherwise the bulk ends up raw</li>
				<li>deploy weld-side down on hot buttered leccy pan</li>
				<li>flatten the edge directly</li>
				<li>brush butter on top –
				    this step I forgor 💀 the first time but then my pan was quite buttered;
				    it's crucial for a good effect if your guys are big and thus don't leave a lot of free butter post-flip</li>
				<li>cover for NUM(1min) – I needed like NUM(1:20) to get even close to the displayed browning level</li>
				<li>flip, let rip for another NUM(2min) – as above; "when both sides are golden brown, it can be out of the pan"</li>
			</ol>
		</li>
	</ol>
</details>


IMAGUS(staging.cohostcdn.org/attachment/284c385d-ab51-470c-9663-5f001f09b2ab/DSC_2617.JPG,  cohost.org/nabijaczleweli/post/1494733-still-very-acceptabl,
       staging.cohostcdn.org/attachment/d8658927-a3d4-4f84-bc06-4d1bb418db20/DSC_2610a.JPG, cohost.org/nabijaczleweli/post/1486924-pog-moment)
<details open>
	SUMMARY(hushi-confexion, Hushi confexion)

	<p class="continuing">
		<a href="//youtu.be/yW85JqGvy7M">Chinese rural specialty delicacy Hushi sugar baker
		                                 (<span lang="zh-CN"><!--"-->中国农村特色美食呼市方糖焙子，从和面到制作油酥很详细，香甜可口还柔软【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-12, cohost.org/nabijaczleweli/post/1486924-pog-moment),
		           REPLICATION(2023-05-14, cohost.org/nabijaczleweli/post/1494733-still-very-acceptabl):</p>
	<ol class="continuation">
		<li>NUM(500g) of flour, NUM(4-5g) of yeast, NUM(2g) of baking powder, NUM(1g) of baking soda, NUM(5g) of sugar, NUM(50g) egg, NUM(20g) of safflower oil, flock
		    – I needed NUM(585g)</li>
		<li>flock in NUM(300g) of like NUM(40°) water</li>
		<li>knead – "needs a little more kneading" is right, needs <em>much</em> more due to the oil</li>
		<li>he sleeps for NUM(30min)</li>
		<li>knead to de-gas, roll cylindrically, cut six-wise, spin each into ball, hide</li>
		<li>NUM(180g) of flour, NUM(150g) of sesame oil, NUM(150g) of sugar, stir – I needed NUM(212g)</li>
		<li>for each guy:
			<ol class="continuing">
				<li>pull into hand-sized hemisphere</li>
				<li>NUM(2-3) spoons of gloop</li>
				<li>close like a bun with a flat top</li>
				<li>spin on counter, weld-side down, to form the ass thereon</li>
				<li>hide</li>
			</ol>
		</li>
		<li>for each guy:
			<ol class="continuing">
				<li>pat sides-on to rectangularise</li>
				<li>roll out long, mostly save the very ends</li>
				<li>correct for wide spots</li>
				<li>flip</li>
				<li>define folding as
					<ol class="continuing">
						<li>fold top edge to bottom third, press lightly</li>
						<li>roll the weld and the uncovered third</li>
						<li>fold the bottom edge to the new top, press strongly</li>
						<li>quarter-turn</li>
					</ol>
				</li>
				<li>folding</li>
				<li>roll out long, mostly save the very ends</li>
				<li>folding</li>
				<li>roll out long, mostly save the very ends</li>
				<li>folding</li>
				<li>flip, roll rectangularly</li>
				<li>hide on tray</li>
			</ol>
			– resist the temptation of doing it <em>super</em> thin, because it takes it very well, but I think it affected the rise a bit
		</li>
		<li>brush all with oil, they sleep covered for NUM(20min)</li>
		<li>sprinkle with sesame and sugar</li>
		<li>bake at NUM(190°) for NUM(20min)</li>
	</ol>

	<p>
		Again, for me the recipe suffers from her flour having, oddly, since she lives in a hotter wetter climate, much more flour per flour
		(the first time I had three hands and three gloops of flour more to get the same consistency on both as she did; second time as above);
		conversely, her sugar is absolutely sodden.
	</p>
</details>


ONE_IMAGUS(staging.cohostcdn.org/attachment/f5fef574-0ada-4e5c-919a-526285cfee9d/DSC_2596a.JPG, cohost.org/nabijaczleweli/post/1465853-this-is-the-only-one)
<details open>
	SUMMARY(onion-pancake, Green onion pancake)

	<p class="continuing">
		<a href="//youtu.be/i8fGjFvwNN0?t=886">How to make Haijuan Gourmet'<!--'-->s big white steamed buns with bright surface?
		                                       (<span lang="zh-CN"><!--"-->【面食合集】表面光亮的大白馒头怎么做？蓬松柔软又好吃，看一遍就会做！【海娟美食】<!--"--></span>)</a>,
		at 14:46,
		by Haijuan Food,
		replicated REPLICATION(2023-05-08, cohost.org/nabijaczleweli/post/1465853-this-is-the-only-one):</p>
	<ol class="continuation">
		<li>"small bowl" of flour – my similarly-profiled and probably-similarly-sized bowl came out to NUM(488g)</li>
		<li>twice that many bolws of water – NUM(1470g)</li>
		<li>salt, NUM(3) eggs</li>
		<li>handful of a green onion – came out to NUM(~50g) of szczypiorek</li>
		<li>whisk</li>
		<li>for each guy:
			<ol class="continuing">
				<li>brush oil on a hot pan</li>
				<li>some mixture, roll to spread</li>
				<li>when it sets a bit (changes colour?), drizzle oil</li>
				<li>when it gets a bubble in the middle, flip</li>
				<li>when it gets a bubble in the middle, roll around</li>
				<li>roll around again within the minute</li>
				<li>flip after just a little fried</li>
				<li>extract after NUM(10s)</li>
			</ol>
		</li>
	</ol>

	<p>
		Unclear what the hell happened, but she appears to be doing these on a well-maintained casting; it turned out all my normal-sized plastic pans are apparently ass.
		Similarly, it appeared impossible to <em>not</em> get something much thicker than what she got,
		with reduced volumes just yielding smaller pancakes of a constant depth.
		Except for like three, none of them behaved at all.
		The surface didn'<!--'-->t really change colour to yellower in the same way that hers did;
		it did get a bubble in the middle, but it was only sufficiently stable to flip when either
		(a) never because it burned on the ass pan, or (b) it was already quite fried, and hers were still white at this time.
	</p>
</details>


IMAGUS(staging.cohostcdn.org/attachment/fdb67946-b1d1-4696-8450-585f0aceda59/DSC_5798.JPG, cohost.org/nabijaczleweli/post/1461465-okay-thats-some-pret,
       staging.cohostcdn.org/attachment/257ba15e-667f-44d0-badd-72b305e2f51d/DSC_5806.JPG, cohost.org/nabijaczleweli/post/1461581-dry-heat-cels-seethi)
<details open>
	SUMMARY(buns, Buns)

	<p class="continuing">
		<a href="//youtu.be/tghGkiw8feU">From snacks to big sauced meat buns, the skin is thin and the stuffing is big and soft
		                                 (<span lang="zh-CN"><!--"-->从小吃到大的酱肉包子，皮薄馅大又暄软，不塌陷不回缩【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-07, cohost.org/nabijaczleweli/post/1461715-goated-gloop-as-well):</p>
	<ol class="continuing">
		<li>NUM(300g) of like NUM(40°) water, NUM(4g) of yeast, NUM(5g) of sugar, stir to suspend</li>
		<li>flock in NUM(500g) of flour</li>
		<li>NUM(10g) of lard – I used hog fat from <a href="#leek-cake">last time</a>, worked very well</li>
		<li>knead, he sleeps sleep in the bowl until he doubles in size –
		    I was gonna try the usual NUM(40min), but I made and cooled the gloop in this time for NUM(100min); still worked well</li>
		<li>knead to de-gas, roll into cylinder, divide NUM(16) ways</li>
		<li>for each guy: spin him flat, ballify him, hide under plastic – or some magical plastic that doesn'<!--'-->t stick to it, because the one I had did</li>
		<li>for each guy: flatten directly, roll out radially (somewhere in the vicinity of upward of NUM(2mm)) leaving a thicker area for the ass in the middle, re-hide –
		    I misunderstood the video, and did this individually before packing each bun;
		    worked fine tho;
		    it really does help to have something that'<!--'-->s mostly round</li>
		<li>for each guy: get him on your off-hand, center over the kuckles, NUM(3-4) spoons of gloop and squish it, close it, spin around to enforce the ass,
		    deposit on paper in basket –
		    this may've been because I've never shut up a bun before so I didn'<!--'-->t really know how I usually liked,
		    or that I need mechanical assitance to bend my hand that way, or w/e, but I got in NUM(2-3) spoons at most; operator error</li>
		<li>they sleep there covered for NUM(10min) –
		    they only grow a bit sideways while sleeping but much more when steaming; I knew this and still put them too close together</li>
		<li>boil the water, let rip for NUM(15min), kill the heat and leave alone for NUM(3min), extract</li>
	</ol>
	<p class="continuing">with a spec gloop of</p>
	<ol class="continuation">
		<li>NUM(2)(?) handfuls of pokchois, blanched in water with olive oil for NUM(1min), dumped in ice water, squeezed dry, shredded –
		    idk how I'<!--'-->d get pokchois, so I used what came out to NUM(473g) of kapusta pekińska ("napa cabbage" apparently), and I had lower cook volume so NUM(2min),
		    and that behaved like hers did</li>
		<li>"a few washed shiitakes", thick cuboidsed, same cooking –
		    looks like NUM(7) big ones; all the shrooms I had on hand was NUM(30g) of dried shiitakes, and those, re-wetted, worked fine in here,
		    compensated with more leeks and that worked</li>
		<li>big tall pan, considerable volume of oil, a "dozen peppercorns", NUM(1) star anise pod, fried until the pepper changes colour, plants removed –
		    my pepper does not look like hers, unclear to me what I'<!--'-->d call what she put in there</li>
		<li>chopped ginger – similar quantity to <a href="#leek-cake">last time</a> was a tad small –
		    and all but half a handful of two medium-but-all-white-bit-leeks(?), halved length-wise and shredded, until they change colour</li>
		<li>minced hog (but not too fine), fried until mostly-cooked –
		    NUM(800g) was about right proportionally,
		    but seemed leaner or drier than what she had, so compensated with remainder of the hog fat from <a href="#leek-cake">last time</a>,
		    and the commercial stuff I got was in extrusions and pre-cutting them to like NUM(1.5cm) worked to get a similar granulation to what she has</li>
		<li>pepper, "bean paste" (miso?), soy sus, oyster sus, salt, "chicken essence" (bit of a boullion cube?), fry to fully cook and disperse the colour –
		    one and a most of a NUM(15g) miso packet was too little for this much schmeat; fish sus worked well I think; half a "strong" boullion cube</li>
		<li>the shiitakes, keep frying for NUM(1min), extract, cool</li>
		<li>the blanched pokchois, rest of the leek, mix</li>
	</ol>

	<p>
		Quite easy (sans the wrapping, but the first pieróg you wrapped also looked like ass and now you can do them without looking, so);
		the lard in the dough is magic.
	</p>
</details>


IMAGUS(staging.cohostcdn.org/attachment/e7e450f2-e151-42ab-977c-d8395e05154a/DSC_5775.JPG, cohost.org/nabijaczleweli/post/1440206-leek-multi-laye,
       staging.cohostcdn.org/attachment/660e5669-4349-4236-907a-dcec6f5c8003/DSC_5778.JPG, cohost.org/nabijaczleweli/post/1440206-leek-multi-laye)
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


NO_IMAGUS()
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


IMAGUS(staging.cohostcdn.org/attachment/ca893d84-f5a0-4e68-8d59-25caa7553def/DSC_2584.JPG, cohost.org/nabijaczleweli/post/1434488-okay-these-ones-rose,
       staging.cohostcdn.org/attachment/4cac1ee0-9abc-447d-ad26-bf841e4f6a2a/DSC_2571.JPG, cohost.org/nabijaczleweli/post/1413956-okay-these-are-pog-c)
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
				<li>spin him flat – thus averaging the crust that'<!--'-->s inevitably developed</li>
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


IMAGUS(staging.cohostcdn.org/attachment/685d38a2-808b-4136-85f5-be6813691c20/1682517987967.JPEG, cohost.org/nabijaczleweli/post/1397956-she-call-me-her-grat,
       staging.cohostcdn.org/attachment/3bb8cd24-0ff4-40e8-8b0f-a554a2cf6714/1682517987996.JPEG, cohost.org/nabijaczleweli/post/1397956-she-call-me-her-grat)
<details open>
	SUMMARY(wężymorda, Gratin de salsifis)

	<p class="continuing">
		<a href="//www.swissmilk.ch/fr/recettes-idees/recettes/LM200711_21/gratin-de-salsifis/">Gratin de salsifis</a>,
		by swissmilk,
		replicated REPLICATION(2023-04-26, cohost.org/nabijaczleweli/post/1397956-she-call-me-her-grat):</p>
	<ol class="continuation">
		<li>water, salt, and lemon juice in pot</li>
		<li>peel NUM(1kg) of salsifis under the tap, trim to NUM(15cm)ish bits, directly into pot</li>
		<li>boil NUM(15-20min) – until relatively not super hard</li>
		<li>drain and replace with cold water</li>
		<li>butter a baking dish – an oval NUM(130×185) one was a bit small for a NUM(500g)-scaled batch and it got filled instead of getting two layers</li>
		<li>lay out the salsifis, wrap the top-most layer in ham</li>
		<li>NUM(300ml) of "half-cream", pepper, half a small spoon each of salt and paprika are poured over and down –
		    I used 18% and had to push it down a bit, maybe wants 12% or something</li>
		<li>grate gruyère and dump some cut hazelnuts on top – smashed works too</li>
		<li>bake at NUM(220°) for NUM(20-25min) – ideally you wanna get colour on the ham, but not burn the cheese</li>
	</ol>
</details>


IMAGUS(staging.cohostcdn.org/attachment/c1132df0-720c-4f9b-9859-aa533b959935/DSC_2539.JPG, cohost.org/nabijaczleweli/post/1341136-he-is-risen-to-an-un,
       staging.cohostcdn.org/attachment/87a35886-38b0-4092-b95d-b5940b45780d/DSC_2554.JPG, cohost.org/nabijaczleweli/post/1383268-who-need-they-brussy)
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


IMAGUS(pbs.twimg.com/media/FUmcYBvXwAA78H5?format=jpg&name=4096x4096, twitter.com/nabijaczleweli/status/1533929176725594118,
       pbs.twimg.com/media/Ff6s7wOX0AQGK5f?format=jpg&name=4096x4096, twitter.com/nabijaczleweli/status/1584894789878587392)
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
