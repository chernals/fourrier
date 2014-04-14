##
# Fourrier
# A C library for tune computation
#
# Author: Cedric Hernaslteens <cedric.hernalsteens@cern.ch>
# 
# European Organization for Nuclear Research
#
# Copyright (c) 2014+ CERN. All rights reserved.
#
##

#
# General variables
NAME=ex01

#
# Libraries
# Leave path blank if system path is to be used

# # FFTW
FFTW_PATH=
ifdef FFTW_PATH
FFTW_INC=-I$(FFTW_PATH)/include
FFTW_LIB=-L$(FFTW_PATH)/lib
endif
FFTW_LINK=-lm -lfftw3

# # Fourrier
FOURRIER_PATH=../..
ifdef FOURRIER_PATH
FOURRIER_INC=-I$(FOURRIER_PATH)/include
FOURRIER_LIB=-L$(FOURRIER_PATH)/lib
endif
FOURRIER_LINK=#-lfourrier

#
# Compiler and archiver names
CC= gcc-4.8#cc
AR=ar

#
# Compiler options
OPTIONS=-O3 -std=c99
WARNINGS=-Wall -pedantic
OPT=$(OPTIONS) $(WARNINGS)

#
# Compiler, linker and archiver flags
ARFLAGS=rvs
CFLAGS=$(OPT) $(FFTW_INC) $(FOURRIER_INC)
LDFLAGS= $(FFTW_LIB) $(FOURRIER_LIB)
LDLIBS=$(FFTW_LINK) $(FOURRIER_LINK)

#
# Dependencies
EXEC_DEPENDENCIES = ex01.o ../../lib/fourrier.a
										
#
# Rules
.PHONY: clean ex01
		
# # Executable
$(NAME): $(EXEC_DEPENDENCIES)
	$(CC) $(LDFLAGS) $(EXEC_DEPENDENCIES) $(LDLIBS) -o $(NAME)

# # Clean
clean:
	$(RM) $(NAME) *.o
	
../../lib/fourrier.a:
