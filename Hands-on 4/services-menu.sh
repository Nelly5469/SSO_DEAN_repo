#!/bin/bash

listar_contenido() {
    read -p "Ingrese la ruta absoluta del directorio: " ruta
    if [[ "$ruta" == /* ]]; then # Verifica si la ruta es absoluta
        if [ -d "$ruta" ]; then
            echo "Contenido de $ruta:"
            ls -l "$ruta"
        else
            echo "La ruta especificada no es un directorio válido."
        fi
    else
        echo "Ingrese una ruta absoluta válida (debe de empezar con /)"
    fi
}

crear_archivo() {
    read -p "Ingrese la cadena de texto a almacenar en el archivo: " texto
    read -p "Ingrese el nombre del archivo sin la extensión (ej: ingrese 'hola' para 'hola.txt'): " nombre_archivo
    nombre_archivo="${nombre_archivo}.txt"
    echo "$texto" > "$nombre_archivo"
    echo "Se ha creado el archivo $nombre_archivo con el texto proporcionado."
}

comparar_archivos() {
    read -p "Ingrese la ruta del primer archivo: " archivo1
    read -p "Ingrese la ruta del segundo archivo: " archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
        if [ $? -eq 0 ]; then
            echo "Los archivos son idénticos."
        else
            echo "Los archivos son diferentes."
        fi
    else
        echo "Uno o ambos archivos no son válidos."
    fi
}

uso_awk() {
    man -f awk
    echo "Ejemplo de uso de awk para imprimir la última columna de un archivo:"
    echo "awk '{print \$NF}' nombre_archivo"
    read -p "Ingrese el nombre del archivo: " nombre_archivo
    awk '{print $NF}' "$nombre_archivo"
}

uso_grep() {
    man -f grep
    echo "Ejemplo de uso de grep para buscar recursivamente un patrón en un directorio:"
    echo "grep -iR 'patron' 'directorio'"
    read -p "Ingrese el patron a buscar: " patron
    read -p "Ingrese el directorio: " directorio
    grep -iR "$patron" "$directorio"
}

while true; do
    echo "Seleccione una opción:"
    echo "1. Listar el contenido de un directorio"
    echo "2. Crear un archivo de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso de awk"
    echo "5. Mostrar uso de grep"
    echo "6. Salir"
    read -p "Opción: " opcion

    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) uso_awk ;;
        5) uso_grep ;;
        6) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción no válida. Intente de nuevo." ;;
    esac
    echo ""
done
