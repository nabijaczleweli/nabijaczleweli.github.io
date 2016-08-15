<!--
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)
​
nabijaczleweli.xyz is licensed under a
Creative Commons Attribution 4.0 International License.
​
You should have received a copy of the license along with this
work. If not, see <http://creativecommons.org/licenses/by/4.0/>.
-->


#include "common.h"
#include "octicons.h"


#define DOC(link, name, desc)                                                      \
<li>                                                                               \
  <a href=link><samp>name</samp></a>                                               \
  <a href=httpsCOLON_SLASH_SLASHgithub.com/nabijaczleweli/name>OCT_MARK_GITHUB</a> \
  — desc                                                                           \
</li>                                                                              \


BOILERPLATE(main(), Landing page for things)


Things I handwrote and then transcribed, because I like laborious work:
<ul>
  <li><a href="writing/świat_to_kilka_takich_pokoi/">"Świat to kilka takich pokoi"</a> [PL] — Grade 9 Polish language class assignment,
                                                                                              wherein I abstract the causes of WWI asin
                                                                                              the context of a stereotypical social building
                                                                                              01.06.2016 - 03.06.2016.</li>
</ul>

Documentation for my various projects:
<ul>
	DOC("https://cdn.rawgit.com/nabijaczleweli/BearLibTerminal.rs/doc/bear_lib_terminal/index.html",
	    BearLibTerminal.rs,
	    <a href="https://bitbucket.org/cfyzium/bearlibterminal"><samp>BearLibTerminal</samp></a> for Rust)
	DOC("https://cdn.rawgit.com/nabijaczleweli/bidir-map-rs/doc/bidir_map/index.html",
	    bidir-map-rs,
	    Bidirectional maps for Rust)
	DOC("https://cdn.rawgit.com/nabijaczleweli/whereami-rs/doc/whereami/index.html",
	    whereami-rs,
	    <a href="https://github.com/gpakosz/whereami"><samp>whereami</samp></a> for Rust)
	DOC("https://cdn.rawgit.com/nabijaczleweli/checksums/doc/checksums/index.html",
	    checksums,
	    Tool for making/verifying checksums of directory trees)
</ul>


BOILERPLATE_END()
