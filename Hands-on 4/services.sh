#!/bin/bash

# Función para listar el contenido de un directorio
listar_contenido() {
    read -p "Ingrese la ruta absoluta del directorio: " ruta
    if [ -d "$ruta" ]; then
        echo "Contenido de $ruta:"
        ls -l "$ruta"
    else
        echo "La ruta especificada no es un directorio válido."
    fi
}

# Función para crear un archivo de texto
crear_archivo() {
    read -p "Ingrese la cadena de texto a almacenar en el archivo: " texto
    read -p "Ingrese el nombre del archivo (con extensión .txt): " nombre_archivo
    echo "$texto" > "$nombre_archivo"
    echo "Se ha creado el archivo $nombre_archivo con el texto proporcionado."
}

# Función para comparar dos archivos de texto
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

# Función para mostrar uso de awk
uso_awk() {
    echo "Ejemplo de uso de awk:"
    echo "Para imprimir la primera columna de un archivo, use:"
    echo "awk '{print \$1}' nombre_archivo"
}

# Función para mostrar uso de grep
uso_grep() {
    echo "Ejemplo de uso de grep:"
    echo "Para buscar una cadena en un archivo, use:"
    echo "grep 'cadena' nombre_archivo"
}

# Menú principal
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