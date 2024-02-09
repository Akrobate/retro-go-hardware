use <./subpieces/directional-cross.scad>
use <./subpieces/rounded-pane.scad>

module directionalCrossPieceCircularSupport(
    button_x_y_size,
    button_z_size,
    button_thickness,
    button_round_edges_radius,
    support_x_y_size,
    support_z_size,
    $fn
) {
    union() {
        translate([0,0, (button_z_size + support_z_size)/ 2]) {
            directionalCross(
                button_x_y_size,
                button_x_y_size,
                button_z_size + support_z_size,
                button_thickness,
                button_round_edges_radius,
                $fn = $fn
            );
        }
        cylinder(d = support_x_y_size, h = support_z_size, $fn = $fn);
    }
}



module directionalCrossPiece(
    button_x_y_size,
    button_z_size,
    button_thickness,
    button_round_edges_radius,
    support_x_y_size,
    support_z_size,
    $fn
) {
    union() {
        translate([0,0, (button_z_size + support_z_size) / 2]) {
            directionalCross(
                button_x_y_size,
                button_x_y_size,
                button_z_size + support_z_size,
                button_thickness,
                button_round_edges_radius,
                $fn = $fn
            );
        }
        
        translate([0,0, (support_z_size) / 2]) {
            roundedPane(
                [
                    support_x_y_size,
                    button_thickness + (support_x_y_size - button_x_y_size),
                    support_z_size
                ],
                button_round_edges_radius,
                button_round_edges_radius,
                center = true,
                $fn = $fn
            );

            roundedPane(
                [
                    button_thickness + (support_x_y_size - button_x_y_size),
                    support_x_y_size,
                    support_z_size
                ],
                button_round_edges_radius,
                button_round_edges_radius,
                center = true,
                $fn = $fn
            );

        }
    }
}