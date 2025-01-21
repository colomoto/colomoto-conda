set -x

mkdir -p "${PREFIX}"/bin

env
ls -l /usr/bin
CXX=${CXX:-g++-14}
echo $CXX
which $CXX
$CXX -E -v
which ld
ld -v

# First build MiniSat
cd ./MiniSat_v1.14


make CXX="$CXX -std=c++03" CFLAGS="$CFLAGS" Solver.o

# build BNS itself
cd ../src

$CXX ../MiniSat_v1.14/Solver.o -I../MiniSat_v1.14 bns.c -o "$PREFIX/bin/bns"
