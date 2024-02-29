/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

#include <harch.h>      // always include the functions declaration file

//--------------------------------------------------------------------------------------------------
// TTY Definition
// - NTTYS              is the number of available TTY
// - struct tty_s       tty's registers map description
// - __tty_regs_map     declare tty's registers map defined in ldscript
// - volatile           means that compiler must really read from and write to memory
//                      thus it must not use registers to optimize
//--------------------------------------------------------------------------------------------------

struct tty_s {
    int write;          // tty's output address
    int status;         // tty's status address something to read if not null)
    int read;           // tty's input address
    int unused;         // unused address
};

extern volatile struct tty_s __tty_regs_map[NTTYS];

//--------------------------------------------------------------------------------------------------

int tty_read (int tty, char *buf, unsigned count)
{
    int res = 0;                                // nb of read char
    tty = tty % NTTYS;                          // to be sure that tty is an existing tty

    while (count--) {
        while (!__tty_regs_map[ tty ].status);  // wait for a char from the keyboard
        int c = __tty_regs_map[ tty ].read;     // read the char
        *buf++ = c;
        res++;
    }
    return res;                                 // return the number of char read
}

int tty_write (int tty, char *buf, unsigned count)
{
    int res = 0;                                // nb of written char
    tty = tty % NTTYS;                          // to be sure that tty is an existing tty

    while (count--) {                           // while there are chars
        __tty_regs_map[ tty ].write = *buf;     // send the char to TTY
        res++;                                  // nb of written char
        buf++;		                            // but is the next address in buffer
    }
    return res;
}
