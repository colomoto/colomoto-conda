set -x

mkdir -p "${PREFIX}"/bin

CXX=${CXX:-g++}
echo $CXX
which $CXX
$CXX -E -v

# First build MiniSat
cd ./MiniSat_v1.14

make CXX="$CXX -std=c++03" CFLAGS="$CFLAGS" Solver.o

# build BNS itself
cd ../src

$CXX -std=c++03 ../MiniSat_v1.14/Solver.o -I../MiniSat_v1.14 bns.c -o "$PREFIX/bin/bns"
ldd "$PREFIX/bin/bns"
