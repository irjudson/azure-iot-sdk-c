#!/bin/sh
#


DEVROOT=/Users/irjudson/esp/xtensa-esp32-elf
IDFROOT=/Users/irjudson/esp/esp-idf
CC=$DEVROOT/bin/xtensa-esp32-elf-gcc
CXX=$DEVROOT/bin/xtensa-esp32-elf-g++
CPPFLAGS="-DESP_PLATFORM -MMD -MP" #-I$IDFROOT/components/openssl/include"
CFLAGS="-L$IDFROOT/components/openssl/lib"
CXXFLAGS=$CFLAGS
LDFLAGS="-nostdlib -lopenssl"

export  CC=$CC
export  CXX=$CXX
export  CFLAGS=$CFLAGS
export  CXXFLAGS=$CXXFLAGS
export  LDFLAGS=$LDFLAGS

/bin/echo -n "Removing old build..."
rm -rf build
/bin/echo "finished."

/bin/echo -n "Making new build directory..."
mkdir build
/bin/echo "finished."

/bin/echo -n "Changing to build directory..."
cd build
/bin/echo "finished."

/bin/echo "Invoking cmake..."
cmake ../../.. -DCMAKE_TOOLCHAIN_FILE=../toolchain.cmake
/bin/echo "cmake finished."

/bin/echo -n "Returning to original directory..."
cd ..
/bin/echo "finished"