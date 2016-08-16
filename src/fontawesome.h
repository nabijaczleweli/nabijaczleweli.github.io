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


#include "util.h"


#define FA(iconname)            <i class=STR(fa fa-iconname)></i>
#define FA_R90(iconname)        <i class=STR(fa fa-iconname fa-rotate-90)></i>
#define FA_R180(iconname)       <i class=STR(fa fa-iconname fa-rotate-180)></i>
#define FA_R270(iconname)       <i class=STR(fa fa-iconname fa-rotate-270)></i>
#define FA_HFLIP(iconname)      <i class=STR(fa fa-iconname fa-flip-horizontal)></i>
#define FA_VFLIP(iconname)      <i class=STR(fa fa-iconname fa-flip-vertical)></i>
#define FA_SPIN(iconname)       <i class=STR(fa fa-iconname fa-spin)></i>
#define FA_PULSE(iconname)      <i class=STR(fa fa-iconname fa-pulse)></i>

#define FA_LG(iconname)         <i class=STR(fa fa-iconname fa-lg)></i>
#define FA_R90_LG(iconname)     <i class=STR(fa fa-iconname fa-lg fa-rotate-90)></i>
#define FA_R180_LG(iconname)    <i class=STR(fa fa-iconname fa-lg fa-rotate-180)></i>
#define FA_R270_LG(iconname)    <i class=STR(fa fa-iconname fa-lg fa-rotate-270)></i>
#define FA_HFLIP_LG(iconname)   <i class=STR(fa fa-iconname fa-lg fa-flip-horizontal)></i>
#define FA_VFLIP_LG(iconname)   <i class=STR(fa fa-iconname fa-lg fa-flip-vertical)></i>
#define FA_SPIN_LG(iconname)    <i class=STR(fa fa-iconname fa-lg fa-spin)></i>
#define FA_PULSE_LG(iconname)   <i class=STR(fa fa-iconname fa-lg fa-pulse)></i>

#define FA_2X(iconname)         <i class=STR(fa fa-iconname fa-2x)></i>
#define FA_R90_2X(iconname)     <i class=STR(fa fa-iconname fa-2x fa-rotate-90)></i>
#define FA_R180_2X(iconname)    <i class=STR(fa fa-iconname fa-2x fa-rotate-180)></i>
#define FA_R270_2X(iconname)    <i class=STR(fa fa-iconname fa-2x fa-rotate-270)></i>
#define FA_HFLIP_2X(iconname)   <i class=STR(fa fa-iconname fa-2x fa-flip-horizontal)></i>
#define FA_VFLIP_2X(iconname)   <i class=STR(fa fa-iconname fa-2x fa-flip-vertical)></i>
#define FA_SPIN_2X(iconname)    <i class=STR(fa fa-iconname fa-2x fa-spin)></i>
#define FA_PULSE_2X(iconname)   <i class=STR(fa fa-iconname fa-2x fa-pulse)></i>

#define FA_3X(iconname)         <i class=STR(fa fa-iconname fa-3x)></i>
#define FA_R90_3X(iconname)     <i class=STR(fa fa-iconname fa-3x fa-rotate-90)></i>
#define FA_R180_3X(iconname)    <i class=STR(fa fa-iconname fa-3x fa-rotate-180)></i>
#define FA_R270_3X(iconname)    <i class=STR(fa fa-iconname fa-3x fa-rotate-270)></i>
#define FA_HFLIP_3X(iconname)   <i class=STR(fa fa-iconname fa-3x fa-flip-horizontal)></i>
#define FA_VFLIP_3X(iconname)   <i class=STR(fa fa-iconname fa-3x fa-flip-vertical)></i>
#define FA_SPIN_3X(iconname)    <i class=STR(fa fa-iconname fa-3x fa-spin)></i>
#define FA_PULSE_3X(iconname)   <i class=STR(fa fa-iconname fa-3x fa-pulse)></i>

