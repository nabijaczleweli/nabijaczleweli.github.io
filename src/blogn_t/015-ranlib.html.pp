<!--
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->

#include "../writing/writing.h"
#include "../common.h"
#include "blogn_t.h"


   <!-- RSS_PUB_DATE: "Tue, 01 Oct 2024 11:09:48 +0200" -->
#define POST_DATE      Tue, 01 Oct 2024 11:09:48 +0200
#define POST_POST_DATE

#define Tn(...)  <span class="smallcaps">__VA_ARGS__</span>
#define CMT(...) <del>__VA_ARGS__</del>
#define ELISION CMT([…])
#define Nx Net(FORCED_SPACER)Tn(bsd)


BOILERPLATE(015. where da lib runnin — blognꞌt, 015. where da lib runnin, en-GB, <link href="/content/assets/prism-twilight.min.css" rel="stylesheet"> BLOGN_T_STYLESHEETS WORD_COUNT_SCRIPT_NON_ENGLISH)
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

samp {
	font-weight: bold;
}

.continuing > dl {
	margin: 0;
}

dl.bltag {
	display: table;
}
dl.bltag dt, dl.bltag dd {
	display: table-cell;
}
dl.bltag dd {
	padding-left: 1em;
}
</style>


BLOGN_T_HEADING(015. where da lib runnin)

<p class="indented continued">
If you're anything like me (and let us hope this is not the case) you've come across <code>ar crs</code>, or, for that matter, ar(1) saying
</p>
<blockquote class="continuing">
	<dl class="bltag">
		<dt><samp>s</samp></dt>
		<dd>Write an object-file index into the archive ELISION. Running <samp>ar s</samp> on an archive is equivalent to running <samp>ranlib</samp> on it.</dd>
	</dl>
</blockquote>
<p class="continuing">while ranlib(1) (<q>generate an index to an archive</q>) says</p>
<blockquote class="continuing">
	<samp>ranlib</samp> generates an index to the contents of an archive ELISION.
	The index lists each symbol defined by a member of an archive that is a relocatable object file.
</blockquote>
<p class="continuing">comparing llvm-ar(1)</p>
<blockquote class="continuing">
	<dl class="bltag">
		<dt><samp>s</samp></dt>
		<dd>This modifier requests that an archive index (or symbol table) be added to the <var>archive</var>, as if using ranlib. CMT(Content description follows.)</dd>
	</dl>
</blockquote>
<p class="continuing">
and llvm-ranlib(1) (<q>manual page for llvm-ranlib 19</q>, the manual looks like untouched help2man-equivalent output)
OVERVIEWs it exclusively as <q>Generate an index for archives</q>.
</p>

<p class="indented continuing">
Beside the obvious question (the linker can already read archives and read the symbols out of objects, so why would the archive itself duplicate this),
these are all circular, <q>running <samp>ranlib</samp> is completely equivalent to executing <samp>ar -s</samp></q>, and <samp>s</samp> is the default.
Well, <samp>s</samp> is an XSI extension that <em>just</em> rebuilds the symbol table,
because POSIX.1-2024 (in text that dates back to the X/Open Portability Guide Issue 3 ("<!--"-->Tn(xpg3)<!--"-->") (1988), inherited directly from the System V Interface Definition ("<!--"-->Tn(svid)<!--"-->" (1985))) says
</p>
<blockquote class="continuation">
When there is at least one object file ELISION in the archive, an archive symbol table shall be created ELISION.
Whenever the <samp>ar</samp> utility is used to create or update ELISION an archive, the symbol table shall be rebuilt.
</blockquote>

<p class="indented continued">
This is all really clear-cut and agrees with our shared personal experience of having constructed many archives, and not having <code>ranlib</code>bed them, ever.
Why, then, does the <cite><a href="//www.gnu.org/software/automake/manual/html_node/Optional.html#index-AC_005fPROG_005fRANLIB">GNU Automake manual</a></cite> say
</p>
<blockquote class="continuing">
	<dl class="bltag">
		<dt><samp>AC_PROG_RANLIB</samp></dt>
		<dd>This is required if any libraries are built in the package.</dd>
	</dl>
</blockquote>
<p class="continuation">
And when was this last true, if ever?
</p>

