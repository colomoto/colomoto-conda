
cd NuSMV-2.6.0/NuSMV/
mkdir build
cd build

cmake -DBUILD_TESTS=OFF .. -Wno-dev
make
cp -a bin "$PREFIX"

# TODO: rename the binary?

