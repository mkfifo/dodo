VERSION = 0.1

PREFIX = /usr
MANPREFIX = ${PREFIX}/share/man

INCS =
LIBS = 

# NB: including  -fprofile-arcs -ftest-coverage for gcov
CFLAGS = -std=c99 -pedantic -Werror -Wall -Wextra -Wstrict-prototypes -Wshadow -Wdeclaration-after-statement -Wunused-function -Wmaybe-uninitialized -fprofile-arcs -ftest-coverage ${INCS}

# gcov free version
#CFLAGS = -std=c99 -pedantic -Werror -Wall -Wextra -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wshadow -Wdeclaration-after-statement -Wunused-function -Wmaybe-uninitialized ${INCS}

# NB: including  -fprofile-arcs for gcov
LDFLAGS = -fprofile-arcs ${LIBS}

# gcov free version
#LDFLAGS = ${LIBS}

CC = cc
