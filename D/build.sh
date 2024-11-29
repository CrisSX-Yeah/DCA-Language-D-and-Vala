#!/bin/bash

# Directorio raíz del proyecto
PROJECT_ROOT=$(dirname "$0")
SRC_DIR="$PROJECT_ROOT/src"

# Compilar todas las clases y el main con opciones para mensajes de aserción detallados
dmd -debug "$SRC_DIR/main.d" "$SRC_DIR/Shape.d" "$SRC_DIR/Rectangle.d" "$SRC_DIR/RectangleDerived.d" "$SRC_DIR/Circle.d" -of=DbC_Areas_D

# Verificar si la compilación fue exitosa
if [ $? -eq 0 ]; then
    echo "Compilación exitosa. Ejecutando el programa..."
    ./DbC_Areas_D
else
    echo "Error en la compilación."
fi
