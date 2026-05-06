# -------------------------------
# generic UNIX makefile for pMARS
# -------------------------------

# Usage:

#   make default        default build (no display, with cdb debugger)
#   make server         server build (disable cdb debugger)
#   make curses         enable Curses display (UNIX)
#   make sdl            enable SDL graphics (generic)
#   make xwin           enable X Windows graphics (UNIX)
#   make clean          remove all *.o (recommended when changing
#                       CFLAGS in Makefile or switching build version)

# Config options (add to CFLAGS):

#   -DRWLIMIT           enables read/write limits
#   -DSAFECOLORS        use Okabe-Ito CVD-safe palette

CFLAGS += -O2 -DEXT94 -DPERMUTATE -DRWLIMIT

CC = gcc                # required for Linux
#CC = cc                # if you don't have gcc

MAINFILE = pmars

.PHONY: all curses default sdl server xwin clean

all:
	@echo "-------------------------------"
	@echo "generic UNIX makefile for pMARS"
	@echo "-------------------------------"
	@echo "Usage:"
	@echo "  make default        default build (no display, with cdb debugger)"
	@echo "  make server         server build (disable cdb debugger)"
	@echo "  make curses         enable Curses display (UNIX)"
	@echo "  make sdl            enable SDL graphics (generic)"
	@echo "  make xwin           enable X Windows graphics (UNIX)"
	@echo "  make clean          remove all *.o (recommended when changing"
	@echo "                      CFLAGS in Makefile or switching build version)"

curses: CFLAGS += -DCURSESGRAPHX
curses: LIBS = -lncurses
curses: $(MAINFILE)

default: $(MAINFILE)

sdl: CFLAGS += -DSDLGRAPHX `sdl-config --cflags`
sdl: LIBS = `sdl-config --libs`
sdl: $(MAINFILE)

server: CFLAGS += -DSERVER
server: LIBS =
server: $(MAINFILE)

smallmem: CFLAGS += -DSERVER -DSMALLMEM
smallmem: LIBS =
smallmem: $(MAINFILE)

xwin: CFLAGS += -DXWINGRAPHX
xwin: LIBS = -L/usr/X11R6/lib -lX11
xwin: $(MAINFILE)

OBJ = pmars.o asm.o eval.o disasm.o cdb.o sim.o pos.o clparse.o global.o token.o str_eng.o

$(MAINFILE): $(OBJ)
	@echo Linking $@
	@$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
	@strip $@
	@echo Done

token.o asm.o disasm.o: asm.h

sim.o cdb.o pos.o disasm.o: sim.h

sim.o: curdisp.c uidisp.c sdldisp.c xwindisp.c

sdldisp.c: pmarsicnsdl.h

xwindisp.c: xwindisp.h pmarsicn.h

$(OBJ): Makefile config.h global.h

%.o: %.c
	@echo Compiling $<
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(MAINFILE) core

gen_asm:
	@cd .. && bash scripts/gen_red_asm.sh $(DIR) "$(FLAGS)"

verify_asm: pmars
	@cd .. && bash scripts/verify_red_asm.sh

