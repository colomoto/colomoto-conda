
# First build MiniSat
cd ./MiniSat_v1.14
make

# build BNS itself
cd ../src
g++ ../MiniSat_v1.14/Solver.o -I../MiniSat_v1.14 bns.c -o "$PREFIX/bin/bns"
