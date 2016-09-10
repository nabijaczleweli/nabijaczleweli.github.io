<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <http://creativecommons.org/licenses/by/4.0/>.
-->


#include "util.h"
#include "common.h"
#include "fontawesome.h"


#define DOC(name, cratename, cratename_code, desc)                                                                          \
<li>                                                                                                                        \
  <a href=STR(httpsCOLON_SLASH_SLASHcdn.rawgit.com/nabijaczleweli/name/doc/cratename_code/index.html)><samp>name</samp></a> \
  <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/nabijaczleweli/name)>FA(github)</a>                                          \
  <a href=STR(httpsCOLON_SLASH_SLASHcrates.io/crates/cratename)>FA(archive)</a>                                             \
  — desc                                                                                                                    \
</li>                                                                                                                       \


BOILERPLATE(main(), Landing page for things)


Things I handwrote and then transcribed, because I like laborious work:
<ul>
  <li><a href="writing/świat_to_kilka_takich_pokoi/">"Świat to kilka takich pokoi"</a> [PL] — wherein I abstract the causes of WWI in
                                                                                              the context of a stereotypical social building;
                                                                                              01.06.2016 - 03.06.2016.</li>
</ul>

<br />

Documentation for my various projects:
<ul>
	DOC(BearLibTerminal.rs, bear-lib-terminal, bear_lib_terminal,
	    <a href="https://bitbucket.org/cfyzium/bearlibterminal"><samp>BearLibTerminal</samp></a> for Rust)
	DOC(bidir-map-rs, bidir-map, bidir_map,
	    Bidirectional maps for Rust)
	DOC(whereami-rs, whereami-rs, whereami,
	    <a href="https://github.com/gpakosz/whereami"><samp>whereami</samp></a> for Rust)
	DOC(not-stakkr, not-stakkr, not_stakkr,
	    not-stakkr is a platform that allows you to create and queue tweets to be shared when YOU want.
	    You create content when you have time and then use FOSS and NOT pay whatever-ridiculous amount of $$$ for posting them automatically.)
	DOC(checksums, checksums, checksums,
	    Tool for making/verifying checksums of directory trees)
	DOC(blake-rs, blake, blake,
	    Implementation of the <a href="http://131002.net/blake">BLAKE</a> hash function for Rust via FFI)
	DOC(md6-rs, md6, md6,
	    Implementation of the <a href="http://groups.csail.mit.edu/cis/md6">MD6</a> hash function for Rust via FFI)
</ul>


BOILERPLATE_END()
