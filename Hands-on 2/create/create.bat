@ECHO OFF
TITLE create_batchscripting_DEAN
ECHO Hello World > mytext.txt
ECHO Se acaba de crear mytext.txt y se le ha escrito
TYPE mytext.txt
MKDIR backup
ECHO Se acaba de crear el subdirectorio backup
COPY mytext.txt .\backup\
ECHO Se acaba de copiar el archivo mytext.txt al subdir backup
DIR backup
DEL .\backup\mytext.txt
ECHO Se acaba de eliminar el archivo mytext.txt del subdir backup
RMDIR .\backup
ECHO Se acaba de eliminar el subdir backup