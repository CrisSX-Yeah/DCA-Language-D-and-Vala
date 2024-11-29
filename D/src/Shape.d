module src.Shape;

import std.stdio; // Para usar writeln en el método move

abstract class Shape {
    // Constructor
    this() { }

    // Método abstracto para calcular el área
    public abstract double getArea();

    public abstract double getAreaLessThan50000();

    // Propiedad para obtener el área
    public double area() {
        return getArea();
    }

    public double areaLessThan50000() 
    out (result; result >= 0 && result <= 5000, "Postcondición: El área debe estar entre 0 y 5000.") {
        return getAreaLessThan50000();
    }

    // Método move con precondiciones
    public void move(int deltaX, int deltaY)
    in (deltaX != 0 || deltaY != 0) { // Precondición
        writeln("Shape moved by (", deltaX, ", ", deltaY, ")");
    }

    // Invariante de clase (vacío en clase abstracta)
    invariant {
        // No hay invariantes en la clase base
    }
}
