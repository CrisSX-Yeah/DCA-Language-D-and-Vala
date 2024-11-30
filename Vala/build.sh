#!/bin/bash

# Ruta al directorio de código fuente
SRC_DIR="src"

# Nombre del ejecutable
OUTPUT="ProgramaVala"

# Comando para compilar
COMPILE_CMD="valac --enable-experimental-non-null --enable-experimental $SRC_DIR/*.vala -o $OUTPUT"

# Función para compilar el programa
compile() {
    echo "Compilando el programa..."
    if $COMPILE_CMD; then
        echo "Compilación exitosa."
    else
        echo "Error en la compilación." >&2
        exit 1
    fi
}

# Función para ejecutar el programa
run() {
    echo "Ejecutando el programa..."
    if ./$OUTPUT; then
        echo "Ejecución finalizada correctamente."
    else
        echo "Error durante la ejecución." >&2
        exit 1
    fi
}

# Compilar y ejecutar
compile
run
