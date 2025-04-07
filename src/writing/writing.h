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


#include "../util.h"


#define COLUMN_CSS_LINK <link href="/content/assets/column.css" rel="stylesheet">

#define WORD_COUNT_SCRIPT_NON_ENGLISH                                                        \
  <script src="/content/assets/pluralize.js"></script> FORCED_NEWLINE \
  <script src="/content/assets/word_count.js"></script>
#define WORD_COUNT_SCRIPT                                                                    \
  <script src="/content/assets/syllable.js"></script>  FORCED_NEWLINE \
  WORD_COUNT_SCRIPT_NON_ENGLISH


#define _WORD_COUNTER_END(...)                                                    \
    <!-- CTNT_END --> <span id="wordcount_wrapper" class="hidden"> FORCED_NEWLINE \
      <hr />                                                       FORCED_NEWLINE \
      <span id="word_count">0</span> words,                        FORCED_NEWLINE \
      __VA_ARGS__                                                  FORCED_NEWLINE \
      <span id="character_count">0</span> characters.              FORCED_NEWLINE \
    </span>
#define WORD_COUNTER_END() _WORD_COUNTER_END(<span id="syllable_count">0</span> syllables,)
#define WORD_COUNTER_END_NON_ENGLISH() _WORD_COUNTER_END()

#define WRITING_CUSTOM_NAME_STUB_END(what, stub)                \
    <!-- CTNT_END --> <hr />                     FORCED_NEWLINE \
    Get what in                                  FORCED_NEWLINE \
    <a href=STR(/content/stub.epub)>ePub</a>,    FORCED_NEWLINE \
    <a href=STR(/content/stub.mobi)>MOBI</a>,    FORCED_NEWLINE \
    <a href=STR(/content/stub.azw3)>AZW3</a>, or FORCED_NEWLINE \
    <a href=STR(/content/stub.pdf)>PDF</a>.

#define WRITING_CUSTOM_NAME_END(what) WRITING_CUSTOM_NAME_STUB_END(what, FILE_NAME_STUB)
#define WRITING_END() WRITING_CUSTOM_NAME_END(this)
