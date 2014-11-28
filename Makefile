CFLAGS?=-Wall -Os -std=c99
LDADD?=`pkg-config --cflags --libs x11 xinerama xft`


normal:
	$(CC) -o pxoat xoat.c $(CFLAGS) $(LDADD) $(LDFLAGS)
	$(CC) -o pxoat-debug xoat.c $(CFLAGS) -g $(LDADD) $(LDFLAGS)
	strip xoat

install:
	make
	sudo cp -f pxoat /usr/local/bin
	pxoat restart

docs:
	pandoc -s -w man xoat.md -o xoat.1

clean:
	rm -f xoat xoat-debug

all: docs normal