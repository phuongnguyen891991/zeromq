CC=gcc
CFLAGS=-I.
LIBS=-lzmq
SOURCE=$(wildcard *.c)
SV_SOURCE=server.c
CL_SOURCE=client.c
OBJECTS=$(patsubst %.c, %.o, $(SOURCES))
SERVER=server
CLIENT=client

.PHONY: all

all: $(SERVER) $(CLIENT)

$(SERVER): $(OBJECTS) $(LIBS)
	$(CC) -o $@ $(OBJECTS) $(SV_SOURCE) $(LIBS)

$(CLIENT): $(OBJECTS) $(LIBS)
	$(CC) -o $@ $(OBJECTS) $(CL_SOURCE) $(LIBS)

clean:
	rm -f *.o *~ core $(SERVER) $(CLIENT)
