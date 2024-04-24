include <./../configurations/global.scad>
use <./../libraries/commons.scad>
use <./../libraries/electronics.scad>

use <./subpieces/rounded-pane.scad>
use <../enveloppes/usb-charger-throws-enveloppe.scad>
use <../enveloppes/speaker-28mm-throws-enveloppe.scad>


/**
 *  facadeBackPiece - Piece can be printed or CNC cutted
 *  #3DPrint, #CNC
 */
module facadeBackPiece(
    x_size = case_external_x_size,
    y_size = case_external_y_size,
    z_size = case_external_panes_thickness,

    throws_margin = facade_throws_margin,

    round_edges_radius = facade_front_round_edges_radius,

    usb_charger_facade_y_size = usb_charger_facade_y_size,
    usb_charger_coords = usb_charger_coords,

    throws_diameter = housing_facades_throws_diameter,

    mother_board_coords = mother_board_coords,
    mother_board_bolt_throws_list = mother_board_bolt_throws_list,

    $fn = facade_fn
) {
    echo(str("facadeBackPiece ", "x_size: ", x_size, " y_size: ", y_size, " z_size: ", z_size));

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
                cylinder(h = z_size * 2, d = throws_diameter, $fn = $fn);


        translate([mother_board_coords[0], mother_board_coords[1], -z_size / 2]) {
            forEachCoord([
                for (i = mother_board_bolt_throws_list) [
                    i[0] * getPointSize(),
                    i[1] * getPointSize()
                ]
            ])
                cylinder(h = z_size * 2, d = throws_diameter, $fn = $fn);
            
            min_x = min([for (i = mother_board_bolt_throws_list) i[0]]) * getPointSize();
            min_y = min([for (i = mother_board_bolt_throws_list) i[1]]) * getPointSize();
            max_x = max([for (i = mother_board_bolt_throws_list) i[0]]) * getPointSize();
            max_y = max([for (i = mother_board_bolt_throws_list) i[1]]) * getPointSize();
            echo(min_x);

            translate([min_x + (max_x - min_x) / 2, min_y + (max_y - min_y) / 2, 0 ])
                speaker28mmThrowsEnveloppe();
        }


        translate([usb_charger_coords[0], usb_charger_coords[1], -usb_charger_facade_y_size])
            rotate([90,0,0])
                usbChargerThrowsEnveloppe();
    }
    

}

facadeBackPiece();


