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
#include "bits.h"



void
main_cpu_reset ( void )
{
  uint8_t buf[5];
  
  /* reset CPU */
  buf[0] = VNA_MSG_CPU_RESET;
  buf[1] = 0x5A;
  buf[2] = 0x69;
  buf[3] = 0xA5;

  /* send to vna-232 */
  rs232_tx(buf,4);

  printf("info: sent reset command\n");
}



void
main_tx_passall ( void )
{
  uint8_t buf[5];
  
  /* reset CPU */
  buf[0] = VNA_MSG_PAMODE_SET;
  buf[1] = 0;  // port
  buf[2] = 1;  // j1708
  buf[3] = 0;  // j1587
  buf[4] = 0;  // can
  buf[5] = 0;  // j1939

  /* send to vna-232 */
  rs232_tx(buf,6);

  printf("info: sent pass all command\n");
}



/*
** Transmit request for PGN.  Used for request based PGNs like VIN.
** dst: Destination address (255=global)
** pgn: Request PGN
*/
void
main_j1939_tx_request ( uint8_t dst, uint32_t pgn )
{
  uint8_t buf[50];
  
  buf[0] = VNA_MSG_TX_J1939;
  buf[1] = 0;      // port
  buf[2] = 0;      // pgn 23-16
  buf[3] = 0xEA;   // pgn 15 - 8
  buf[4] = 0;      // pgn 7 - 0
  buf[5] = dst;    // dst
  buf[6] = 252;    // src
  buf[7] = 6;      // pri
  buf[8] = (uint8_t) pgn;
  buf[9] = (uint8_t) (pgn >> 8);
  buf[10] = (uint8_t) (pgn >> 16);

  rs232_tx(buf,11);
  printf("info: transmitted J1939 request for PGN %d\n", pgn);
}



/*
** Transmit J1587 destination specific request for PID.
** dst: Destination address (must be less than 255)
** pid: PID being requested
*/
void
main_j1587_tx_dst_specific_request ( uint8_t dst, uint8_t pid )
{
  uint8_t buf[20];
  
  buf[0] = VNA_MSG_TX_J1587;
  buf[1] = 145;   // mid
  buf[2] = 0;     // pid 15 - 8 
  buf[3] = 128;   // pid 7 - 0 (pid 128 = dst req)
  buf[4] = 3;     // pri
  buf[5] = dst;
  buf[6] = pid;

  rs232_tx(buf,7);
  printf("info: transmitted destination specific J1587 request PID %d\n",pid);
}



/*
** Transmit J1587 global request for PID.
** pid: PID being requested
*/
void
main_j1587_tx_global_request ( uint8_t pid )
{
  uint8_t buf[20];
  
  buf[0] = VNA_MSG_TX_J1587;
  buf[1] = 145;   // mid
  buf[2] = 0;     // pid 15 - 8 
  buf[3] = 0;     // pid 7 - 0 (pid 0 = global req)
  buf[4] = 3;     // pri
  buf[5] = pid;

  rs232_tx(buf,6);
  printf("info: transmitted global J1587 request for PID %d\n",pid);
}





/*
** Transmit BAM message (i.e. multi-frame to all controllers)
*/
void
main_j1939_tx_bam ( uint8_t p )
{
  uint8_t cnt;
  uint8_t buf[50];
  
  buf[0] = VNA_MSG_TX_J1939;
  buf[1] = p;      // port
  buf[2] = 0;      // pgn 23-16
  buf[3] = 0xFE;   // pgn 15 - 8
  buf[4] = 0xF0;   // pgn 7 - 0
  buf[5] = 255;    // dst
  buf[6] = 252;    // src
  buf[7] = 3;      // pri

  /* set to 'not availble' for since this is a test msg */
  for( cnt = 0; cnt < 16; cnt++ )
    buf[8+cnt] = p*10+cnt;

  rs232_tx(buf,24);
  printf("info: transmitted BAM of PGN 65264\n");
}



