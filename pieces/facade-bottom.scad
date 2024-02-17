include <./../configurations/global.scad>
use <./../libraries/commons.scad>

use <./subpieces/rounded-pane.scad>


module facadeBottom(
    x_size = case_external_x_size,
    y_size = case_external_y_size,
    z_size = case_external_panes_thickness,

    facade_throws_margin = 5,

    round_edges_radius = facade_front_round_edges_radius,

    $fn = facade_front_fn
) {

    difference() {
        color("BurlyWood")
            roundedPane(
                [x_size, y_size, z_size],
                r1 = round_edges_radius,
                r2 = round_edges_radius,
                center = false,
                $fn = $fn
            );

        translate([0, 0, -z_size / 2])
            forEachCoord([
                [facade_throws_margin, facade_throws_margin],
                [x_size - facade_throws_margin, facade_throws_margin],
                [facade_throws_margin, y_size - facade_throws_margin],
                [x_size - facade_throws_margin, y_size - facade_throws_margin,],
            ])
                cylinder(h = z_size * 2, d = 3, $fn = $fn);

    }
}

%facadeTop();

