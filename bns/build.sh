set -x

mkdir -p "${PREFIX}"/bin

if [[ "$OSTYPE" == darwin* && "$(uname -m)" == "x86_64" ]]; then
    cp -v Pre-compiled*/Mac/bns "${PREFIX}/bin/"
    chmod +x "${PREFIX}/bin/bns"
    exit $?
fi

# First build MiniSat
cd ./MiniSat_v1.14

make CXX="$CXX -std=c++03" CFLAGS="$CFLAGS" Solver.o

# build BNS itself
cd ../src

$CXX ../MiniSat_v1.14/Solver.o -I../MiniSat_v1.14 bns.c -o "$PREFIX/bin/bns"
