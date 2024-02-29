/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

#include <syscalls.h>

static char hello[] = "app is alive at ";

// unsigned to ascii, that is temporary before to have a printf()
static char utoa_buffer[16];
static char *utoa (int val)
{
    char *res;

    res = &utoa_buffer[15];         // address of the last byte
    *res = 0;                       // put it the NUL char
    do {
        *--res = (val % 10) + '0';  // compute the unit digit
        val = val / 10;             // go to the next digit
    }
    while (val);
    return res;
}

static int strlen (char *s)
{
    int len = 0;    // number of characters in the string s
    while (*s++) len++;
    return len;
}

int main (void)
{
    int t0 = syscall (0, 0, 0, 0, SYSCALL_CLOCK);   // number of cycles elapsed since boot
    char *st0 = utoa(t0);                           // tranform into string

    syscall( 0, (int) hello, strlen(hello), 0, SYSCALL_WRITE);
    syscall( 0, (int) st0, strlen(st0), 0, SYSCALL_WRITE);
    syscall( 1, 0, 0, 0, SYSCALL_EXIT);

    return 0;
}
