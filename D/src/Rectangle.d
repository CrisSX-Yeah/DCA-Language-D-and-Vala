module src.Rectangle;

import src.Shape;
import std.exception;

class Rectangle : Shape {
    protected int width;  // Protegido para permitir acceso en clases derivadas
    protected int height;

    // Constructor con precondiciones y postcondiciones
    this(int width, int height)
    in (width > 0 && height > 0)
    out (; this.width > 0 && this.height > 0, "Postcondición: dimensiones establecidas correctamente.") {
        this.width = width;
        this.height = height;
    }

    // Método para establecer dimensiones con precondiciones y postcondiciones
    void setDimensions(int newWidth, int newHeight)
    in (newWidth > 0 && newHeight > 0)
    out (; this.width == newWidth && this.height == newHeight, "Postcondición: dimensiones actualizadas correctamente.") {
        this.width = newWidth;
        this.height = newHeight;
    }

    // Implementación del método abstracto
    override public double getArea() {
        return cast(double)(width * height);
    }

    override public double getAreaLessThan50000()
    out (result; result >= 0 && result <= 50000, "Postcondición: El área debe estar entre 0 y 50000.")  {
        return cast(double)(width * height);
    }

    // Invariante de clase
    invariant {
        assert(width > 0 && width <= 1000, "Invariante: width debe ser > 0 y <= 1000.");
        assert(height > 0 && height <= 1000, "Invariante: height debe ser > 0 y <= 1000.");
    }
}
