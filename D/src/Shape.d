module src.Shape; // Declaración correcta del módulo

abstract class Shape {
    // Constructor
    this() { }

    // Método abstracto para calcular el área
    public abstract double getArea();

    // Propiedad para obtener el área
    public double area() {
        return getArea();
    }

    // Invariante de clase (vacío en clase abstracta)
    invariant {
        // No hay invariantes en la clase base
    }
}
