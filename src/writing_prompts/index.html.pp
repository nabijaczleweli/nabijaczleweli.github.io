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
#include "../fontawesome.h"
#include "../writing/writing.h"


#define WP_RAW(story_semiurl, post_id, title, ...)                                                   \
<li>                                                                                                 \
  <a href=STR(story_semiurl.html)>title</a>                                                          \
  <a href=STR(httpsCOLON_SLASH_SLASHwww.reddit.com/r/WritingPrompts/comments/post_id)>FA(reddit)</a> \
  __VA_ARGS__                                                                                        \
</li>

#define WP(story_semiurl, post_id, title, ...) WP_RAW(story_semiurl, post_id, title, — __VA_ARGS__)

#define WP_IP(story_semiurl, post_id, title, img_address) WP_RAW(story_semiurl, post_id, title, <a href=STR(httpsCOLON_SLASH_SLASH##img_address)>FA(image)</a>)


BOILERPLATE(Writing prompts, The result of boredom and semi-insomniac visits to /r/WritingPrompts)


List of <a href="https://www.reddit.com/r/WritingPrompts">writing prompts</a> completed by me:

<ul>
	<!-- WP_IP(the_pursuer, 5i2h9m, The Pursuer, artsed.deviantart.com/art/The-Pursuer-459072802) -->
	WP(theless, 5ihrpc, The-less, Write a story without using the word "the")
	WP(start_eq_end, 5jor6i, End = Start, You must start and end your story by using the same sentence)
	WP_IP(dead_santa, 5j7m3m, No gifts this year, imgur.com/gkevfag)
	WP(six_minutes, 5kb0q6, Six Minutes, Two people, talking. The scene only lasts a few minutes. No flashbacks)
	WP(green_ass_dog, 5kt8x0, Cucumber Dog, You meet dog who stands with a green knapsack on its back and tells you
	                                        "I am on a journey looking for Ass, Potatoes, &amp; Cucumbers. Can you assist me?")
	WP(not_dead_yet, 5ks29s, Get Up， Soldier, "Get Up, Soldier, You're Not Dead Yet")
</ul>


WRITING_CUSTOM_NAME_END(all stories)
BOILERPLATE_END()
