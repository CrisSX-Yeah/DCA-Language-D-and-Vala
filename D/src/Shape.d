module src.Shape;

import std.stdio; // Para usar writeln en el método move

abstract class Shape {
    // Constructor
    this() { }

    // Método abstracto para calcular el área
    public abstract double getArea();

    // Propiedad para obtener el área
    public double area() {
        return getArea();
    }

    // Método move con precondiciones
    public void move(int deltaX, int deltaY)
    in (deltaX != 0 || deltaY != 0)
    do {
        // Implementación base: simplemente imprime el movimiento
        writeln("Shape moved by (", deltaX, ", ", deltaY, ")");
    }

    // Invariante de clase (vacío en clase abstracta)
    invariant {
        // No hay invariantes en la clase base
    }
}
