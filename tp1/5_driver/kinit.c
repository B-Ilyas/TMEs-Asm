/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

#include <harch.h>

char hello[] = "\nHello ";
char end[] = "\n\nAu revoir\n";
char ask[] = "Entrez votre nom : ";
char cont[] = "Continue [Y]/N : ";
char name[] = { [0 ... 63] = 'x' };             // table of 64 bytes filled by 'x' character

//--------------------------------------------------------------------------------------------------

int tty_getc (int tty)
{
    char c;
    tty_read (tty, &c, 1);                      // read only 1 char
    tty_write (tty, &c, 1);                     // loop back to the tty
    return c;                                   // return the read char
}

int tty_puts (int tty, char *buf)
{
    int count = 0;                              // nb of written char
    while (buf[count++]);                       // count the number of char
    return tty_write (tty, buf, count);         // send buf to the tty
}

int tty_gets (int tty, char *buf, int count)
{
    // to make the backspace, we use ANSI codes : https://www.wikiwand.com/en/ANSI_escape_code
    char *DEL = "\033[D \033[D";                // move left, then write ' ' and move left
    int res = 0;
    count--;                                    // we need to add a NUL (0) char at the end
    char c=0;

    while ((count != 0) && (c != '\n')) {       // as long as we can or need to get a char

        tty_read (tty, &c, 1);                  // read only 1 char
        if (c == '\r')                          // if c is the carriage return (13)
            tty_read (tty, &c, 1);              // get the next that is line feed (10)

        if ((c == 8)||(c == 127)) {             // 8 = backspace, 127 = delete
            if (res) {                          // go back in the buffer if possible
        	    tty_write (tty, DEL, 7);        // replace the current char by a ' ' (space)
                count++;		                // count is the remaining place
                buf--;                          // but is the next address in buffer
                res--;
            }
            continue;                           // ask for another key
        } else
            tty_write (tty, &c, 1);             // loop back to the tty

        *buf = c;                               // write the char into the buffer
        buf++;                                  // increments the writing pointer
        count--;                                // decrements the remaining space
        res++;                                  // increments the read char
    }
    *buf = 0;                                   // add a last 0 to end the string

    return res;                                 // returns the number of char read
}

void kinit (void)
{
    char c;

    tty_puts (0, ask);
    tty_gets (0, name, sizeof(name));

    do {
        tty_puts (0, hello);                    // print hello string
        tty_puts (0, name);
        tty_puts (0, cont);
        c = tty_getc (0);                       // read one char (with loopback)
    }
    while (c != 'N');                           // until the char is 'q'

    tty_puts (0, end);                          // print end string on terminal 0

    while (1);                                  // infinite loop
}
