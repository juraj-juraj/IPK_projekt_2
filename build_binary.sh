#Script which builds binary
mkdir ./build
cmake -S . -B ./build/
make -C ./build/
ln -s ./build/ipk-sniffer ipk-sniffer
