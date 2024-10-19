clang -emit-llvm -S hello.c -o hello.ll

lli hello.ll

llc hello.ll

clang -x ir hello.ll -o hello.out