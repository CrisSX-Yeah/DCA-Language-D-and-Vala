// src/RectangleDerived.vala

public class RectangleDerived : Rectangle {
    // Constructor con precondiciones y postcondiciones
    public RectangleDerived(int width, int height)
        requires (width > 0 && height > 0)
        ensures (this.width == width && this.height == height) {
        base(width, height);
    }

    // Redefinición del método set_dimensions con precondiciones y postcondiciones adicionales
    public override void set_dimensions(int new_width, int new_height)
        requires (new_width > 0 && new_height > 0 && new_width <= 100 && new_height <= 100)
        ensures (this.width == new_width && this.height == new_height) {
        base.set_dimensions(new_width, new_height);
    }

    // Sobrescritura del método move con precondiciones adicionales
    public override void move(int delta_x, int delta_y)
        requires (delta_x >= -10 && delta_x <= 10 && delta_y >= -10 && delta_y <= 10) {
        base.move(delta_x, delta_y);
    }
}
