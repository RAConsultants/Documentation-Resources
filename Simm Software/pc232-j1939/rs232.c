#include <stdio.h>
#include "stdint.h"
#include "main.h"
#include "uart.h"
#include "vna.h"
#include "rs232.h"
#include "msgs.h"



/* SLIP byte stuffing */
#define RS232_FLAG           0xC0
#define RS232_ESCAPE         0xDB
#define RS232_ESCAPE_FLAG    0xDC
#define RS232_ESCAPE_ESCAPE  0xDD

/* rx buffer (unstuffed) */
#define RS232_BUF_RX_SIZE              259
uint8_t rs232_buf_rx[ RS232_BUF_RX_SIZE ];



/*
** Calculates and returns 2's complement checksum.
*/
uint8_t
rs232_cksum ( uint8_t *buf, uint16_t size )
{
  uint8_t ret = 0;

  /* checksum data */
  while( size-- )
    ret += buf[size];

  return ((~ret)+1);
}



/*
** Byte stuff the stream and transmit.
*/
void
rs232_bs ( uint8_t *buf, uint16_t buf_len )
{
  uint16_t cnt;

  /* byte stuff stream */
  for( cnt = 0; cnt < buf_len; cnt++ ) {

    /* 0xC0 is sent as 0xDB, 0xDC
       0xDB is sent as 0xDB, 0xDD */
    if( buf[cnt] == RS232_FLAG ) {
      uart_tx(RS232_ESCAPE);
      uart_tx(RS232_ESCAPE_FLAG);
    } else if( buf[cnt] == RS232_ESCAPE ) {
      uart_tx(RS232_ESCAPE);
      uart_tx(RS232_ESCAPE_ESCAPE);
    } else {
      uart_tx(buf[cnt]);
    }
  }
}



/*
** Transmits a RS-232 message.  This function sends the start of message byte,
** adds the 2-byte length field and checksum to the message.  It then byte
** stuffs the length field, data, and checksum and transmits it.
*/
void
rs232_tx ( uint8_t *buf, uint16_t buf_len )
{
  uint8_t msg[2000];
  uint16_t cnt;

  /* is the msg larger than our example supports? */
  if( buf_len >= 2000 )
    return;
 
  /* start of message (raw - unstuffed) */
  uart_tx( RS232_FLAG ); 

  /* stuff msg length, adding a byte for chksum */
  msg[0] = (uint8_t)((buf_len+1) >> 8);
  msg[1] = (uint8_t)(buf_len+1);

  /* copy over message */
  for( cnt = 0; cnt < buf_len; cnt++ )
    msg[2+cnt] = buf[cnt];

  /* checksum and place at end of message */
  msg[2+buf_len] = rs232_cksum( msg, (uint16_t)(buf_len+2) );

  /* byte stuff and transmit the 'length', 'data', and 'cksum' */
  rs232_bs( msg, (uint16_t)(buf_len+3) );
}



/*
** Receives a RS-232 message by polling for start of message byte,
** unstuffing the data, and validating the checksum.  All completed
** are sent to rs232_port().  
*/
void
rs232_update ( uint8_t val )
{
  static uint16_t buf_len = 0;
  static uint16_t msg_size = 0;
  static uint8_t is_stuffed = 0;
  static uint8_t is_invalid = 0;
 
  /* is it start of message? */
  if( val == RS232_FLAG ) {

    /* start */
    buf_len = 0;
    is_invalid = 0;
    msg_size = 0xFFFF;
  
  } else if( is_invalid == 0 ) {

    /* if it's an escape, skip and unstuff next byte */
    if( val == RS232_ESCAPE ) {

      is_stuffed = 1;

    } else {

      /* if prev byte was an escape, then decode current byte */
      if( is_stuffed ) {

        is_stuffed = 0;

        /* it can only be two things, else invalid stream */
        if( val == RS232_ESCAPE_FLAG )
          val = RS232_FLAG;
        else if( val == RS232_ESCAPE_ESCAPE )
          val = RS232_ESCAPE;
        else
          is_invalid = 1;
      }

      /* at this point data is always unstuffed */
      if( buf_len < RS232_BUF_RX_SIZE )
        rs232_buf_rx[buf_len++] = val;

      /* at 2 bytes, we have enough info to calc a real msg length */
      if( buf_len == 2 )
        msg_size = ((rs232_buf_rx[0] << 8) | rs232_buf_rx[1]) + 2;

      /* have we received the entire msg? */
      if( buf_len == msg_size ) {

        /* subtract off cksum, validate, and post to application */
        buf_len--;
        if( rs232_buf_rx[buf_len] == rs232_cksum(&rs232_buf_rx[0],buf_len) )
         msgs_post( &rs232_buf_rx[2], (uint16_t)(buf_len-2) );
      }
    }
  }
}
