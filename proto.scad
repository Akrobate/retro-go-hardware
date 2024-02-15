use <./components/game-pad-component.scad>

include <./configurations/global.scad>

use <./pieces/subpieces/rounded-pane.scad>


// color("green")
//     cylinder(h = 12, d = 3, $fn = 10);

// gamePadComponent();


module facadeTop(
    x_size = facade_front_x_size,
    y_size = facade_front_y_size,
    z_size = facade_front_z_size,

    controller_position_coords = [],

    facade_throws_margin = 5,

    round_edges_radius = facade_front_round_edges_radius,
    $fn = facade_front_fn
) {


    difference() {
        color("BurlyWood")
            roundedPane(
                [
                    x_size,
                    y_size,
                    z_size,
                ],
                r1 = round_edges_radius,
                r2 = round_edges_radius,
                center = false,
                $fn = $fn
            );

        translate([
            facade_throws_margin,
            facade_throws_margin,
            -z_size / 2
        ])
            cylinder(h = z_size * 2, d = 3, $fn = $fn);


        translate([
            x_size - facade_throws_margin,
            facade_throws_margin,
            -z_size / 2
        ])
            cylinder(h = z_size * 2, d = 3, $fn = $fn);


        translate([
            facade_throws_margin,
            y_size - facade_throws_margin,
            -z_size / 2
        ])
            cylinder(h = z_size * 2, d = 3, $fn = $fn);


        translate([
            x_size - facade_throws_margin,
            y_size - facade_throws_margin,
            -z_size / 2
        ])
            cylinder(h = z_size * 2, d = 3, $fn = $fn);



    }

}

facadeTop();
