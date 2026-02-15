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


#include "common.h"
#include "util.h"


#define REDIRECT_HEADER(...)                                                                \
<meta id="refresher" http-equiv="refresh" content=STR(0;url=__VA_ARGS__) />  FORCED_NEWLINE \
<script>                                                                     FORCED_NEWLINE \
refresher.content += window.location.search;                                 FORCED_NEWLINE \
refresher.content += window.location.hash;                                   FORCED_NEWLINE \
/* ^ doesn't seem to do anything in spite of https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/Redirections#order_of_precedence */ FORCED_NEWLINE \
window.location.pathname = STR(__VA_ARGS__);                                 FORCED_NEWLINE \
</script>

#define REDIRECT(pagename, description, language, ...)                                          \
<!--                                                                             FORCED_NEWLINE \
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)              FORCED_NEWLINE \
​                                                                         FORCED_NEWLINE \
nabijaczleweli.xyz is licensed under a                                           FORCED_NEWLINE \
Creative Commons Attribution 4.0 International License.                          FORCED_NEWLINE \
​                                                                         FORCED_NEWLINE \
You should have received a copy of the license along with this                   FORCED_NEWLINE \
work. If not, see <httpsCOLON_SLASH_SLASHcreativecommons.org/licenses/by/4.0/>.  FORCED_NEWLINE \
-->                                                                              FORCED_NEWLINE \
                                                                                 FORCED_NEWLINE \
                                                                                 FORCED_NEWLINE \
BOILERPLATE(pagename, description, language, REDIRECT_HEADER(__VA_ARGS__))       FORCED_NEWLINE \
                                                                                 FORCED_NEWLINE \
                                                                                 FORCED_NEWLINE \
Page moved to <a href=#__VA_ARGS__>__VA_ARGS__</a>.                              FORCED_NEWLINE \
Old links will remain valid indefinitely.                                        FORCED_NEWLINE \
                                                                                 FORCED_NEWLINE \
                                                                                 FORCED_NEWLINE \
  </body>                                                                        FORCED_NEWLINE \
</html>
