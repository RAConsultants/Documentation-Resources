- main.c does checking of the command line, configures the serial port, continously reads in all serial data and passes to rs232.c

- rs232.c decodes the byte stream and packages complete messages. 

- msgs.c decodes the complete messages and prints to stdout.