/*
** Transmit Power Takeoff Information msg (PGN 65264)
*/
void
main_j1939_tx ( uint8_t p )
{
  uint8_t cnt;
  uint8_t buf[20];
  
  buf[0] = VNA_MSG_TX_J1939;
  buf[1] = p;      // port
  buf[2] = 0;      // pgn 23-16
  buf[3] = 0xFE;   // pgn 15 - 8
  buf[4] = 0xF0;   // pgn 7 - 0
  buf[5] = 255;    // dst
  buf[6] = 252;    // src
  buf[7] = 3;      // pri

  /* set to 'not availble' for since this is a test msg */
  for( cnt = 0; cnt < 8; cnt++ )
    buf[8+cnt] = cnt;

  rs232_tx(buf,16);
  printf("info: transmitted j1939 example message\n");
}



/*
** Transmit Mass Air Flow (PID 132)
*/
void
main_j1587_tx ( uint16_t pid )
{
  uint8_t buf[20];
  
  buf[0] = VNA_MSG_TX_J1587;
  buf[1] = 145;   // mid
  buf[2] = (uint8_t) (pid >> 8); // pid 15 - 8 
  buf[3] = (uint8_t) pid;        // pid 7 - 0
  buf[4] = 3;     // pri
  buf[5] = 40;    // data 0
  buf[6] = 50;    // data 1

  rs232_tx(buf,7);
  printf("info: transmitted j1587 message for PID %d\n", pid);
}



/*
** Add filter for J1587 PID
*/
void
main_filter_add_j1587 ( uint16_t pid )
{
  uint8_t buf[5];
  
  /* add filter for cruise control/vehicle speed PGN */
  buf[0] = VNA_MSG_FA_J1587;
  buf[1] = pid >> 8;          // pid 15 - 8
  buf[2] = (uint8_t) pid;     // pid 7 - 0

  /* send to vna-232 */
  rs232_tx(buf,3);

  printf("info: added j1587 filter for PID %d\n", pid);
}



/*
** Add filter for PGN 65265 (Cruise Control/Vehicle Speed)
*/
void
main_filter_add_j1939 ( uint32_t pgn )
{
  uint8_t buf[5];
  
  /* add filter for cruise control/vehicle speed PGN */
  buf[0] = VNA_MSG_FA_J1939;
  buf[1] = 0;                     // port 0
  buf[2] = (uint8_t)(pgn >> 16);  // pgn 23-16
  buf[3] = (uint8_t)(pgn >> 8);   // pgn 15 - 8
  buf[4] = (uint8_t)pgn;          // pgn 7 - 0

  /* send to vna-232 */
  rs232_tx(buf,5);

  printf("info: added filter for j1939 PGN: %d\n", pgn);
}



void
main ( int argc, char *argv[] )
{
  uint8_t val;
  uint8_t port;
  uint8_t rate;

  /* must be port and speed, where speed can only be 1, 2, or 3 */
  if( (argc != 3) || (argv[1][0] < '0') || (argv[1][0] > '9')
                  || (argv[2][0] < '1') || (argv[2][0] > '3') ) {
    printf("usage: pc232 <port> <rate>\n");
    printf("  <port> - serial port number\n");
    printf("  <speed> - 1=9.6K, 2=115.2K, 3=460.8K\n");
    return;
  }

  /* get port */
  port = (uint8_t)strtol(argv[1], 0, 10);

  /* get data rate */
  rate = argv[2][0] - '0';

  /* if setup fails, do nothing */
  if( uart_setup((uint8_t)port,rate) )
    return;

  /* wait for RS-232 transceiver to stabilize */
  Sleep(100);

  /* add filter j1587 engine load */
  main_filter_add_j1587(92);

  /* add filter j1587 VIN */
  main_filter_add_j1587(237);

  /* send j1587 request for VIN from engine (0 = engine) */
  main_j1587_tx_dst_specific_request(0,237);

  /* send j1587 request for VIN to everyone */
  main_j1587_tx_global_request(237);

  /* added filter for engine speed PGN */
  main_filter_add_j1939(61444);

  /* added filters for both odometer messages */
  main_filter_add_j1939(65217);
  main_filter_add_j1939(65248);

  /* add filter for VIN and transmit global request for VIN */
  main_filter_add_j1939(65260);
  main_j1939_tx_request(255,65260);

  /* wait for user to hit q */
  while( _kbhit() == 0 || toupper(getch()) != 'Q' ) {

    while( uart_rx(&val) == 0 )
      rs232_update(val);

    Sleep(1);
  }

  uart_close();
}
