/**
 * roundedPane
 * @name roundedPane
 * @description roundedPane
 * @type Supbiece
 * @parent 
 */
module roundedPane(
    x_y_z_coords,
    r1,
    r2,
    center = false,
    $fn = $fn
) {
    x = x_y_z_coords[0];
    y = x_y_z_coords[1];
    z = x_y_z_coords[2];

    r = (r1 < r2) ? r2 : r1;

    module _pane() {
        hull() {
            translate([r,r,0]) {
                cylinder(z, r1 = r1, r2 = r2);
            }

            translate([x-r,r,0]) {
                cylinder(z, r1 = r1, r2 = r2);
            }

            translate([r,y-r,0]) {
                cylinder(z, r1 = r1, r2 = r2);
            }

            translate([x-r,y-r,0]) {
                cylinder(z, r1 = r1, r2 = r2);
            }
        }
    }

    if (center) {
        translate([-x / 2, -y / 2, -z / 2])
            _pane();
    } else {
        _pane();
    }

}