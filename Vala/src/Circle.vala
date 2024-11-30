// src/Circle.vala

public class Circle : Shape {
    private double radius;

    // Constructor con precondiciones y postcondiciones
    public Circle(double radius)
        requires (radius > 0.0)
        ensures (this.radius == radius) {
        this.radius = radius;
    }

    // Método para establecer el radio con precondiciones y postcondiciones
    public void set_radius(double new_radius)
        requires (new_radius > 0.0)
        ensures (this.radius == new_radius) {
        this.radius = new_radius;
    }

    // Implementación del método abstracto para calcular el área
    public override double get_area() {
        return Math.PI * radius * radius;
    }

    // Implementación del método abstracto para áreas menores a 50000
    public override double get_area_less_than_50000()
        ensures (result >= 0.0 && result <= 50000.0) {
        return Math.PI * radius * radius;
    }
}
