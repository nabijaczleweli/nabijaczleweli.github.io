#define __LICENSE                                                  \
// nabijaczleweli.xyz (c) by nabijaczleweli                        \
​//                                                                 \
// nabijaczleweli.xyz is licensed under a                          \
// Creative Commons Attribution 4.0 International License.         \
​//                                                                 \
// You should have received a copy of the license along with this  \
// work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
#undef __LICENSE


#pragma once


#define WP(story_semiurl, post_id, title, ...) WP_RAW(story_semiurl, post_id, title, — __VA_ARGS__)
#define WP_IP(story_semiurl, post_id, title, img_address) WP_RAW(story_semiurl, post_id, title, <a href=STR(httpsCOLON_SLASH_SLASH##img_address)>FA(image)</a>)
#define WP_RAW(story_semiurl, post_id, title, ...)                                                                            \
	<li>                                                                                                         FORCED_NEWLINE \
	  <a href=STR(/content/writing_prompts/story_semiurl.html)>title</a>                                         FORCED_NEWLINE \
	  <a href=STR(httpsCOLON_SLASH_SLASHwww.reddit.com/r/WritingPrompts/comments/post_id)>FAB(reddit-alien)</a>  FORCED_NEWLINE \
	  __VA_ARGS__                                                                                                FORCED_NEWLINE \
	</li>


#define WRITING_PROMPT_LIST()                                                                                                                                          \
<!-- WP_IP(the_pursuer, 5i2h9m, The Pursuer, artsed.deviantart.com/art/The-Pursuer-459072802) -->                                                       FORCED_NEWLINE \
WP(theless, 5ihrpc, The-less, Write a story without using the word "the")                                                                               FORCED_NEWLINE \
WP(start_eq_end, 5jor6i, End = Start, You must start and end your story by using the same sentence)                                                     FORCED_NEWLINE \
WP_IP(dead_santa, 5j7m3m, No gifts this year, imgur.com/gkevfag)                                                                                        FORCED_NEWLINE \
WP(six_minutes, 5kb0q6, Six Minutes, Two people, talking. The scene only lasts a few minutes. No flashbacks)                                            FORCED_NEWLINE \
WP(green_ass_dog, 5kt8x0, Cucumber Dog, You meet dog who stands with a green knapsack on its back and tells you                                                        \
                                        "I am on a journey looking for Ass, Potatoes, &amp; Cucumbers. Can you assist me?")                             FORCED_NEWLINE \
WP(not_dead_yet, 5ks29s, Get Up，Soldier, "Get Up, Soldier, You're Not Dead Yet")                                                                       FORCED_NEWLINE \
WP(trucks_a_cash, 5l4iqi, Utopian Assassin, Government mails money for amount of happiness spread. You sometimes get some. One day you get a truckload) FORCED_NEWLINE \
WP(degenerate, 5l09xc, Degenerate Watch, Plot is based on some song)                                                                                    FORCED_NEWLINE \
WP(laser_cats, 5qv165, Ghostly Lasers, Cats interpret laser pointers the same way people interpret ghosts)                                              FORCED_NEWLINE \
WP(eye_see, 5qfb3c, The Last Eye, First-person narration without "I")                                                                                   FORCED_NEWLINE