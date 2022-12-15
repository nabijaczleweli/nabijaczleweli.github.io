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
#include "../font-mfizz.h"
#include "../devicon.h"
#include "../heading.h"
#include "../common.h"
#include "../util.h"


#define DOC(name, cratename, cratename_code, ...) USER_DOC(nabijaczleweli, name, cratename, cratename_code, __VA_ARGS__)
#define USER_DOC(user, name, cratename, cratename_code, ...)                                                                         \
<li>                                                                                                                  FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHrawcdn.githack.com/user/name/doc/cratename_code/index.html)><samp>name</samp></a> FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/user/name)>FAB(github)</a>                                             FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHcrates.io/crates/cratename)>FA(archive)</a>                                       FORCED_NEWLINE \
  — __VA_ARGS__                                                                                                       FORCED_NEWLINE \
</li>
#define UNPUBLISHED_USER_DOC(user, name, cratename_code, ...)                                                                        \
<li>                                                                                                                  FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHrawcdn.githack.com/user/name/doc/cratename_code/index.html)><samp>name</samp></a> FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/user/name)>FAB(github)</a>                                             FORCED_NEWLINE \
  <span style="opacity: .5;">FA(archive)</span>                                                                       FORCED_NEWLINE \
  — __VA_ARGS__                                                                                                       FORCED_NEWLINE \
</li>

#define SRHT_DOC(name, gitname, cratename, cratename_code, ...) USER_SRHT_DOC(nabijaczleweli, name, gitname, cratename, cratename_code, __VA_ARGS__)
#define USER_SRHT_DOC(user, name, gitname, cratename, cratename_code, ...)                                                                        \
<li>                                                                                                                               FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHsrhtcdn.githack.com/~user/gitname/blob/doc/cratename_code/index.html)><samp>gitname</samp></a> FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHsr.ht/~user/name)>FAR(circle)</a>                                                              FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHcrates.io/crates/cratename)>FA(archive)</a>                                                    FORCED_NEWLINE \
  — __VA_ARGS__                                                                                                                    FORCED_NEWLINE \
</li>

#define USER_REPO(user, name, icons, ...)                                                                                            \
<li>                                                                                                                  FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/user/name)><samp>user/name</samp></a>                                  FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/user/name)>FAB_D(github)</a>                                           FORCED_NEWLINE \
  icons                                                                                                               FORCED_NEWLINE \
  — __VA_ARGS__                                                                                                       FORCED_NEWLINE \
</li>
#define SRHT_SET(name, icons, ...)                                                                                                   \
<li>                                                                                                                  FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHsr.ht/~nabijaczleweli/name)><samp>name</samp></a>                                 FORCED_NEWLINE \
  <a href=STR(httpsCOLON_SLASH_SLASHsr.ht/~nabijaczleweli/name)>FAR(circle)</a>                                       FORCED_NEWLINE \
  icons                                                                                                               FORCED_NEWLINE \
  — __VA_ARGS__                                                                                                       FORCED_NEWLINE \
</li>



#define STYLESHEETS MAIN_HEADING_STYLE FONTAWESOME_LINK MFIZZ_LINK DEVICON_LINK                        FORCED_NEWLINE \
                    <link href="/kaschism/assets/column.css" rel="stylesheet" />                       FORCED_NEWLINE \
                    <link href="../writing/Roboto-font.css" rel="stylesheet" />                        FORCED_NEWLINE \
                    <link href="../writing/the_taste_of_mi/Merriweather-font.css" rel="stylesheet" />
BOILERPLATE(Documentation and mistakes, Documentation and code, en-GB, STYLESHEETS)


MAIN_HEADING(Documentation and mistakes)
<span class="roboto">


Most of my output can be found under my <a href="//github.com/nabijaczleweli">GitHub</a> and <a href="//sr.ht/~nabijaczleweli">SourceHut</a> accounts,
	but I also wrote or maintain these to some nontrivial degree:
<ul>
	USER_REPO(LoungeCPP, PicturaMediocritas, DEVICON(cplusplus),
	          Like aurea mediocritas, but with frames in a video instead, or get an average frame from a video)
	USER_REPO(systemd, zram-generator, MFIZZ(rust),
	          Systemd unit generator for zram swap devices)
	USER_REPO(LoungeCPP, pir-8-emu, MFIZZ(rust),
	          Assembler, dissassembler, emulator and full library representation for/of the <a href="https://github.com/thecoshman/pir-8"><samp>pir-8</samp> ISA</a>)
	USER_REPO(LoungeCPP, Tatsoryk, MFIZZ(rust) DEVICON(html5),
	          A Lounge&lt;Discord&gt; gaem project that gets completed – a 2D top-down pvp arena shooter)
	USER_REPO(ThePhD, infoware, DEVICON(cplusplus),
	          C++ Library for pulling system and hardware information, without hitting the command line)
	USER_REPO(thecoshman, http, MFIZZ(rust),
	          Host These Things Please - a basic HTTP server for hosting a folder fast and simply)
	USER_REPO(thecoshman, doh, MFIZZ(rust),
	          D'<!--'-->Oh - Directories Over HTTP)
	USER_REPO(Skorezore, Gaem, DEVICON(cplusplus),
	          Absolutely the best gaem on earth, if it exists)
</ul>
<br />

A brief subsection of non-Rust non-mistakes:
<ul>
	SRHT_SET(klapki, DEVICON(cplusplus),
	         EFI boot manager; or, well, an EFI bootorder compiler)
	SRHT_SET(tzpfms, DEVICON(cplusplus),
	         TPM-based encryption keys for ZFS datasets)
	SRHT_SET(febug, DEVICON(cplusplus),
	         User-space cooperative debugging à la debugfs)
	SRHT_SET(ratrun, 🐀,
	         atrun(8) for the rat race (mail-based calendaring system))
