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


#include "util.h"


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
  #define CI_LINK_FOOTER_PART <br /><a href=STR(httpsCOLON_SLASH_SLASHtravis-ci.org/REPO_SLUG/builds/BUILD_ID)>See job on TravisCI</a>.
#else
  #define CI_LINK_FOOTER_PART
#endif

#define ICONS_HEADER_PART                                                                                 \
    <link rel="apple-touch-icon" sizes="57x57" href="/assets/favicons/apple-touch-icon-57x57.png">        \
    <link rel="apple-touch-icon" sizes="60x60" href="/assets/favicons/apple-touch-icon-60x60.png">        \
    <link rel="apple-touch-icon" sizes="72x72" href="/assets/favicons/apple-touch-icon-72x72.png">        \
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/favicons/apple-touch-icon-76x76.png">        \
    <link rel="apple-touch-icon" sizes="114x114" href="/assets/favicons/apple-touch-icon-114x114.png">    \
    <link rel="apple-touch-icon" sizes="120x120" href="/assets/favicons/apple-touch-icon-120x120.png">    \
    <link rel="apple-touch-icon" sizes="144x144" href="/assets/favicons/apple-touch-icon-144x144.png">    \
    <link rel="apple-touch-icon" sizes="152x152" href="/assets/favicons/apple-touch-icon-152x152.png">    \
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/favicons/apple-touch-icon-180x180.png">    \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-32x32.png" sizes="32x32">            \
    <link rel="icon" type="image/png" href="/assets/favicons/android-chrome-192x192.png" sizes="192x192"> \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-96x96.png" sizes="96x96">            \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-16x16.png" sizes="16x16">            \
    <link rel="manifest" href="/assets/favicons/manifest.json">                                           \
    <link rel="mask-icon" href="/assets/favicons/safari-pinned-tab.svg" color="#5bbad5">                  \
    <link rel="shortcut icon" href="/assets/favicons/favicon.ico">                                        \
    <meta name="apple-mobile-web-app-title" content="nabijaczleweli">                                     \
    <meta name="application-name" content="nabijaczleweli">                                               \
    <meta name="msapplication-TileColor" content="#da532c">                                               \
    <meta name="msapplication-TileImage" content="/assets/favicons/mstile-144x144.png">                   \
    <meta name="msapplication-config" content="/assets/favicons/browserconfig.xml">                       \
    <meta name="theme-color" content="#ffffff">


#define BOILERPLATE(pagename, description, ...)                         \
<!DOCTYPE html>                                                         \
<html lang="en">                                                        \
  <head>                                                                \
    <meta charset="utf-8">                                              \
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">               \
    <meta name="viewport" content="width=device-width,initial-scale=1"> \
    <meta name="author" content="nabijaczleweli">                       \
    <meta name="description" content=#description>                      \
    <title>pagename — kaschism</title>                                  \
                                                                        \
    <link href="/kaschism/assets/common.css" rel="stylesheet" />        \
    __VA_ARGS__                                                         \
    ICONS_HEADER_PART                                                   \
  </head>                                                               \
  <body>

#define BOILERPLATE_END()                                                                                                     \
    <hr />                                                                                                                    \
    Creative text licensed under <a href="/kaschism/LICENSE-CREATIVE">CC-BY-SA 4.0</a>.                                     \
    <hr />                                                                                                                    \
    This page is open-source, you can find it at <a href="https://github.com/nabijaczleweli/kaschism">GitHub</a>,             \
    and contributt and/or tell us how you hate a couple of teenagers' evening project.<!--'-->                                \
    Maybe you'll even call us nazis or something because you can't stand bloody puns? Who knows if not you!                   \
    <hr />                                                                                                                    \
    Automatically generated with COMPILER_NAME version COMPILER_VERSION'<!--'-->s C preprocessor on DATE_TIME from FILE_NAME. \
    CI_LINK_FOOTER_PART                                                                                                       \
    <hr />                                                                                                                    \
    <a href="/kaschism/feed.xml">RSS feed</a>                                                                               \
  </body>                                                                                                                     \
</html>
