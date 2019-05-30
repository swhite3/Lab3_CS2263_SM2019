
# TODO: add targets to compile LinkedList.c

# TODO: add a target for each .input file in the Data directory to run the compiled LinkedList program with the tests in ./Data

# TODO: add a target that can run all the tests above.



#########################################
# Created by Seth Wydysh
# Made on May 30th, 2019
# To compile and test Lab3, Stack.c
#
##########################################

# compile with gcc, change this to clang if you prefer
COMPILER = gcc

# The C flags to pass to gcc
C_FLAGS = -Wall -Wextra -std=c99

# prepend the command with '@' so that Make does not print the command before running it 
help:
	@printf "available command:\n"
	@printf "	make help               (this command)\n"
	@printf "	make Stack          (to build your C program)\n"
	@printf "	make test               (to run every test case)\n"

# link our .o files to make an executable
Stack: Stack.o
	$(COMPILER) $(C_FLAGS) -o Stack Stack.o 

# compile the `Stack.o` file
Stack.o: Stack.c
	$(COMPILER) $(C_FLAGS) -c Stack.c

##################################################################
# Test Cases
test: test1 test2 test3

# run our executable by passing in the text file via stdin with `<` and passing stdout to a file with `>`
# then use a scrit to verify that the result are the same one as the one expected
test1: Stack Data/test1.input Data/test1.expected
	./Stack < Data/test1.input > test1.result
	./TestPassed.sh test1.result Data/test1.expected

test2: Stack Data/test2.input Data/test2.expected
	./Stack < Data/test2.input > test2.result
	./TestPassed.sh test2.result Data/test2.expected

test3: Stack Data/test3.input Data/test3.expected
	./Stack < Data/test3.input > test3.result
	./TestPassed.sh test3.result Data/test3.expected
