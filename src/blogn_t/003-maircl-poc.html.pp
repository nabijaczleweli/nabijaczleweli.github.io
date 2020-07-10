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


   <!-- RSS_PUB_DATE: "Sat, 11 Jul 2020 00:34:50 +0200" -->
#define POST_DATE      Sat, 11 Jul 2020 00:34:50 +0200
#define POST_POST_DATE


#define CMT Also used in heading.h, make sure to update both with fixes
#undef CMT
#define HEADING_LINK(id)                  <a class="hash-link" href=STR(HASH##id)>HASH</a>
#define HEADING_S(level, hid, style, ...) <h##level id=STR(hid) style>HEADING_LINK(hid) __VA_ARGS__</h##level>
#define HEADING(level, id, ...)           HEADING_S(level, id, , __VA_ARGS__)


#define STYLESHEETS BLOGN_T_STYLESHEETS                                                      FORCED_NEWLINE \
                    <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" />

BOILERPLATE(003. A proof-of-concept IRC/mail bridge — blognꞌt, 003. A proof-of-concept IRC/mail bridge, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

video, img {
	max-width: 100%;
}

@media all and (max-device-width: 800px) {
	.bigcode {
		width: 100%;
	}
}

@media all and (min-device-width: 800px) {
	.bigcode {
		width: 125%;
		margin-left: -12.5%; /* (125 - 100) / 2 */
	}
}
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(<code>003. A proof-of-concept IRC/mail bridge</code>)

HEADING(2, what, What?)
<p class="indented">
A video'<!--'-->s worth a few interrobangs, so:
<video    src="/content/assets/blogn_t/003.01-2020-07-10_01-42-57.mp4"
	     poster="/content/assets/blogn_t/003.02-2020-07-10_01-42-57.mp4_snapshot_00.04_[2020.07.10_15.53.59].png" alt="Demo video" controls preload></video>
</p>

<p class="continued">
Herein we can see:
</p>
<ul class="continuation">
  <li>In the back: freenode'<!--'-->s web client, with username "hasix", focused on the DM to "nabijaczleweli",</li>
  <li>At the center: neomutt open on <code>~/uwu/mbox</code>,</li>
  <li>Near the top-right: output of <code>journalctl -fu postfix@-</code>,</li>
  <li>Toward the bottom-right: a tee of mails going into <code>~/uwu/mbox</code>.</li>
</ul>

<p class="continued">
The play-by-play:
</p>
<ul class="continuation">
  <li><code>0:05</code>: mail is composed to "hasix@irc." with subject "hewwo",</li>
  <li><code>0:15</code>: mail is sent, with activity in the journal window and one new mail showing up both in neomutt and the mail tee window (from "hasix@irc.", subject "&lt;nabijaczleweli&gt; hewwo"), the message shows up in the web client to a click sound,</li>
  <li><code>0:23</code>: message "стинкы" is sent from the web client,</li>
  <li><code>0:25</code>: the tee window comes back into view, it lists a new mail (from "nabijaczleweli@irc.", subject "&lt;hasix&gt; стинкы"),</li>
  <li><code>0:28</code>: neomutt index is scrolled, revealing the new mail,</li>
  <li><code>0:48</code>: mail is composed to "hasix@irc" with subject "thank you very cool :)",</li>
  <li><code>1:01</code>: mail is sent, with activity in the journal window and one new mail showing up both in neomutt and the mail tee window (from "hasix@irc.", subject "&lt;nabijaczleweli&gt; thank you very cool :)"), the message shows up in the web client to a click sound,</li>
  <li><code>1:05</code>: a tired voice proclaims "oh, I hate this!".</li>
</ul>


HEADING(2, why, Why‽)
<p class="indented">
Intrusive thought when I noticed that messages from whitenotifier hit <a href="//freenode.irclog.whitequark.org/solvespace/2020-07-09">#solvespace</a>
  slightly sooner than my e-mail notifications.
The gin helped.
</p>


HEADING(2, how, How?)
<p class="continued">
Apart from blatant disregard for common decency:
</p>
<ul class="continuation">
  <li><code>1</code>  postfix smarthost</li>
  <li><code>1</code>  <a href="//tools.suckless.org/sic">sic(1)</a> process</li>
  <li><code>1</code>  MUA that handles a continuously-updating mbox gracefully</li>
  <li><code>2</code>  FIFOs</li>
  <li><code>11</code> lines of AWK to "deliver" messages from sic to a mbox</li>
  <li><code>10</code> lines of AWK to deliver messages from postfix to sic</li>
</ul>


HEADING(3, how-irc, The IRC)
<p class="continued">
Start with a simple connection:
</p>
<div class="bigcode continuation">
  #include "blogn_t/003.01-conn-init.shell-session.html"
</div>

<p class="indented">
Now <kbd>cat &lt; output &</kbd> to see what'<!--'-->s up and <kbd>cat &gt;&gt; input</kbd> to open the connection, something like
</p>
<div class="bigcode continuing">
  #include "blogn_t/003.02-conn-blurb.plaintext.html"
</div>
<p class="continuing">
should appear, and typing "<kbd>:m hasix owo</kbd>" should produce a message in the web client and
</p>
<div class="bigcode continuing">
  <pre class="language-plaintext"><code class="language-plaintext">hasix       : 07/10/20 16:07 &lt;nabijaczleweli&gt; owo</pre></code>
</div>
<p class="continuing">
a message that comes back should show up as well:
</p>
<div class="bigcode continuation">
  <pre class="language-plaintext"><code class="language-plaintext">nabijaczleweli: 07/10/20 16:09 &lt;hasix&gt; :)</pre></code>
