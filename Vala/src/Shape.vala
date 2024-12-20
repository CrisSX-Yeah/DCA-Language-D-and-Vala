public abstract class Shape {
    // Constructor protegido para clases derivadas
    protected Shape() { }

    // Método abstracto para calcular el área
    public abstract double calculate_area();

    // Método abstracto para obtener áreas menores a 50000
    public abstract double calculate_area_below_50000()
        ensures (result >= 0.0 && result <= 50000.0);

    // Propiedad para obtener el área
    public double area {
        get {
            return calculate_area();
        }
    }

    // Propiedad para obtener el área menos de 50000
    public double area_below_50000 {
        get {
            return calculate_area_below_50000();
        }
    }

    // Método move con precondiciones
    public virtual void move(int delta_x, int delta_y)
        requires (delta_x != 0 || delta_y != 0) {
        print("Shape moved by (%d, %d)\n", delta_x, delta_y);
    }
}
