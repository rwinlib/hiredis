#!/bin/sh
# Follows from here:
# http://lists.r-forge.r-project.org/pipermail/rcpp-devel/2014-May/007584.html
set -x
set -e

## set LIB_HIREDIS=C:/Users/rfitzjoh/src/redis/redis-2.4/deps/hiredis/hiredis

DEST=${PWD}
mkdir -p ${DEST}/include ${DEST}/lib/i386 ${DEST}/lib/x64

git clone https://github.com/dmajkic/redis.git

cd redis/deps/hiredis

rm -f *.o
gcc -m64 -c -std=gnu99 -pedantic -O3 -Wall -W -D_ISOC99_SOURCE -D__USE_MINGW_ANSI_STDIO=1 -Wwrite-strings -g -ggdb  net.c
gcc -m64 -c -std=gnu99 -pedantic -O3 -Wall -W -D_ISOC99_SOURCE -D__USE_MINGW_ANSI_STDIO=1 -Wwrite-strings -g -ggdb  hiredis.c
gcc -m64 -c -std=gnu99 -pedantic -O3 -Wall -W -D_ISOC99_SOURCE -D__USE_MINGW_ANSI_STDIO=1 -Wwrite-strings -g -ggdb  sds.c
gcc -m64 -c -std=gnu99 -pedantic -O3 -Wall -W -D_ISOC99_SOURCE -D__USE_MINGW_ANSI_STDIO=1 -Wwrite-strings -g -ggdb  async.c
ar rcs ${DEST}/lib/x64/libhiredis.a net.o hiredis.o sds.o async.o

rm -f *.o
gcc -m32 -c -std=gnu99 -pedantic -O3 -Wall -W -D_ISOC99_SOURCE -D__USE_MINGW_ANSI_STDIO=1 -Wwrite-strings -g -ggdb  net.c
gcc -m32 -c -std=gnu99 -pedantic -O3 -Wall -W -D_ISOC99_SOURCE -D__USE_MINGW_ANSI_STDIO=1 -Wwrite-strings -g -ggdb  hiredis.c
gcc -m32 -c -std=gnu99 -pedantic -O3 -Wall -W -D_ISOC99_SOURCE -D__USE_MINGW_ANSI_STDIO=1 -Wwrite-strings -g -ggdb  sds.c
gcc -m32 -c -std=gnu99 -pedantic -O3 -Wall -W -D_ISOC99_SOURCE -D__USE_MINGW_ANSI_STDIO=1 -Wwrite-strings -g -ggdb  async.c
ar rcs ${DEST}/lib/i386/libhiredis.a net.o hiredis.o sds.o async.o

cp hiredis.h $DEST/include
