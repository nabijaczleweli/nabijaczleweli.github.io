#define __LICENSE                                                 \
// nabijaczleweli.xyz (c) by nabijaczleweli                       \
​//                                                                \
// nabijaczleweli.xyz is licensed under a                         \
// Creative Commons Attribution 4.0 International License.        \
​//                                                                \
// You should have received a copy of the license along with this \
// work. If not, see <http://creativecommons.org/licenses/by/4.0/>.
#undef __LICENSE


#pragma once


#ifdef __clang__
  #define COMPILER_NAME Clang
#elif defined(__GNUC__)
  #define COMPILER_NAME GCC
#else
  #define COMPILER_NAME an unknown compiler
#endif

#ifdef __clang__
  #define COMPILER_VERSION __clang_major__‍.‍__clang_minor__‍.‍__clang_patchlevel__
#elif defined(__GNUC__)
  #define COMPILER_VERSION __GNUC__‍.‍__GNUC_MINOR__‍.‍__GNUC_PATCHLEVEL__
#else
  #define COMPILER_VERSION unknown
#endif

#if defined(BUILD_ID) && defined(REPO_SLUG)
  #define CI_LINK_FOOTER_PART <br /><a href=httpsCOLON_SLASH_SLASHtravis-ci.org/REPO_SLUG/builds/BUILD_ID>See job on TravisCI</a>.
#else
  #define CI_LINK_FOOTER_PART
#endif


#define BOILERPLATE(pagename, description)                                                                 \
<!DOCTYPE html>                                                                                            \
<html lang="en">                                                                                           \
<head>                                                                                                     \
  <meta charset="utf-8">                                                                                   \
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">                                                  \
    <meta name="viewport" content="width=device-width,initial-scale=1">                                    \
    <meta name="author" content="nabijaczleweli">                                                          \
    <meta name="description" content=#description>                                                         \
    <title>pagename — nabijaczleweli</title>                                                               \
                                                                                                           \
    <link href="/capitalism/assets/common.css" rel="stylesheet" />                                         \
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" /> \
    <script type="text/javascript" src="/js/add_icons.js" id="icon-placeholder"></script>                  \
  </head>                                                                                                  \
  <body>

#define BOILERPLATE_END()                                                                                                                          \
    <hr />                                                                                                                                         \
    Creative text licensed under <a href="/capitalism/LICENSE-CREATIVE">CC-BY-SA 4.0</a>,                                                          \
    code licensed under <a href="/capitalism/LICENSE-CODE">The MIT License</a>.                                                                    \
    <hr />                                                                                                                                         \
    This page is open-source, you can find it at <a href="https://github.com/nabijaczleweli/nabijaczleweli.github.io/tree/dev">GitHub</a>,         \
    and contributt and/or yell at me there.                                                                                                        \
    <hr />                                                                                                                                         \
    Do you consider this some <i>good shit, right there</i>?<br />                                                                                 \
    Follow me on GitHub, where I'm<!--'--> <a href="https://github.com/nabijaczleweli">nabijaczleweli</a>,                                         \
    or on Twitter, where I'm<!--'--> <sub>(surprise, surprise)</sub> <a href="https://twitter.com/nabijaczleweli">@nabijaczleweli</a>.             \
    <hr />                                                                                                                                         \
    Automatically generated with COMPILER_NAME version COMPILER_VERSION's <!--'--> C preprocessor on DATE_TIME from FILE_NAME. CI_LINK_FOOTER_PART \
    <hr />                                                                                                                                         \
    <a href="http://nabijaczleweli.xyz/capitalism/feed.xml">RSS feed</a>                                                                           \
  </body>                                                                                                                                          \
</html>
