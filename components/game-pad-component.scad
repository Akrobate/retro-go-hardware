use <./../pieces/subpieces/breadboard.scad>
use <./../pieces/subpieces/simple-button.scad>

use <./../pieces/controller-facade-piece.scad>
use <./../pieces/directional-cross-piece.scad>
use <./../pieces/a-b-button-piece.scad>
use <./../pieces/small-button-piece.scad>
use <./../pieces/bolt-join-game-pad-piece.scad>

use <../libraries/electronics.scad>

include <../configurations/global.scad>

module directionalCrossElectronicCard(
    breadboard_x_size_point = controller_breadboard_x_size_point,
    breadboard_y_size_point = controller_breadboard_y_size_point,
    bolt_throws_list = controller_bolt_throws_list,
    directional_cross_points_coords = controller_directional_cross_points_coords,
    electronic_button_coords_list = [
        controller_start_button_points_coords,
        controller_select_button_points_coords,
        controller_menu_button_points_coords,
        controller_option_button_points_coords,
        controller_a_button_points_coords,
        controller_b_button_points_coords,
    ]
) {
    breadboard(
        breadboard_x_size_point,
        breadboard_y_size_point,
        throw_3mm_coord_list = bolt_throws_list,
        draw_throws = true,
        z_size = 1.5,
        $fn = 30
    );

    placeCrossElectronicButton(directional_cross_points_coords, 1.5, $fn = 20);

    for (coords = electronic_button_coords_list)
        placeStandartElectronicButton(coords, 1.5, $fn = 20);
}


module placeStandartElectronicButton(point_coords, z, $fn = $fn) {
    translateBreadboard(point_coords[0], point_coords[1], z)
        simpleButton(center = true, $fn = $fn);
}


module placeCrossElectronicButton(point_coords, z, $fn = $fn) {
    for (coords = [[0, 3], [3, 0], [0, -3], [-3, 0]])
        translateBreadboard(point_coords[0] + coords[0], point_coords[1] + coords[1], z)
            simpleButton(center = true, $fn = $fn);
}


module gamePadComponent(
    directional_cross_points_coords = controller_directional_cross_points_coords,
    small_button_points_coords_list = [controller_start_button_points_coords, controller_select_button_points_coords, controller_menu_button_points_coords, controller_option_button_points_coords],
    a_b_button_points_coors_list = [controller_a_button_points_coords, controller_b_button_points_coords],

    breadboard_x_size_point = controller_breadboard_x_size_point,
    breadboard_y_size_point = controller_breadboard_y_size_point,

    facade_with_border_x_size = controller_facade_with_border_x_size,
    facade_with_border_y_size = controller_facade_with_border_y_size,

    bolt_throws_list = controller_bolt_throws_list,
    bolt_join_height = bolt_join_game_pad_height,
) {

    breadboard_z_size = 1.5;

    margin_facade_breadboard = bolt_join_height + breadboard_z_size;
    border_margin_size_x = (facade_with_border_x_size - getSizeFromPointCount(breadboard_x_size_point)) / 2;
    border_margin_size_y = (facade_with_border_y_size - getSizeFromPointCount(breadboard_y_size_point)) / 2;

    controllerFacadePiece();

    translate([border_margin_size_x, border_margin_size_y]) {
        translate([0,0, -margin_facade_breadboard]) {
            directionalCrossElectronicCard();

            for (coords = bolt_throws_list)
                translateBreadboard(coords[0], coords[1], breadboard_z_size)
                    boltJoinGamePadPiece();
        }

        *translateBreadboard(directional_cross_points_coords[0], directional_cross_points_coords[1], -1)
            color("DarkGray")
                directionalCrossPiece();

        for (coords = a_b_button_points_coors_list)
            translateBreadboard(coords[0], coords[1], -1)
                abButtonPiece();

        *for (coords = small_button_points_coords_list)
            translateBreadboard(coords[0], coords[1], -1)
                smallButtonPiece();

    }
}


gamePadComponent();