</ul>
<br />

LWN wrote about me once in the December 5, 2022 issue in <em><a href="//lwn.net/Articles/915163/">Losing the magic</a></em>.<br />
<br />

Documentation for my Rust crates:
<ul>
	DOC(rust-embed-resource, embed-resource, embed_resource,
	    A <a href="//doc.crates.io/build-script.html"><samp>Cargo</samp> build script</a> library to handle compilation and inclusion of Windows resources
	    in the most resilient fashion imaginable)
	DOC(BearLibTerminal.rs, bear-lib-terminal, bear_lib_terminal,
	    <a href="//bitbucket.org/cfyzium/bearlibterminal"><samp>BearLibTerminal</samp></a> for Rust)
	UNPUBLISHED_USER_DOC(nabijaczleweli, chattium-oxide-lib, chattium_oxide_lib,
	    Common files for <a href="//github.com/nabijaczleweli/chattium-oxide-client">chattium-oxide-client</a>
	                 and <a href="//github.com/nabijaczleweli/chattium-oxide-server">chattium-oxide-server</a>)
	DOC(trivial-colours-rs, trivial_colours, trivial_colours,
	    Very simple and naive colour changing for your terminal, but that'<!--'-->s exactly what you need sometimes)
	DOC(safe-transmute-rs, safe-transmute, safe_transmute,
	    A safeguarded <samp>transmute()</samp> for Rust)
	DOC(gen-epub-book.rs, gen-epub-book, gen_epub_book,
	    Generate an ePub book from a simple plaintext descriptor in Rust)
	DOC(registry.pol-rs, registry-pol, registry_pol,
	    Parser for the <a href="//msdn.microsoft.com/en-us/library/aa374407(v=vs.85).aspx">Windows Registry Policy File format</a>)
	<li>
		<a href="httpsCOLON_SLASH_SLASHrawcdn.githack.com/Galactim/Sudoku/backend-doc/sudoku_backend/index.html"><samp>sudoku-backend</samp></a>
		<a href="httpsCOLON_SLASH_SLASHgithub.com/Galactim/Sudoku">FAB(github)</a>
		<span style="opacity: .5;">FA(archive)</span>
		— Back-end for modern, API-based Sudoku app
	</li>
	SRHT_DOC(yaxpeax-friends, yaxpeax-superh, yaxpeax-superh, yaxpeax_superh,
	         SuperH decoder with optional <a href="//git.iximeow.net/yaxpeax-arch/about/">yaxpeax</a> support)
	DOC(bidir-map-rs, bidir-map, bidir_map,
	    Bidirectional maps for Rust)
	DOC(cargo-update, cargo-update, cargo_update,
	    Cargo subcommand for checking and applying updates to installed executables)
	DOC(codepage-437, codepage-437, codepage_437,
	    <a href="//en.wikipedia.org/wiki/Code_page_437">Code page 437</a> transcoding for Rust)
	DOC(openalias.rs, openalias, openalias,
	    Look up and parse <a href="//openalias.org">OpenAlias</a> data)
	DOC(poke-a-mango, poke-a-mango, poke_a_mango,
	    What all the kool kidz are playing these days)
	DOC(whereami-rs, whereami-rs, whereami,
	    <a href="//github.com/gpakosz/whereami"><samp>whereami</samp></a> for Rust)
	DOC(mandalas-rs, mandalas, mandalas,
	    A mandala generator using Tonči Juričev-Grgin's<!--'--> method)
	DOC(flac-bound, flac-bound, flac_bound,
	    FLAC encoding via libflac FFI)
	DOC(rfsapi-rs, rfsapi, rfsapi,
	    Raw Filesystem API for Rust -- enable simpler browsing with ease)
	DOC(checksums, checksums, checksums,
	    Tool for making/verifying checksums of directory trees)
	DOC(dumplingh, dumplingh, dumplingh,
	    Issue/PR exporter for GitHub)
	USER_DOC(LoungeCPP, pir-8-emu, pir-8-emu, pir_8_emu,
	         Assembler, dissassembler, emulator and full library representation for/of the <a href="//github.com/thecoshman/pir-8"><samp>pir-8</samp> ISA</a>)
	DOC(termimage, termimage, termimage,
	    Display images in your terminal, kind of)
	DOC(blake-rs, blake, blake,
	    Implementation of the <a href="//131002.net/blake">BLAKE</a> hash function for Rust via FFI)
	DOC(OWAPI.rs, owapi, owapi,
	    Overwatch JSON API bindings for Rust)
	DOC(bloguen, bloguen, bloguen,
	    Generate a blogue from a flat TOML-based descriptor)
	DOC(feembox, feembox, feembox,
	    What if a feed, but it'<!--'-->s a mailbox?)
	DOC(dishub, dishub, dishub,
	    App for posting GitHub activity on Discord)
	DOC(tweetr, tweetr, tweetr,
	    tweetr is a platform that allows you to create and queue tweets to be shared when YOU want.
	    You create content when you have time and then use FOSS and NOT pay whatever-ridiculous amount of $$$ for posting them automatically)
	DOC(hrx.rs, hrx, hrx,
	    Rust implementation of the <a href="//github.com/google/hrx">HRX plain text archive format</a>)
	DOC(pls-rs, pls, pls,
	    Rust crate for parsing and writing the PLS playlist format)
	DOC(md6-rs, md6, md6,
	    Implementation of the <a href="//groups.csail.mit.edu/cis/md6">MD6</a> hash function for Rust via FFI)
	USER_DOC(thecoshman, doh, doh, doh,
	         D'<!--'-->Oh - Directories Over HTTP)
</ul>


</span>
BOILERPLATE_END()
