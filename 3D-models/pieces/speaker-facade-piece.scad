include <./../configurations/global.scad>
use <./../libraries/commons.scad>
use <./../libraries/electronics.scad>

use <./subpieces/rounded-pane.scad>
use <../enveloppes/speaker-28mm-throws-enveloppe.scad>

/**
 * speakerFacadePiece
 * @name speakerFacadePiece
 * @description Speaker protection
 * @type piece
 * @parent root
 * @stl
 */
module speakerFacadePiece(
    z_size = speaker_facade_z_size,
    mother_board_bolt_throws_list = mother_board_bolt_throws_list,
    rounded_radius = speaker_facade_rounded_radius,
    $fn = 100
) {
    x_size = getThrowsSpaceSizes(mother_board_bolt_throws_list)[0];
    y_size = getThrowsSpaceSizes(mother_board_bolt_throws_list)[1];

    difference() {
        roundedPane([x_size + rounded_radius * 2, y_size + rounded_radius * 2, z_size], r1 = rounded_radius, r2 = rounded_radius);

        translate([rounded_radius, rounded_radius, -z_size / 2])
            translate([-getMin(mother_board_bolt_throws_list, 0), -getMin(mother_board_bolt_throws_list, 1), 0]) {
                forEachCoord([
                    for (i = mother_board_bolt_throws_list) [
                        i[0] * getPointSize(),
                        i[1] * getPointSize()
                    ]
                ])
                    cylinder(h = z_size * 2, d = 3, $fn = $fn);

                translate(concat(getThrowsSpaceCenterXYCoords() ,0)) {
                    intersection() {
                    speaker28mmThrowsEnveloppe();

                    translate([0, -17, 0])
                        for(i = [0:2:30]) {
                            translate([0, i, 0])
                                rotate([60, 0, 0])
                                    cube([40, 20, 1], center = true);
                        }
                    }
                }
            }

    }
}

function getThrowsSpaceSizes(
    list = mother_board_bolt_throws_list,
) = [for (coord = [0, 1])
    getMax(list, coord) - getMin(list, coord)
];

function getThrowsSpaceCenterXYCoords(
    list = mother_board_bolt_throws_list,
) = [for (coord = [0, 1])
    getMin(list, coord) + (getMax(list, coord) - getMin(list, coord)) / 2
];

function getMin(list, coord) = min([for (i = list) i[coord]]) * getPointSize();
function getMax(list, coord) = max([for (i = list) i[coord]]) * getPointSize();



speakerFacadePiece();