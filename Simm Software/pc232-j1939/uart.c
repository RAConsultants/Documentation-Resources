#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <conio.h>
#include "stdint.h"
#include "wsc.h"
#include "keycode.h"
#include "rs232.h"
#include "uart.h"
#include "vna.h"



int port;



void
uart_close ( void )
{
  SioDone(port);
}



uint8_t
uart_setup ( uint8_t cport, uint8_t rate )
{
  int code;
  int baud;

  /* the com library needs minus 1 */
  port = cport - 1;

  /* decode rate number */
  switch( rate ) {
    case 1: baud = 9600; break;
    case 2: baud = 115200; break;
    case 3: baud = 460800; break;
  }

  /* pass the key code */
  code = SioKeyCode(WSC_KEY_CODE);
  if( code < 0 ) {
    printf("error: %d bad key code %d", code, WSC_KEY_CODE);
    return 1;
  }

  /* set defaults for all ports. Note 'port' argument is -1
     DTR & RTS set at port initialization */
  if( SioReset(-1,1,1) < 0 ) {
    printf("error: failed reset\n");
    return 1;
  }

  if( SioParms(-1,WSC_NoParity,WSC_OneStopBit,WSC_WordLength8) < 0 ) {
    printf("error: port failed setup\n");
    return 1;
  }

  /* reset (initialize) the port */
  if( SioReset(port, 1024, 1024) < 0 ) {
    printf("error: failed reset #2\n");
    return 1;
  }

  if( SioBaud(port, baud) < 0 ) {
    printf("error: port failed setup #2\n");
    return 1;
  }

  if( SioSetTimeouts(port,(DWORD)5,(DWORD)5,(DWORD)5,(DWORD)5,(DWORD)5) < 0 ) {
    printf("error: timeout setup failed\n");
    return 1;
  }

  /* success */
  return 0;
}



/*
** Application code uses this to receive a byte
** RETURN: 0 - success
**         1 - failed
*/
uint8_t
uart_rx ( uint8_t *val )
{
  int tmp;

  tmp = SioGetc(port);
  *val = (uint8_t) tmp;
  if( tmp >= 0 )
    return 0;

  return 1;
}



/* 
** Application code uses this to transmit a byte
** RETURN: 0 - success
**         1 - failed
*/
uint8_t
uart_tx ( uint8_t val )
{
  uint8_t cnt = 0;

  /* tx character, wait for up to 1 second */
  while( SioPutc(port, val) != 1 ) {

    Sleep(5);
    cnt++;
    if( cnt > 200 ) {

      printf("error: rs-232 adapter failure\n");
      uart_close();
      exit(1);
    }
  }

  return 0;
}
