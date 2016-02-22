CFLAGS?=-Wall -Os -std=c99
LDADD?=`pkg-config --cflags --libs x11 xinerama xft`


normal: config.h  
	$(CC) -o pxoat pxoat.c $(CFLAGS) $(LDADD) $(LDFLAGS) 
	$(CC) -o pxoat-debug pxoat.c $(CFLAGS) -g $(LDADD) $(LDFLAGS)
	strip pxoat

install:
	cp -f pxoat /usr/local/bin
	pxoat restart

docs:
	pandoc -s -w man pxoat.md -o pxoat.1

clean:
	rm -f pxoat pxoat-debug

all: docs normal