#define FA_4X(iconname)         <i class=STR(fa fa-iconname fa-4x)></i>
#define FA_R90_4X(iconname)     <i class=STR(fa fa-iconname fa-4x fa-rotate-90)></i>
#define FA_R180_4X(iconname)    <i class=STR(fa fa-iconname fa-4x fa-rotate-180)></i>
#define FA_R270_4X(iconname)    <i class=STR(fa fa-iconname fa-4x fa-rotate-270)></i>
#define FA_HFLIP_4X(iconname)   <i class=STR(fa fa-iconname fa-4x fa-flip-horizontal)></i>
#define FA_VFLIP_4X(iconname)   <i class=STR(fa fa-iconname fa-4x fa-flip-vertical)></i>
#define FA_SPIN_4X(iconname)    <i class=STR(fa fa-iconname fa-4x fa-spin)></i>
#define FA_PULSE_4X(iconname)   <i class=STR(fa fa-iconname fa-4x fa-pulse)></i>

#define FA_5X(iconname)         <i class=STR(fa fa-iconname fa-5x)></i>
#define FA_R90_5X(iconname)     <i class=STR(fa fa-iconname fa-5x fa-rotate-90)></i>
#define FA_R180_5X(iconname)    <i class=STR(fa fa-iconname fa-5x fa-rotate-180)></i>
#define FA_R270_5X(iconname)    <i class=STR(fa fa-iconname fa-5x fa-rotate-270)></i>
#define FA_HFLIP_5X(iconname)   <i class=STR(fa fa-iconname fa-5x fa-flip-horizontal)></i>
#define FA_VFLIP_5X(iconname)   <i class=STR(fa fa-iconname fa-5x fa-flip-vertical)></i>
#define FA_SPIN_5X(iconname)    <i class=STR(fa fa-iconname fa-5x fa-spin)></i>
#define FA_PULSE_5X(iconname)   <i class=STR(fa fa-iconname fa-5x fa-pulse)></i>

#define CMT // D = only decorative
#undef CMT  // "Note: to improve web accessibility, we recommend using aria-hidden="true" to hide icons used purely for decoration."

#define FA_D(iconname)          <i class=STR(fa fa-iconname)                          aria-hidden="true"></i>
#define FA_R90_D(iconname)      <i class=STR(fa fa-iconname fa-rotate-90)             aria-hidden="true"></i>
#define FA_R180_D(iconname)     <i class=STR(fa fa-iconname fa-rotate-180)            aria-hidden="true"></i>
#define FA_R270_D(iconname)     <i class=STR(fa fa-iconname fa-rotate-270)            aria-hidden="true"></i>
#define FA_HFLIP_D(iconname)    <i class=STR(fa fa-iconname fa-flip-horizontal)       aria-hidden="true"></i>
#define FA_VFLIP_D(iconname)    <i class=STR(fa fa-iconname fa-flip-vertical)         aria-hidden="true"></i>
#define FA_SPIN_D(iconname)     <i class=STR(fa fa-iconname fa-spin)                  aria-hidden="true"></i>
#define FA_PULSE_D(iconname)    <i class=STR(fa fa-iconname fa-pulse)                 aria-hidden="true"></i>

#define FA_LG_D(iconname)       <i class=STR(fa fa-iconname fa-lg)                    aria-hidden="true"></i>
#define FA_R90_LG_D(iconname)   <i class=STR(fa fa-iconname fa-lg fa-rotate-90)       aria-hidden="true"></i>
#define FA_R180_LG_D(iconname)  <i class=STR(fa fa-iconname fa-lg fa-rotate-180)      aria-hidden="true"></i>
#define FA_R270_LG_D(iconname)  <i class=STR(fa fa-iconname fa-lg fa-rotate-270)      aria-hidden="true"></i>
#define FA_HFLIP_LG_D(iconname) <i class=STR(fa fa-iconname fa-lg fa-flip-horizontal) aria-hidden="true"></i>
#define FA_VFLIP_LG_D(iconname) <i class=STR(fa fa-iconname fa-lg fa-flip-vertical)   aria-hidden="true"></i>
#define FA_SPIN_LG_D(iconname)  <i class=STR(fa fa-iconname fa-lg fa-spin)            aria-hidden="true"></i>
#define FA_PULSE_LG_D(iconname) <i class=STR(fa fa-iconname fa-lg fa-pulse)           aria-hidden="true"></i>

