<!--
nabijaczleweli.xyz (c) by nabijaczleweli@nabijaczleweli.xyz
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "../writing/writing.h"
#include "../fontawesome.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Thu, 17 Oct 2024 03:42:06 +0200" -->
#define POST_DATE      Thu, 17 Oct 2024 03:42:06 +0200
#define POST_POST_DATE

#define Tn(...)  <span class="smallcaps">__VA_ARGS__</span>
#define CMT(...) <del>__VA_ARGS__</del>
#define ELISION CMT([…])

#undef linux
#undef unix


BOILERPLATE(017. malloc(0) & realloc(…，0) ≠ 0 — blognꞌt, 017. malloc(0) & realloc(…，0) ≠ 0, en-GB, BLOGN_T_STYLESHEETS FONTAWESOME_LINK FORCED_NEWLINE WORD_COUNT_SCRIPT)
<style>
#include "../writing/the_taste_of_mi/spacing.css"
#include "../gen-epub-book/fonts.css"
#include "../indent.css"

del {
	text-decoration: none;
	opacity: 50%;
}

.nowrap {
	white-space: nowrap;
}

cite {
	font-style: inherit;
}
cite.path {
	font-size: 0.6em;
	line-height: 0.6em;
	font-style: italic;
}

details#contents > ol a {
	display: initial !important;
}
</style>


BLOGN_T_HEADING(017. malloc(0) & realloc(…, 0) ≠ 0)

<p class="indented continued">
<a href="//www.open-std.org/jtc1/sc22/wg14/www/docs/n3301.pdf#subsection.7.24.4">C</a> and <a href="//pubs.opengroup.org/onlinepubs/9799919799/functions/malloc.html">POSIX</a>
say that
</p>
<blockquote class="continuing">
If the size of the space requested is 0, the behavior is implementation-defined:
either a null pointer shall be returned, or the behavior shall be as if the size were some non-zero value ELISION.
</blockquote>
<p class="continuation">
one <a href="//github.com/shadow-maint/shadow/pull/1095">has to wonder</a> if this is real.
</p>


