find src/ | grep ".asm" | awk '{ print $1" -f elf64" }' | xargs -L1 nasm 
gcc $(find src/ | grep "\.o") -o server -no-pie -nostdlib
find src/ | grep "\.o" | xargs -L1 rm 
