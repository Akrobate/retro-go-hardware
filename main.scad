$fn = 80;


module roundedPane(x_y_z_coords, r1, r2, center = false) {
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



module roundedCube(x_y_z_coords, r, center = false) {

    x = x_y_z_coords[0];
    y = x_y_z_coords[1];
    z = x_y_z_coords[2];

    module _cube() {
        hull() {
            translate([r,r,r]) {
                sphere(r=r);
            }

            translate([x-r,r,r]) {
                sphere(r=r);
            }

            translate([r,y-r,r]) {
                sphere(r=r);
            }

            translate([x-r,y-r,r]) {
                sphere(r=r);
            }

            translate([r,r,z-r]) {
                sphere(r=r);
            }

            translate([x-r,r,z-r]) {
                sphere(r=r);
            }

            translate([r,y-r,z-r]) {
                sphere(r=r);
            }

            translate([x-r,y-r,z-r]) {
                sphere(r=r);
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

x = 10;
y = 10;
z = 10;
r = 1;



module directionalCross(
    button_x_size,
    button_y_size,
    button_z_size,
    button_thickness,
    button_round_edges_radius
) {
    union() {
        roundedCube(
            [
                button_x_size,
                button_thickness,
                button_z_size,
            ],
            button_round_edges_radius,
            false
        );
        roundedCube(
            [
                button_thickness,
                button_y_size,
                button_z_size,
            ],
            button_round_edges_radius,
            false
        );
    }
}






module directionalCrossPiece(
    button_x_size,
    button_y_size,
    button_z_size,
    button_thickness,
    button_round_edges_radius,
    support_z_size,
    support_diameter
) {
    union() {
        translate([0,0, (button_z_size + support_z_size)/ 2]) {
            directionalCross(
                button_x_size,
                button_y_size,
                button_z_size + support_z_size,
                button_thickness,
                button_round_edges_radius
            );
        }
        cylinder(d = support_diameter, h = support_z_size, $fn = 150);
    }
}



module directionnalCrossFacade(
    cross_button_x_size,
    cross_button_y_size,
    cross_button_z_size,
    cross_button_thickness,
    cross_button_round_edges_radius,
    facade_x_size,
    facade_y_size,
    facade_z_size
) {
    
}


roundedPane([15, 15, 1], 3, 1, center = true);


/*
directionalCrossPiece(
    button_x_size = 20,
    button_y_size = 20,
    button_z_size = 5,
    button_thickness = 6,
    button_round_edges_radius = 1,
    support_z_size = 2,
    support_diameter = 25
);
*/
