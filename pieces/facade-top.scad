use <./../components/game-pad-component.scad>

include <./../configurations/global.scad>

use <./subpieces/rounded-pane.scad>
use <./subpieces/breadboard.scad>

use <./../libraries/commons.scad>
use <./../libraries/electronics.scad>

// color("green")
//     cylinder(h = 12, d = 3, $fn = 10);

// gamePadComponent();


module controllerFacadePieceThrows(
    facade_with_border_x_size = controller_facade_with_border_x_size,
    facade_with_border_y_size = controller_facade_with_border_y_size,

    breadboard_x_size_point = controller_breadboard_x_size_point,
    breadboard_y_size_point = controller_breadboard_y_size_point,

    border_throws_margin = controller_facade_border_throws_margin,

    z_size = facade_front_z_size,
    $fn = $fn
) {

    breadboard_x_size = getSizeFromPointCount(breadboard_x_size_point);
    breadboard_y_size = getSizeFromPointCount(breadboard_y_size_point);

    forEachCoord([
        [border_throws_margin, border_throws_margin],
        [facade_with_border_x_size - border_throws_margin, border_throws_margin],
        [border_throws_margin, facade_with_border_y_size - border_throws_margin],
        [facade_with_border_x_size - border_throws_margin, facade_with_border_y_size - border_throws_margin],
        [facade_with_border_x_size / 2, facade_with_border_y_size - border_throws_margin],
        [facade_with_border_x_size / 2, border_throws_margin],
    ])
        cylinder(h= z_size * 2, d = 3, $fn = $fn);

    translate([
        facade_with_border_x_size / 2 - breadboard_x_size / 2,
        facade_with_border_y_size / 2 - breadboard_y_size / 2,
        0
    ])
        cube([breadboard_x_size, breadboard_y_size, z_size * 2]);
}


function facadeControllerCalculateXYOffset(
    facade_with_border_x_size = controller_facade_with_border_x_size,
    facade_with_border_y_size = controller_facade_with_border_y_size,
    facade_controller_coords = facade_controller_coords,
) = [
    facade_controller_coords[0] - facade_with_border_x_size / 2,
    facade_controller_coords[1] - facade_with_border_y_size / 2,
];



module facadeTop(
    x_size = facade_front_x_size,
    y_size = facade_front_y_size,
    z_size = facade_front_z_size,

    controller_position_coords = [],

    facade_throws_margin = 5,

    round_edges_radius = facade_front_round_edges_radius,
    facade_with_border_x_size = controller_facade_with_border_x_size,
    facade_with_border_y_size = controller_facade_with_border_y_size,

    facade_controller_coords = facade_controller_coords,

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

        translate(
            concat(
                facadeControllerCalculateXYOffset(facade_with_border_x_size, facade_with_border_y_size, facade_controller_coords),
                -z_size / 2
            )
        )
            controllerFacadePieceThrows();
    }
}

%facadeTop();


