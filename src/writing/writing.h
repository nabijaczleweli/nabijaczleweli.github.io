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

#define WORD_COUNT_SCRIPT                                                                       \
  <script type="text/javascript" src="/capitalism/assets/syllable.js"></script>  FORCED_NEWLINE \
  <script type="text/javascript" src="/capitalism/assets/pluralize.js"></script> FORCED_NEWLINE \
  <script type="text/javascript" src="/capitalism/assets/word_count.js"></script>

#define BOOK_URL_SETTER_SCRIPT <script type="text/javascript" src="/capitalism/assets/book_setter.js"></script>
#define CUSTOM_BOOK_URL_SETTER_SCRIPT(url_code)  \
  <script type="text/javascript"> FORCED_NEWLINE \
    function custom_book_url() {  FORCED_NEWLINE \
      return (url_code);          FORCED_NEWLINE \
    }                             FORCED_NEWLINE \
  </script>                       FORCED_NEWLINE \
  BOOK_URL_SETTER_SCRIPT


#define _WORD_COUNTER_END(...)                                       \
    <span id="wordcount_wrapper" class="hidden">      FORCED_NEWLINE \
      <hr />                                          FORCED_NEWLINE \
      <span id="word_count">0</span> words,           FORCED_NEWLINE \
      __VA_ARGS__                                     FORCED_NEWLINE \
      <span id="character_count">0</span> characters. FORCED_NEWLINE \
    </span>
#define WORD_COUNTER_END() _WORD_COUNTER_END(<span id="syllable_count">0</span> syllables,)
#define WORD_COUNTER_END_NON_ENGLISH() _WORD_COUNTER_END()

#define WRITING_CUSTOM_NAME_END(what)                           \
    <hr />                                       FORCED_NEWLINE \
    Get what in                                  FORCED_NEWLINE \
    <a href="#" id="epub_book_link">ePub</a>,    FORCED_NEWLINE \
    <a href="#" id="mobi_book_link">MOBI</a>,    FORCED_NEWLINE \
    <a href="#" id="azw3_book_link">AZW3</a>, or FORCED_NEWLINE \
    <a href="#" id="pdf_book_link">PDF</a>.

#define WRITING_END() WRITING_CUSTOM_NAME_END(this)
