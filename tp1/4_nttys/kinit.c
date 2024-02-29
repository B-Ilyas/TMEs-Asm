/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-11-21
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

//--------------------------------------------------------------------------------------------------
// TTY Definition
// - NTTYS              is the number of available TTY
// - struct tty_s       tty's registers map description
// - __tty_regs_map     declare tty's registers map defined in ldscript
//--------------------------------------------------------------------------------------------------

struct tty_s {
    int write;          // tty's output address
    int status;         // tty's status address something to read if not null)
    int read;           // tty's input address
    int unused;         // unused address
};

// it is a declaration of an external variable
// since this array of structures is is actually mapped in the TTY controler!
// volatile means that the compiler must really read from the memory or write to memory 
// without trying to use registers to optimize
extern volatile struct tty_s __tty_regs_map[NTTYS];

//--------------------------------------------------------------------------------------------------

char * hello_0 = "Hello World!\n";
char * hello_1 = "Hello World!\n";
void kinit (void)
{
    char *s;
    char c;
    int tty = 0;

    for (s = hello_0; *s; s++) {                        // for all char in hello string
        __tty_regs_map[ 0%NTTYS ].write = *s;         // write it to the tty output register
    }
    for (s = hello_1; *s; s++) {
        __tty_regs_map[ 1%NTTYS ].write = *s;
    }

    while (1) {
        if (__tty_regs_map[0].status != 0){       // wait for a char typed on keyboard0 (system)
        	c = __tty_regs_map[0].read;           // read the char
        	__tty_regs_map[0].write = c;          // print it (that is a software loopback)
        }
        if (__tty_regs_map[1].status != 0){       // wait for a char typed on keyboard1
        	c = __tty_regs_map[1].read;           // read the char
        	if((c >= 'a')&&(c <= 'z'))
        		c += 'A' - 'a'
        	else if ((c >= 'A')&&(c <= 'Z'))
        		c += 'a' - 'A'
        	__tty_regs_map[1].write = c;		// print it (that is a software loopback)
        }           
    }

    while (1);                                          // infinite loop at the end
}
