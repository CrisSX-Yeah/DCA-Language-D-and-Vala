module src.RectangleDerived;

import src.Rectangle;
import std.exception;
import std.stdio; // Para usar writeln si es necesario

class RectangleDerived : Rectangle {
    // Constructor con precondiciones y postcondiciones
    this(int width, int height)
    in (width > 0 && height > 0)
    out (; this.width > 0 && this.height > 0, "Postcondición: dimensiones establecidas correctamente en RectangleDerived.") {
        super(width, height);
    }

    // Redefinición del método setDimensions con precondiciones y postcondiciones adicionales
    override void setDimensions(int newWidth, int newHeight)
    in (newWidth > 0 && newHeight > 0 && newWidth <= 100 && newHeight <= 100)
    out (; this.width == newWidth && this.height == newHeight, "Postcondición: dimensiones actualizadas correctamente en RectangleDerived.") {
        super.setDimensions(newWidth, newHeight);
    }

    // Sobrescritura del método move con precondiciones y postcondiciones adicionales
    override void move(int deltaX, int deltaY)
    in (deltaX >= -10 && deltaX <= 10 && deltaY >= -10 && deltaY <= 10) {
        super.move(deltaX, deltaY);
    }
}
