set -x

mkdir -p "${PREFIX}"/bin

if [[ "$OSTYPE" == darwin* && "$(uname -m)" == "x86_64" ]]; then
    ls -l /Applications
    sudo xcode-select -s /Applications/Xcode_14.3.1.app
    ls -l /Applications
fi

CXX=${CXX:-g++}
echo $CXX
which $CXX
$CXX -E -v

# First build MiniSat
cd ./MiniSat_v1.14

make CXX="$CXX -std=c++03" CFLAGS="$CFLAGS" Solver.o

# build BNS itself
cd ../src

$CXX ../MiniSat_v1.14/Solver.o -I../MiniSat_v1.14 bns.c -o "$PREFIX/bin/bns"
