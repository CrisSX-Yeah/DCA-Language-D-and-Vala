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
    print("Crear Rectángulo con fallos en las precondiciones debería de fallar.\n");
    try {
        var invalid_rect = new Rectangle(-3, 10);
    } catch (Error e) {
        print("Error al crear Rectángulo: %s\n", e.message);
    }

    // Prueba de precondiciones fallidas en el método set_dimensions de la clase Rectangle
    print("El método set_dimensions de la Clase Rectángulo con fallos en las precondiciones debería de fallar.\n");
    try {
        var valid_rect = new Rectangle(7, 10);
        valid_rect.set_dimensions(6, -4);
        print("No se esperaba esta línea.\n");
    } catch (Error e) {
        print("Error al modificar las dimensiones del Rectángulo: %s\n", e.message);
    }

    // Prueba de precondiciones fallidas en el constructor de la clase Circle
    print("Crear Círculo con fallos en las precondiciones debería de fallar.\n");
    try {
        var invalid_circ = new Circle(-5.0);
        print("No se esperaba esta línea.\n");
    } catch (Error e) {
        print("Error al crear Círculo: %s\n", e.message);
    }

    // Prueba de precondiciones fallidas en el método set_radius de la clase Circle
    print("El método set_radius de la Clase Circle con fallos en las precondiciones debería de fallar.\n");
    try {
        var valid_circ = new Circle(8.0);
        valid_circ.set_radius(0.0);
        print("No se esperaba esta línea.\n");
    } catch (Error e) {
        print("Error al modificar las dimensiones del Círculo: %s\n", e.message);
    }

    //--------- PRUEBAS DE FALLOS EN LAS POSTCONDICIONES
    print("--------- PRUEBAS DE FALLOS EN LAS POSTCONDICIONES\n");

    print("No debería de lanzarse la postcondición inválida en Rectángulo.\n");
    rect.set_dimensions(500, 500);
    print("OK. Nueva Área del Rectángulo: %.2f\n", rect.area);

    print("No debería de lanzarse la postcondición inválida en Círculo.\n");
    circ.set_radius(500.0);
    print("OK. Nueva Área del Círculo: %.2f\n", circ.area);

    print("Llamar al método get_area_less_than_50000() en Rectángulo debería fallar.\n");
    try {
        rect.calculate_area_below_50000();
        print("No se esperaba esta línea.\n");
    } catch (Error e) {
        print("Error al calcular área en Rectángulo: %s\n", e.message);
    }

    print("Llamar al método get_area_less_than_50000() en Círculo debería fallar.\n");
    try {
        circ.calculate_area_below_50000();
        print("No se esperaba esta línea.\n");
    } catch (Error e) {
        print("Error al calcular área en Círculo: %s\n", e.message);
    }

    //--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES EN CLASES DERIVADAS
    print("--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES EN CLASES DERIVADAS\n");

    print("Crear Rectángulo Derivado sin fallos en las precondiciones debería de salir OK.\n");
    var derived_rect = new RectangleDerived(4, 8);
    print("OK. Área del Rectángulo Derivado: %.2f\n", derived_rect.area);

    print("Modificar dimensiones en RectangleDerived con fallos en las precondiciones debería de fallar.\n");
    try {
        derived_rect.set_dimensions(-4, 8);
        print("No se esperaba esta línea.\n");
    } catch (Error e) {
        print("Error al actualizar dimensiones del Rectángulo Derivado: %s\n", e.message);
    }

    print("Mover RectangleDerived con parámetros válidos debería de salir OK.\n");
    derived_rect.move(5, 5);
    print("OK.\n");

    print("Mover RectangleDerived con parámetros inválidos debería fallar.\n");
    try {
        derived_rect.move(150, 150);
        print("No se esperaba esta línea.\n");
    } catch (Error e) {
        print("Error al mover RectangleDerived: %s\n", e.message);
    }

    return 0;
}
