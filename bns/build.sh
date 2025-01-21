set -x

mkdir -p "${PREFIX}"/bin

env
echo $CXX
which $CXX
$CXX --version

# First build MiniSat
cd ./MiniSat_v1.14
make CXX="$CXX -std=c++03"

# build BNS itself
cd ../src

$CXX ../MiniSat_v1.14/Solver.o -I../MiniSat_v1.14 bns.c -o "$PREFIX/bin/bns"