#define FA_2X_D(iconname)       <i class=STR(fa fa-iconname fa-2x)                    aria-hidden="true"></i>
#define FA_R90_2X_D(iconname)   <i class=STR(fa fa-iconname fa-2x fa-rotate-90)       aria-hidden="true"></i>
#define FA_R180_2X_D(iconname)  <i class=STR(fa fa-iconname fa-2x fa-rotate-180)      aria-hidden="true"></i>
#define FA_R270_2X_D(iconname)  <i class=STR(fa fa-iconname fa-2x fa-rotate-270)      aria-hidden="true"></i>
#define FA_HFLIP_2X_D(iconname) <i class=STR(fa fa-iconname fa-2x fa-flip-horizontal) aria-hidden="true"></i>
#define FA_VFLIP_2X_D(iconname) <i class=STR(fa fa-iconname fa-2x fa-flip-vertical)   aria-hidden="true"></i>
#define FA_SPIN_2X_D(iconname)  <i class=STR(fa fa-iconname fa-2x fa-spin)            aria-hidden="true"></i>
#define FA_PULSE_2X_D(iconname) <i class=STR(fa fa-iconname fa-2x fa-pulse)           aria-hidden="true"></i>

#define FA_3X_D(iconname)       <i class=STR(fa fa-iconname fa-3x)                    aria-hidden="true"></i>
#define FA_R90_3X_D(iconname)   <i class=STR(fa fa-iconname fa-3x fa-rotate-90)       aria-hidden="true"></i>
#define FA_R180_3X_D(iconname)  <i class=STR(fa fa-iconname fa-3x fa-rotate-180)      aria-hidden="true"></i>
#define FA_R270_3X_D(iconname)  <i class=STR(fa fa-iconname fa-3x fa-rotate-270)      aria-hidden="true"></i>
#define FA_HFLIP_3X_D(iconname) <i class=STR(fa fa-iconname fa-3x fa-flip-horizontal) aria-hidden="true"></i>
#define FA_VFLIP_3X_D(iconname) <i class=STR(fa fa-iconname fa-3x fa-flip-vertical)   aria-hidden="true"></i>
#define FA_SPIN_3X_D(iconname)  <i class=STR(fa fa-iconname fa-3x fa-spin)            aria-hidden="true"></i>
#define FA_PULSE_3X_D(iconname) <i class=STR(fa fa-iconname fa-3x fa-pulse)           aria-hidden="true"></i>

#define FA_4X_D(iconname)       <i class=STR(fa fa-iconname fa-4x)                    aria-hidden="true"></i>
#define FA_R90_4X_D(iconname)   <i class=STR(fa fa-iconname fa-4x fa-rotate-90)       aria-hidden="true"></i>
#define FA_R180_4X_D(iconname)  <i class=STR(fa fa-iconname fa-4x fa-rotate-180)      aria-hidden="true"></i>
#define FA_R270_4X_D(iconname)  <i class=STR(fa fa-iconname fa-4x fa-rotate-270)      aria-hidden="true"></i>
#define FA_HFLIP_4X_D(iconname) <i class=STR(fa fa-iconname fa-4x fa-flip-horizontal) aria-hidden="true"></i>
#define FA_VFLIP_4X_D(iconname) <i class=STR(fa fa-iconname fa-4x fa-flip-vertical)   aria-hidden="true"></i>
#define FA_SPIN_4X_D(iconname)  <i class=STR(fa fa-iconname fa-4x fa-spin)            aria-hidden="true"></i>
#define FA_PULSE_4X_D(iconname) <i class=STR(fa fa-iconname fa-4x fa-pulse)           aria-hidden="true"></i>

#define FA_5X_D(iconname)       <i class=STR(fa fa-iconname fa-5x)                    aria-hidden="true"></i>
#define FA_R90_5X_D(iconname)   <i class=STR(fa fa-iconname fa-5x fa-rotate-90)       aria-hidden="true"></i>
#define FA_R180_5X_D(iconname)  <i class=STR(fa fa-iconname fa-5x fa-rotate-180)      aria-hidden="true"></i>
#define FA_R270_5X_D(iconname)  <i class=STR(fa fa-iconname fa-5x fa-rotate-270)      aria-hidden="true"></i>
#define FA_HFLIP_5X_D(iconname) <i class=STR(fa fa-iconname fa-5x fa-flip-horizontal) aria-hidden="true"></i>
#define FA_VFLIP_5X_D(iconname) <i class=STR(fa fa-iconname fa-5x fa-flip-vertical)   aria-hidden="true"></i>
#define FA_SPIN_5X_D(iconname)  <i class=STR(fa fa-iconname fa-5x fa-spin)            aria-hidden="true"></i>
#define FA_PULSE_5X_D(iconname) <i class=STR(fa fa-iconname fa-5x fa-pulse)           aria-hidden="true"></i>
