# Compiler, linker, archiver, etc.
CC = gcc
AR = ar

# Options de compilation et linker pour le programme

CFLAGS = -Wall
LDFLAGS = -L.
LINKERNAME = $(PROG)_library
STATICLINKERFILENAME = lib$(LINKERNAME).a
OBJECTS = journal.o

# Options de compilaion et linker pour la bibliothèque
libCFLAGS = -fPIC -Wall -shared
libLDFLAGS = -L.
libLDLIBS = -lc

# Nom de l'exécutable
PROG = devoir

all: library

$(OBJECTS) : CFLAGS = $(libCFLAGS)

$(STATICLINKERFILENAME): $(OBJECTS)
	$(AR) rcs $(STATICLINKERFILENAME) $(OBJECTS)

library: $(STATICLINKERFILENAME)


