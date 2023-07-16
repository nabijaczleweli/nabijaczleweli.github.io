<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../writing/writing.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Mon, 25 May 2020 00:12:30 +0200" -->
#define POST_DATE      Mon, 25 May 2020 00:12:30 +0200
#define POST_POST_DATE

BOILERPLATE(002. An overlong analysis of ^Z+fg crashing ncurses programs for gpm users — blognꞌt, 002. An overlong analysis of ^Z+fg crashing ncurses programs for gpm users, en-GB, BLOGN_T_STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../indent.css"
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(<code>002. An overlong analysis of ^Z+fg crashing ncurses programs for gpm users</code>)

<p class="indented continued">
The post I made for <a href="https://bugs.debian.org/961097#35">#961097</a>,
	which went through three packages (
</p>
<ol class="continuing">
	<li>htop: segfaults after ^Z+fg on x32</li>
	<li>gpm: SIGTSTP handler segfaults programs</li>
	<li>libncurses6: unloads libgpm2 in SIGTSTP handler, process returns to unmapped address on resume</li>
</ol>
<p class="continuing">
	) is roughly the length of a blog post and something I would read as a blog post, so it may be interesting to other viewers as well.
<p class="indented continuation">
Plus, it took me an entire day to write and the better part of a week to hunt down (by god it'<!--'-->s bigger than either of the screenshots),
	so it definitely qualifies.
</p>

<p class="indented continued">
You can read it on <a href="https://bugs.debian.org/961097#35">debbugs</a>, since reproducing plaintext with boxes in HTML is a massive pain
	(plus there'<!--'-->s context there).
</p>
<p class="indented continuation">
You may also be interested in the corresponding <a href="https://lfs.nabijaczleweli.xyz/0017-twitter-export#1263652757803724800">twitter thread</a>.
</p>

BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()
