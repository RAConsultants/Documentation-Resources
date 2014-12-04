#include <stdio.h>
#include "stdint.h"
#include "vna.h"
#include "msgs.h"



/* converts a msb first buf to unsigned 24 */
uint32_t
msbbufto24( uint8_t *buf )
{
  uint32_t ret;

  ret = buf[0];
  ret <<= 8;
  ret |= buf[1];
  ret <<= 8;
  ret |= buf[2];

  return ret;
}



/* converts a msb first buf to unsigned 32 */
uint32_t
msbbufto32( uint8_t *buf )
{
  uint32_t ret;

  ret = buf[0];
  ret <<= 8;
  ret |= buf[1];
  ret <<= 8;
  ret |= buf[2];
  ret <<= 8;
  ret |= buf[3];

  return ret;
}


/*
** Print out a J1587 message.
*/
void
msgs_rx_pstatus( uint8_t *buf, uint16_t buf_len )
{
  switch( buf[1] ) {
    case 0: printf("done"); break;
    case 1: printf("patching"); break;
    case 2: printf("patched"); break;
  }
  printf("\n");
}



/*
** Print out a J1587 message.
*/
void
msgs_rx_blver( uint8_t *buf, uint16_t buf_len )
{
  switch( buf[1] ) {
    case 3: printf("bl ver 1.3"); break;
  }
  printf("\n");
}



/*
** Print out POST.
*/
void
msgs_rx_post( uint8_t *buf, uint16_t buf_len )
{
  printf("hw product id: %d\n", buf[1]);
  printf("app product id: %d\n", buf[2]);
  printf("hw ver: %d\n", buf[3]);
  printf("bl ver: %d\n", buf[4]);
  printf("app ver: %d\n", buf[5]);
  printf("app is valid: %d\n", buf[6]);
  printf("\n");
}






/*
** Print out a J1587 message.
*/
void
msgs_rx_j1708( uint8_t *buf, uint16_t buf_len )
{
  uint8_t cnt;

  printf("j1708 rx: pid=%d ", buf[2] );
  printf("m=%01d ", buf[1]);
  printf("d[]=");
  for( cnt = 3; cnt < buf_len; cnt++ )
    printf("%03d ", buf[cnt]);
  printf("\n");
}



/*
** Print out a J1587 message.
*/
void
msgs_rx_j1587( uint8_t *buf, uint16_t buf_len )
{
  uint8_t cnt;

  printf("j1587 rx: pid=%d ", buf[3] );
  printf("m=%01d ", buf[1]);
  printf("d[]=");
  for( cnt = 4; cnt < buf_len; cnt++ )
    printf("%03d ", buf[cnt]);
  printf("\n");
}



/*
** Print out a J1939 message.
*/
void
msgs_rx_j1939( uint8_t *buf, uint16_t buf_len )
{
  uint8_t cnt;

  printf("rx: pgn=%d ", msbbufto24(&buf[2]));
  printf("p=%01d ", buf[1]);
  printf("d=%03d ", buf[5]);
  printf("s=%03d ", buf[6]);
  printf("d[]=");
  for( cnt = 8; cnt < buf_len; cnt++ )
    printf("%03d ", buf[cnt]);
  printf("\n");
}



/*
** Print out a J1939 message.
*/
void
msgs_rx_i15765( uint8_t *buf, uint16_t buf_len )
{
  uint8_t cnt;

  printf("p=%01d ", buf[1]);
  printf("d=%03d ", buf[2]);
  printf("s=%03d ", buf[3]);
  printf("pri=%03d ", buf[4]);
  printf("tat=%03d ", buf[5]);
  printf("d[]=");
  for( cnt = 6; cnt < buf_len; cnt++ )
    printf("%03d ", buf[cnt]);
  printf("\n");
}





/*
** Print out a CAN message.
*/
void
msgs_stats( uint8_t *buf, uint16_t buf_len )
{
  printf("rx: j1708 valid msgs=%d ", msbbufto32(&buf[1]) );
  printf("j1708 invalid bytes=%d ", msbbufto32(&buf[5]) );
  printf("can frames=%d ", msbbufto32(&buf[9]) );
  printf("hwv=%d ", buf[13] );
  printf("swv=%d ", buf[14] );
  printf("\n");
}



/*
** Print out a CAN message.
*/
void
msgs_stats_obd( uint8_t *buf, uint16_t buf_len )
{
  printf("rx: can frames=%d ", msbbufto32(&buf[1]) );
  printf("hwv=%d ", buf[5] );
  printf("swv=%d ", buf[6] );
  printf("\n");
}



/*
** This function receives all completed messages from the VNA-232
*/
void
msgs_post( uint8_t *buf, uint16_t buf_len )
{
  /* process new msg */
  switch( buf[0] ) {

    /* received an ack */
    case VNA_MSG_ACK: {
      printf("rx: ack=%d\n", buf[1] );
      break;
    }

    /* received a j1587 */
    case VNA_MSG_RX_J1708: {
      msgs_rx_j1708( buf, buf_len );
      break;
    }

    /* received a j1587 */
    case VNA_MSG_RX_J1587: {
      msgs_rx_j1587( buf, buf_len );
      break;
    }

    /* received a j1939 */
    case VNA_MSG_RX_J1939: {
      msgs_rx_j1939( buf, buf_len );
      break;
    }

    /* received a iso 15765 message */
    case VNA_MSG_RX_I15765: {
      msgs_rx_i15765( buf, buf_len );
      break;
    }

    /* received a stat message */
    case VNA_MSG_STATS: {
      msgs_stats( buf, buf_len );
      break;
    }

    /* received a stat message */
    case VNA_MSG_STATS_OBD: {
      msgs_stats_obd( buf, buf_len );
      break;
    }

    /* received a stat message */
    case VNA_MSG_PSTATUS: {
      msgs_rx_pstatus( buf, buf_len );
      break;
    }

    case VNA_MSG_BLVER: {
      msgs_rx_blver( buf, buf_len );
      break;
    }

    case VNA_MSG_POST: {
      msgs_rx_post( buf, buf_len );
      break;
    }

    default: {
      printf("error: unknown message\n");
      break;
    }
  }

  fflush(stdout);
}
