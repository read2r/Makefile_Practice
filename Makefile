CC = gcc

# C Compiler option
CFLAGS = -Wall -O2

# Linker option
LDFLAGS =

# Source code directory
SRC_DIR = ./src

# Object file directory
OBJ_DIR = ./obj

# Executable file name
TARGET = main

# Source files to build
#
# 'wildcard' Usage : $(wildcard pattern)
# e.g $(wildcard ./src/*.c) 
# => ./src/main.c ./src/foo.c ./src/bar.c
#
# 'notdir' Usage : $(nodir file_path)
# e.g $(nodir ./src/main.c ./src/foo.c ./src/bar.c
# => main.c foo.c bar.c
SRCS = $(notdir $(wildcard $(SRC_DIR)/*.c))

OBJS = $(SRCS:.c=.o)

# 'patsubst' Usage : $(patsubst pattern,replacement,text);
# e.g $(patsubst %.o,./obj/%.o,main.o foo.o bar.o)
# => ./obj/main.o ./obj/foo.o ./obj/bar.o
OBJECTS = $(patsubst %.o,$(OBJ_DIR)/%.o,$(OBJS))
DEPS = $(OBJECTS:.o=.d)

all : main

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@ -MD $(LDFLAGS)

$(TARGET) : $(OBJECTS)
	$(CC) $(CLFAGS) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

.PHONY : clean all
clean:
	rm -f $(OBJECTS) $(DEPS) $(TARGET)

-include $(DEPS)
