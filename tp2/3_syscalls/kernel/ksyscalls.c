/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

#include <syscalls.h>
#include <klibc.h>

static int unknown_syscall (int a0, int a1, int a2, int a3, int syscall_code)
{
    kprintf ("Unknown Syscall : %d\n", syscall_code);
    kprintf ("a0 : 0x%p (%d)\n", a0, a0);
    kprintf ("a1 : 0x%p (%d)\n", a1, a1);
    kprintf ("a2 : 0x%p (%d)\n", a2, a2);
    kprintf ("a3 : 0x%p (%d)\n", a3, a3);
    return 1;
}

void *syscall_vector[] = {
    [0 ... SYSCALL_NR - 1] = unknown_syscall,   /* default function */
    [SYSCALL_EXIT        ] = exit,
    [SYSCALL_READ        ] = tty_read,
    [SYSCALL_WRITE       ] = tty_write,
    [SYSCALL_CLOCK       ] = clock,
};
