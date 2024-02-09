
module roundedCube(x_y_z_coords, r, center = false, $fn = $fn) {

    x = x_y_z_coords[0];
    y = x_y_z_coords[1];
    z = x_y_z_coords[2];

    module _cube() {
        hull() {
            translate([r,r,r]) {
                sphere(r=r, $fn=$fn);
            }

            translate([x-r,r,r]) {
                sphere(r=r, $fn=$fn);
            }

            translate([r,y-r,r]) {
                sphere(r=r, $fn=$fn);
            }

            translate([x-r,y-r,r]) {
                sphere(r=r, $fn=$fn);
            }

            translate([r,r,z-r]) {
                sphere(r=r, $fn=$fn);
            }

            translate([x-r,r,z-r]) {
                sphere(r=r, $fn=$fn);
            }

            translate([r,y-r,z-r]) {
                sphere(r=r, $fn=$fn);
            }

            translate([x-r,y-r,z-r]) {
                sphere(r=r, $fn=$fn);
            }
        }
    }

    if (center) {
        _cube();
    } else {
        translate([-x / 2, -y / 2, -z / 2])
            _cube();
    }
}