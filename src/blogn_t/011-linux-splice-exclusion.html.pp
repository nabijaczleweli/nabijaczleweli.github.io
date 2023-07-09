<!--
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->
<!-- https://lfs.nabijaczleweli.xyz/0016-cohost-export/https://cohost.org/nabijaczleweli/post/1730377-please-talk-to-my-su -->


#include "../writing/writing.h"
#include "../fontawesome.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Fri, 07 Jul 2023 01:42:34 +0200" -->
#define POST_DATE      Fri, 07 Jul 2023 01:42:34 +0200
#define POST_POST_DATE

#define CMT Also used in heading.h, make sure to update both with fixes
#undef CMT
#define HEADING_LINK(id)                  <a class="hash-link" href=STR(HASH##id)>HASH</a>
#define HEADING_S(level, hid, style, ...) <h##level id=STR(hid) style>HEADING_LINK(hid) __VA_ARGS__</h##level>


#define STYLESHEETS BLOGN_T_STYLESHEETS FONTAWESOME_LINK <link href="/content/assets/prism-twilight.min.css" rel="stylesheet" />


BOILERPLATE(011. pipe exclusion with splice() under Linux — blognꞌt, 011. pipe exclusion with splice() under Linux, en-GB, STYLESHEETS WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

kbd {
  font-weight: bold;
}

.inline {
  padding-left: 3em;
}

pre {
  white-space: pre-wrap;
}
</style>

<span class="roboto writing">


<p></p>
BLOGN_T_HEADING(<code>011. pipe exclusion with splice() under Linux</code>)


<p class="indented continued">
Since apparently I'<!--'-->m
<a href="//lore.kernel.org/linux-fsdevel/jbyihkyk5dtaohdwjyivambb2gffyjs3dodpofafnkkunxq7bu@jngkdxx65pux/t/#u">the only <code>splice</code>(2) user</a>,
herein I demonstrate a <a href="//lore.kernel.org/linux-fsdevel/qk6hjuam54khlaikf2ssom6custxf5is2ekkaequf4hvode3ls@zgf7j5j4ubvw/t/#u">fun Linux BKL moment</a>
(but the BKL is on a pipe).
</p>
<p class="indented continuing">
If you use a <a href="//git.sr.ht/~nabijaczleweli/voreutils/tree/trunk/item/cmd/cat.cpp">splicing <code>cat</code></a>,
you can do this right now from your teletype: just
</p>
<pre class="continuing inline"><samp><!--
-->$ <kbd>cat | whatever</kbd><!--
--></samp></pre>
<p class="continuation">
and <code>whatever</code> will sleep forever on reads from its standard input stream, even if it set <code>O_NONBLOCK</code> on it.
</p>

<p class="indented continued">
That'<!--'-->s boring tho, since anonymous pipes are, well, anonymous. What about
</p>
<pre class="continuing inline"><samp><!--
-->$ <kbd>mkfifo fifo</kbd>
$ <kbd>whatever &lt; fifo &</kbd>
$ <kbd>cat > fifo</kbd>
</samp></pre>
<p class="continuing">
? The same applies! Even better:
</p>
<pre class="continuing inline"><samp><!--
-->$ <kbd>> fifo</kbd><!--
--></samp></pre>
<p class="continuation">
from another teletype sleeps forever as well.
So does the <code>&lt;</code> direxion.
And <code>O_NONBLOCK</code>.
</p>

<p class="indented">
And <em>any</em> operation on that pipe.
Try sending a deadly signal to any of the afflicted (non-<code>cat</code>) processes, too!.
</p>

<p class="indented continued">
If you don'<!--'-->t, then
</p>
<div class="bigcode inline continuing">
#include "blogn_t/011.01-cat.c.html"
</div>
<p class="continuation">
can function as the pro-verbial <code>cat</code>.
You can also substitute the <code>splice(…)</code> for a <code>sendfile(1, 0, 0, 128 * 1024 * 1024);</code>,
since, as a special case since 5.12,
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/read_write.c?id=b964bf53e540262f2d12672b3cca10842c0172e7">sendfile(any→pipe) is legal and equivalent to splice() of the same</a>,
even though otherwise it
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/splice.c?id=6995e2de6891c724bfeb2db33d7b87775f913ad1#n905">only allows seekable→any</a>.
</p>



<p class="indented continued">
But
</p>
HEADING_S(2, how, class="continuing", how?)
<p class="continuing">
Quite easily —
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/splice.c?id=6995e2de6891c724bfeb2db33d7b87775f913ad1#n1111"><code>splice_file_to_pipe()</code></a>,
which, shockingly, runs when splicing
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/splice.c?id=6995e2de6891c724bfeb2db33d7b87775f913ad1#n1131">from a non-pipe to a pipe</a>,
locks the output pipe, then does I/O, then unlocks it.
Locking the pipe naturally excludes concurrent
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/pipe.c?id=6995e2de6891c724bfeb2db33d7b87775f913ad1#n1098"><code>open()</code>s</a>,
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/pipe.c?id=6995e2de6891c724bfeb2db33d7b87775f913ad1#n231"><code>read()</code>s</a>,
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/pipe.c?id=6995e2de6891c724bfeb2db33d7b87775f913ad1#n417"><code>write()</code>s</a>.
and
<a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/pipe.c?id=6995e2de6891c724bfeb2db33d7b87775f913ad1#n717">final <code>close()</code>s</a>
(incl. implicit ones on death).
</p>
<p class="indented continuation">
Usually you wouldn'<!--'-->t think this to be a huge issue, since most I/O completes within some reasonably-bounded time,
but teletype I/O, by design, never does
<a href="//srhtcdn.githack.com/~nabijaczleweli/voreutils/blob/man/man1/stty.1.html#ATTRIBUTES">until a newline/<code>eof</code>/<code>eol</code>/<code>eol2</code></a>.
And, thus, QED.
</p>


<p class="indented continued">
But
</p>
HEADING_S(2, notty, class="continuing", I'<!--'-->m not at a teletype‽)
<div class="bigcode continuation">
#include "blogn_t/011.02-v.c.html"
</div>


HEADING_S(2, bisexion, , Bisexion)

<p class="indented continued">
By rough-bisecting off snapshot.d.o kernel packages – since
<a href="//lfs.nabijaczleweli.xyz/0016-cohost-export/https://cohost.org/nabijaczleweli/post/1787015-two-hours-babysittin">4.0, and even 5.0, don'<!--'-->t build on bookworm</a> –
to between
<code>4.8.15-2</code> and <code>4.9.1-1~exp1</code>,
<!--
3.16.36-1+deb8u1 is ok
Linux (none) 4.5.0-2-amd64 #1 SMP Debian 4.5.5-1 (2016-05-29) x86_64 GNU/Linux   is ok
Linux (none) 4.8.0-2-amd64 #1 SMP Debian 4.8.15-2 (2017-01-04) x86_64 GNU/Linux  is ok

Linux (none) 4.9.0-trunk-rt-amd64 #1 SMP PREEMPT RT Debian 4.9.1-1~exp1 (2017-01-07) x86_64 GNU/Linux us borken
vmlinuz-4.19.0-9-amd64 is borken
-->
then manually bisecting between <code>v4.8</code> and <code>v4.9</code> – in a stretch chroot, naturally,
since images built on buster hard-rebooted QEMU in a tight loop just after the decompressor and ELF parsing;
strapping the chroot took two hours of baby-sitting due to the current state of s.d.o, and most revisions only build
<a href="//lists.ubuntu.com/archives/kernel-team/2016-May/077178.html">with an ubuntu patch</a>;
so much for never breaking fucking userspace –
</p>
<pre class="continuing inline"><a href="//git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8924feff66f35fe22ce77aafe3f21eb8e5cff881">commit 8924feff66f35fe22ce77aafe3f21eb8e5cff881 ("splice: lift pipe_lock out of splice_to_pipe()")</a></pre>
<p class="continuation">
is the first bad commit.
</p>

<p class="indented continued">
(The smoketest is:
</p>
<pre class="continuing inline">
./v > fifo &
read -r _ < fifo &
echo zupa > fifo
</pre>
<p class="continuation">
<code>good</code> is it completes; <code>bad</code> is it hangs.)
</p>

<p class="indented">
This aligns with the origin of the modern <code>pipe_lock()</code> placement I got by recursive <code>blame</code>.
</p>


<p class="indented continued">
But
</p>
HEADING_S(2, why, class="continuing", why'<!--'-->d I care?)
<p class="continuing">
Depends if you'<!--'-->re running, like, nullmailer, in which case
<a href="//lore.kernel.org/linux-fsdevel/qk6hjuam54khlaikf2ssom6custxf5is2ekkaequf4hvode3ls@zgf7j5j4ubvw/t/#m69ed72a7e0ffa7da3ba9f8800cd85bb63f6da715"><code>./v > /var/spool/nullmailer/trigger</code></a>
makes it ⇒ any subsequent MUA ⇒ any subsequent sender (if <code>wait()</code>ing synchronously) enter the signal-impervious mutex-sleeping state,
which can only be recovered from by killing the splicing process.
Good luck finding that, since this affects any ptracing process as well.
</p>
<p class="indented continuing">
Or any other message or log collection system where – especially unprivileged – users write stuff to a pipe,
since they'<!--'-->ve now been granted a total exclusion thereon.
</p>
<p class="indented continuing">
Even in inocuous situations like QEMU with <samp>-chardev pipe,id=pipe,path=$HOME/uwu/q -serial chardev:pipe</samp>, <code>cat</code>ting to <code>~/uwu/q.in</code>
(besides only waking up every second line, which is just business as usual), excludes emulation.
</p>



BLOGN_T_FOOTER()

</span>
WORD_COUNTER_END()
BOILERPLATE_END()
