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

#define CMT // Copypasted from /assets/icons.htm
#undef CMT
#define ICONS_HEADER_PART                                                                                                \
    <link rel="apple-touch-icon" sizes="57x57" href="/assets/favicons/apple-touch-icon-57x57.png">        FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="60x60" href="/assets/favicons/apple-touch-icon-60x60.png">        FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="72x72" href="/assets/favicons/apple-touch-icon-72x72.png">        FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/favicons/apple-touch-icon-76x76.png">        FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="114x114" href="/assets/favicons/apple-touch-icon-114x114.png">    FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="120x120" href="/assets/favicons/apple-touch-icon-120x120.png">    FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="144x144" href="/assets/favicons/apple-touch-icon-144x144.png">    FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="152x152" href="/assets/favicons/apple-touch-icon-152x152.png">    FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/favicons/apple-touch-icon-180x180.png">    FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-32x32.png" sizes="32x32">            FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/android-chrome-192x192.png" sizes="192x192"> FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-96x96.png" sizes="96x96">            FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-16x16.png" sizes="16x16">            FORCED_NEWLINE \
    <link rel="manifest" href="/assets/favicons/manifest.json">                                           FORCED_NEWLINE \
    <link rel="mask-icon" href="/assets/favicons/safari-pinned-tab.svg" color="#5bbad5">                  FORCED_NEWLINE \
    <link rel="shortcut icon" href="/assets/favicons/favicon.ico">                                        FORCED_NEWLINE \
    <meta name="apple-mobile-web-app-title" content="nabijaczleweli">                                     FORCED_NEWLINE \
    <meta name="application-name" content="nabijaczleweli">                                               FORCED_NEWLINE \
    <meta name="msapplication-TileColor" content="#da532c">                                               FORCED_NEWLINE \
    <meta name="msapplication-TileImage" content="/assets/favicons/mstile-144x144.png">                   FORCED_NEWLINE \
    <meta name="msapplication-config" content="/assets/favicons/browserconfig.xml">                       FORCED_NEWLINE \
    <meta name="theme-color" content="#ffffff">


#define BOILERPLATE(pagename, description, language, ...)                               \
<!DOCTYPE html>                                                          FORCED_NEWLINE \
<html lang=STR(language)>                                                FORCED_NEWLINE \
  <head>                                                                 FORCED_NEWLINE \
    <meta charset="utf-8">                                               FORCED_NEWLINE \
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">                FORCED_NEWLINE \
    <meta name="viewport" content="width=device-width,initial-scale=1">  FORCED_NEWLINE \
    <meta name="author" content="nabijaczleweli">                        FORCED_NEWLINE \
    <meta name="description" content=#description>                       FORCED_NEWLINE \
    <title>pagename — nabijaczleweli</title>                             FORCED_NEWLINE \
                                                                         FORCED_NEWLINE \
    <link href="/content/assets/common.css" rel="stylesheet" />          FORCED_NEWLINE \
    ICONS_HEADER_PART                                                    FORCED_NEWLINE \
    __VA_ARGS__                                                          FORCED_NEWLINE \
  </head>                                                                FORCED_NEWLINE \
  <body>

#define BOILERPLATE_END()                                                                                                                           \
    <!-- CTNT_END --> <hr />                                                                                                         FORCED_NEWLINE \
    Creative text licensed under <a href="/content/LICENSE-CREATIVE">CC-BY-SA 4.0</a>,                                               FORCED_NEWLINE \
    code licensed under <a href="/content/LICENSE-CODE">The MIT License</a>.                                                         FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    This page is open-source, you can find it at <a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/tree/dev">GitHub</a>, FORCED_NEWLINE \
    and contribute and/or yell at me there.                                                                                          FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    Like what you see? Consider giving me a follow over at social medias listed <a href="/">here</a>, or maybe even a                               \
    <a href="bitcoin:1MoSyGZp3SKpoiXPXfZDFK7cDUFCVtEDeS?label=nabijaczleweli&message=Donation%20to%20nabijaczleweli">donation</a>                   \
    <a href="/content/assets/btc-donate-qr.svg" title="Bitcoin donation QR code"                                                                    \
       style="background: url('https://rawcdn.githack.com/reduxframework/elusive-iconfont/master/dev/icons-svg/qrcode.svg');                        \
              background-size: 100% 100%; display: inline-block;                                                                                    \
              width: 1em; height: 1em; margin-bottom: -.2em; font: 14px/1 normal;"></a>,                                                            \
    if my software helped you in some significant way?                                                                               FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    Automatically generated with COMPILER_NAME COMPILER_VERSION'<!--'-->s C preprocessor on DATE_TIME from                           FORCED_NEWLINE \
    <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/nabijaczleweli/nabijaczleweli.github.io/blob/dev/FILE_NAME)>FILE_NAME</a>.          FORCED_NEWLINE \
    CI_LINK_FOOTER_PART                                                                                                              FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    <a href="/content/feed.xml">RSS feed</a>                                                                                         FORCED_NEWLINE \
  </body>                                                                                                                            FORCED_NEWLINE \
</html>
