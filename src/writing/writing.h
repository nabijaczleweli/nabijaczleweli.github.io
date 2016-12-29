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


#define COLUMN_CSS_LINK <link href="/capitalism/assets/column.css" rel="stylesheet" />


#define WRITING_CUSTOM_END(what, url_code)                                                               \
    <hr />                                                                                               \
    Get what in ePub format                                                                              \
    <script type="text/javascript">document.write('<a href="' + (url_code) + '.epub">here</a>')</script> \
    or in MOBI format                                                                                    \
    <script type="text/javascript">document.write('<a href="' + (url_code) + '.mobi">here</a>')</script>.

#define WRITING_CUSTOM_NAME_END(what) WRITING_CUSTOM_END(what, (document.URL.substr(0, document.URL.lastIndexOf('/'))))

#define WRITING_END() WRITING_CUSTOM_NAME_END(this)
