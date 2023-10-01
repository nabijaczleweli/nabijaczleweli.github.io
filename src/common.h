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
#define ICONS_HEADER_PART                                                                                                                           \
    <link rel="apple-touch-icon" sizes="57x57" href="/assets/favicons/apple-touch-icon-57x57.png">                                   FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="60x60" href="/assets/favicons/apple-touch-icon-60x60.png">                                   FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="72x72" href="/assets/favicons/apple-touch-icon-72x72.png">                                   FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/favicons/apple-touch-icon-76x76.png">                                   FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="114x114" href="/assets/favicons/apple-touch-icon-114x114.png">                               FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="120x120" href="/assets/favicons/apple-touch-icon-120x120.png">                               FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="144x144" href="/assets/favicons/apple-touch-icon-144x144.png">                               FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="152x152" href="/assets/favicons/apple-touch-icon-152x152.png">                               FORCED_NEWLINE \
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/favicons/apple-touch-icon-180x180.png">                               FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-32x32.png" sizes="32x32">                                       FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/android-chrome-192x192.png" sizes="192x192">                            FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-96x96.png" sizes="96x96">                                       FORCED_NEWLINE \
    <link rel="icon" type="image/png" href="/assets/favicons/favicon-16x16.png" sizes="16x16">                                       FORCED_NEWLINE \
    <link rel="manifest" href="/assets/favicons/manifest.json">                                                                      FORCED_NEWLINE \
    <link rel="mask-icon" href="/assets/favicons/safari-pinned-tab.svg" color="#5bbad5">                                             FORCED_NEWLINE \
    <link rel="shortcut icon" href="/assets/favicons/favicon.ico">                                                                   FORCED_NEWLINE \
    <meta name="apple-mobile-web-app-title" content="nabijaczleweli">                                                                FORCED_NEWLINE \
    <meta name="application-name" content="nabijaczleweli">                                                                          FORCED_NEWLINE \
    <meta name="msapplication-TileColor" content="#da532c">                                                                          FORCED_NEWLINE \
    <meta name="msapplication-TileImage" content="/assets/favicons/mstile-144x144.png">                                              FORCED_NEWLINE \
    <meta name="msapplication-config" content="/assets/favicons/browserconfig.xml">                                                  FORCED_NEWLINE \
    <meta name="color-scheme" content="dark light">                                                                                  FORCED_NEWLINE \
    <script>                                                                                                                         FORCED_NEWLINE \
      (function() {                                                                                                                  FORCED_NEWLINE \
        let m = navigator.userAgent.match(/Firefox\/([0-9]+)/);                                                                      FORCED_NEWLINE \
        if(m && parseInt(m[1]) < 96)                                                                                                 FORCED_NEWLINE \
          document.addEventListener("DOMContentLoaded", function() {                                                                 FORCED_NEWLINE \
            Array.from(document.getElementsByClassName("dark-invert")).forEach(function(e) { e.classList.remove("dark-invert"); });  FORCED_NEWLINE \
          });                                                                                                                        FORCED_NEWLINE \
      })();                                                                                                                          FORCED_NEWLINE \
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
    <link href="/content/assets/common.css" rel="stylesheet" />          FORCED_NEWLINE \
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
      <svg style="position: absolute; top: 3px;" viewBox="0 0 80 80" height="16" width="16"><g transform="translate(-78.37-208.06)" fill="#1a171b"><path d="m104.28 271.1c-3.571 0-6.373-.466-8.41-1.396-2.037-.93-3.495-2.199-4.375-3.809-.88-1.609-1.308-3.457-1.282-5.544.025-2.086.313-4.311.868-6.675l9.579-40.05 11.69-1.81-10.484 43.44c-.202.905-.314 1.735-.339 2.489-.026.754.113 1.421.415 1.999.302.579.817 1.044 1.546 1.395.729.353 1.747.579 3.055.679l-2.263 9.278"></path><path d="m146.52 246.14c0 3.671-.604 7.03-1.811 10.07-1.207 3.043-2.879 5.669-5.01 7.881-2.138 2.213-4.702 3.935-7.693 5.167-2.992 1.231-6.248 1.848-9.767 1.848-1.71 0-3.42-.151-5.129-.453l-3.394 13.651h-11.162l12.52-52.19c2.01-.603 4.311-1.143 6.901-1.622 2.589-.477 5.393-.716 8.41-.716 2.815 0 5.242.428 7.278 1.282 2.037.855 3.708 2.024 5.02 3.507 1.307 1.484 2.274 3.219 2.904 5.205.627 1.987.942 4.11.942 6.373m-27.378 15.461c.854.202 1.91.302 3.167.302 1.961 0 3.746-.364 5.355-1.094 1.609-.728 2.979-1.747 4.111-3.055 1.131-1.307 2.01-2.877 2.64-4.714.628-1.835.943-3.858.943-6.071 0-2.161-.479-3.998-1.433-5.506-.956-1.508-2.615-2.263-4.978-2.263-1.61 0-3.118.151-4.525.453l-5.28 21.948"></path></g></svg> \
      <span style="margin-left: 19px;">buck</span>                                                                                                  \
      <span style="font-size: 0;">liberapay donate</span>                                                                                           \
    </a> or                                                                                                                                         \
    <a href="//patreon.com/nabijaczleweli">two<span style="font-size: 0;"> patreon</span></a> my way                                                \
    if my software helped you in some significant way?                                                                               FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    Automatically generated with COMPILER_NAME COMPILER_VERSION'<!--'-->s C preprocessor on DATE_TIME from                           FORCED_NEWLINE \
    <a href=STR(httpsCOLON_SLASH_SLASHgithub.com/nabijaczleweli/nabijaczleweli.github.io/blob/dev/FILE_NAME)>FILE_NAME</a>.          FORCED_NEWLINE \
    CI_LINK_FOOTER_PART                                                                                                              FORCED_NEWLINE \
    <hr />                                                                                                                           FORCED_NEWLINE \
    <a href="/content/feed.xml">RSS feed</a>                                                                                         FORCED_NEWLINE \
  </body>                                                                                                                            FORCED_NEWLINE \
</html>
