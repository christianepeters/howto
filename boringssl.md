# Installing BoringSSL

Prerequisites
```
sudo apt update
sudo apt install cmake build-essential golang ninja-build git
```

Clone the BoringSSL Repository:
```
git clone https://boringssl.googlesource.com/boringssl
cd boringssl
```

Build BoringSSL:
```
mkdir build
cd build
cmake -GNinja -B build -DCMAKE_BUILD_TYPE=Release ..
ninja -C build
```

If you're on a machine with memory constraints replace the last step by:
```
ninja -C build -j 4
```