</div>


HEADING(3, how-mbox, The mbox)
<p class="indented continued">
Great. Suspend the input <code>cat</code> (killing it will slam <code>sic</code>'<!--'-->s pipe and kill it) and kill the output <code>cat</code>,
  replacing it with a (GNU) AWK process running this
</p>
<div class="bigcode continuing">
  #include "blogn_t/003.03-sic-to-mbox-parser.awk.html"
</div>
<p class="continuing">
i.e.
</p>
<div class="bigcode continuation">
  <pre class="language-plaintext"><code class="language-plaintext">gawk <span class="token string">'&lt;&lt;that&gt;&gt;'</span> output | tee -a mbox &</pre></code>
</div>

<p class="indented continued">
Now if a message arrives (from the web client) or is sent (":m hasix msg"), it should show up with
</p>
<div class="bigcode continuing">
  #include "blogn_t/003.04-first-mail.plaintext.html"
</div>
<p class="continuing">
both in the teletype and the mailbox. At this point pointing the MUA at it should work and the message should show up:
</p>
<img class="continuing" src="/content/assets/blogn_t/003.03-should_show_up.png"
     alt="neomutt window showing two messages, one from nabijaczleweli@irc. with subject '<hasix> owo'; second from hasix@irc. with subject '<nabijaczleweli> owo'" />
<p class="continuation">
If they don'<!--'-->t, see if the messages are flushed, or if the MUA handles this in general.
</p>


HEADING(3, how-postfix, The MX)
<p class="continued">
Now it'<!--'-->s time to convince postfix to do a big crime, by:
</p>
<ul class="continuation">
  <li>adding "irc" to <code>mydestination</code> in <code>/etc/postfix/main.cf</code> and ensuring <code>transport_maps = hash:/etc/postfix/transport</code> therein,</li>
  <li>appending "irc  irc:" to <code>/etc/postfix/transport</code> (and running <code>postmap</code> on it),
      which will make messages to <kbd>@irc,</kbd> use the <kbd>irc:</kbd> protocol,</li>
  <li>appending what follows to <code>/etc/postfix/master.cf</code> (I stole this from the internet,
      <a href="//manpages.debian.org/buster/postfix/pipe.8postfix.en.html">pipe(8postfix)</a> or
      <a href="//manpages.debian.org/buster/postfix/master.5.en.html">     master(5)</a> will probably be very insightful):
      <div class="bigcode">
        #include "blogn_t/003.05-service-decl.bash.html"
      </div>
      </li>
  <li>reloading postfix.</li>
</ul>

<p class="indented continued">
<code>ircmail</code> should be executable and something like this
  (note that the From: parsing is entirely superfluous, but might be useful for scaling this to multi-user):
</p>
<div class="bigcode continuation">
  #include "blogn_t/003.06-ircmail.awk.html"
</div>

<p class="indented continued">
Now, sending a mail to "hasix@irc", "##test@irc", &c. should yield something like
</p>
<div class="bigcode continuing">
  #include "blogn_t/003.07-journal-fragment.plaintext.html"
</div>
<p class="continuation">
in the journal, and the corresponding commands in sic'<!--'-->s input.
</p>

HEADING(2, conclusion, Conclusion?)
<p class="indented continued">
Despite this technically making an open IRC relay, since anyone can connect on port 25 with <code>RCPT TO:&lt;whomever@irc&gt;</code>,
  this is perfect and I wholeheartedly recommend it for when your workflow includes a MUA but not IRC!
</p>
<p class="indented continuation">
I am, as ever, morbidly curious so as to scaling this to a multi-user/auto-join solution, but, well, even I have my limits.
Okay, I don't, but I don't really have much of a reason to Be On™ IRC. Watch me eat my words in, like, a year, I guess?
</p>


BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()
