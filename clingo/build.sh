
# can't build from source with conda's old gcc
cmake -DCLINGO_REQUIRE_PYTHON=ON .
make

# When building from source: enter the bin output folder
cd bin

# Just copy the clingo binary
cp -p clasp clingo gringo lpconvert reify "$PREFIX/bin"

# depending on build options, also copy the shared library (libclingo.so)
cp -p lib*.so* "$PREFIX/lib"

# add the python module
cp -a python "$PREFIX/lib/python3.6"

