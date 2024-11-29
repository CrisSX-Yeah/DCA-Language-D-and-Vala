module src.RectangleDerived;

import src.Rectangle;
import std.exception;
import std.stdio; // Para usar writeln si es necesario

class RectangleDerived : Rectangle {
    // Constructor
    this(int width, int height)
    in (width > 0 && height > 0)
    do {
        super(width, height);
        // Postcondición dentro del cuerpo de la función
        assert(this.width > 0 && this.height > 0, "Postcondición: dimensiones establecidas correctamente en RectangleDerived.");
    }

    // Redefinición del método setDimensions con precondiciones adicionales
    override void setDimensions(int newWidth, int newHeight)
    in (newWidth > 0 && newHeight > 0 && newWidth <= 100 && newHeight <= 100)
    do {
        super.setDimensions(newWidth, newHeight);
        // Postcondición dentro del cuerpo de la función
        assert(this.width > 0 && this.height > 0, "Postcondición: dimensiones actualizadas correctamente en RectangleDerived.");
    }

    // Sobrescritura del método move con precondiciones adicionales
    override void move(int deltaX, int deltaY)
    in (deltaX >= -10 && deltaX <= 10 && deltaY >= -10 && deltaY <= 10)
    do {
        super.move(deltaX, deltaY);
        // Postcondición dentro del cuerpo de la función
        assert(deltaX >= -10 && deltaX <= 10 && deltaY >= -10 && deltaY <= 10, "Postcondición: deltaX y deltaY están dentro del rango permitido.");
    }
}
