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


#ifdef EBOOK

#define CSS_EBOOK_ONLY(...) */ __VA_ARGS__ SLASH_ASTERIX
#define CSS_HTML_ONLY(...)

#define EBOOK_ONLY(...) --> __VA_ARGS__ <!--
#define HTML_ONLY(...)

#else

#define CSS_EBOOK_ONLY(...)
#define CSS_HTML_ONLY(...) */ __VA_ARGS__ SLASH_ASTERIX

#define EBOOK_ONLY(...)
#define HTML_ONLY(...) --> __VA_ARGS__ <!--

#endif
