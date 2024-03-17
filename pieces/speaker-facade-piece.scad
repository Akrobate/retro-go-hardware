include <./../configurations/global.scad>
use <./../libraries/commons.scad>
use <./../libraries/electronics.scad>

use <./subpieces/rounded-pane.scad>
use <../enveloppes/speaker-28mm-throws-enveloppe.scad>


module speakerFacadePiece(
    z_size = 2,
    mother_board_bolt_throws_list = mother_board_bolt_throws_list,
    rounded_radius = 5,
    $fn = 100
) {

    min_x = min([for (i = mother_board_bolt_throws_list) i[0]]) * getPointSize();
    min_y = min([for (i = mother_board_bolt_throws_list) i[1]]) * getPointSize();
    max_x = max([for (i = mother_board_bolt_throws_list) i[0]]) * getPointSize();
    max_y = max([for (i = mother_board_bolt_throws_list) i[1]]) * getPointSize();

    x_size = max_x - min_x;
    y_size = max_y - min_y;


    difference() {
    roundedPane([x_size + rounded_radius * 2, y_size + rounded_radius * 2, z_size], r1 = rounded_radius, r2 = rounded_radius);

    translate([rounded_radius, rounded_radius, 0])
        translate([-min_x, -min_y, 0]) {
            forEachCoord([
                for (i = mother_board_bolt_throws_list) [
                    i[0] * getPointSize(),
                    i[1] * getPointSize()
                ]
            ])
                cylinder(h = z_size * 2, d = 3, $fn = $fn);

            translate([min_x + (max_x - min_x) / 2, min_y + (max_y - min_y) / 2, 0 ])
                speaker28mmThrowsEnveloppe();
        }

    }
}

speakerFacadePiece();