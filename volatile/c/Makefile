CFLAGS = -Os
LDFLAGS = -lpthread

FILES = $(wildcard *.c)
ASMS = $(subst .c,.s,$(FILES))
OUTS = $(subst .c,.out,$(FILES))

all:$(ASMS) $(OUTS)

%.s: %.c
	gcc $(CFLAGS) -S -o $@ $<

%.out: %.s
	gcc $(CFLAGS) $(LDFLAGS) -o $@ $<

clean: $(ASMS) $(OUTS)
	rm -rf $^
