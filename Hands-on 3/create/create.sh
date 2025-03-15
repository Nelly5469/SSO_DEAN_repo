#!/bin/bash
echo "Hello World" > mytext.txt
echo "Se acaba de crear mytext.txt y se le ha escrito"
cat mytext.txt
mkdir backup
echo "Se acaba de crear el subdirectorio backup"
cp mytext.txt backup/
echo "Se acaba de copiar el archivo mytext.txt al subdir backup"
ls backup
rm backup/mytext.txt
echo "Se acaba de eliminar el archivo mytext.txt del subdir backup"
rmdir backup
echo "Se acaba de eliminar el subdir backup"
