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
    writeln("Crear Rectángulo sin fallos en las precondiciones debería de salir OK.");
    auto rect = new Rectangle(5, 10);
    writeln("OK. Área del Rectángulo: ", rect.area());

    // Modificación de dimensiones de un Rectángulo válido
    writeln("El método setDimensions de la Clase Rectángulo sin fallos en las precondiciones debería de salir OK.");
    rect.setDimensions(15, 15);
    writeln("OK. Nueva Área del Rectángulo: ", rect.area());

    // Creación de un Círculo válido
    writeln("Crear Círculo sin fallos en las precondiciones debería de salir OK.");
    auto circ = new Circle(7);
    writeln("OK. Área del Círculo: ", circ.area());

    // Modificación de dimensiones de un Círculo válido
    writeln("El método setRadius de la Clase Circle sin fallos en las precondiciones debería de salir OK.");
    circ.setRadius(15);
    writeln("OK. Nueva Área del Círculo: ", circ.area());

    // Prueba de precondiciones fallidas en el constructor de la clase Rectangle
    try {
        writeln("Crear Rectángulo con fallos en las precondiciones debería de fallar.");
        auto invalidRect = new Rectangle(-3, 10);
    } catch (Throwable e) { // Capturar Throwable para mensajes detallados
        writeln("Error al crear Rectángulo: ", e.toString());
    }

    // Prueba de precondiciones fallidas en el método setDimensions de la clase Rectangle
    try {
    writeln("El método setDimensions de la Clase Rectángulo con fallos en las precondiciones debería de fallar.");
        auto validRect = new Rectangle(7, 10);
        validRect.setDimensions(6,-4);
    } catch (Throwable e) { // Capturar Throwable para mensajes detallados
        writeln("Error al modificar las dimensiones del Rectángulo: ", e.toString());
    }

    // Prueba de precondiciones fallidas en el constructor de la clase Circle
    try {
        writeln("Crear Círculo con fallos en las precondiciones debería de fallar.");
        auto invalidCirc = new Circle(-5);
    } catch (Throwable e) {
        writeln("Error al crear Círculo: ", e.toString());
    }

    // Prueba de precondiciones fallidas en el método setRadius de la clase Circle
    try {
    writeln("El método setDimensions de la Clase Circle con fallos en las precondiciones debería de fallar.");
        auto validCirc = new Circle(8);
        validCirc.setRadius(0);
    } catch (Throwable e) { // Capturar Throwable para mensajes detallados
        writeln("Error al modificar las dimensiones del Círculo: ", e.toString());
    }

    // Fallo por invariante en la clase Rectangle a través del constructor
    try {
        writeln("\nPrueba de invariante en Rectangle estableciendo dimensiones inválidas (width=1001, height=1001).");
        auto rectInvalid = new Rectangle(1001, 1001); // Debería fallar invariante
    } catch (Throwable e) {
        writeln("Error por invariante en Rectangle: ", e.toString());
    }

    // Fallo por invariante en la clase Rectangle a través del método setDimensions
    try {
        writeln("\nPrueba de invariante en Rectangle estableciendo dimensiones inválidas mediante setDimensions (width=1001, height=1001).");
        rect.setDimensions(1001, 1001); // Debería fallar invariante
    } catch (Throwable e) {
        writeln("Error por invariante en Rectangle: ", e.toString());
    }

    // Fallo por invariante en la clase Circle a través del constructor
    try {
        writeln("\nPrueba de invariante en Circle estableciendo radio inválido (radius=1001.0).");
        auto circInvalid = new Circle(1001.0); // Debería fallar invariante
    } catch (Throwable e) {
        writeln("Error por invariante en Circle: ", e.toString());
    }

    // Fallo por invariante en la clase Circle a través del método setRadius
    try {
        writeln("\nPrueba de invariante en Circle estableciendo radio inválido mediante setRadius (radius=1001.0).");
        circ.setRadius(1001.0); // Debería fallar invariante
    } catch (Throwable e) {
        writeln("Error por invariante en Circle: ", e.toString());
    }

    // Creación de RectangleDerived válido
    writeln("Crear Rectángulo Derivado sin fallos en las precondiciones debería de salir OK.");
    auto derivedRect = new RectangleDerived(4, 8);
    writeln("OK. Área del Rectángulo Derivado: ", derivedRect.area());

    // Prueba de setDimensions en RectangleDerived con precondiciones fallidas
    try {
        writeln("Crear Rectángulo Derivado con fallos en las precondiciones debería de fallar.");
        derivedRect.setDimensions(-4, 8); // Debería fallar precondición
    } catch (Throwable e) {
        writeln("Error al actualizar dimensiones del Rectángulo Derivado: ", e.toString());
    }

    // Prueba de move en Rectangle (sin precondiciones adicionales)
    writeln("Mover Rectángulo sin precondiciones adicionales debería de dar OK:");
    rect.move(15, 15); // Debería pasar
    writeln("OK.");

    // Prueba de move en RectangleDerived con precondiciones adicionales
    writeln("MovER RectangleDerived con parámetros válidos debería de dar OK:");
    derivedRect.move(5, 5); // Debería pasar
    writeln("OK.");

    writeln("Moviendo RectangleDerived con parámetros inválidos debería de dar error:");
    try {
        derivedRect.move(15, 15); // Debería fallar precondición
    } catch (Throwable e) {
        writeln("Error al mover RectangleDerived: ", e.toString());
    }
}