<p class="indented continued">
As expected from the Tn(svid) wording provenance, versions 1-<a href="//www.tuhs.org/Archive/Distributions/Research/Dennis_v6/v6doc.tar.gz">6</a> Tn(at&t unix), Tn(at&t) System III Tn(unix), and all releases of Tn(at&t) System V Tn(unix)
ship without <samp>ranlib</samp>.
</p>
<p class="indented continuing">
Indeed, the Tn(svid) wording is replicated from
<a href="//bitsavers.org/pdf/att/unix/System_V_Release_1/301-905_UNIX_System_V_Release_1_Users_Manual_Jan83.pdf"><cite>Tn(Unix) System User'<!--'-->s Manual, System V, January 1983</cite></a> (SysVr1), in <em>both</em> ar(1)s,
but is not in
<a href="//archive.org/details/bitsavers_attunixSysalRelease3Jun80_33886798"><cite>Tn(Unix) User'<!--'-->s Manual, Release 3.0, June 1980</cite></a> (SysIII).
This also corresponds to the ld(1) wording change from
</p>
<blockquote class="continuing">
If any argument is a library, it is searched exactly once at the point it is
encountered in the argument list. Only those routines defining an unresolved
external reference are loaded. If a routine from a library references
another routine in the library, the referenced routine must appear after the
referencing routine in the library. Thus the order of programs within
libraries is important.
</blockquote>
<p class="continuing">(<cite>ibid.</cite>), and hence lorder(1) and tsort(1), to
<blockquote class="continuing">
ELISION are loaded. The library (archive) symbol table (see <i>ar</i>(4) is
searched sequentially with as many passes as are necessary to resolve external
references which can be satisfied by library members. Thus, the ordering of
library members is unimportant.
</blockquote>
<p class="continuing">
(<cite>SysVr1</cite>), but only in ld(1) for non-Tn(pdp-11)
(lorder(1) is further declared unneeded, except on the Tn(pdp-11)).
Later releases
(<a href="//bitsavers.org/pdf/att/unix/System_V_Release_2/UNIX_Programmers_Manual_Vol_1_Commands_and_Utilities_1986.pdf"><cite>UNIX programmer'<!--'-->s manual, 1986</cite></a> (SysVr2))
drop the Tn(pdp-11) and its specific ld(1)/ar(1); the lorder(1) mention is downgraded to <!--"-->"except onsome(FORCED_SPACER)CMT((sic)) computers"<!--"-->.
</p>

<p class="indented continued">
Conversely, Version 7 Tn(at&t unix) contains ranlib(1) (<q>convert archives to random libraries</q>, which explains the bizarre name), which
</p>
<blockquote class="continuing">
converts each <var>archive</var> to a form which can be loaded more rapidly by the loader, by adding a table of contents named <strong>__.SYMDEF</strong> to the beginning of the archive.
It uses <i>ar</i>(1) to reconstruct the archive, ELISION.
</blockquote>
<p class="continuing">
(<a href="//www.tuhs.org/Archive/Distributions/Research/Henry_Spencer_v7/v7.tar.gz"><cite>UNIX<sup>TM</sup> TIME-SHARING SYSTEM: UNIX PROGRAMMER'<!--'-->S MANUAL, Seventh Edition, January, 1979</cite></a>),
and the loader instead growing a midpoint of both of the aforementioned:
</p>
<blockquote class="continuing">
ELISION If a routine from a library references
another routine in the library, and the library has not been processed by <i>ranlib</i>(1),
the referenced routine must appear after the referencing routine in the library.
Thus the order of programs within libraries may be important.
If the first member of a library is named `__.SYMDEF'<!--'-->,
then it is understood to be a dictionary for the library such as produced by ranlib;
the dictionary is searched iteratively to satisfy as many references as possible.
</blockquote>
<p class="continuing">
(<cite>ibid.</cite>).
ranlib(1) <strong>BUGS</strong> indict further:
</p>
<blockquote class="continuing">
Because generation ELISION and randomization ELISION are separate, phase errors are possible.
The loader <i>ld</i> warns when the modification date of a library is more recent than the creation of its dictionary;
	but this means you get the warning even if you only copy the library.
</blockquote>
<p class="continuation">
any system so utterly limp as to warrant more <strong>BUGS</strong> than <strong>DESCRIPTION</strong>
is truly worthy of its stench still lingering 45 years on.
One has to wonder why <samp>ar</samp> didn'<!--'-->t, at worst, finish with <code class="nowrap">exec("ranlib", <var>arc</var>, 0)</code>.
</p>

<p class="indented continued">
<cite>
	<a href="//www.mckusick.com/csrg/">The Tn(csrg) Archives</a>,
	<a href="//archive.org/details/The_CSRG_Archives_CD-ROM_1_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 1</span>: Berkeley Systems 1978-1986</a>,
	<a href="//archive.org/details/The_CSRG_Archives_CD-ROM_2_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 2</span>: Berkeley Systems 1987-1993</a>,
	<a href="//archive.org/details/The_CSRG_Archives_CD-ROM_3_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 3</span>: Final Berkeley Releases</a>,
	and&nbsp;<a
	   href="//archive.org/details/The_CSRG_Archives_CD-ROM_4_August_1998_Marshall_Kirk_McKusick"><span class="nowrap">CD-ROM 4</span>: Final /usr/src including SCCS files</a>
</cite>
tell us that
Tn(3bsd) (December, 1979) is not afflicted by this because it doesn'<!--'-->t ship ranlib(1) at all
(owing no doubt to shipping a novel Tn(vax)-specific ld(1) with no support for a symbol table).
</p>
<p class="indented continuing">
Tn(4bsd) (November, 1980) includes Version 7 Tn(at&t unix) ranlib(1) (and a very related implementation),
and the ld(1) blurb is similarly related, except the first member <q>should</q>.
lorder(1) is briefly expanded to note that
<q>The need for lorder may be vitiated by use of <i>ranlib</i>(1), which converts an ordered archive into a randomly accessed library.</q>.
</p>
<p class="indented continuing">
Tn(4.3bsd) (April, 1986) calls ranlib(1) <q>preprocess archives for efficient linking</q> instead
and adds <samp>-t</samp> (matching <samp>make -t</samp>) to update the timestamp of the symbol table only.
</p>
<p class="indented continuing">
Archive targets in Tn(4.3bsd)-Reno (June, 1990) <samp>make</samp> are rebuilt based on the timestamp in the symbol table, not that of the archive itself
(archives without symbol tables are always rebuilt).
</p>
<p class="indented continuing">
Tn(4.4bsd)-Lite (June, 1993)'<!--'-->s ranlib(1) is <q>table-of-contents for archive libraries</q>,
and in spite of no implementation changes, ar(1) <q>is expected to offer a superset of the Tn(posix) 1003.2 functionality</q>.
This is because
<cite><a href="//rawcdn.githack.com/oldlinux-web/oldlinux-files/HEAD/Ref-docs/POSIX/all.pdf?page=717">IEEE P1003.2 Draft 11.2</a> − September 1991,
      <a href="//ftp.funet.fi/index/doc/posix/p1003.2/d11.2/6.1">Section 6: Software Development Utilities Option</a></cite>
doesn'<!--'-->t specify <samp>as -s</samp>, just requiring that
<q>When an archive consists entirely of valid object files,
   the implementation shall format the archive so that it is usable as a library for link editing ELISION.</q>,
rationalised because
</p>
<blockquote class="continuing">
<p class="continuing">
historical implementations maintain a symbol table to speed searches,
particularly when the archive contains object files. However, future implementors
may or may not use a symbol table, and the <samp>-s</samp> option was removed from this
clause to permit implementors freedom of choice. ELISION
</p>
<p class="indented continuing">
System V maintain(FORCED_SPACER)CMT(s) the symbol table without
ELISION <samp>-s</samp>, so adding <samp>-s</samp> (even if it were worded as allowing a no-op)
would essentially require all portable applications to use it in all invocations
involving libraries.
</p>
</blockquote>
<p class="continuing">
And being fully <q>usable as a library for link editing</q> is ensured for libraries without symbol tables by this system just shipping GNU ld,
which understands symbol tables, but can read symbols out of objects just as well.
Naturally, the matter of make(1) remains, and it still always considers untabled archives outdated, but it doesn'<!--'-->t even try to claim Tn(posix) compatibility,
and it'<!--'-->s basically a cosmetic issue.
</p>
<p class="indented continuation">
Nx 1.1 (<cite><a href="//cvsweb.netbsd.org/bsdweb.cgi/src/usr.bin/make/arch.c#rev1.8"><tt>make/arch.c</tt> revision 1.8 (1995-01-11)</a></cite>)
echoes this, saying that
<q>we should not bother with the TOC at all since this is used by 'ar' rules that affect the data contents of the archive, not by ranlib rules, which affect the TOC.</q>,
except that no-thing has ever used separate <samp>ar</samp>/<samp>ranlib</samp> rules,
and every make-file in every distribution heretofore (and hence),
if it runs <samp>ranlib</samp> at all, does so just after <samp>ar</samp> anyway.
Indeed, the application of the
<a href="//ro.ws.co.ls/tsort.pdf?page=2">lorder(1)-recommended</a> <code>ar cr library `lorder *.o | tsort`</code>
stanza is nigh-universal for library archives <em>anyway</em>, even post-<samp>ranlib</samp>.
This version of the file is included in Tn(4.4bsd)-Lite2 (April, 1994 (actually 1995-06))
as <tt>make/arch.c</tt> revision 8.3 (95/04/28, christos <q>Updated to the latest version from the Nx source</q>).
</p>

<p class="continued indented">
Thus, you <em>realistically</em> never really needed to run <samp>ranlib</samp>, since you were building archives with lorder(1) anyway.
But if you weren'<!--'-->t, then the efficacious range is [1979-01, 1995-06).
</p>
<p class="continuing indented">
The unfortunate virulence of this is reflected even contemporaneously
— <a href="//fosstodon.org/@alanc/113182473295182189">upstream reports</a>,
  and I <a href="//winworldpc.com/product/sun-solaris/2x">can</a> <a href="//vetusware.com/download/Solaris%202.5%20Source%20Code/?id=11544">validate</a> —
that in the SunOS 4→5 1992 transition (Tn(4.3bsd)→SysV rebase) <samp>ranlib</samp> was naturally lost,
then re-invented as a no-op in 2.5 for compat.
This <a href="//github.com/illumos/illumos-gate/blame/master/usr/src/cmd/sgs/ranlib/ranlib.sh">remains</a> in the illumos gate.
</p>
<p class="continuation indented">
So, last even remotely desirable 30 years ago, defined as extraneous by all standards,
and also Tn(4.4bsd)-Lite2 very clearly includes Nx code but no Tn(unix) genealogical chart shows this?
</p>

BLOGN_T_FOOTER()
WORD_COUNTER_END_NON_ENGLISH()
BOILERPLATE_END()
