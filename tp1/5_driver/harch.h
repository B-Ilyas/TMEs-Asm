/*------------------------------------------------------------------------------------------------*\
   _     ___    __
  | |__ /'v'\  / /      \date        2022-01-15
  | / /(     )/ _ \     \copyright   2021-2022 Sorbonne University
  |_\_\ x___x \___/                  https://opensource.org/licenses/MIT

\*------------------------------------------------------------------------------------------------*/

#ifndef _HARCH_H_
#define _HARCH_H_

//--------------------------------------------------------------------------------------------------
// TTY API
//--------------------------------------------------------------------------------------------------

/**
 * \brief     read any char from the tty until count is reached
 * \param     tty   tty number (between 0 and NTTYS-1)
 * \param     buf   buffer where the read char are put
 * \param     count number of char read must be lower or equal to buf size
 * \return    the number of read chars
 */
int tty_read (int tty, char *buf, unsigned count);

/**
 * \brief     write count chars of the buffer to the tty
 * \param     tty   tty number (between 0 and NTTYS-1)
 * \param     buf   buffer pointer
 * \return    the number of written char
 */
int tty_write (int tty, char *buf, unsigned count);

#endif//_HARCH_H_
