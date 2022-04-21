mkdir ./build
cmake -S . -B ./build/
make -C ./build/
ln -s ./build/sniffer sniffer
