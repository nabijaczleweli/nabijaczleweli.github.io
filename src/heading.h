#include "util.h"


#define CMT Based on gen-epub-book'<!--'-->s hash-on-the-left, make sure to update both if fixing something
#undef CMT

#define MAIN_HEADING_ALT(back_url, ...) <h2 id="go-back" class="smallcaps merriweather"><a id="go-back-link" href=STR(back_url)>↩</a> __VA_ARGS__</h2>
#define MAIN_HEADING(...)               MAIN_HEADING_ALT(.., __VA_ARGS__)


#define MAIN_HEADING_STYLE                        \
<style>                            FORCED_NEWLINE \
	#go-back > a#go-back-link {      FORCED_NEWLINE \
	float: left;                     FORCED_NEWLINE \
	visibility: hidden;              FORCED_NEWLINE \
	opacity: 0;                      FORCED_NEWLINE \
	padding-right: calc(1em / 5.5);  FORCED_NEWLINE \
	margin-left: calc(-1em / 0.9);   FORCED_NEWLINE \
	transition: all 0.5s;            FORCED_NEWLINE \
                                                  \
	color: black;                    FORCED_NEWLINE \
	text-decoration: none;           FORCED_NEWLINE \
}                                  FORCED_NEWLINE \
                                                  \
#go-back:hover > a#go-back-link {  FORCED_NEWLINE \
	visibility: visible;             FORCED_NEWLINE \
	opacity: 1;                      FORCED_NEWLINE \
}                                  FORCED_NEWLINE \
</style>
