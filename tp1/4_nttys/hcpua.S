/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

//--------------------------------------------------------------------------------------------------
// Boot code
//--------------------------------------------------------------------------------------------------

.section .boot,"ax"                     // new section: .boot (see https://bit.ly/3gzKWob)
                                        // flags "ax": a -> allocated means section is in memory
                                        //             x -> section contains instructions

boot:                                   // must be 0xBFC0000 for the MIPS

    la      $29,    __kdata_end         // define stack ptr (first address after kdata region)
    la      $26,    kinit               // get address of kinit() function
    jr      $26                         // goto kinit()
