/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

#include <klibc.h>

static char banner[] =          // banner's text defined on several lines
"   _     ___    __ \n"
"  | |__ /'v'\\  / / \n"
"  | / /(     )/ _ \\\n"
"  |_\\_\\ x___x \\___/\n\n";

void kinit (void)
{
    kprintf (banner);

    // put bss sections to zero. bss contains uninitialised global variables
    extern int __bss_origin;    // first int of bss section (defined in ldscript kernel.ld)
    extern int __bss_end;       // first int of above bss section (defined in ldscript kernel.ld)
    for (int *a = &__bss_origin; a != &__bss_end; *a++ = 0);

    extern int _start;          // _start is the entry point of the app (defined in kernel.ld)
    app_load (&_start);         // function to start the user app (defined in hcpua.S)
}
