PLATFORM=$(shell uname)
CC = gcc
AR = ar

STATIC_LIB =  luniq.a
SHARED_LIB = luniq.so
OBJS = luniq.o \
       handlemap.o
	

LLIBS = -llua -lpthread
#CFLAGS = -c -O3 -Wall -fPIC -Werror=declaration-after-statement -std=c89 -pedantic
CFLAGS = -c -O3 -Wall -fPIC
LDFLAGS = -O3 -Wall --shared

ifeq ($(PLATFORM),Linux)
else
	ifeq ($(PLATFORM), Darwin)
		LLIBS += 
	endif
endif

all : $(SHARED_LIB) $(STATIC_LIB)

$(SHARED_LIB): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS) $(LLIBS)

$(STATIC_LIB): $(OBJS)
	$(AR) crs $@ $^

$(OBJS) : %.o : %.c
	$(CC) -o $@ $(CFLAGS) $<

clean : 
	rm -f $(OBJS) $(SHARED_LIB) $(STATIC_LIB)

.PHONY : clean

