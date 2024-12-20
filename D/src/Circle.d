module src.Circle;

import src.Shape;
import std.exception;
import std.math;

class Circle : Shape {
    private double radius;

    // Constructor con precondiciones y postcondiciones
    this(double radius)
    in (radius > 0)
    out (; this.radius > 0, "Postcondición: radius establecido correctamente.") {
        this.radius = radius;
    }

    // Método para establecer el radio con precondiciones y postcondiciones
    void setRadius(double newRadius)
    in (newRadius > 0)
    out (; this.radius == newRadius, "Postcondición: radius actualizado correctamente.") {
        this.radius = newRadius;
    }

    // Implementación del método abstracto
    override public double getArea() {
        return PI * radius * radius;
    }

    override public double getAreaLessThan50000()
    out (result; result >= 0 && result <= 50000, "Postcondición: El área debe estar entre 0 y 50000.")  {
         return PI * radius * radius;
    }

    // Invariante de clase
    invariant {
        assert(radius > 0 && radius <= 1000.0, "Invariante: radius debe ser > 0 y <= 1000.0.");
    }
}
