
clear

curdir=$(pwd)

cd /home/dominik/Dokumenty/Projekty/c/build/

rm -f ../output/*

gcc -pthread -O0 -Wall ../source/app.c -o ../output/app.exe -lX11 -lm
gcc -fverbose-asm -S ../source/app.c -o ../output/app.asm

chmod +rwx ../output/app.exe

cd $curdir
