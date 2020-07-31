
cd NuSMV-2.6.0/NuSMV/
mkdir build
cd build

cmake -DBUILD_TESTS=OFF .. -Wno-dev
make
mkdir -p "$PREFIX/bin"

# Rename the binary for use side-by-side with the regular NuSMV
# ltl2smv is part of the regular NuSMV package
cp -a bin/NuSMV "$PREFIX/bin/NuSMV-a"

