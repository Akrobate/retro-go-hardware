use <./rounded-cube.scad>

/**
 * directionalCross
 * @name directionalCross
 * @description Direction cross
 * @type Supbiece
 * @parent 
 */
module directionalCross(
    button_x_size,
    button_y_size,
    button_z_size,
    button_thickness,
    button_round_edges_radius
) {
    union() {
        roundedCube(
            [
                button_x_size,
                button_thickness,
                button_z_size,
            ],
            button_round_edges_radius,
            false
        );
        roundedCube(
            [
                button_thickness,
                button_y_size,
                button_z_size,
            ],
            button_round_edges_radius,
            false
        );
    }
}