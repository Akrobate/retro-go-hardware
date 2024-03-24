use <./../libraries/commons.scad>
use <./../enveloppes/on-off-button-throw-enveloppe.scad>

include <./../configurations/global.scad>


module facadeTopPiece(
    x_size = case_external_x_size - (facade_corners_offset_lenght * 2),
    y_size = case_external_z_size - (case_external_panes_thickness * 2),
    z_size = case_external_panes_thickness,
    throws_margin = facade_throws_margin,
    throws_diameter = housing_facades_throws_diameter,
    facade_top_on_off_button_coords = facade_top_on_off_button_coords,
    facade_corners_offset_lenght = facade_corners_offset_lenght,
    case_external_panes_thickness = case_external_panes_thickness,
    $fn = facade_fn
) {
    
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

        
        translate([
                facade_top_on_off_button_coords[0] - facade_corners_offset_lenght,
                facade_top_on_off_button_coords[1] - case_external_panes_thickness,
                z_size / 2
            ])
                onOffButtonThrowEnveloppe();
    }

}

facadeTopPiece();