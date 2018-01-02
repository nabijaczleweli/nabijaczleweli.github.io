<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
-->


#include "fontawesome.h"
#include "common.h"
#include "util.h"


#define DOC(name, cratename, cratename_code, ...) USER_DOC(nabijaczleweli, name, cratename, cratename_code, __VA_ARGS__)
#define USER_DOC(user, name, cratename, cratename_code, ...)                                                                     \
<li>                                                                                                              FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHcdn.rawgit.com/user/name/doc/cratename_code/index.html)><samp>name</samp></a> FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/user/name)>FA(github)</a>                                          FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHcrates.io/crates/cratename)>FA(archive)</a>                                   FORCED_NEWLINE \
  — __VA_ARGS__                                                                                                   FORCED_NEWLINE \
</li>


BOILERPLATE(main(), Landing page for things, en-GB, FONTAWESOME_LINK)


Some things I'<!--'-->ve written:
<ul>
	<li><a href="writing/moments/">"A Widow's Trace"</a> — Overwatch smut, enter at own risk; ~10-20.03.2017.</li>
	<li><a href="writing/the_taste_of_mi/">"The Taste of MI"</a> [PL] — lass reminsces about her key life points while waiting for her wife;
	                                                                    30.06.2017 - 12.08.2017.</li>
	<li><a href="writing/">More…</a></li>
</ul>

<p>
	Some pretty (? or so I hope) things I made with <a href="maths">maths</a>.
</p>

<p>
	A complete writeup on <a href="gen-epub-book"><code>gen-epub-book</code>(s)</a>.
</p>

<p>
	The <a href="extensive_list_of_rust_puns">Extensive List of Rust Puns</a> needs your suggestions!
</p>

Documentation for my Rust projects:
<ul>
	DOC(rust-embed-resource, embed-resource, embed_resource,
	    A <a href="http://doc.crates.io/build-script.html"><samp>Cargo</samp> build script</a> library to handle compilation and inclusion of Windows resources
	    in the most resilient fashion imaginable)
	DOC(BearLibTerminal.rs, bear-lib-terminal, bear_lib_terminal,
	    <a href="https://bitbucket.org/cfyzium/bearlibterminal"><samp>BearLibTerminal</samp></a> for Rust)
	DOC(trivial-colours-rs, trivial_colours, trivial_colours,
	    Very simple and naive colour changing for your terminal, but that'<!--'-->s exactly what you need sometimes)
	DOC(safe-transmute-rs, safe-transmute, safe_transmute,
	    A safeguarded <samp>transmute()</samp> for Rust)
	DOC(gen-epub-book.rs, gen-epub-book, gen_epub_book,
	    Generate an ePub book from a simple plaintext descriptor in Rust)
	DOC(registry.pol-rs, registry-pol, registry_pol,
	    Parser for the <a href="https://msdn.microsoft.com/en-us/library/aa374407(v=vs.85).aspx">Windows Registry Policy File format</a>)
	DOC(bidir-map-rs, bidir-map, bidir_map,
	    Bidirectional maps for Rust)
	DOC(cargo-update, cargo-update, cargo_update,
	    Cargo subcommand for checking and applying updates to installed executables)
	DOC(openalias.rs, openalias, openalias,
	    Look up and parse <a href="https://openalias.org">OpenAlias</a> data)
	DOC(poke-a-mango, poke-a-mango, poke_a_mango,
	    What all the kool kidz are playing these days)
	DOC(whereami-rs, whereami-rs, whereami,
	    <a href="https://github.com/gpakosz/whereami"><samp>whereami</samp></a> for Rust)
	DOC(mandalas-rs, mandalas, mandalas,
	    A mandala generator using Tonči Juričev-Grgin's<!--'--> method)
	DOC(rfsapi-rs, rfsapi, rfsapi,
	    Raw Filesystem API for Rust -- enable simpler browsing with ease)
	DOC(checksums, checksums, checksums,
	    Tool for making/verifying checksums of directory trees)
	DOC(dumplingh, dumplingh, dumplingh,
	    Issue/PR exporter for GitHub)
	DOC(termimage, termimage, termimage,
	    Display images in your terminal, kind of)
	DOC(blake-rs, blake, blake,
	    Implementation of the <a href="https://131002.net/blake">BLAKE</a> hash function for Rust via FFI)
	DOC(OWAPI.rs, owapi, owapi,
	    Overwatch JSON API bindings for Rust)
	DOC(dishub, dishub, dishub,
	    App for posting GitHub activity on Discord)
	DOC(tweetr, tweetr, tweetr,
	    tweetr is a platform that allows you to create and queue tweets to be shared when YOU want.
	    You create content when you have time and then use FOSS and NOT pay whatever-ridiculous amount of $$$ for posting them automatically)
	DOC(pls-rs, pls, pls,
	    Rust crate for parsing and writing the PLS playlist format)
	DOC(md6-rs, md6, md6,
	    Implementation of the <a href="https://groups.csail.mit.edu/cis/md6">MD6</a> hash function for Rust via FFI)
	USER_DOC(thecoshman, doh, doh, doh,
	         D'<!--'-->Oh - Directories Over HTTP)
</ul>


BOILERPLATE_END()
