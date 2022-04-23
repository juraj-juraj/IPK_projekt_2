PROG = ipk-sniffer
CMD_PARAMS = cmd_params_c
UTILS_FCE = utils_fce
FILES= *.cpp Makefile *.sh cablefish.py CMakeLists.txt libs/ doc/ testovanie/
LIB_PATH = ./libs/
NAME=xnovos13

CXX=g++
CC=g++
CPPFLAGS= -g -lstdc++ -Wall -Wextra -pedantic -std=c++17 -lpcap 
#CPPFLAGS= -g -lstdc++ -fPIC -std=c++17 -lpcap

.PHONY: run clean zip

${PROG}: ${PROG}.o ${LIB_PATH}${CMD_PARAMS}.o ${LIB_PATH}${UTILS_FCE}.o
	${CXX} -o $@ $^ ${CPPFLAGS}

#${CMD_PARAMS}.o: ${LIB_PATH}${CMD_PARAMS}.cpp ${LIB_PATH}${CMD_PARAMS}.h

#${UTILS_FCE}.o: ${LIB_PATH}${UTILS_FCE}.cpp ${LIB_PATH}${UTILS_FCE}

zip: $(FILES)
	tar -czf $(NAME).tgz $(FILES)

clean:
	rm -f ${PROG} *.o ${LIB_PATH}*.o  ${NAME}.tgz