HEADING_S(2, v6, class="continued", UNIX Programmer'<!--'-->s Manual, <cite><a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v6/v6doc.tar.gz">Sixth Edition</a></cite>)
<p class="continuation">
doesn'<!--'-->t have <code>malloc</code>.
</p>


HEADING_S(2, v7, class="continued", UNIX™ Time-Sharing System: UNIX Programmer'<!--'-->s Manual, <cite><a href="//www.tuhs.org/Archive/Distributions/Research/Henry_Spencer_v7/v7.tar.gz">Seventh Edition</a></cite>)
<p class="continuing">
has a malloc(3) with <code>malloc</code> and <code>realloc</code>:
</p>
<blockquote class="continuing">
<i>Malloc</i>, <i>realloc</i> and <i>calloc</i> return a null pointer (0) if there is no available memory or if the arena has been detectably corrupted ELISION.
</blockquote>
<p class="continuing">
where <code>malloc</code> allocates <code>(nbytes+WORD+WORD-1)/WORD</code> (≥1) words, where one is eaten for the allocation size,
and <code>realloc(b, nbytes)</code> is <code>free(b); malloc(nbytes); memcpy()</code> (in so many words),
with <code>memcpy()</code> skipped if the just-freed block was <code>malloc</code>ed.
<cite class="path"><samp>usr/man/man3/malloc.3</samp>, <samp>usr/src/libc/gen/malloc.c</samp></cite>
</p>


HEADING_S(2, BSD, class="continued", <cite><a href="//www.tuhs.org/Archive/Distributions/Research/Henry_Spencer_v7/v7.tar.gz">The Tn(bsd)</a></cite>)
<p class="indented continuation">
<cite>
	<a href="//www.mckusick.com/csrg/">The Tn(csrg) Archives</a>,
	<a href="//archive.org/details/The_CSRG_Archives_CD-ROM_1_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 1</span>: Berkeley Systems 1978-1986</a>,
	<a href="//archive.org/details/The_CSRG_Archives_CD-ROM_2_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 2</span>: Berkeley Systems 1987-1993</a>,
	and&nbsp;<a href="//archive.org/details/The_CSRG_Archives_CD-ROM_3_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 3</span>: Final Berkeley Releases</a>
</cite>
say that everything up to 4.1<!---->Tn(bsd) uses the Tn(v7) allocator.
<cite class="path"><samp>3bsd/usr/src/libc/gen/malloc.c</samp>, <samp>4.0/usr/src/libc/gen/malloc.c.c</samp>, <samp>4.1/usr/src/libc/gen/malloc.c</samp></cite>
<cite class="path"><samp>3bsd/usr/man/man3/malloc.3</samp>, <samp>4.0/usr/man/man3/malloc.3</samp>, <samp>4.1/usr/man/man3/malloc.3</samp></cite>
</p>

HEADING_S(3, 42BSD, class="continued", 4.2<!---->Tn(bsd))
<p class="continuing">
has a new allocator:
<cite class="path"><samp>4.2/usr/src/lib/libc/gen/malloc.c</samp>, <samp>4.2/usr/man/man3/malloc.3</samp></cite>
</p>
<blockquote class="continuing"><pre class="continuing"><!--
    "-->/*<!--"-->
<!--"--> * nextf[i] is the pointer to the next free block of size 2^(i+3).  The<!--"-->
<!--"--> * smallest allocatable block is 8 bytes.  The overhead information<!--"-->
<!--"--> * precedes the data area returned to the user.<!--"-->
<!--"--> */<!--"-->
#define NBUCKETS 30
static  union overhead *nextf[NBUCKETS];<!--
--></pre></blockquote>
<p class="continuation">
but otherwise implements the same methodology by adding <code>sizeof (union overhead)</code> to the allocation size before rounding up and bucketing.
<code>realloc(cp, nbytes)</code> similarly returns <code>cp</code> if <code>nbytes</code> ≤ the old allocation size, else <code>malloc(nbytes); memcpy()</code>.
</p>

HEADING_S(3, 43BSD, class="continued", 4.3<!---->Tn(bsd))
<p class="continuing">
goes about calculating it differently, but small allocations remain equivalent to allocating 8 bytes.
<cite class="path"><samp>4.3/usr/src/lib/libc/gen/malloc.c</samp>, <samp>4.3/usr/man/man3/malloc.3</samp></cite>
</p>

HEADING_S(3, 44BSD, class="continued", 4.4<!---->Tn(bsd))
<p class="continuing">
updates the malloc(3) <cite>RETURN VALUES</cite> wording to
</p>
<blockquote class="continuing">
The <code><b>malloc</b></code>() function returns a pointer to the allocated space if successful; otherwise a null pointer is returned.
</blockquote>
<p class="continuing">
and cites conformance with C89.
<cite class="path"><samp>4.3tahoe/usr/src/lib/libc/gen/malloc.c</samp>, <samp>4.3reno/usr/src/lib/libc/stdlib/malloc.c</samp>, <samp>4.4BSD-Lite1/usr/src/lib/libc/stdlib/malloc.c</samp>, <samp>4.4BSD-Lite2/usr/src/lib/libc/stdlib/malloc.c</samp></cite>
<cite class="path"><samp>4.3tahoe/usr/src/man/man3/malloc.3</samp>, <samp>4.3reno/usr/src/lib/libc/stdlib/malloc.3</samp>, <samp>4.4BSD-Lite1/usr/src/lib/libc/stdlib/malloc.3</samp>, <samp>4.4BSD-Lite2/usr/src/lib/libc/stdlib/malloc.3</samp></cite>
</p>


HEADING_S(2, SysIII, class="continued", Tn(Unix) User'<!--'-->s Manual, <cite><a href="//archive.org/details/bitsavers_attunixSysalRelease3Jun80_33886798">Release 3.0</a></cite>)
<p class="continuing">
uses the Tn(v7) allocator and malloc(3C).
<cite class="path">p. 524, <a href="//vetusware.com/download/UNIX%20System%20III%20Source%20Code%20SYSIII/?id=11576"><samp>src/lib/libc/vax/gen/malloc.c</samp></a></cite>
</p>


HEADING(2, SysVr123, Tn(Unix)∗ System User'<!--'-->s Manual, <cite><a href="//bitsavers.org/pdf/att/unix/System_V_Release_1/301-905_UNIX_System_V_Release_1_Users_Manual_Jan83.pdf">System V</a></cite><br /> UNIX™ <b>System V</b>—<a href="http://bitsavers.org/pdf/att/unix/System_V_Release_2/307-113_UNIX_System_V_Release_2.0_Programmer_Reference_Manual_DEC_Processors_Apr1984.pdf">Release 2.0</a> <b>Programmer Reference Manual</b><br /> <b>UNIX® System V</b> Programmer'<!--'-->s Reference Manual <del>[<a href="http://bitsavers.org/pdf/att/unix/System_V_Release_3/308-139_UNIX_System_V_Release_3_Programmers_Guide_1987.pdf">SysVr3</a>]</del>)

<p class="indented">
None of these make any meaningful changes to the allocator (in the domain of small allocations) or to malloc(3C).
<cite class="path">p. 585, <a href="//vetusware.com/download/UNIX%20SYSVr1%20Source%20Code%20r1/?id=11570"><samp>sysv-pdp11_usr-src/lib/libc/port/gen/malloc.c</samp></a></cite>
<cite class="path">p. <code>MALLOC(3C) 1</code>, <a href="//vetusware.com/download/UNIX%20SYSVr2%20Source%20Code%20r2/?id=11571"><samp>sysv-pdp11_usr-src/lib/libc/port/gen/malloc.c</samp></a></cite>
<cite class="path">p. 310 (331), <a href="//vetusware.com/download/UNIX%20SYSVr3%20Source%20Code%20r3/?id=11572"><samp>301/usr/src/lib/libc/port/gen/malloc.c</samp>, <samp>31/usr/src/lib/libc/port/gen/malloc.c</samp></a></cite>
</p>

<p class="indented continued">
SysVr2 and SysVr3 both additionally ship malloc(3X) (the "<em>fast</em> main memory allocator"), however, as <code>-lmalloc</code>.
Within the area this document surveys, the manual is functionally equivalent, sans the <cite>WARNINGS</cite> including
</p>
<blockquote class="continuing">
Undocumented features of <i>malloc</i>(3C) have not been duplicated.
</blockquote>
<p class="continuation">
and, indeed, this implementation'<!--'-->s <code>malloc(nbytes)</code> says <code>if (nbytes == 0) return NULL;</code>
and <code>realloc(ptr, size)</code> says <code>if(size == 0) return NULL;</code>.
</p>

<p class="indented continued">
If one recalls that the <cite>DIAGNOSTICS</cite> still say that
</p>
<blockquote class="continuing">
<i>malloc</i>, <i>realloc</i> and <i>calloc</i> return a NULL pointer if there is not enough available memory.
</blockquote>
<p class="continuing">
and mention no other case,
and the <cite>DESCRIPTION</cite>
<blockquote class="continuing">
The argument to <i>free</i> is a pointer to a block previously allocated by malloc
</blockquote>
<p class="continuing">
when <code>free(0)</code> doesn'<!--'-->t work (dereferences negative pointer, so segfaults, probably?),
then it's difficult to conclude that this isn't an "undocumented feature", but "just a bug in malloc(3X) actually".
<cite class="path">p. <code>MALLOC(3X) 1</code>, <samp>src/lib/libmalloc/malloc.c</samp></cite>
<cite class="path">p. 469 (490), <samp>301/usr/src/lib/libmalloc/malloc.c</samp></cite>
</p>

<p class="indented continuing">
This is also the birth of the <cite>DIAGNOSTICS</cite>'<!--'-->
</p>
<blockquote class="continuation">
When <i>realloc</i> returns NULL, the block pointed to by <i>ptr</i> is left intact.
</blockquote>


HEADING_S(2, SysVr4, class="continued", UNIX® System V <a href="//bitsavers.org/pdf/att/unix/System_V_Release_4/0-13-947029-8_Unix_System_V_Rel4_Programmers_Reference_Manual_1990.pdf">Release 4</a> Programmer'<!--'-->s Reference Manual)
<p class="indented continuing">
has a new implementation, in which <code>malloc</code> first tries to re-use the last-freed block,
then allocations smaller than 5 <code>int</code>s use a special small-block queue, wherein
</p>
<blockquote class="continuing"><pre class="continuing"><!--
    "-->	/* want to return a unique pointer on malloc(0) */<!--"-->
<!--"-->	if(size == 0)<!--"-->
<!--"-->		size = WORDSIZE;<!--"
--></pre></blockquote>
<p class="indented continuing">
(i.e. <code>sizeof(int)</code>).
This spills to <code>realloc</code> where
</p>
<blockquote class="continuing"><pre class="continuing"><!--
    "-->	/* special cases involving small blocks */<!--"-->
<!--"-->	if(size &lt; MINSIZE || SIZE(tp) &lt; MINSIZE)<!--"-->
<!--"-->		goto call_malloc;<!--"
--></pre></blockquote>
<p class="indented continuing">
where the old algorithm is reimplemented as <code>malloc(); memcpy(); free()</code>.
<cite class="path">p. 507, <a href="//vetusware.com/download/UNIX%20SYSVr4%20Source%20Code%20r4/?id=11573"><samp>ATT-SYSVr4/lib/libc/port/gen/malloc.c</samp>, <samp>ATT-SYSVr4/lib/libc/port/gen/mallint.h</samp></a></cite>
</p>

<p class="indented">
malloc(3X) is unchanged but <code>-lmalloc</code> <code>free</code> accepts <code>NULL</code>s now.
And <code>realloc(ptr, 0)</code> frees <code>ptr</code>.
As it should do, since <code>NULL</code> is this implementation'<!--'-->s spelling for a zero-sized allocation.
Except that it now no longer leaves <code>ptr</code> unchanged when returning <code>NULL</code>.
<cite class="path">p. 682, <samp>ATT-SYSVr4/lib/libmalloc/malloc.c</samp></cite>
</p>


HEADING_S(2, sunos3, class="continued", SunOS <a href="//www.bitsavers.org/bits/Sun/sun3/sunos_3.4_src.7z">4.1.3</a>)
<p class="continuation">
uses the SunOS allocator which <code>malloc</code>s and <code>realloc</code>s at least <code>sizeof(uint)</code> (+ once again for the accounting block).
This allocator is dated 1986, so there's no reason to suspect (and no way to verify) there was another one that interceded 'twixt the Tn(v7) one.
<cite class="path"><samp>sunos_3.4_src/lib/libc/gen/malloc.h</samp>, <samp>sunos_3.4_src/lib/libc/gen/mallint.h</samp></cite>
</p>

HEADING_S(2, sunos4, class="continued", SunOS <a href="//vetusware.com/download/SunOS%20Source%20Code%204.1.3/?id=13475">4.1.3</a>)
<p class="continuing">
adjusts the minima to <code>sizeof(double)</code> on Tn(sparc) or <code>sizeof(uint)</code> on m68k.
<cite class="path"><samp>SunOS 4.1.3 sunsrc.tar</samp>, <samp>SunOS 4.1.3 sunsrc/413/lib/libc/gen/common/malloc.c</samp>, <samp>SunOS 4.1.3 sunsrc/413/lib/libc/gen/common/mallint.h</samp></cite>
</p>
<p class="indented continuation">
It also ships libxpg which includes SysVr2-style <code>-lmalloc</code>
<cite class="path"><samp>SunOS 4.1.3 sunsrc.tar</samp>, <samp>SunOS 4.1.3 sunsrc/413/xpglib/malloc.c</samp></cite>
</p>

HEADING_S(2, solaris, class="continued", Solaris <a href="//vetusware.com/download/Solaris%20Source%20Code%205.8/?id=11547">8</a>)
<p class="continuation">
ships both implementations functionally unchanged since SysVr4.
There'<!--'-->s no
<a href="//vetusware.com/download/Solaris%202.5%20Source%20Code%202.5/?id=11544">reason</a>
<a href="//vetusware.com/download/Solaris%20Source%20Code%202.6/?id=11545">to</a>
<a href="//vetusware.com/download/Solaris%20Source%20Code%202.7/?id=11546">suspect</a>
this has ever wavered in SysV SunOSes prior (or for some time after 2000).
</p>


HEADING_S(2, SVID, class="continued", Tn(svid))
<p class="continuation">
has no extant copy.
</p>

HEADING_S(3, SVID2, class="continued", System V Interface Definition, <a href="//bitsavers.org/pdf/att/unix/SVID/System_V_Interface_Definition_Issue_2_Volume_1_1986.pdf">Issue 2</a>)
<p class="continuing">
includes SysVr2 malloc(3X) mostly-verbatim as malloc(BA_OS) in Volume 1.
(The API is adapted minimally to match SysVr3'<!--'-->s.)
The <cite>RETURN VALUE</cite> is extended to say for the first time
</p>
<blockquote class="continuing">
The functions <tt>malloc</tt>, <tt>realloc</tt>, and <tt>calloc</tt> return a <tt>NULL</tt> pointer if <tt>nbytes</tt> is <tt>0</tt>
or if there is not enough available memory.
</blockquote>
<p class="continuing">
Illuminatingly, <cite>RETURN VALUE</cite> proclaims that
</p>
<blockquote class="continuing">
In System V Release 2.0, the developer can control whether the contents of the freed space are destroyed or left undisturbed ELISION.
In System V Release 1.0, the contents are left undisturbed.
</blockquote>
<p class="continuing">
manufacturing a reality in which the <em>undocumented behaviour of the <code>-lmalloc</code> opt-in extension</em> is actually the universal baseline.
<cite class="path">p. 103 (114)</cite>
</p>

HEADING_S(3, SVID3, class="continued", System V Interface Definition, <a href="//archive.org/details/systemvinterface0001unse">Third Edition</a>)
<blockquote class="continuing">
The functions <tt>malloc</tt>(), <tt>realloc</tt>(), and <tt>calloc</tt>() return a null pointer if there is not enough available memory.
If the size of the space requested is zero, the behavior is implementation defined; the value returned will be either a null pointer or unique pointer.
When <tt>realloc</tt>() returns <tt>NULL</tt>, the block pointed to by <i>ptr</i> is left intact.
</blockquote>
<p class="continuing">
This is supposed to match SysVr4, and neither of SysVr4'<!--'-->s mallocs document which behaviour they pick.
It also mandates SysVr2 (SysVr3)'s <code>-lmalloc</code>'s leaking behaviour, which SysVr4 has fixed, making it non-compliant.
<cite class="path">p. 6-76</cite>
</p>


HEADING_S(2, XPG, class="continued", <a href="//bitsavers.computerhistory.org/pdf/xOpen/X_Open_Portability_Guide_1985/xpg_2_xopen_system_v_specification_2.pdf">X/Open Portability Guide, Part II: The X/Open System V Specification</a>)
<p class="continuation">
includes SysVr2'<!--'-->s malloc(3X) as malloc(3X) (it says it's via SVID malloc(OS) but it <em>doesn't</em> define <code>malloc(0) = NULL</code>).
It notes that an <q>older (smaller) form may also exist</q>,
but correctly recognises that <q>it is the responsibility of the application developers to ensure that the appropriate version is linked into their applications</q>.
<cite class="path">p. 103</cite>
</p>


HEADING_S(3, XPG4, class="continued", Tn(xpg4))
<p class="continuation">
<q>is updated to indicate what will be returned if <i>size</i> is 0</q>: <code>NULL</code> or a unique <code>free</code>able.
<cite class="path"><a href="//pubs.opengroup.org/onlinepubs/009656499/toc.pdf#page=406"></a> p. 378 (406) & 468 (495)	</cite>
</p>

<p class="indented">
This is naught but a mild editorialisation of <a href="//nvlpubs.nist.gov/nistpubs/Legacy/FIPS/fipspub160.pdf#page=155">C89 wording</a>,
and later <ss>Tn(xpg)s</ss><ss>Tn(sus)es</ss>Tn(posix)es use later Cs.
</p>


HEADING_S(2, conclusions, class="continued", Conclusions)
<p class="continuing">
Within the area this document surveys (Tn(at&t unix), the Tn(bsd), SunOS and '<!--'-->til-Y2K Solaris, pre-Tn(xpg) Tn(svid), Tn(xpg) and its descendants):
</p>
<ol>
	<li>every <code>realloc(…, 0)</code> ever behaved congruently with its <code>malloc</code></li>
	<li>every <em>default</em> <code>malloc(0)</code> ever behaved as-if <code>malloc(n); n > 0</code></li>
	<li>this is documented. just not, like, as explicitly as you'<!--'-->d write it today,
	    but there hadn't been a confounding implementation that did the opposite, so it never crossed anyone's mind probably</li>
	<li>this was clearly understood as relied-on behaviour, as it'<!--'-->s retained across multiple re-implementations</li>
	<li>the implementation that breaks this — SysVr2 <code>-lmalloc</code> — also understands this since
	    (a) it has to implement the opposite behaviour explicitly,
	    (b) includes a nod to its removal in malloc(3X)
	        (the other behaviour this could be referring to is retained — <code>realloc</code> can <q>deal<!----> with twits who reallocate free blocks</q>)</li>
	<li>this difference is not documented</li>
	<li>the author needs to opt into this implementation explicitly (and is — ever so tacitly — warned about this) so this is basically fine, if sub-optimal</li>
	<li>AT&T issues the Tn(svid) with the malloc(3X) extension presented as the universal baseline interface,
	    with its undocumented features, incl. <code>malloc(0) = NULL</code>, expressly defined as standard</li>
	<li>this contrapuncts the implied documentation in every other implementation, which is now awfully weak</li>
	<li>the Tn(xpg) manages to miss this,
	    but it'<!--'-->s now impossible to reconcile the behaviour mandated by the Tn(svid) that <em>no-one was actually getting</em>
	    with the unstated behaviour experienced universally, except by saying "yeah fuckin do whatever" a decade later</li>
</ol>

HEADING_S(3, conclusions, class="continued", Verdict <del style="font-weight: normal;"><small><i>(this section is not normative)</i></small></del>)
<p class="continuing">
not real.
</p>


BLOGN_T_FOOTER()
WORD_COUNTER_END()
BOILERPLATE_END()
