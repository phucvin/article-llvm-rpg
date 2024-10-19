clang -emit-llvm -S hello.c -o hello.ll

lli hello.ll

llc hello.ll

clang -x ir hello.ll -o hello.out

https://dassur.ma/things/c-to-webassembly/

clang -emit-llvm -S hello.c -o add_nowasm.ll

clang --target=wasm32 -emit-llvm -S add.c -o add_wasm.ll

llc -march=wasm32 -filetype=obj add_wasm.ll

/usr/lib/llvm-10/bin/wasm-ld --no-entry --export-all -o add.wasm add_wasm.o

export PATH=$PATH:/usr/lib/llvm-10/bin

clang --target=wasm32 -nostdlib -Wl,--no-entry -Wl,--export-all -o add.wasm -O3 -flto -Wl,--lto-O3 add.c

cd ..

sudo apt-get install llvm-11-dev libantlr4-runtime-dev

cmake .

make -j2

./rpg rpgle/CALCFIB.rpgle > rpgle/calcfib.ll

clang -x ir rpgle/calcfib.ll -o rpgle/calcfib

rpgle/calcfib
