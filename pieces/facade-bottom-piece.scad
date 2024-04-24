use <./../libraries/commons.scad>

include <./../configurations/global.scad>


/**
 *  facadeBottomPiece - Piece can be printed or CNC cutted
 *  #3DPrint, #CNC
 */
module facadeBottomPiece(
    x_size = case_external_x_size - (facade_corners_offset_lenght * 2),
    y_size = case_external_z_size - (case_external_panes_thickness * 2),
    z_size = case_external_panes_thickness,
    throws_margin = facade_throws_margin,
    throws_diameter = housing_facades_throws_diameter,

    $fn = facade_fn
) {

    echo(str("facadeBottomPiece ", "x_size: ", x_size, " y_size: ", y_size, " z_size: ", z_size));
    difference() {
        color("BurlyWood")
            cube([x_size, y_size, z_size]);

        translate([0, 0, -z_size / 2])
            forEachCoord([
                [throws_margin, throws_margin],
                [x_size - throws_margin, throws_margin],
                [throws_margin, y_size - throws_margin],
                [x_size - throws_margin, y_size - throws_margin,],
            ])
                cylinder(h = z_size * 2, d = throws_diameter, $fn = $fn);
    }
}


facadeBottomPiece();
