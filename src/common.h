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
  #define COMPILER_VERSION __clang_major__
#elif defined(__GNUC__)
  #define COMPILER_VERSION __GNUC__‍.‍__GNUC_MINOR__‍.‍__GNUC_PATCHLEVEL__
#else
  #define COMPILER_VERSION unknown
#endif

#if defined(BUILD_ID) && defined(REPO_SLUG)
  #define CI_LINK_FOOTER_PART <br /><a href=STR(httpsCOLON_SLASH_SLASHtravis-ci.org/REPO_SLUG/builds/BUILD_ID)>See job on TravisCI</a>.
#elif defined(JOB_URL)
  #define CI_LINK_FOOTER_PART <br /><a href="JOB_URL">See job on builds.sr.ht</a>.
#else
  #define CI_LINK_FOOTER_PART
#endif

#define CMT // Copypasted from /assets/icons.htm
#undef CMT
#define ICONS_HEADER_PART                                                                                                                               \
    <link rel="apple-touch-icon" sizes="57x57" href="/assets/favicons/apple-touch-icon-57x57.png">                                       FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="60x60" href="/assets/favicons/apple-touch-icon-60x60.png">                                       FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="72x72" href="/assets/favicons/apple-touch-icon-72x72.png">                                       FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/favicons/apple-touch-icon-76x76.png">                                       FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="114x114" href="/assets/favicons/apple-touch-icon-114x114.png">                                   FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="120x120" href="/assets/favicons/apple-touch-icon-120x120.png">                                   FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="144x144" href="/assets/favicons/apple-touch-icon-144x144.png">                                   FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="152x152" href="/assets/favicons/apple-touch-icon-152x152.png">                                   FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/favicons/apple-touch-icon-180x180.png">                                   FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-32x32.png" sizes="32x32">                                           FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/android-chrome-192x192.png" sizes="192x192">                                FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-96x96.png" sizes="96x96">                                           FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-16x16.png" sizes="16x16">                                           FORCED_NEWLINE \
    <link rel="manifest" href="/assets/favicons/manifest.json">                                                                          FORCED_NEWLINE \
    <link rel="mask-icon" href="/assets/favicons/safari-pinned-tab.svg" color="#5bbad5">                                                 FORCED_NEWLINE \
    <link rel="shortcut icon" href="/assets/favicons/favicon.ico">                                                                       FORCED_NEWLINE \
    <link rel="alternate" href="/content/feed.xml" type="application/rss+xml">                                                           FORCED_NEWLINE \
    <meta name="apple-mobile-web-app-title" content="nabijaczleweli">                                                                    FORCED_NEWLINE \
    <meta name="application-name" content="nabijaczleweli">                                                                              FORCED_NEWLINE \
    <meta name="msapplication-TileColor" content="#da532c">                                                                              FORCED_NEWLINE \
    <meta name="msapplication-TileImage" content="/assets/favicons/mstile-144x144.png">                                                  FORCED_NEWLINE \
    <meta name="msapplication-config" content="/assets/favicons/browserconfig.xml">                                                      FORCED_NEWLINE \
    <meta name="color-scheme" content="dark light">                                                                                      FORCED_NEWLINE \
    <script>                                                                                                                             FORCED_NEWLINE \
      (function() {                                                                                                                      FORCED_NEWLINE \
        let m = navigator.userAgent.match(/Firefox\/([0-9]+)/);                                                                          FORCED_NEWLINE \
        if(m && parseInt(m[1]) < 96)                                                                                                     FORCED_NEWLINE \
          document.addEventListener("DOMContentLoaded", function() {                                                                     FORCED_NEWLINE \
            Array.from(document.getElementsByClassName("dark-invert")).forEach(function(e) { e.classList.remove("dark-invert"); });      FORCED_NEWLINE \
            Array.from(document.querySelectorAll('source[media="(prefers-color-scheme: dark)"]')).forEach(function(e) { e.remove(); });  FORCED_NEWLINE \
          });                                                                                                                            FORCED_NEWLINE \
      })();                                                                                                                              FORCED_NEWLINE \
    </script>


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
    <link href="/content/assets/common.css" rel="stylesheet">          FORCED_NEWLINE \
    ICONS_HEADER_PART                                                    FORCED_NEWLINE \
    __VA_ARGS__                                                          FORCED_NEWLINE \
  </head>                                                                FORCED_NEWLINE \
  <body>

#define BOILERPLATE_END()                                                                                                                           \
    <!-- CTNT_END --> <hr style="padding-top: 1em;" />                                                                               FORCED_NEWLINE \
    Creative text licensed under <a href="/content/LICENSE-CREATIVE">CC-BY-SA 4.0</a>,                                               FORCED_NEWLINE \
    code licensed under <a href="/content/LICENSE-CODE">The MIT License</a>.                                                         FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    This page is open-source, you can find it at <a href="//github.com/nabijaczleweli/nabijaczleweli.github.io/tree/dev">GitHub</a>, FORCED_NEWLINE \
    and contribute and/or yell at me there.                                                                                          FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    Like what you see? Consider giving me a follow over at social medias listed <a href="/">here</a>, or maybe even a                               \
    sending a                                                                                                                                       \
    <a style="display: inline-block; position: relative;" id="liberapay-btn" href="https://liberapay.com/nabijaczleweli/donate">                    \
      <svg class="dark-invert" style="position: absolute; top: 3px; width: 1em; height: 1em;"><use xlink:href="/assets/liberapay-logo.svg#top"></use></svg> \
      <span style="margin-left: 19px;">buck</span>                                                                                                  \
      <span style="font-size: 0;">liberapay donate</span>                                                                                           \
    </a> or                                                                                                                                         \
    <a href="//patreon.com/nabijaczleweli">two<span style="font-size: 0;"> patreon</span></a> my way                                                \
    if my software helped you in some significant way?                                                                               FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    Compiled with COMPILER_NAME COMPILER_VERSION'<!--'-->s C preprocessor on DATE_TIME from                                          FORCED_NEWLINE \
    <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/nabijaczleweli/nabijaczleweli.github.io/blob/dev/FILE_NAME)>FILE_NAME</a>.          FORCED_NEWLINE \
    CI_LINK_FOOTER_PART                                                                                                              FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    <a href="/content/feed.xml" type="application/rss+xml" rel="alternate">RSS feed</a>                                              FORCED_NEWLINE \
  </body>                                                                                                                            FORCED_NEWLINE \
</html>
