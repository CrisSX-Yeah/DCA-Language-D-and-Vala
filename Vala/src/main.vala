// src/main.vala

public static int main(string[] args) {
    print("=== Cálculo de Áreas con Diseño por Contrato en Vala ===\n");

    //--------- PRUEBAS REFERENTES A LA CREACIÓN Y MODIFICACIÓN DE OBJETOS VÁLIDOS
    print("--------- PRUEBAS REFERENTES A LA CREACIÓN Y MODIFICACIÓN DE OBJETOS VÁLIDOS\n");

    // Creación de un Rectángulo válido
    print("Crear Rectángulo sin fallos en las precondiciones debería de salir OK.\n");
    var rect = new Rectangle(5, 10);
    print("OK. Área del Rectángulo: %.2f\n", rect.area);

    // Modificación de dimensiones de un Rectángulo válido
    print("El método set_dimensions de la Clase Rectángulo sin fallos en las precondiciones debería de salir OK.\n");
    rect.set_dimensions(15, 15);
    print("OK. Nueva Área del Rectángulo: %.2f\n", rect.area);

    // Creación de un Círculo válido
    print("Crear Círculo sin fallos en las precondiciones debería de salir OK.\n");
    var circ = new Circle(7.0);
    print("OK. Área del Círculo: %.2f\n", circ.area);

    // Modificación de dimensiones de un Círculo válido
    print("El método set_radius de la Clase Circle sin fallos en las precondiciones debería de salir OK.\n");
    circ.set_radius(15.0);
    print("OK. Nueva Área del Círculo: %.2f\n", circ.area);

    //--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES
    print("--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES\n");

    // Prueba de precondiciones fallidas en el constructor de la clase Rectangle
    try {
        print("Crear Rectángulo con fallos en las precondiciones debería de fallar.\n");
        var invalid_rect = new Rectangle(-3, 10);
    } catch (Error e) {
        print("Error al crear Rectángulo: %s\n", e.message);
    }

    // Prueba de precondiciones fallidas en el método set_dimensions de la clase Rectangle
    try {
        print("El método set_dimensions de la Clase Rectángulo con fallos en las precondiciones debería de fallar.\n");
        var valid_rect = new Rectangle(7, 10);
        valid_rect.set_dimensions(6, -4);
    } catch (Error e) {
        print("Error al modificar las dimensiones del Rectángulo: %s\n", e.message);
    }

    // Prueba de precondiciones fallidas en el constructor de la clase Circle
    try {
        print("Crear Círculo con fallos en las precondiciones debería de fallar.\n");
        var invalid_circ = new Circle(-5.0);
    } catch (Error e) {
        print("Error al crear Círculo: %s\n", e.message);
    }

    // Prueba de precondiciones fallidas en el método set_radius de la clase Circle
    try {
        print("El método set_radius de la Clase Circle con fallos en las precondiciones debería de fallar.\n");
        var valid_circ = new Circle(8.0);
        valid_circ.set_radius(0.0);
    } catch (Error e) {
        print("Error al modificar las dimensiones del Círculo: %s\n", e.message);
    }

    //--------- PRUEBAS DE FALLOS EN LAS POSTCONDICIONES
    print("--------- PRUEBAS DE FALLOS EN LAS POSTCONDICIONES\n");

    // Actualizar área de Rectángulo a más de 50000 no provoca que salte la postcondición inválida si no se usa el método get_area_less_than_50000()
    print("\nNo debería de lanzarse la postcondición inválida en Rectángulo puesto que no se está llamando a get_area_less_than_50000().\n");
    rect.set_dimensions(500, 500);
    print("OK. Nueva Área del Rectángulo: %.2f\n", rect.area);

    // Actualizar área de Círculo a más de 50000 no provoca que salte la postcondición inválida si no se usa el método get_area_less_than_50000()
    print("\nNo debería de lanzarse la postcondición inválida en Círculo puesto que no se está llamando a get_area_less_than_50000().\n");
    circ.set_radius(500.0);
    print("OK. Nueva Área del Círculo: %.2f\n", circ.area);

    // Si accedemos al método get_area_less_than_50000() de la clase Rectangle ahora sí salta la postcondición inválida
    try {
        print("Llamar al método get_area_less_than_50000() dentro de la Clase Rectangle con área mayor que 50000 provoca una postcondición inválida.\n");
        rect.get_area_less_than_50000();
    } catch (Error e) {
        print("Error al obtener el área del Rectángulo con el método get_area_less_than_50000(): %s\n", e.message);
    }

    // Si accedemos al método get_area_less_than_50000() de la clase Circle ahora sí salta la postcondición inválida
    try {
        print("Llamar al método get_area_less_than_50000() dentro de la Clase Circle con área mayor que 50000 provoca una postcondición inválida.\n");
        circ.get_area_less_than_50000();
    } catch (Error e) {
        print("Error al obtener el área del Círculo con el método get_area_less_than_50000(): %s\n", e.message);
    }

    //--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES EN CLASES DERIVADAS
    print("--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES EN CLASES DERIVADAS\n");

    // Creación de RectangleDerived válido
    print("Crear Rectángulo Derivado sin fallos en las precondiciones debería de salir OK.\n");
    var derived_rect = new RectangleDerived(4, 8);
    print("OK. Área del Rectángulo Derivado: %.2f\n", derived_rect.area);

    // Prueba de set_dimensions en RectangleDerived con precondiciones fallidas
    try {
        print("Modificar dimensiones en RectangleDerived con fallos en las precondiciones debería de fallar.\n");
        derived_rect.set_dimensions(-4, 8);
    } catch (Error e) {
        print("Error al actualizar dimensiones del Rectángulo Derivado: %s\n", e.message);
    }

    // Prueba de move en Rectangle (sin precondiciones adicionales)
    print("Mover Rectángulo sin precondiciones adicionales debería de dar OK:\n");
    rect.move(15, 15);
    print("OK.\n");

    // Prueba de move en RectangleDerived con precondiciones adicionales
    print("Mover RectangleDerived con parámetros válidos debería de dar OK:\n");
    derived_rect.move(5, 5);
    print("OK.\n");

    print("Moviendo RectangleDerived debería de fallar al no cumplir con las precondiciones adicionales:\n");
    try {
        derived_rect.move(150, 150); // Debería fallar precondición
    } catch (Error e) {
        print("Error al mover RectangleDerived: %s\n", e.message);
    }

    return 0;
}
