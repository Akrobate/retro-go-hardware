include <./../configurations/global.scad>


module facadeCorner(
    round_radius = facade_front_round_edges_radius,
    z_size = case_external_z_size - (case_external_panes_thickness * 2),
    main_x_size = facade_corners_main_x_size,
    main_y_size = facade_corners_main_y_size,
    main_thickness = facade_corners_main_thickness,

    offset_thickness = case_external_panes_thickness,
    offset_lenght = facade_corners_offset_lenght,

    throw_diameter = insert_throw_diameter,
    throw_depth = insert_throw_length,
    throw_x_margin = facade_throws_margin,
    throw_y_margin = facade_throws_margin,
    throw_z_margin = facade_throws_margin,
    $fn = 80
) {

    difference() {
        union() {
            translate([round_radius, round_radius, 0])
                cylinder(h = z_size, r = round_radius, $fn = $fn);

            translate([round_radius, 0,0])
                cube([
                    main_x_size - round_radius,
                    main_thickness,
                    z_size
                ]);

            translate([0, round_radius, 0])
                cube([
                    main_thickness,
                    main_y_size - round_radius,
                    z_size
                ]);
        }

        translate([offset_lenght, -main_thickness + offset_thickness, - z_size / 2])
            cube([
                main_x_size - round_radius,
                main_thickness,
                z_size * 2
            ]);

        translate([-main_thickness + offset_thickness, offset_lenght, - z_size / 2])
            cube([
                main_thickness,
                main_y_size - round_radius,
                z_size * 2
            ]);

        // x throws
        translate([offset_lenght + throw_x_margin,  offset_thickness - 0.1, throw_y_margin])
            rotate([-90,0,0])
                cylinder(h = throw_depth + 0.1, d = throw_diameter, $fn = $fn);

        translate([offset_lenght + throw_x_margin, offset_thickness - 0.1, z_size - throw_y_margin])
            rotate([-90,0,0])
                cylinder(h = throw_depth + 0.1, d = throw_diameter, $fn = $fn);


        // y throws
        translate([offset_thickness - 0.1, offset_lenght + throw_y_margin, throw_y_margin])
            rotate([0, 90, 0])
                cylinder(h = throw_depth + 0.1, d = throw_diameter, $fn = $fn);

        translate([offset_thickness - 0.1, offset_lenght + throw_y_margin, z_size - throw_y_margin])
            rotate([0, 90, 0])
                cylinder(h = throw_depth + 0.1, d = throw_diameter, $fn = $fn);


        // z throws
        translate([throw_z_margin, throw_z_margin, -0.1])
            cylinder(h = throw_depth + 0.1, d = throw_diameter, $fn = $fn);

        translate([throw_z_margin, throw_z_margin, z_size - throw_depth])
            cylinder(h = throw_depth + 0.1, d = throw_diameter, $fn = $fn);

    }
}


facadeCorner(
    $fn = 80
);