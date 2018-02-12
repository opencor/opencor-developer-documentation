#!/bin/sh

if [ "`hash ninja 2>&1`" = "" ]; then
    ninjaFound=true
    generator="Ninja"
    cmakeGenerator="Ninja"
else
    ninjaFound=false
    generator="Make"
    cmakeGenerator="Unix Makefiles"
fi

echo "\033[44;37;1mMaking the developer documentation for OpenCOR (using $generator)...\033[0m"

cd build

cmake -G "$cmakeGenerator" ..

exitCode=$?

if [ $exitCode -ne 0 ]; then
    cd ..

    exit $exitCode
fi

shift

if [ $ninjaFound = true ]; then
    ninja $@
else
    make $@
fi

exitCode=$?

cd ..

if [ $exitCode -eq 0 ]; then
    echo "\033[42;37;1mAll done!\033[0m"
fi

exit $exitCode
