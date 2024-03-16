use <./subpieces/roundedBorderPaneSubpiece.scad>
use <./subpieces/paneFixationThrows.scad>

beeperHolderPiece();
// beeperHolderPieceBack();

color(alpha = 0.2)
    beeperHolderPieceThrows();

// Beeper diameter : 11.7mm

module beeperHolderPiece(
    size_x = 30,
    size_y = 20,
    size_z = 2,
    buzzer_diameter = 12.5,
    buzzer_border_holder = 2,
    buzzer_holder_height = 4,
    _fn = 500
) {

    difference() {

        roundedBorderPaneSubpiece(
            size_x = size_x,
            size_y = size_y,
            size_z = size_z,

            border_radius = 3,

            $fn = 150
        );

        paneFixationThrows(
            size_x = size_x,
            size_y = size_y,
            size_z = size_z * 2,

            throws_diameter = 3.5,
            throws_margin = 3
        );

        translate([0, -5, 0])
            for(i = [0:2:10]) {
                translate([0, i, 0])
                    rotate([60, 0, 0])
                        cube([15, 20, 1], center = true);
            }
    }

    difference() {

        translate([0, 0, size_z / 2])
            cylinder(d = buzzer_diameter + buzzer_border_holder, h = buzzer_holder_height, $fn = _fn);

        translate([0, 0, size_z / 2 - 0.01 + 1])
            cylinder(d = 12.5, h = 3 + 0.02, $fn = _fn);

        translate([0, 0, size_z / 2 - 0.01])
            cylinder(d = 9, h = 3, $fn = _fn);
    }

}






module beeperHolderPieceBack(
    size_x = 30,
    size_y = 20,
    size_z = 2,
    _fn = 500
) {

    difference() {

        roundedBorderPaneSubpiece(
            size_x = size_x,
            size_y = size_y,
            size_z = size_z,

            border_radius = 3,

            $fn = 150
        );

        paneFixationThrows(
            size_x = size_x,
            size_y = size_y,
            size_z = size_z * 2,

            throws_diameter = 3.5,
            throws_margin = 3
        );
    }
}




module beeperHolderPieceThrows(
    size_x = 30,
    size_y = 20,
    size_z = 2,
    buzzer_throw_diameter = 12.5 + 2 + 1,

    throws_depth = 10,
    throw_diameter = 3.8,

    _fn = 500
) {
    paneFixationThrows(
        size_x = size_x,
        size_y = size_y,
        size_z = throws_depth,

        head_throw_diameter = throw_diameter,
        head_throw_size_z = 0,

        throws_diameter = throw_diameter,
        throws_margin = 3
    );

    translate([0, 0, 0])
        cylinder(
            d = buzzer_throw_diameter,
            h = throws_depth,
            center = true,
            $fn = _fn
        );


}