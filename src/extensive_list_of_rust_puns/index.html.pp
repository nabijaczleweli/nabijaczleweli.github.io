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
#include "../writing/writing.h"


#define MATH(...) <span class="math-font-normal roboto-unscale">__VA_ARGS__</span>

#define PUN(pun_id, user_id, user_name, msg_id, msg_time, ...)                                                                                          \
	<li id=STR(pun_id)>__VA_ARGS__                                                                                                         FORCED_NEWLINE \
	               — <a href=STR(httpsCOLON_SLASH_SLASHchat.stackoverflow.com/users/user_id)>user_name</a>                                 FORCED_NEWLINE \
	               - <a href=STR(httpsCOLON_SLASH_SLASHchat.stackoverflow.com/transcript/message/msg_id##HASH##msg_id)>MATH(msg_time)</a></li>


#define STYLESHEETS MAIN_HEADING_STYLE                                                                 FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet" />                       FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/MathJax-font.css" rel="stylesheet" />       FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet" />                        FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />  FORCED_NEWLINE \
                    <link href="//fonts.googleapis.com/css?family=Droid+Sans+Mono" rel="stylesheet">   FORCED_NEWLINE \
                    <style>samp { font-family: "Droid Sans Mono", monospace; }</style>
BOILERPLATE(Extensive List of Rust puns, Puns about the Rust programming language, en-US, STYLESHEETS)
<span class="roboto">


<p></p>
MAIN_HEADING(Extensive list of <a href="//rust-lang.org">Rust</a> puns)

As <a href="//chat.stackoverflow.com/transcript/62927?m=35242527#35242527">requested</a>
	by <a href="//chat.stackoverflow.com/users/2408867">Lukas Kalbertodt</a>;
	also consult the <a href="//github.com/Enet4/rust-tropes/blob/master/rust-tropes.md">Rust Tropes Dictionary</a>:
<ul>
	PUN(dont-build-an-Arc, 1233251, E_net4, 45776570, 28.03.19 01:45 PM,
	    "Don't build an <samp>Arc</samp> unless you expect a flood (of borrows).")
	PUN(do-Cows-consume-Hay, 3650362, trentcl, 43287198, 17.17.17 06:14 PM,
	    "Do <samp>Cow</samp>s consume <samp>Hay</samp>?")
	PUN(sharing-Cell-with-threads-but-let-idea-Sync, 1233251, E_net4, 35262129, 23.01.17 11:30 PM,
	    "Kept wondering what was preventing me from sharing a <samp>Cell</samp> with multiple threads, but then I let the idea <samp>Sync</samp> in.")
	PUN(Indiana-Jones-and-the-Raiders-of-the-Lost-ArcT, 2408867, Lukas Kalbertodt, 35262129, 20.10.17  11:30 PM,
	    "Indiana Jones and the Raiders of the Lost <samp>Arc&lt;T&gt;</samp>")
	PUN(one-does-not-simply-implement-Sync, 1233251, E_net4, 39687034, 20.10.17  2:34 PM,
	    "One does not simply implement <samp>Sync</samp>", on top of a man from Lord of the Rings)
	PUN(would-you-like-some-T, 2408867, Lukas Kalbertodt, 30846902, 30.05.16  8:22 AM,
	    "Would you like <samp>Some(T)</samp>?")
</ul>

</span>
BOILERPLATE_END()
