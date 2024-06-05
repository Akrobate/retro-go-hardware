include <../configurations/global.scad>

/**
 * boltJoinGamePadPiece
 * @name boltJoinGamePadPiece
 * @description Joins to hold controller electronic board with controller facade
 * @type piece
 * @parent gamePadComponent
 * @stl
 */
module boltJoinGamePadPiece(
    internal_diameter = bolt_join_game_pad_internal_diameter,
    external_diameter = bolt_join_game_pad_external_diameter,
    height = bolt_join_game_pad_height,
    _fn = bolt_join_fn
) {
    echo(str("boltJoinGamePadPiece height : ", height))
    difference() {
        cylinder(d = external_diameter, h = height, center = false, $fn = _fn);

        translate([0,0,-0.1])
            cylinder(d = internal_diameter, h = height * 2 + 0.1 * 2, center = false, $fn = _fn);
    }
}

boltJoinGamePadPiece();