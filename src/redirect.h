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


#define REDIRECT(pagename, description, language, destination)                                                             \
<!--                                                                                                        FORCED_NEWLINE \
nabijaczleweli.xyz (c) by nabijaczleweli@gmail.com (nabijaczleweli)                                         FORCED_NEWLINE \
​                                                                                                            FORCED_NEWLINE \
nabijaczleweli.xyz is licensed under a                                                                      FORCED_NEWLINE \
Creative Commons Attribution 4.0 International License.                                                     FORCED_NEWLINE \
​                                                                                                            FORCED_NEWLINE \
You should have received a copy of the license along with this                                              FORCED_NEWLINE \
work. If not, see <httpsCOLON_SLASH_SLASHcreativecommons.org/licenses/by/4.0/>.                             FORCED_NEWLINE \
-->                                                                                                         FORCED_NEWLINE \
                                                                                                            FORCED_NEWLINE \
                                                                                                            FORCED_NEWLINE \
BOILERPLATE(pagename, description, language, <meta http-equiv="refresh" content=STR(0;url=destination) />)  FORCED_NEWLINE \
                                                                                                            FORCED_NEWLINE \
                                                                                                            FORCED_NEWLINE \
This content resides at <a href=#destination>destination</a>.                                               FORCED_NEWLINE \
                                                                                                            FORCED_NEWLINE \
                                                                                                            FORCED_NEWLINE \
  </body>                                                                                                   FORCED_NEWLINE \
</html>
