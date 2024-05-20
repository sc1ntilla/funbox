
clear

curdir=$(pwd)

cd /home/dominik/Dokumenty/Projekty/asm/build/

rm -f ../output/*

nasm -Wall ../source/app.nasm -o ../output/app.obj -f elf64

ld -e main ../output/app.obj -o ../output/app --dynamic-linker /usr/lib64/ld-linux-x86-64.so.2 /usr/lib/libX11.so.6

chmod +rwx ../output/app

cd $curdir
