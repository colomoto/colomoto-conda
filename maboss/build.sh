

cd engine/src
make install
make MAXNODES=128 install
make MAXNODES=256 install
mv ../pub/MaBoSS* ${PREFIX}/bin
cd ../..
mkdir -p "${PREFIX}/share/MaBoSS"
mv doc tutorial examples ${PREFIX}/share/MaBoSS/
mv tools/* ${PREFIX}/bin

