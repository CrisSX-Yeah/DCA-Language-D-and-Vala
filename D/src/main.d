module src.main; // Declaración correcta del módulo

import std.stdio;
import src.Shape;
import src.Rectangle;
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

    // Prueba de precondiciones fallidas
    try {
        auto invalidRect = new Rectangle(-3, 10);
    } catch (Error e) {
        writeln("Error al crear Rectángulo: ", e.msg);
    }

    try {
        auto invalidCirc = new Circle(-5);
    } catch (Error e) {
        writeln("Error al crear Círculo: ", e.msg);
    }

    // Prueba de método con precondición
    try {
        rect.setDimensions(15, -2);
    } catch (Error e) {
        writeln("Error al actualizar dimensiones del Rectángulo: ", e.msg);
    }

    // Prueba de herencia y redefinición de métodos
    auto derivedRect = new RectangleDerived(4, 8);
    writeln("Área del Rectángulo Derivado: ", derivedRect.area());

    try {
        derivedRect.setDimensions(-4, 8); // Debería fallar precondición
    } catch (Error e) {
        writeln("Error al actualizar dimensiones del Rectángulo Derivado: ", e.msg);
    }
}
