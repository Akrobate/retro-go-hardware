module screen($fn = $fn) {

    electronic_board_x_size = 72.25;
    electronic_board_y_size = 43.25;
    electronic_board_z_size = 1.25;

    screen_external_x_size = 60.25;
    screen_external_y_size = 42.7;
    screen_external_z_size = 4 - 1.25;

    throw_diameter = 3.1;

    x_margin_left = 1.6 + 1.55;
    x_margin_right = 1.5 + 1.55;
    y_margin_top = 1.55 + 1.55;
    y_margin_bottom = 1.4 + 1.55;

    difference() {
        union() {
            color("RoyalBlue")
                cube(
                    [
                        electronic_board_x_size,
                        electronic_board_y_size,
                        electronic_board_z_size,
                    ]
                );

            translate([
                (electronic_board_x_size - screen_external_x_size) / 2,
                (electronic_board_y_size - screen_external_y_size) / 2,
                electronic_board_z_size
            ])
            color("white")
                cube(
                    [
                        screen_external_x_size,
                        screen_external_y_size,
                        screen_external_z_size,
                    ]
                );


            translate([
                (electronic_board_x_size - screen_external_x_size) / 2 + 1,
                (electronic_board_y_size - screen_external_y_size) / 2 + 1,
                electronic_board_z_size + 0.01
            ])
            color("black")
                cube(
                    [
                        screen_external_x_size - 1 - 6.5,
                        screen_external_y_size - 1 - 1,
                        screen_external_z_size,
                    ]
                );

            translate([0.85, 11.3, -8.25])
            cube([
                2.5,
                electronic_board_y_size - (11.3 * 2),
                8.25 + electronic_board_z_size + 1.6
            ]);
        }

        translate([x_margin_left, y_margin_bottom, - electronic_board_z_size / 2])
            cylinder(h = electronic_board_z_size * 2, d = throw_diameter, $fn = $fn);

        translate([x_margin_left, electronic_board_y_size - y_margin_bottom, - electronic_board_z_size / 2])
            cylinder(h = electronic_board_z_size * 2, d = throw_diameter, $fn = $fn);

        translate([electronic_board_x_size - x_margin_right, electronic_board_y_size - y_margin_bottom, - electronic_board_z_size / 2])
            cylinder(h = electronic_board_z_size * 2, d = throw_diameter, $fn = $fn);

        translate([electronic_board_x_size - x_margin_right, y_margin_bottom, - electronic_board_z_size / 2])
            cylinder(h = electronic_board_z_size * 2, d = throw_diameter, $fn = $fn);

    }
}

screen($fn = 50);