/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

extern volatile int __tty_regs_map;     // declare tty's registers map defined in ldscript
                                        // volatile means that the compiler must write in memory
                                        // each time and cannot use a register to optimize

char hello[] = "Hello World!\n";        // define a global string

void kinit (void)
{
    char *s;

    for (s = hello; *s; s++) {          // for all char in hello string
        __tty_regs_map = *s;            // write it to the tty output register
    }
    while (1);                          // infinite loop at the end
}
