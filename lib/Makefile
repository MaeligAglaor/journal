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

$(REALNAME) $(LINKERFILENAME) $(SONAME): $(OBJECTS)
	$(CC) -shared -fPIC -Wl,-soname,$(LINKERNAME)$(MAJOR) -o $(REALNAME) $(OBJECTS) $(libLDLIBS)
	ln -sf $(REALNAME) $(LINKERFILENAME)
	ln -sf $(REALNAME) $(LINKERFILENAME)$(MAJOR)

library: $(REALNAME) $(STATICLINKERFILENAME)

