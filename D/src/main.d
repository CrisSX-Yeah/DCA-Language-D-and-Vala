module src.main;

import std.stdio;
import src.Shape;
import src.Rectangle;
import src.RectangleDerived;
import src.Circle;
import std.exception;

void main() {
    writeln("=== Cálculo de Áreas con Diseño por Contrato en D ===");

    // Creación de un Rectángulo válido
    auto rect = new Rectangle(5, 10);
    writeln("Área del Rectángulo: ", rect.area());

    // Creación de un Círculo válido
    auto circ = new Circle(7);
    writeln("Área del Círculo: ", circ.area());

    // Prueba de precondiciones fallidas en constructor
    try {
        auto invalidRect = new Rectangle(-3, 10);
    } catch (Throwable e) { // Capturar Throwable para mensajes detallados
        writeln("Error al crear Rectángulo: ", e.toString());
    }

    try {
        auto invalidCirc = new Circle(-5);
    } catch (Throwable e) {
        writeln("Error al crear Círculo: ", e.toString());
    }

    // Prueba de método setDimensions con precondiciones fallidas
    try {
        rect.setDimensions(15, -2);
    } catch (Throwable e) {
        writeln("Error al actualizar dimensiones del Rectángulo: ", e.toString());
    }

    // Creación de RectangleDerived válido
    auto derivedRect = new RectangleDerived(4, 8);
    writeln("Área del Rectángulo Derivado: ", derivedRect.area());

    // Prueba de setDimensions en RectangleDerived con precondiciones fallidas
    try {
        derivedRect.setDimensions(-4, 8); // Debería fallar precondición
    } catch (Throwable e) {
        writeln("Error al actualizar dimensiones del Rectángulo Derivado: ", e.toString());
    }

    // Prueba de move en Rectangle (sin precondiciones)
    writeln("Moviendo Rectángulo sin precondiciones:");
    rect.move(5, 5); // Debería pasar

    // Prueba de move en RectangleDerived con precondiciones
    writeln("Moviendo RectangleDerived con parámetros válidos:");
    derivedRect.move(5, 5); // Debería pasar

    writeln("Moviendo RectangleDerived con parámetros inválidos:");
    try {
        derivedRect.move(15, 15); // Debería fallar precondición
    } catch (Throwable e) {
        writeln("Error al mover RectangleDerived: ", e.toString());
    }
}
