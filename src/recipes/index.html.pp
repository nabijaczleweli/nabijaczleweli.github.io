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
<!-- RSS_UPDATE_DATE: "Sun, 31 Dec 2023 18:43:21 +0100" -->


#define STYLESHEETS MAIN_HEADING_STYLE FONTAWESOME_LINK                                               FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet" />                      FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet" />                       FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/MathJax-font.css" rel="stylesheet">        FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />
BOILERPLATE(Recipes, My answer to the replication crisis, en-GB, STYLESHEETS)

#define NUM(...) <span class="roboto-unscale math-font-normal">__VA_ARGS__</span>
#define REPLICATION(date, url) <a href=STR(httpsCOLON_SLASH_SLASH##url)>NUM(date)</a>
#define PREPLICATION(date)     NUM(date)

#define HEADING_LINK(id)  <a class="hash-link" href=STR(HASH##id)>HASH</a>
#define SUMMARY(hid, ...) <summary class="roboto-unscale" style="font-weight: bold;">HEADING_LINK(hid)__VA_ARGS__</summary>
#define IMAGUS(hid, i1, o1, i2, o2)                                                                                                                   \
  </article>                                                                                                                           FORCED_NEWLINE \
  <article id=STR(hid)>                                                                                                                FORCED_NEWLINE \
  	<center class="grid-by-each continued">                                                                                            FORCED_NEWLINE \
  	   <a href=STR(httpsCOLON_SLASH_SLASH##o1)><img loading="lazy" class="grid-by-each" src=STR(httpsCOLON_SLASH_SLASH##i1) /></a><!-- FORCED_NEWLINE \
  	--><a href=STR(httpsCOLON_SLASH_SLASH##o2)><img loading="lazy" class="grid-by-each" src=STR(httpsCOLON_SLASH_SLASH##i2) /></a>     FORCED_NEWLINE \
  	</center>
#define ONE_IMAGUS(hid, i1, o1)                                                                                                    \
  </article>                                                                                                                       \
  <article id=STR(hid)>                                                                                                            \
  	<center class="grid-by-each continued">                                                                                        \
  	   <a href=STR(httpsCOLON_SLASH_SLASH##o1)><img loading="lazy" class="grid-by-each" src=STR(httpsCOLON_SLASH_SLASH##i1) /></a> \
  	</center>
#define NO_IMAGUS(hid)  \
  </article>            \
  <article id=STR(hid)> \
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
window.addEventListener("DOMContentLoaded", function() {
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
	Latest replication: REPLICATION(2023-12-29, $101010.pl/@nabijaczleweli/111665100080724986)</a>.
	<button toggle-tag="details">Toggle all</button>
	<button toggle-tag="center" >Toggle images</button>
</p>

<article>
IMAGUS(emil-vánočka,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/665/984/649/011/860/original/54a12b070a2f3e3a.jpeg, $101010.pl/@nabijaczleweli/111665995564384100,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/665/985/294/509/492/original/0cb5cd15f13295ad.jpeg, $101010.pl/@nabijaczleweli/111665995564384100)

<details open>
	SUMMARY(emil-vánočka, <a href="//101010.pl/@the_art_of_giving_up@mastodon.social/111637997219976292">Emil'<!--'-->s vánočka</a>)
	<p class="continuing">
		<a href="//www.pottenpannen.cz/recepty-a-rady/adventni-vyzva-prava-ceska-vanocka-podle-josefa-marsalka/">Adventní výzva – Pravá česká vánočka podle Josefa Maršálka</a>,
		by Potten & Pannen - Staněk,
		replicated REPLICATION(2023-12-29, $101010.pl/@nabijaczleweli/111665100080724986):
	</p>
	<ol class="continuation">
		<li>dissolve NUM(20g) of live yeast, NUM(10g) of vanilla sugar, and NUM(100g) of flour in NUM(250g) of milk and leave for NUM(1h) covered with a rag,
		    this will be gloop Ш –
		    I don'<!--'-->t stock live yeast so dry yeast for me, I warmed the milk to like NUM(40°), and it definitely started to leave the bowl,
		    so I'<!--'-->d say prep the rest of the from step 2 and put the bowl on top to explode; definitely no rag</li>
		<li>NUM(400g) of flour, NUM(100g) of sugar, NUM(30g) (NUM(3-4)) of egg yolks, NUM(5g) of salt, NUM(2g) of nutmeg, NUM(1g) of milled anise,
		    the skin of NUM(1) lemon, mix – I was fresh out of lemons, so the skin of NUM(2) mandarins for me</li>
		<li>mix in gloop Ш, knead dough to be smooth and not sticky</li>
		<li>add in NUM(150g) of butter and continue kneading –
		    they recommend machine kneading, and it'<!--'-->s difficult to disagree; this definitely needs a tremendous amount of kneading before and after the butter,
		    much more than I was able to give it at the time</li>
		<li>when it stops sticking and is resilient but elastic, lightly knead in NUM(100g) of golden raisins – cranberries for me</li>
		<li>he sleeps for NUM(~1h) under a rag until tripled in size – this may be because it was underkneaded but this rise didn'<!--'-->t do much for me</li>
		<li>roll out into strips and weave a vánočka onto a baking tray like you usually do, Josef recommends knitting from six strands – 🙄</li>
		<li>leave him to sleep once more to rise well – again, no rise for me</li>
		<li>Form the nut icing by mixing:
			  <ol>
			    <li>NUM(100g) (NUM(3-4) eggs) of whites</li>
			    <li>NUM(60g) of powder sugar</li>
			    <li>NUM(60g) of milled hazelnuts –
			        apparently these are available commercially, but I just pounded some full ones;
			        this meant it never really formed a "paste with consistency" but close enough</li>
			    <li>NUM(1g) of milled cinnamon</li>
			  </ol></li>
		<li>brush it with egg and the nut icing, then sprinkle cut almonds</li>
		<li>start baking at NUM(200°), but bake at NUM(160°) for NUM(30min), validate by prodding with a stick – mine needed NUM(5min) more</li>
	</ol>
</details>

<article>
ONE_IMAGUS(andy-vánočka,
           storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/647/880/463/356/238/original/7938eaee2ded220a.png, $101010.pl/@nabijaczleweli/111647881958561845)

<details open>
	SUMMARY(andy-vánočka, Andy'<!--'-->s vánočka)
	<p class="continuing">
		<!-- https://discord.com/channels/145079846832308224/166565886998609920/1188939034597281842 -->
		Guest recipe from Andy's wife's grandma,
		replicated REPLICATION(2023-12-26, $101010.pl/@nabijaczleweli/111647542784996947):
	</p>
	<ul class="continuing">
		<li>500g flour (ideally low protein content, like 8-9g)</li>
		<li>120g butter</li>
		<li>120g crystal or caster sugar</li>
		<li>3 average egg yolks or 4 small egg yolks</li>
		<li>30g fresh yeast</li>
		<li>5g salt</li>
		<li>250g milk</li>
		<li>1 lemon zest (or actually as much as you like)</li>
		<li>30g almonds (or actually as much as you like)</li>
	</ol>
	<p class="continuation">
		Make the dough by mixing all the ingredients, then let it rise in a bowl for like 60-90 mins. Then roll 9 equally long pieces and form the vianočka. Paint with egg whites, let it rise for another 30 mins or so, then bake at 180C for about 45 mins
	</p>

	<p>
		I don'<!--'-->t stock fresh yeast, and used dry instead; forgot to brush with egg.
	</p>
</details>

<article>
ONE_IMAGUS(challah,
           storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/631/775/273/497/339/original/cc67a40e25cad667.jpeg, $101010.pl/@nabijaczleweli/111631778152035657)

<details open>
	SUMMARY(challah, Chałka (strucla (chałka)))
	<p class="continuing">
		<a href="//stronakuchni.pl/klasyczna-chalka-drozdzowa-na-podwieczorek-tradycyjny-przepis-na-rumiany-wypiek-posyp-ja-makiem-jak-za-dawnych-lat/ar/c17-17861293">Klasyczna chałka drożdżowa na podwieczorek. Tradycyjny przepis na rumiany wypiek. Posyp ją makiem jak za dawnych lat</a>
		by Strona Kuchni,
		replicated REPLICATION(2023-12-23, $101010.pl/@nabijaczleweli/111631778152035657):</p>
	<ol class="continuation">
		<li>prepare a urine sample yesterday by having applied three saffron threads to a spoon of white rum – I don'<!--'-->t think the spirit matters, I had gin to hand</li>
		<li>NUM(15g) of fresh yeast, NUM(90g) of like NUM(40°) water, NUM(20g) of sugar, NUM(1) egg, stir, leave alone for NUM(15min)</li>
		<li>add NUM(25g) of warm butter and mix it in – to… water? I know this is a click-farm and this was probably poorly copied but this is baffling</li>
		<li>NUM(½) of a small spoon of salt, NUM(250g) of flour, knead mostly, add the urine sample, knead fully, he sleeps for NUM(30min)</li>
		<li>knead short, he sleeps for NUM(1h)</li>
		<li>knead to accrue, divide into NUM(5) guys, they sleep for NUM(5-7min) under a rag</li>
		<li>cylindrise each guy NUM(18-20cm) long, plait them together, they sleep for NUM(1h) under a rag – that would have been exceedingly short for me</li>
		<li>brush with yolk, sprinkle poppy, bake at NUM(180°) for NUM(25min)</li>
		<li>cool on rack</li>
	</ol>

	<p>
		This is something I'<!--'-->d call a chałka and mother calls a chałka,
		but polish chałka is sweet with streusel topping,
		and this isn't because it's a chrismas variant,
		so father calls it a strucla which it isn'<!--'-->t,
		or this must be deeply regional counternomenclature.
	</p>
</details>


IMAGUS(ass-yorkshire-pudding,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/450/825/877/321/125/original/20fb7deb1879af31.jpeg, $101010.pl/@nabijaczleweli/111450828098726010,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/495/451/686/471/782/original/7275030b7d7eadd0.jpeg, $101010.pl/@nabijaczleweli/111495453441617318)

<details open>
	SUMMARY(ass-yorkshire-pudding, Yorkshire pudding (bad))
	<p class="continuing">
		<!-- https://discord.com/channels/616404343146414243/659425870204764160/1171880679416537180 -->
		From Donkey Kong,
		replicated REPLICATION(2023-11-16, $101010.pl/@nabijaczleweli/111450828098726010),
		           REPLICATION(2023-11-27, $101010.pl/@nabijaczleweli/111495453441617318):</p>
	<ol class="continuation">
		<li>minimally combine mixed powder Ш (
		    	<ul class="continuing">
		    		<li>NUM(3) cups of flour</li>
		    		<li>NUM(¼) of a cup of sugar</li>
		    		<li>NUM(1) small spoon of salt</li>
		    		<li>NUM(1) spoon of baking powder</li>
		    		<li>NUM(1½) spoons of baking soda</li>
		    	</ul>
		    ) with mixed gloop Ё (
		    	<ul class="continuing">
		    		<li>NUM(1) cup of milk</li>
		    		<li>NUM(¼) of a cup of NUM(5%) vinegar</li>
		    		<li>vanilla</li>
		    		<li>NUM(3) eggs</li>
		    		<li>some cider</li>
		    	</ul>
		    )</li>
		<li>fridge for NUM(1h)</li>
		<li>generously grease a muffin-type tin, heat to NUM(230°), deploy gloop, bake for NUM(20min) – supposed to sizzle on deployment</li>
	</ol>

	<p>
		Doesn'<!--'-->t really work, clearly.
		This is in contrast to what the original photos demonstrated, so maybe this only works in Leicester.
	</p>
</details>


IMAGUS(america-biscuit,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/387/225/452/857/096/original/7d8005acf75fd3a9.jpeg, $101010.pl/@nabijaczleweli/111387230909933378,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/426/200/399/488/287/original/494470d2f12e46a3.jpeg, $101010.pl/@nabijaczleweli/111426205697493973)
<span id="england-biscuit"> <!-- I fucked it and misrembered. kingdom biscuits are actual biscuits!!-->

<details open>
	SUMMARY(america-biscuit, Yankscuit)
	<p class="continuing">
		<a href="//sallysbakingaddiction.com/flaky-buttermilk-biscuits/">Homemade Buttermilk Biscuits (6 Ingredients)</a>,
		by Sally'<!--'-->s Baking Addiction,
		replicated REPLICATION(2023-11-05, $101010.pl/@nabijaczleweli/111364903392394230),
		           REPLICATION(2023-11-06, $101010.pl/@nabijaczleweli/111369410357766527),
		           REPLICATION(2023-11-09, $101010.pl/@nabijaczleweli/111381412838337393),
		           REPLICATION(2023-11-10, $101010.pl/@nabijaczleweli/111387230909933378),
		           REPLICATION(2023-11-14, $101010.pl/@nabijaczleweli/111423249410917412),
		           REPLICATION(2023-11-15, $101010.pl/@nabijaczleweli/111426205697493973),
		           REPLICATION(2023-12-11, $101010.pl/@nabijaczleweli/111562935147889796):</p>
	<ol class="continuation">
		<li>NUM(313g) of flour, NUM(2) spoons of baking powder, small spoon of salt, mix</li>
		<li>cut in NUM(113g) of butter</li>
		<li>NUM(240ml) of buttermilk, NUM(14g) of honey, combine –
		    unclear how you'<!--'-->re supposed to measure the former, but <a href="//pl.wikipedia.org/wiki/Maślanka#Skład_chemiczny">published buttermilk breakdowns</a>
		    and taking just whatever'<!--'-->s NUM(>1%) concentration yields NUM(91% + 3.1%⋅1.35 + 4%⋅1.525) which ends up being around NUM(1.01285g/ml)
		    and agrees with my experimental data, which is close enough to unity to not matter; or like NUM(245g) if you want to split hairs</li>
		<li>flatten to NUM(19mm), fold in third</li>
		<li>flatten to NUM(19mm), fold in third</li>
		<li>flatten to NUM(19mm), fold in third</li>
		<li>flatten to NUM(19mm)</li>
		<li>cut into NUM(Φ63.5-76.2) cylinders — or into whatever shape so long as it's not super small and with something sharp. unclear how it'd get an appropriate circular cutter</li>
		<li>lay out so the tips touch, brush with buttermilk, bake for NUM(18-20min) at NUM(220°)</li>
		<li>brush with a NUM(2:1) butter:honey combo heated to combine</li>
	</ol>
</details>
</span>


ONE_IMAGUS(ciasto-kotletowe,
           storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/353/463/863/592/505/original/561588b6e25a107f.png, $101010.pl/@nabijaczleweli/111353464306173291)

<details open>
	SUMMARY(ciasto-kotletowe, Ciasto kotletowe)
	<p class="continuing">
		Courtesy of my aunt,
		replicated REPLICATION(2023-11-04, $101010.pl/@nabijaczleweli/111353464306173291):</p>
		<div style="padding-left: 40px;">
			<p class="continuation">
				2 szkl. kaszy mannej<br />
				2 szkl. mąki<br />
				2 łyżeczki proszku do pieczenia<br />
				1 1/2 szklanki cukru<br />
				200g zimnego masła<br />
				2kg jabłek<br />
			</p>

			<strong>Wykonanie</strong>
			<p class="continuation">Jabłka obieramy i ścieramy na tarce o grubych oczkach i mieszamy z 3-ma łyżkami cukru. Jabłka powinny być wilgotne.</p>

			<p class="continued">Mannę, mąkę, cukier, proszek mieszamy i dzliemy na trzy części. Formę wykładamy papierem.</p>
			<p class="continuing">Na dno wsypujemy część sypkich składników i wykładamy połową jabłek, przykrywamy drugą częścią sypkich składników. Wykładamy resztę jabłek. Ponownie dajemy sypkie składniki.</p>
			<p class="continuing">Wierzch szarlotki pokrywamy plastrami masła lub wiórkami.</p>
			<p class="continuation">Pokrywamy całą powierzchnię ciasta. Pieczemy 60 min, 180°C.</p>
		</div>
	</p>
</details>


IMAGUS(shaobing,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/992/073/464/014/965/original/d128c25363a316d5.jpeg, $101010.pl/@nabijaczleweli/110992083451588635,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/041/044/915/290/778/original/a43748bfceb81e52.jpeg, $101010.pl/@nabijaczleweli/111041049425379229)

<details open>
	SUMMARY(shaobing, Shaobing)
	<p class="continuing">
		<a href="//youtu.be/OoSJTqpcHps" lang="zh-CN"><!--"-->从小吃到大的油盐烧饼，不用烤烙着吃更香，咸香酥软太好吃了<!--"--></a>,
		by Yi Ning'<!--'-->s Mother Loves Food,
		replicated REPLICATION(2023-09-01, $101010.pl/@nabijaczleweli/110991939199680335),
		           REPLICATION(2023-09-07, $101010.pl/@nabijaczleweli/110956423046357306),
		           REPLICATION(2023-11-02, $101010.pl/@nabijaczleweli/111358771030497231):</p>
	<ol class="continuation">
		<li>NUM(250g) of like NUM(40°) water, NUM(5g) of salt, NUM(3g) of yeast, mix</li>
		<li>flock into NUM(400g) of flour – she gets something quite stiff, but I tend to get more of a light bread dough, even when putting in additional flour</li>
		<li>knead, he sleeps</li>
		<li>pour NUM(50g) of boiling oil over NUM(40g) of flour, NUM(5g) of salt, and NUM(5g) of pepper</li>
		<li>wake him up, clean up on floured board, roll out thinly on floured board – you want to get like NUM(5-6) folds while preserving the major dimension</li>
		<li>deploy and spread the oily goop</li>
		<li>roll up fold-wise while preserving the major dimension</li>
		<li>cut into NUM(6) guys</li>
		<li>for each guy:
			<ol class="continuing">
				<li>crimp cut ends</li>
				<li>roll out the resulting skirts</li>
				<li>fold the edges in, then the flap up</li>
				<li>invert, roll, invert, roll, invert</li>
				<li>brush with oil, deploy black sesame</li>
				<li>he sleeps for NUM(10min)</li>
				<li>fry covered on dark oil, flip after NUM(1min), flip after NUM(1min), flip after NUM(1min), flip after NUM(1min)</li>
			</ol>
		</li>
	</ol>
</details>


IMAGUS(liver-soup,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/945/854/392/660/756/original/26ad039c41131d76.jpeg, $101010.pl/@nabijaczleweli/110945861145403755,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/956/422/198/154/529/original/46ad82460086d290.jpeg, $101010.pl/@nabijaczleweli/110956423046357306)

<details open>
	SUMMARY(liver-soup, Hog'<!--'-->s liver soup)
	<p class="continuing">
		<a href="//youtu.be/y_hT7nzXzGE">Chef Wang teaches you: "Pork Liver Soup", a traditional Sichuan soup dish
		                                 (<span lang="zh-CN">厨师长教你：“生汆猪肝汤”的家常做法，清爽滑嫩，鲜而不腥</span>)</a>,
		by Chef Wang 美食作家王刚,
		replicated REPLICATION(2023-08-24, $101010.pl/@nabijaczleweli/110945861145403755),
		           REPLICATION(2023-08-26, $101010.pl/@nabijaczleweli/110956423046357306):</p>
	<ol class="continuation">
		<li>soak some fungus and dried lilies for NUM(30min) –
		    the lilies appear to be a very regional product, I just put in some dried apricots in a similar aspect ratio</li>
		<li>detendonise a small hog'<!--'-->s liver, cut into small strips –
		    NUM(~4) poultry livers also work but it's a hell of a job to de-tendonise them and you don't get nice pieces</li>
		<li>spoon of salt, launder, fill with water, launder, drain, squeeze</li>
		<li>NUM(1.5) spoons (nom. NUM(~1.5g)) of salt, and NUM(some) (nom. NUM(~1g)) white pepper, launder</li>
		<li>NUM(1) egg's<!--'-->s white, launder</li>
		<li>add a few hands (nom. NUM(50g)) of starch, laundering in betweem; let "marinate" –
		    he specs sweet potato, I don't think this is sold here. normal starch works; appx. four to five hands went into poultry livers and hog's liver, resp.</li>
		<li>quarter NUM(1) tomato, de-seed, de-skin, cut into strips</li>
		<li>de-root a couple small pokchois</li>
		<li>shred a couple onion whites</li>
		<li>shred a "small bit" of ginger</li>
		<li>blanch the soakers</li>
		<li>boil the blanched soakers with the ginger and NUM(some) lard, NUM(1) spoon (nom. NUM(3g)) of salt,
		    and NUM(1) pinch (nom. NUM(0.5g)) each of white pepper and MSG</li>
		<li>deploy each bit of liver piece-wise into the boiling water</li>
		<li>let it "half-cook"</li>
		<li>deploy the rest of the vegetables</li>
		<li>boil midly and de-froth until "the vegetables are half-cooked"</li>
	</ol>
</details>


IMAGUS(supposed-laobing,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/912/322/766/078/278/original/871fbbb3fdab47bb.jpeg, $101010.pl/@nabijaczleweli/110912325874653835,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/885/534/928/580/898/original/1711d463c0ae032f.jpg, $101010.pl/@nabijaczleweli/110885535194714458)

<details open>
	SUMMARY(supposed-laobing, Half-rye inflating bread)
	<p class="continuing">
		<a href="//youtu.be/y_hT7nzXzGE" lang="zh-CN"><!--"-->这样烙饼好神奇！不抹油不包油酥，个个空心像气球，简单好吃<!--"--></a>,
		by Yi Ning'<!--'-->s Mother Loves Food,
		replicated REPLICATION(2023-08-10, $101010.pl/@nabijaczleweli/110867561340637439),
		           REPLICATION(2023-08-11, $101010.pl/@nabijaczleweli/110874141044133521),
		           REPLICATION(2023-08-12, $101010.pl/@nabijaczleweli/110877700083516193),
		           REPLICATION(2023-08-13, $101010.pl/@nabijaczleweli/110885535194714458),
		           REPLICATION(2023-08-16, $101010.pl/@nabijaczleweli/110899730662475961),
		          PREPLICATION(2023-08-17),
		           REPLICATION(2023-08-18, $101010.pl/@nabijaczleweli/110912325874653835),
		          PREPLICATION(2023-08-19),
		          PREPLICATION(2023-08-20),
		          PREPLICATION(2023-08-21),
		           REPLICATION(2023-08-22, $101010.pl/@nabijaczleweli/110933500189109818),
		           …,
		          PREPLICATION(2023-09-06),
		           …,
		           REPLICATION(2023-09-25, $101010.pl/@nabijaczleweli/111126263457267793),
		           REPLICATION(2023-10-19, $101010.pl/@nabijaczleweli/111263625416932870),
		           REPLICATION(2023-10-31, $101010.pl/@nabijaczleweli/111341104967972340):</p>
	<ol class="continuation">
		<li>NUM(100g) of rye flour, NUM(190g) of boiling water, pastify, let cool to yeast temp</li>
		<li>mix in NUM(3g) of yeast</li>
		<li>NUM(200g) of flour, knead</li>
		<li>he sleeps</li>
		<li>cylindrise, divide NUM(6)-wise</li>
		<li>for each guy: knead radially, ballify</li>
		<li>for each guy: flatten directly, flour bilaterally, roll out to NUM(2-3mm), bake on casting</li>
	</ol>
</details>


ONE_IMAGUS(soy-flour-red-bean-sticky-rice-worm-hunks,
           storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/809/495/805/550/457/original/20bef8e45b221fe0.jpg, $101010.pl/@nabijaczleweli/110809682480516115)

<details open>
	SUMMARY(soy-flour-red-bean-sticky-rice-worm-hunks, The soy-eating sticky rice and red bean worm so delicious it was hunted to extinxion (real, sad, tragic, the method for preparation is explained))
	<p class="continuing">
		<a href="//youtu.be/94sq209lddU" lang="zh-CN"><!--"-->糯米粉这样做，比驴打滚简单好吃，一口一个软糯香甜，夏天必吃<!--"--></a>,
		by Yi Ning'<!--'-->s Mother Loves Food,
		replicated REPLICATION(2023-07-31, $101010.pl/@nabijaczleweli/110809682480516115):</p>
	<ol class="continuation">
		<li>NUM(180g) of sticky rice flour, NUM(20g) of corn starch, NUM(20g) of sugar, NUM(220g) of milk, whisk –
		    I don'<!--'-->t operate under a corn-based economy, so I just had potato</li>
		<li>steam for NUM(20min) – she has a flat bowl, mine was still raw inside; I did altogether NUM(40min)</li>
		<li>cut in, deploy NUM(20g) of butter, hide</li>
		<li>knead in the butter once wet, ballify</li>
		<li>deploy on soy flour, roll out rectangularly until NUM(2-3mm)</li>
		<li>to exhaustion: deploy bean paste length-wise near edge, snakify, separate, fix weld</li>
		<li>for each snake: to exhaustion: cut off a piece</li>
		<li>toss the pieces in soy flour to cover</li>
	</ol>
</details>


IMAGUS(shroomy-paper,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/787/165/007/587/820/original/f9aa27cddb09c71e.jpeg, $101010.pl/@nabijaczleweli/110787166550728100,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/133/449/399/259/470/original/dea0e20ea8afc644.jpeg, $101010.pl/@nabijaczleweli/111133451540276725)

<details open>
	SUMMARY(shroomy-paper, Fungus bean curd skin)
	<p class="continuing">
		<a href="//youtu.be/94sq209lddU">The chef teaches you the recipe for Bean curd skin , it'<!--'-->s too fragrant
		                                 (<span lang="zh-CN"><!--"-->豆腐皮这个做法太好吃了，我家一周吃6次，上桌就光盘，太香了！Bean curd skin recipe<!--"--></span>)</a>,
		by <span lang="zh-CN">家常菜日记</span>,
		replicated REPLICATION(2023-07-27, $101010.pl/@nabijaczleweli/110787166550728100)
		           REPLICATION(2023-07-26, $101010.pl/@nabijaczleweli/111133451540276725):</p>
	<ol class="continuation">
		<li>soak fungus in water with a little salt and some flour for NUM(5min), wash in clean water –
		    he specs auricularia cornea, which only has a wiki article in śląski and no common names; I used dried shredded mun because thats what I had</li>
		<li>cut up NUM(2) bean curd skins into strips, then parallelograms –
		    his appeared smaller and thicker than mine, the stack I got looked like twice what he did, so I doubled the rest and it made two big bowls</li>
		<li>cut a flat half of a long red and long green pepper lengthwise then parallelogramwise</li>
		<li>shred two chives, keep the white bit separate</li>
		<li>mince a garlic, save it with the white bit</li>
		<li>for sus:
			<ol class="continuing">
				<li>a little salt</li>
				<li>a little chicken essence (bullion cube)</li>
				<li>ground pepper</li>
				<li>two spoons of light soy sus</li>
				<li>an spoon of oyster sus</li>
				<li>a drip of dark soy sus (colour only)</li>
				<li>half a spoon of corn starch – I don'<!--'-->t operate under a corn-based economy, so I just had potato</li>
				<li>stir with some water</li>
			</ol>
		</li>
		<li>boil the skin for NUM(30s)</li>
		<li>boil the shrooms for NUM(2min)</li>
		<li>heat oil, fry the white bit + garlic with an spoon of bean paste until the oil reddens</li>
		<li>fry with shrooms</li>
		<li>fry with skin</li>
		<li>boil for NUM(2min) with the sus</li>
		<li>fry with with peppers</li>
		<li>finish with chives</li>
	</ol>

	<p>
		The <em>lightness</em> of the soy sus is paramount here, it really did come Too Salty™ the first time.
		Probably moderate the salt when using a salty bullion cube.
	</p>
</details>


IMAGUS(beef-brussy-CA,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/752/920/201/065/064/original/e5104e9dae21ffc3.jpeg, $101010.pl/@nabijaczleweli/110752930128901173,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/752/949/667/426/193/original/6937c34646c929fd.jpeg, $101010.pl/@nabijaczleweli/110752998578446480)

<details open>
	SUMMARY(beef-brussy-CA, Beef Stuffed Flatbread)
	<p class="continuing">
		<a href="//youtu.be/kko5x0P0Cbg">Beef Stuffed Flatbread
		                                 (<span lang="zh-CN"><!--"-->薄皮馅饼 Stuffed Flatbread<!--"--></span>)</a>,
		by <span lang="zh-CN">小高姐的</span> Magic Ingredients,
		replicated REPLICATION(2023-07-21, $101010.pl/@nabijaczleweli/110752998578446480):</p>
	<ol class="continuation">
		<li>NUM(350g) of flour, NUM(210g) of water, NUM(¼) of a small spoon of yeast, NUM(1) spoon of oil, mix to accrue, he sleeps for NUM(15min)</li>
		<li>knead for NUM(1min), divide NUM(6)-wise</li>
		<li>for each guy: knead radially, press directly knead-side down, he sleeps for at least NUM(20min)</li>
		<li>for each guy:
			<ol class="continuing">
				<li>flatten directly in the hand</li>
				<li>deploy gloop ball</li>
				<li>encompass, close with a flat weld</li>
				<li>deploy weld-side down on oiled sheet</li>
				<li>cover with oil</li>
			</ol>
		</li>
		<li>cover the sheet with plastic, fridge for the night</li>
		<li>for each guy:
			<ol class="continuing">
				<li>extract</li>
				<li>flatten directly on oiled board</li>
				<li>roll out – I opted for flattening directly entirely</li>
				<li>fry on oil expectedly</li>
			</ol>
		</li>
	</ol>
	<p class="continuing">with a spec gloop of</p>
	<ol class="continuation">
		<li>NUM(60g) of starch noodles boiled for NUM(3min), run through with cold water, and shredded</li>
		<li>NUM(100g) of chives finely chopped</li>
		<li>NUM(200g) of beef extrusion,
			  NUM(1) spoon of soy sus,
			  NUM(1) spoon of dark soy sus,
			  NUM(¼) of a small spoon of ground pepper from sichuan,
			  NUM(¼) of a small spoon of ground white pepper,
			  NUM(¼) of a small spoon of salt,
			  NUM(⅛) of a small spoon of five spices, mix</li>
		<li>pour on NUM(1) spoon of sesame oil and NUM(1) spoon of oil on the the chives and noodles, mix</li>
		<li>mix the chive and noodle gloop with the meat</li>
		<li>divide NUM(6)-wise, ballify</li>
	</ol>

	<p>
		I had not realised this was a yankified recipe until after having fridged it –
		this explains why my meat was pale and the result was lacking flavour –
		she uses spoon-based measurements, but she actually means "customary ladle #7".
		Actual measures yet unknown.
	</p>
</details>

IMAGUS(blooming-bread,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/669/573/055/938/291/original/c6b5c98e5242ace8.jpeg, $101010.pl/@nabijaczleweli/110669748656310055,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/110/670/199/586/607/127/original/2a6248ace16432df.jpeg, $101010.pl/@nabijaczleweli/110669748656310055)

<details open>
	SUMMARY(blooming-bread, 开花馒头)

	<p class="continuing">
		<a href="//youtu.be/NOZxFzMKnz4" lang="zh-CN"><!--"-->开花馒头，开不开花揉馒头方法很关键，做对了一出锅个个笑开花【三丰美食】<!--"--></a>,
		by <span lang="zh-CN"><!--"-->三丰美食<!--"--></span>,
		replicated REPLICATION(2023-07-06, $101010.pl/@nabijaczleweli/110669748656310055),
		           REPLICATION(2023-07-08, $101010.pl/@nabijaczleweli/110684630031038414):</p>
	<ol class="continuation">
		<li>NUM(40g) of dark sugar, NUM(190g) of hot water, mix to solve, wait to cool to like NUM(40°)</li>
		<li>some yeast, NUM(3g) of baking powder, mix –
		    I had originally mis-taken this to be salt and put a spoon of salt in;
		    this ended up tasting better, and I haven'<!--'-->t detected an appreciable change from the powder</li>
		<li>NUM(350g) of flour, knead, he sleeps covered</li>
		<li>pour hot water over NUM(11) jujube, cut up into small bits</li>
		<li>flatten the risen dough in the bowl, deploy NUM(1g) of soda in NUM(10g)(?) of water, knead, he sleeps covered for NUM(15min)</li>
		<li>flatten on board, deploy jujube, knead in, cylindrise, tear into NUM(7) guys</li>
		<li>for each guy:
			<ol class="continuing">
				<li>flatten directly(?)</li>
				<li>fold a point at the bottom to the top on the same radius, rotate a bit, repeat for like two rotations</li>
				<li>indent, form conically</li>
				<li>sleep for NUM(15min)</li>
				<li>boil water, deploy, let rip for NUM(15min)</li>
			</ol>
		</li>
	</ol>

	<p>
		I haven'<!--'-->t gotten these to work morphologically.
	</p>
</details>


IMAGUS(puckered-bread,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/7e10cb46-e68f-454c-8a1f-920b6f7ef7a3/DSC_2700.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1688343-idk-what-i-did-diffe,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/b3806ff1-048d-472c-b03c-b6a5bdec1189/DSC_2694.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1676107-didn-t-explode-along)
<details open>
	SUMMARY(puckered-bread, Puckered bread)

	<p class="continuing">
		<a href="//youtu.be/z44JqGKyLBg">Blossom steamed bread delicious method is very simple
		                                 (<span lang="zh-CN"><!--"-->开花馒头好吃方法很简单，学会这个做法，蓬松柔软个个开花【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-06-13, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1676107-didn-t-explode-along),
		           REPLICATION(2023-06-15, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1688384-scale-comparison),
		           REPLICATION(2023-06-17, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1705325-i-don-t-know-what-i),
		           REPLICATION(2023-06-28, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1776589-they-made),
		           REPLICATION(2023-06-30, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1791054-empty),
		           REPLICATION(2023-07-18, $101010.pl/@nabijaczleweli/110736025902684639),
		           PREPLICATION(2023-08-14):</p>
	<ol class="continuation">
		<li>NUM(500g) of flour, NUM(4-5g) of yeast, NUM(35g) of sugar, NUM(50-60g) egg, mix</li>
		<li>flock in NUM(80g) of yogurt – I'<!--'-->ve been informed chinese yogurt is closer to zsiadłe mleko (or, indeed, lait ribot). that worked fine</li>
		<li>flock in NUM(200g) of hot milk – to compensate the cold egg and "yogurt"</li>
		<li>knead to accrue, stretch out on board, deposit NUM(15g) of butter, gloop in – she uses clarified, normal worked fine</li>
		<li>he sleeps</li>
		<li>tear him open, knead radially roll-wise, cylindrise. divide NUM(7)-wise</li>
		<li>for each guy: knead, smooth, ballify</li>
		<li>for each guy:
			<ol class="continuing">
				<li>spin around on floured board</li>
				<li>invert, indent radially</li>
				<li>invert, spin around on floured board</li>
				<li>deposit flour-side up to sleep for NUM(15min)</li>
				<li>boil water, deploy, let rip for NUM(15min), kill the heat and leave alone for NUM(2min)</li>
			</ol>
		</li>
	</ol>

	<p>
		I haven't gotten an intentation technique that wasn't just a knife to work, idk how she does it.
	</p>
</details>


IMAGUS(dumpy,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/833db54b-f39d-4278-998d-167856b153cb/DSC_2655a.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1619105-one-day-they-ll-inve,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/81fc99fc-d95a-4cd4-b69d-5eed4470c701/DSC_2656.JPG,  lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1619105-one-day-they-ll-inve)
<details open>
	SUMMARY(dumpy, Steamed dumpling)

	<p class="continuing">
		<a href="//youtu.be/kwx-qZd9Epw">Home version of big steamed dumplings learn to do this, soft and chewy
		                                 (<span lang="zh-CN"><!--"-->家庭版大蒸饺学会这样做，柔软筋道不破皮不漏馅，适合新手【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-06-04, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1619105-one-day-they-ll-inve),
		           REPLICATION(2023-06-06, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1636148-actually-fun-moment),
		           REPLICATION(2023-06-08, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1647533-dzia-zy),
		           REPLICATION(2023-06-10, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1658603-this-user-is-like):</p>
	<ol class="continuation">
		<li>NUM(500g) of flour, NUM(3g) of salt, mix</li>
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


IMAGUS(brown-sugar-shortbread,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/2e864867-f252-4c51-9ea4-126fd8e1a5e9/DSC_2637a.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1534159-idk-whose-home-town,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/bb5f12d8-8cd5-47a2-980e-55501950da44/DSC_2635a.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1534159-idk-whose-home-town)
<details open>
	SUMMARY(brown-sugar-shortbread, Old-fashioned brown sugar short-bread)

	<p class="continuing">
		<a href="//youtu.be/wzMPdyUy99g">Hometown gourmet brown sugar shortbread, step-by-step explanation
		                                 (<span lang="zh-CN"><!--"-->家乡美食红糖酥饼，步骤详细讲解，酥脆香甜不用出去买【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-21, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1534159-idk-whose-home-town):</p>
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


IMAGUS(pumpkin-hanamaki,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/7339792a-7d19-4344-acc1-4f0b2f928cef/DSC_2647.JPG,  lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1538182-yes-im-still-working,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/64a8b45c-13e5-4a1f-8bcc-1564da55fcd5/DSC_2630a.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1525544-okay-thats-kinda-pog)
<details open>
	SUMMARY(pumpkin-hanamaki, Pumpkin hanamaki)

	<p class="continuing">
		<a href="//youtu.be/7_VBad4AzWI">Homemade Hanamaki is simple and practical, you can learn it in a minute
		                                 (<span lang="zh-CN"><!--"-->家常花卷简单实用，一分钟就能学会，营养丰富层多柔软【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-17, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1525544-okay-thats-kinda-pog),
		           REPLICATION(2023-05-22, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1538182-yes-im-still-working),
		           REPLICATION(2023-08-02, $101010.pl/@nabijaczleweli/110820714260955866):</p>
	<ol class="continuation">
		<li>half a pumpkin in NUM(4mm) slices, steamed for NUM(20min), blended with water for a loose gloop –
		    I used an NUM(850g) <a href="//lfs.nabijaczleweli.xyz/0016-cohost-export/https://cohost.org/nabijaczleweli/post/1512219-this-is-half-a-pumpk">dynia piżmowa</a>,
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


IMAGUS(butter-bread,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/85fc5b38-c64e-4c56-8323-4b6aae087473/1683924925110.JPEG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1488951-quite-pog-for-a-brus,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/6401196b-c17e-478d-9249-9593555e5531/DSC_2615a.JPG,      lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1488951-quite-pog-for-a-brus)
<details open>
	SUMMARY(butter-bread, Butter bread)

	<p class="continuing">
		<a href="//youtu.be/i8fGjFvwNN0?t=441">How to make Haijuan Gourmet'<!--'-->s big white steamed buns with bright surface?
		                                       (<span lang="zh-CN"><!--"-->【面食合集】表面光亮的大白馒头怎么做？蓬松柔软又好吃，看一遍就会做！【海娟美食】<!--"--></span>)</a>,
		at 7:21,
		by Haijuan Food,
		replicated REPLICATION(2023-05-12, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1488951-quite-pog-for-a-brus),
		           REPLICATION(2023-05-15, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1504203-remaining-4-5-not-p):</p>
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


IMAGUS(hushi-confexion,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/284c385d-ab51-470c-9663-5f001f09b2ab/DSC_2617.JPG,  lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1494733-still-very-acceptabl,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/d8658927-a3d4-4f84-bc06-4d1bb418db20/DSC_2610a.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1486924-pog-moment)
<details open>
	SUMMARY(hushi-confexion, Hushi confexion)

	<p class="continuing">
		<a href="//youtu.be/yW85JqGvy7M">Chinese rural specialty delicacy Hushi sugar baker
		                                 (<span lang="zh-CN"><!--"-->中国农村特色美食呼市方糖焙子，从和面到制作油酥很详细，香甜可口还柔软【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-12, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1486924-pog-moment),
		           REPLICATION(2023-05-14, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1494733-still-very-acceptabl):</p>
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


ONE_IMAGUS(onion-pancake,
           lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/f5fef574-0ada-4e5c-919a-526285cfee9d/DSC_2596a.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1465853-this-is-the-only-one)
<details open>
	SUMMARY(onion-pancake, Green onion pancake)

	<p class="continuing">
		<a href="//youtu.be/i8fGjFvwNN0?t=886">How to make Haijuan Gourmet'<!--'-->s big white steamed buns with bright surface?
		                                       (<span lang="zh-CN"><!--"-->【面食合集】表面光亮的大白馒头怎么做？蓬松柔软又好吃，看一遍就会做！【海娟美食】<!--"--></span>)</a>,
		at 14:46,
		by Haijuan Food,
		replicated REPLICATION(2023-05-08, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1465853-this-is-the-only-one):</p>
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


IMAGUS(buns,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/fdb67946-b1d1-4696-8450-585f0aceda59/DSC_5798.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1461465-okay-thats-some-pret,
       storage.waw.cloud.ovh.net/v1/AUTH_74714a37e6e24c7fb695d79be309da62/101010public/media_attachments/files/111/574/872/987/262/651/original/559a4b23d29075e3.jpeg, $101010.pl/@nabijaczleweli/111575020146177424)
<details open>
	SUMMARY(buns, Buns)

	<p class="continuing">
		<a href="//youtu.be/tghGkiw8feU">From snacks to big sauced meat buns, the skin is thin and the stuffing is big and soft
		                                 (<span lang="zh-CN"><!--"-->从小吃到大的酱肉包子，皮薄馅大又暄软，不塌陷不回缩【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		      replicated REPLICATION(2023-05-07, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1461715-goated-gloop-as-well),
		                 REPLICATION(2023-09-12, $101010.pl/@nabijaczleweli/111064931118614188)
		                 REPLICATION(2023-12-13, $101010.pl/@nabijaczleweli/111575020146177424);
		gloop replicated REPLICATION(2023-07-10, $101010.pl/@nabijaczleweli/110691639550245407):</p>
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


IMAGUS(leek-cake,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/e7e450f2-e151-42ab-977c-d8395e05154a/DSC_5775.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1440206-leek-multi-laye,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/660e5669-4349-4236-907a-dcec6f5c8003/DSC_5778.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1440206-leek-multi-laye)
<details open>
	SUMMARY(leek-cake, Leek multi-layer cake)

	<p class="continuing">
		<a href="//youtu.be/2rNbXgnnyQg">Leek multi-layer cake is delicious and no skill
		                                 (<span lang="zh-CN"><!--"-->韭菜多层饼好吃无技巧，层层有饼层层有馅，咸香味美满嘴香！【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-05-03, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1440206-leek-multi-laye):</p>
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


NO_IMAGUS(topinambur-cream-soup)
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


IMAGUS(corn-freamed-buns,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/ca893d84-f5a0-4e68-8d59-25caa7553def/DSC_2584.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1434488-okay-these-ones-rose,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/4cac1ee0-9abc-447d-ad26-bf841e4f6a2a/DSC_2571.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1413956-okay-these-are-pog-c)
<details open>
	SUMMARY(corn-freamed-buns, Corn freamed (fried steamed) rolls (buns), rose-shaped)

	<p class="continuing">
		<a href="//youtu.be/7tZEh6uzcOo">Cornmeal for rolls? Easy to make fluffy and soft
		                                 (<span lang="zh-CN"><!--"-->玉米面不蒸馒头做花卷？蓬松柔软做法简单，全程无难度【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-04-29, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1413956-okay-these-are-pog-c),
		           REPLICATION(2023-05-02, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1433335-little-secondary-ris),
		           REPLICATION(2023-05-02, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1434488-okay-these-ones-rose):</p>
	<ol class="continuation">
		<li>NUM(200g) of <a href="//lfs.nabijaczleweli.xyz/0016-cohost-export/https://cohost.org/nabijaczleweli/post/1404618-this-user-just-got">corn</a>,
		    flock with NUM(200g) of boiling water,
		    let cool until not hot to second knuckle – with the eggs you want to get a good yeast temp</li>
		<li>NUM(3g) of yeast, spoon of sugar, two eggs – mine are NUM(~70g)</li>
		<li>NUM(200g) of flour – maybe my eggs are huge, maybe idk, but starting with NUM(250g) and likely adding slightly more to get to a reasonable "dough" consistency
		    — instead of a paste, which doesn'<!--'-->t rise; the spec is to <em>maybe add water</em> which is insane to me —
		    worked for me to avoid the REPLICATION(2023-05-02, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1433335-little-secondary-ris) incident again</li>
		<li>flock, accrue, knead in bowl for NUM(5min), he sleeps in the covered bowl for NUM(40min)</li>
		<li>knead a bit on floured counter to de-gas, roll into cylinder, cut into NUM(~12) guys –
		    there's a critical mass above which they won't re-rise(?), and NUM(9) left them too big
		    (again, REPLICATION(2023-05-02, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1433335-little-secondary-ris)),
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
		These came out just about perfect REPLICATION(2023-04-29, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1413956-okay-these-are-pog-c),
		but the water level is finnicky, and pouring in more and turning the heat back on turns out badly for me
		(stuck to bottom; REPLICATION(2023-05-02, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1433335-little-secondary-ris),
		                  REPLICATION(2023-05-02, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1434488-okay-these-ones-rose)).
		Maybe this is easier if you have a plastic pan the right size, but my biggest (NUM(Φ245)) is stainless (but the right size).
		Operator error.
	</p>
</details>


IMAGUS(wężymorda,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/685d38a2-808b-4136-85f5-be6813691c20/1682517987967.JPEG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1397956-she-call-me-her-grat,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/3bb8cd24-0ff4-40e8-8b0f-a554a2cf6714/1682517987996.JPEG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1397956-she-call-me-her-grat)
<details open>
	SUMMARY(wężymorda, Gratin de salsifis)

	<p class="continuing">
		<a href="//www.swissmilk.ch/fr/recettes-idees/recettes/LM200711_21/gratin-de-salsifis/">Gratin de salsifis</a>,
		by swissmilk,
		replicated REPLICATION(2023-04-26, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1397956-she-call-me-her-grat):</p>
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


IMAGUS(flower-rolls,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/c1132df0-720c-4f9b-9859-aa533b959935/DSC_2539.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1341136-he-is-risen-to-an-un,
       lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHstaging.cohostcdn.org/attachment/87a35886-38b0-4092-b95d-b5940b45780d/DSC_2554.JPG, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1383268-who-need-they-brussy)
<details open>
	SUMMARY(flower-rolls, Flower rolls (round steamed bread with an oil))

	<p class="continuing">
		<a href="//youtu.be/hpYrnQiGd6w">Homemade flower rolls are delicious and no skills, suitable for novice making
		                                 (<span lang="zh-CN"><!--"-->家常花卷好吃无技巧，松软白亮方法简单，适合新手制作【海娟美食】<!--"--></span>)</a>,
		by Haijuan Food,
		replicated REPLICATION(2023-04-15, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1341136-he-is-risen-to-an-un),
		           REPLICATION(2023-04-23, lfs.nabijaczleweli.xyz/0016-cohost-export/httpsCOLON_SLASH_SLASHcohost.org/nabijaczleweli/post/1383268-who-need-they-brussy):</p>
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


IMAGUS(bubliki,
       lfs.nabijaczleweli.xyz/0017-twitter-export/parser-output/media/1533929176725594118-FUmcYBvXwAA78H5.jpg, lfs.nabijaczleweli.xyz/0017-twitter-export#1533929176725594118,
       lfs.nabijaczleweli.xyz/0017-twitter-export/parser-output/media/1584894789878587392-Ff6s7wOX0AQGK5f.jpg, lfs.nabijaczleweli.xyz/0017-twitter-export#1584894789878587392)
<details open>
	SUMMARY(bubliki, Бублики)

	<p class="continuing">
		Originally derived from
		<a href="//youtu.be/PPHy_1R7Xu4">Making the slavic bagel</a>,
		by Life of Boris.
		First replicated
		REPLICATION(2022-06-06, lfs.nabijaczleweli.xyz/0017-twitter-export#1533929176725594118),
		but this was my sole bread in-take for the
		REPLICATION(2022-07-06–2022-10-28, lfs.nabijaczleweli.xyz/0017-twitter-export#1584894789878587392)
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
</article>


</span>
BOILERPLATE_END()
