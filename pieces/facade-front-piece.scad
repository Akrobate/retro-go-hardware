use <./subpieces/rounded-pane.scad>
use <./subpieces/breadboard.scad>

use <../enveloppes/screen-enveloppe.scad>

use <./../libraries/commons.scad>
use <./../libraries/electronics.scad>

include <./../configurations/global.scad>
include <../assets/lcd-screen/configurations.scad>


module controllerFacadePieceThrows(
    facade_with_border_x_size = controller_facade_with_border_x_size,
    facade_with_border_y_size = controller_facade_with_border_y_size,

    breadboard_x_size_point = controller_breadboard_x_size_point,
    breadboard_y_size_point = controller_breadboard_y_size_point,

    border_throws_margin = controller_facade_border_throws_margin,
    braidboard_throw_margin = controller_braidboard_throw_margin,

    fixation_throws_diameter = facade_front_fixation_throws_diameter,

    z_size = case_external_panes_thickness,
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
        cylinder(h= z_size * 2, d = fixation_throws_diameter, $fn = $fn);
    
    translate([
        facade_with_border_x_size / 2 - (breadboard_x_size + braidboard_throw_margin * 2) / 2,
        facade_with_border_y_size / 2 - (breadboard_y_size + braidboard_throw_margin * 2) / 2,
        0
    ])
        cube([
            breadboard_x_size + braidboard_throw_margin * 2,
            breadboard_y_size + braidboard_throw_margin * 2,
            z_size * 2
        ]);
}


function facadeControllerCalculateXYOffset(
    facade_with_border_x_size = controller_facade_with_border_x_size,
    facade_with_border_y_size = controller_facade_with_border_y_size,
    facade_controller_coords = facade_controller_coords,
) = [
    facade_controller_coords[0] - facade_with_border_x_size / 2,
    facade_controller_coords[1] - facade_with_border_y_size / 2,
];


function facadeScreenCalculateXYOffset(
    screen_asset_electronic_board_x_size = screen_asset_electronic_board_x_size,
    screen_asset_electronic_board_y_size = screen_asset_electronic_board_y_size,
    facade_screen_coords = facade_screen_coords,
) = [
    facade_screen_coords[0] - screen_asset_electronic_board_x_size / 2,
    facade_screen_coords[1] - screen_asset_electronic_board_y_size / 2,
];



module facadeScreenThrows() {
    screenFixationThrows(
        throw_diameter = facade_front_fixation_throws_diameter,
        $fn = 100
    );
    screenMainThrow();
    screenConnectorThrow();
}


/**
 *  facadeFrontPiece - Piece can be printed or CNC cutted
 *  #3DPrint, #CNC
 */
module facadeFrontPiece(
    x_size = case_external_x_size,
    y_size = case_external_y_size,
    z_size = case_external_panes_thickness,

    controller_position_coords = [],

    throws_margin = facade_throws_margin,
    fixation_throws_diameter = facade_front_fixation_throws_diameter,

    round_edges_radius = facade_front_round_edges_radius,
    facade_with_border_x_size = controller_facade_with_border_x_size,
    facade_with_border_y_size = controller_facade_with_border_y_size,

    screen_asset_electronic_board_x_size = screen_asset_electronic_board_x_size,
    screen_asset_electronic_board_y_size = screen_asset_electronic_board_y_size,

    facade_controller_coords = facade_controller_coords,
    facade_screen_coords = facade_screen_coords,
    $fn = facade_fn
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
                [throws_margin, throws_margin],
                [x_size - throws_margin, throws_margin],
                [throws_margin, y_size - throws_margin],
                [x_size - throws_margin, y_size - throws_margin,],
            ])
                cylinder(h = z_size * 2, d = fixation_throws_diameter, $fn = $fn);

        translate(
            concat(
                facadeControllerCalculateXYOffset(
                    facade_with_border_x_size,
                    facade_with_border_y_size,
                    facade_controller_coords
                ),
                -z_size / 2
            )
        )
            controllerFacadePieceThrows();


        translate(
            concat(
                facadeScreenCalculateXYOffset(
                    screen_asset_electronic_board_x_size,
                    screen_asset_electronic_board_y_size,
                    facade_screen_coords
                ),
                -z_size / 2
            )
        )
            facadeScreenThrows();

    }
}

facadeFrontPiece();


