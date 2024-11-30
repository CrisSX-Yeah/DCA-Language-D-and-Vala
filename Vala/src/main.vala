public static int main(string[] args) {
    print("=== Calculo de Areas con Diseno por Contrato en Vala ===\n");

    //--------- PRUEBAS REFERENTES A LA CREACION Y MODIFICACION DE OBJETOS VALIDOS
    print("--------- PRUEBAS REFERENTES A LA CREACION Y MODIFICACION DE OBJETOS VALIDOS\n");

    // Creacion de un Rectangulo valido
    print("Crear Rectangulo sin fallos en las precondiciones deberia de salir OK.\n");
    var rect = new Rectangle(5, 10);
    print("OK. Area del Rectangulo: %.2f\n", rect.area);

    // Modificacion de dimensiones de un Rectangulo valido
    print("El metodo set_dimensions de la Clase Rectangulo sin fallos en las precondiciones deberia de salir OK.\n");
    rect.set_dimensions(15, 15);
    print("OK. Nueva Area del Rectangulo: %.2f\n", rect.area);

    // Creacion de un Circulo valido
    print("Crear Circulo sin fallos en las precondiciones deberia de salir OK.\n");
    var circ = new Circle(7.0);
    print("OK. Area del Circulo: %.2f\n", circ.area);

    // Modificacion de dimensiones de un Circulo valido
    print("El metodo set_radius de la Clase Circle sin fallos en las precondiciones deberia de salir OK.\n");
    circ.set_radius(15.0);
    print("OK. Nueva Area del Circulo: %.2f\n", circ.area);

    //--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES
    print("--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES\n");

    // Prueba de precondiciones fallidas en el constructor de la clase Rectangle
    print("Crear Rectangulo con fallos en las precondiciones deberia de fallar.\n");
    var invalid_rect = new Rectangle(-3, 10);

    // Prueba de precondiciones fallidas en el metodo set_dimensions de la clase Rectangle
    print("El metodo set_dimensions de la Clase Rectangulo con fallos en las precondiciones deberia de fallar.\n");
    var valid_rect = new Rectangle(7, 10);
    valid_rect.set_dimensions(6, -4);

    // Prueba de precondiciones fallidas en el constructor de la clase Circle
    print("Crear Circulo con fallos en las precondiciones deberia de fallar.\n");
    var invalid_circ = new Circle(-5.0);

    // Prueba de precondiciones fallidas en el metodo set_radius de la clase Circle
    print("El metodo set_radius de la Clase Circle con fallos en las precondiciones deberia de fallar.\n");
    var valid_circ = new Circle(8.0);
    valid_circ.set_radius(0.0);


    //--------- PRUEBAS DE FALLOS EN LAS POSTCONDICIONES
    print("--------- PRUEBAS DE FALLOS EN LAS POSTCONDICIONES\n");

    print("No deberia de lanzarse la postcondicion invalida en Rectangulo.\n");
    rect.set_dimensions(500, 500);
    print("OK. Nueva Area del Rectangulo: %.2f\n", rect.area);

    print("No deberia de lanzarse la postcondicion invalida en Circulo.\n");
    circ.set_radius(500.0);
    print("OK. Nueva Area del Circulo: %.2f\n", circ.area);

    print("Llamar al metodo get_area_less_than_50000() en Rectangulo deberia fallar.\n");
    rect.calculate_area_below_50000();

    
    print("Llamar al metodo get_area_less_than_50000() en Circulo deberia fallar.\n");
    circ.calculate_area_below_50000();


    //--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES EN CLASES DERIVADAS
    print("--------- PRUEBAS DE FALLOS EN LAS PRECONDICIONES EN CLASES DERIVADAS\n");

    print("Crear Rectangulo Derivado sin fallos en las precondiciones deberia de salir OK.\n");
    var derived_rect = new RectangleDerived(4, 8);
    print("OK. Area del Rectangulo Derivado: %.2f\n", derived_rect.area);

    print("Modificar dimensiones en RectangleDerived con fallos en las precondiciones deberia de fallar.\n");
    derived_rect.set_dimensions(-4, 8);

    print("Mover RectangleDerived con parametros validos deberia de salir OK.\n");
    derived_rect.move(5, 5);
    print("OK.\n");

    print("Mover RectangleDerived con parametros invalidos deberia fallar.\n");
    derived_rect.move(150, 150);

    return 0;
}
