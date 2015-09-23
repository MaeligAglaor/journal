# Compiler, linker, archiver, etc.
CC = gcc
AR = ar

# Options de compilation et linker pour le programme
MAJOR = .1
MINOR = .1
PATCH = .57
CFLAGS = -Wall
LDFLAGS = -L.
LINKERNAME = $(PROG)_library
LINKERFILENAME = lib$(LINKERNAME).so
SONAME = $(LINKERFILENAME)$(MAJOR)
REALNAME = $(SONAME)$(MINOR)$(PATCH)
STATICLINKERFILENAME = lib$(LINKERNAME).a
OBJECTS = lib/journal.o

# Options de compilaion et linker pour la bibliothèque
libCFLAGS = -fPIC -Wall -shared
libLDFLAGS = -L./lib
libLDLIBS = -lc

# Nom de l'exécutable
PROG = devoir

all: prog

$(OBJECTS) : CFLAGS = $(libCFLAGS)

$(STATICLINKERFILENAME): $(OBJECTS)
	$(AR) rcs $(STATICLINKERFILENAME) $(OBJECTS)

$(REALNAME) $(LINKERFILENAME) $(SONAME): $(OBJECTS)
	$(CC) -shared -fPIC -Wl,-soname,$(LINKERNAME)$(MAJOR) -o $(REALNAME) $(OBJECTS) $(libLDLIBS)
	ln -sf $(REALNAME) $(LINKERFILENAME)
	ln -sf $(REALNAME) $(LINKERFILENAME)$(MAJOR)

prog: $(STATICLINKERFILENAME) $(REALNAME)
	$(CC) -c $(CFLAGS) main.c
	$(CC) -o $(PROG).static main.o $(LDFLAGS) -l:$(STATICLINKERFILENAME)
	$(CC) -Ilib -o $(PROG).shared main.o $(libLDFLAGS) -l$(LINKERNAME)
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./$(PROG).shared


library: $(REALNAME) $(STATICLINKERFILENAME)

clean:
	rm -f *.o *$(PROG)*

