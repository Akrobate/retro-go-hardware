use <./pieces/subpieces/rounded-pane.scad>
use <./pieces/subpieces/rounded-cube.scad>
use <./pieces/subpieces/directional-cross.scad>
use <./pieces/subpieces/breadboard.scad>
use <./pieces/subpieces/simple-button.scad>

use <./pieces/subpieces/directional-cross-facade.scad>

use <./pieces/directional-cross-piece.scad>


module directionalCrossElectronicCard() {
    breadboard(9, 9, z_size = 1.5, $fn = 30);

    translateBreadboard(2, 5, 1.5)
        simpleButton(center = true, $fn=50);

    translateBreadboard(8, 5, 1.5)
        simpleButton(center = true, $fn=50);

    translateBreadboard(5, 2, 1.5)
        simpleButton(center = true, $fn=50);

    translateBreadboard(5, 8, 1.5)
        simpleButton(center = true, $fn=50);
}

if (1) {
translate([0, 0, 7])
    color("DarkGray", 1)
        directionalCrossPiece(
            button_x_y_size = 20,
            button_z_size = 4,
            button_thickness = 6,
            button_round_edges_radius = 1,
            support_x_y_size = 22,
            support_z_size = 0.5,
            $fn = 150
        );

translateBreadboard(-5, -5)
    directionalCrossElectronicCard();
}


translate([0,0, 9.1])
directionnalCrossFacade(
    cross_button_x_y_size = 20 + 1,
    cross_button_thickness = 6 + 1,
    cross_button_round_edges_radius = 1,
    facade_x_size = 40,
    facade_y_size = 40,
    facade_z_size = 2,
    center = true,
    $fn = 150
);