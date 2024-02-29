/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#define SYSCALL_EXIT        0
#define SYSCALL_READ        1
#define SYSCALL_WRITE       2
#define SYSCALL_CLOCK       3
#define SYSCALL_NR          32

#if (SYSCALL_NR != 16) && (SYSCALL_NR != 32)
#   error SYSCALL_NR doit être une puissance de 2
#endif

/**
 * __ASSEMBLER__ is automatically defined when gcc runs the assembler (.S source file)
 * (see https://bit.ly/32tv7u8) thus this part is not included in assembler files (.S)
 */
#ifndef __ASSEMBLER__
/**
 * \brief   allows to enter the kernel, it is written in assembler in crt0.c
 * \param   a0 1st generic parameter
 * \param   a1 2nd generic parameter
 * \param   a2 3rd generic parameter
 * \param   a3 4th generic parameter
 * \param   syscall_code syscall code must be one of those defined above : SYSCALL_xxx
 * \return  depends on the syscall code but often it is the success information: 0 good else failure
 */
extern int syscall (int a0, int a1, int a2, int a3, int syscall_code);
#endif

#endif//_SYSCALL_H_
