include <../configurations/global.scad>

/**
 * boltJoinMotherBoardPiece
 * @name boltJoinMotherBoardPiece
 * @description Joins to hold mother board
 * @type piece
 * @parent motherBoardComponent
 * @stl
 */
module boltJoinMotherBoardPiece(
    internal_diameter = bolt_join_mother_board_internal_diameter,
    external_diameter = bolt_join_mother_board_external_diameter,
    height = bolt_join_mother_board_height,
    _fn = bolt_join_fn
) {
    difference() {
        cylinder(d = external_diameter, h = height, center = false, $fn = _fn);

        translate([0,0,-0.1])
            cylinder(d = internal_diameter, h = height * 2 + 0.1 * 2, center = false, $fn = _fn);
    }
}

boltJoinMotherBoardPiece();