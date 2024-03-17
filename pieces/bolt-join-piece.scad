include <../configurations/global.scad>


module boltJoinPiece(
    internal_diameter = bolt_join_internal_diameter,
    external_diameter = bolt_join_external_diameter,
    height = bolt_join_height,
    _fn = bolt_join_fn
) {
    difference() {
        cylinder(d = external_diameter, h = height, center = false, $fn = _fn);

        translate([0,0,-0.1])
            cylinder(d = internal_diameter, h = height * 2 + 0.1 * 2, center = false, $fn = _fn);
    }
}

boltJoinPiece();