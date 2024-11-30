module src.main;

import std.stdio;
import src.Shape;
import src.Rectangle;
import src.RectangleDerived;
import src.Circle;
import std.exception;

void main() {
    writeln("=== Cálculo de Áreas con Diseño por Contrato en D ===");


    //--------- PRUEBAS REFERENTES A LA CREACIÓN Y MODIFICACIÓN DE OBJETOS VÁLIDOS (NO SE VIOLA NINGUNA PRECONDICIÓN NI POSTCONDICIÓN NI INVARIANTES)
    writeln("--------- PRUEBAS REFERENTES A LA CREACIÓN Y MODIFICACIÓN DE OBJETOS VÁLIDOS (NO SE VIOLA NINGUNA PRECONDICIÓN NI POSTCONDICIÓN NI INVARIANTES)");


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


    //--------- PRUEBAS REFERENTES A COMPROBAR QUÉ OCURRE CUANDO HAY FALLOS EN LAS PRECONDICIONES
    writeln("--------- PRUEBAS REFERENTES A COMPROBAR QUÉ OCURRE CUANDO HAY FALLOS EN LAS PRECONDICIONES");

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


    //--------- PRUEBAS REFERENTES A COMPROBAR QUÉ OCURRE CUANDO HAY FALLOS EN LAS POSTCONDICIONES
    writeln("--------- PRUEBAS REFERENTES A COMPROBAR QUÉ OCURRE CUANDO HAY FALLOS EN LAS POSTCONDICIONES");


    // Actualizar área de Rectángulo a más de 50000 no provoca que salte la postcondición inválida si no se usa el método getAreaLessThan50000()
    writeln("\nNo debería de lanzarse la postcondición inválida en Rectángulo puesto que no se está llamando a getAreaLessThan50000().");
    rect.setDimensions(500,500);
    writeln("OK. Nueva Área del Rectángulo: ", rect.area());

    // Actualizar área de Rectángulo a más de 50000 no provoca que salte la postcondición inválida si no se usa el método getAreaLessThan50000()
    writeln("\nNo debería de lanzarse la postcondición inválida en Círculo puesto que no se está llamando a getAreaLessThan50000().");
    circ.setRadius(500);
    writeln("OK. Nueva Área del Círculo: ", circ.area());

    //Si accedemos al método getAreaLessThan50000() de la clase Rectangle ahora sí salta la postcondición inválida
    try {
        writeln("Llamar al método getAreaLessThan50000() dentro de la Clase Rectangle con área mayor que 50000 provoca una postcondición inválida.");
        rect.getAreaLessThan50000();
    } catch (Throwable e) { // Capturar Throwable para mensajes detallados
        writeln("Error al obtener el área del Rectangulo con el método getAreaLessThan50000(): ", e.toString());
    }

    //Si accedemos al método getAreaLessThan50000() de la clase Circle ahora sí salta la postcondición inválida
    try {
        writeln("Llamar al método getAreaLessThan50000() dentro de la Clase Circle con área mayor que 50000 provoca una postcondición inválida.");
        circ.getAreaLessThan50000();
    } catch (Throwable e) { // Capturar Throwable para mensajes detallados
        writeln("Error al obtener el área del Círculo con el método getAreaLessThan50000(): ", e.toString());
    }


    //--------- PRUEBAS REFERENTES A COMPROBAR QUÉ OCURRE CUANDO HAY FALLOS EN LAS INVARIANTES
    writeln("--------- PRUEBAS REFERENTES A COMPROBAR QUÉ OCURRE CUANDO HAY FALLOS EN LAS INVARIANTES");


    // Fallo por invariante en la clase Rectangle a través del método setDimensions
    try {
        writeln("\nPrueba de invariante en Rectangle estableciendo dimensiones inválidas mediante setDimensions (width=1001, height=1001).");
        rect.setDimensions(1001, 1001); // Debería fallar invariante
    } catch (Throwable e) {
        writeln("Error por invariante en Rectangle: ", e.toString());
    }

    // Fallo por invariante en la clase Circle a través del método setRadius
    try {
        writeln("\nPrueba de invariante en Circle estableciendo radio inválido mediante setRadius (radius=1001.0).");
        circ.setRadius(1001.0); // Debería fallar invariante
    } catch (Throwable e) {
        writeln("Error por invariante en Circle: ", e.toString());
    }

    // La instancia de Rectangle queda invalidada debido a haberse incumplido la invariante. El objeto no puede ejecutar ningún método público.
    try {
        writeln("\nTras quedar invalidado, el objeto de la clase Rectangle no puede lanzar ningún método público ya que las invariantes se verifican antes y después de cada método público.");
        rect.setDimensions(2, 4); 
    } catch (Throwable e) {
        writeln("Error por invariante en Rectangle: ", e.toString());
    }

    // La instancia de Circle queda invalidada debido a haberse incumplido la invariante. El objeto no puede ejecutar ningún método público.
    try {
        writeln("\nTras quedar invalidado, el objeto de la clase Circle no puede lanzar ningún método público ya que las invariantes se verifican antes y después de cada método público.");
        circ.setRadius(4); 
    } catch (Throwable e) {
        writeln("Error por invariante en Circle: ", e.toString());
    }


    //--------- PRUEBAS REFERENTES A COMPROBAR QUÉ OCURRE CUANDO UNA CLASE BASE NO TIENE PRECONDICIONES Y CUANDO REDEFINIMOS UNA CLASE DERIVADA SE LAS AÑADIMOS A ESTA CLASE DERIVADA
    writeln("--------- PRUEBAS REFERENTES A COMPROBAR QUÉ OCURRE CUANDO UNA CLASE BASE NO TIENE PRECONDICIONES Y CUANDO REDEFINIMOS UNA CLASE DERIVADA SE LAS AÑADIMOS A ESTA CLASE DERIVADA");


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

    // Prueba de move en RectangleDerived con precondiciones adicionales con respecto a la clase padre válidas
    writeln("Mover RectangleDerived con parámetros válidos debería de dar OK:");
    derivedRect.move(5, 5); 
    writeln("OK.");

    // Prueba de move en RectangleDerived con precondiciones adicionales con respecto a la clase padre inválidas
    writeln("Moviendo RectangleDerived debería de ignorar las restricciones más estrictas para no incumplir el principio de Sustitución de Liskov:");
    derivedRect.move(150, 150);
    writeln("OK. Las precondiciones extras se ignoran debido a que están añadiendo restricciones más estrictas que las establecidad en la clase padre. Así se evita incumplir el principio de sustitución de Liskov. ");
    
}
