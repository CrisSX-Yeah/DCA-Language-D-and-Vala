module src.Rectangle;

import src.Shape;
import std.exception;

class Rectangle : Shape {
    protected int width;  // Protegido para permitir acceso en clases derivadas
    protected int height;

    // Constructor con precondiciones
    this(int width, int height)
    in (width > 0 && height > 0)
    do {
        this.width = width;
        this.height = height;
        // Postcondición dentro del cuerpo de la función
        assert(this.width > 0 && this.height > 0, "Postcondición: dimensiones establecidas correctamente.");
    }

    // Método para establecer dimensiones con precondiciones
    void setDimensions(int newWidth, int newHeight)
    in (newWidth > 0 && newHeight > 0)
    do {
        this.width = newWidth;
        this.height = newHeight;
        // Postcondición dentro del cuerpo de la función
        assert(this.width > 0 && this.height > 0, "Postcondición: dimensiones actualizadas correctamente.");
    }

    // Implementación del método abstracto
    override public double getArea() {
        return cast(double)(width * height);
    }

    // Invariante de clase
    invariant {
        assert(width > 0 && width <= 1000, "Invariante: width debe ser > 0 y <= 1000.");
        assert(height > 0 && height <= 1000, "Invariante: height debe ser > 0 y <= 1000.");
    }
}
