use <./pieces/subpieces/directional-cross.scad>
use <./pieces/subpieces/controller-breadboard-facade.scad>
use <./pieces/subpieces/breadboard.scad>
use <./pieces/subpieces/simple-button.scad>

use <./pieces/directional-cross-piece.scad>
use <./pieces/a-b-button-piece.scad>
use <./pieces/small-button-piece.scad>

breadboard_x_size_point = 28;
breadboard_y_size_point = 9;

button_throw_margin = 1;

cross_button_x_y_size = 20;
cross_button_thickness = 6;
cross_button_round_edges_radius = 1;
a_b_button_diameter = 7;
a_b_button_z_size = 4;
small_button_diameter = 5;
small_button_z_size = 3;

directional_cross_points_coords = [5, 5];
start_button_points_coords = [14, 3];
select_button_points_coords = [18, 3];
menu_button_points_coords = [14, 7];
option_button_points_coords = [18, 7];
a_button_points_coords = [23, 4];
b_button_points_coords = [27, 6];
bolt_throws_list = [
    [2, 2],
    [2, 8],
    [10, 2],
    [10, 8],
    [27, 2],
    [23, 8],
];


module directionalCrossElectronicCard() {
    breadboard(breadboard_x_size_point, breadboard_y_size_point, throw_3mm_coord_list = bolt_throws_list, z_size = 1.5, $fn = 30);

    placeCrossElectronicButton(directional_cross_points_coords, 1.5, $fn = 20);
    placeStandartElectronicButton(start_button_points_coords, 1.5, $fn = 20);
    placeStandartElectronicButton(select_button_points_coords, 1.5, $fn = 20);
    placeStandartElectronicButton(menu_button_points_coords, 1.5, $fn = 20);
    placeStandartElectronicButton(option_button_points_coords, 1.5, $fn = 20);
    placeStandartElectronicButton(a_button_points_coords, 1.5, $fn = 20);
    placeStandartElectronicButton(b_button_points_coords, 1.5, $fn = 20);
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


translate([0,0,10])
    %controllerBreadboardFacade(
        x_points = breadboard_x_size_point,
        y_points = breadboard_y_size_point,
        z_size = 2,
        directional_cross_points_coords = directional_cross_points_coords,
        start_button_points_coords = start_button_points_coords,
        select_button_points_coords = select_button_points_coords,
        menu_button_points_coords = menu_button_points_coords,
        option_button_points_coords = option_button_points_coords,
        a_button_points_coords = a_button_points_coords,
        b_button_points_coords = b_button_points_coords,
        
        cross_button_x_y_size = cross_button_x_y_size + button_throw_margin,
        cross_button_thickness = cross_button_thickness + button_throw_margin,
        cross_button_round_edges_radius = cross_button_round_edges_radius,
        a_b_button_diameter = a_b_button_diameter + button_throw_margin,
        small_button_diameter = small_button_diameter + button_throw_margin,

        bolt_throws_list = bolt_throws_list,
        $fn = 100
    );

directionalCrossElectronicCard();

translateBreadboard(directional_cross_points_coords[0], directional_cross_points_coords[1], 10 - 1)
    color("DarkGray", 1)
        directionalCrossPiece(
            button_x_y_size = 20,
            button_z_size = 4,
            button_thickness = 6,
            button_round_edges_radius = 1,
            support_x_y_size = 22,
            support_z_size = 1,
            $fn = 150
        );

for (coords = [a_button_points_coords, b_button_points_coords])
    translateBreadboard(coords[0], coords[1], 10 - 1)
        abButtonPiece(
            diameter = a_b_button_diameter,
            button_z_size = a_b_button_z_size,
            support_diameter = a_b_button_diameter + 2,
            support_z_size = 1,
            $fn = 80
        );

for (coords = [menu_button_points_coords, option_button_points_coords, start_button_points_coords, select_button_points_coords])
    translateBreadboard(coords[0], coords[1], 10 - 1)
        smallButtonPiece(
            diameter = small_button_diameter,
            button_z_size = small_button_z_size,
            support_diameter = small_button_diameter + 2,
            support_z_size = 1,
            $fn = 80
        );
