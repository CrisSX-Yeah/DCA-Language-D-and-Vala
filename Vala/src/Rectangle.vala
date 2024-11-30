// src/Rectangle.vala

public class Rectangle : Shape {
    protected int width;
    protected int height;

    // Constructor con precondiciones y postcondiciones
    public Rectangle(int width, int height)
        requires (width > 0 && height > 0)
        ensures (this.width == width && this.height == height) {
        this.width = width;
        this.height = height;
    }

    // Método para establecer dimensiones con precondiciones y postcondiciones
    public virtual void set_dimensions(int new_width, int new_height)
        requires (new_width > 0 && new_height > 0)
        ensures (this.width == new_width && this.height == new_height) {
        this.width = new_width;
        this.height = new_height;
    }

    // Implementación del método abstracto para calcular el área
    public override double get_area() {
        return (double)(width * height);
    }

    // Implementación del método abstracto para áreas menores a 50000
    public override double get_area_less_than_50000()
        ensures (result >= 0.0 && result <= 50000.0) {
        return (double)(width * height);
    }
}
