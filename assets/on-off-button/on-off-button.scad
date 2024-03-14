module onOffButton(
    $fn = 100
) {

    bottom_part_z_size = 6 + 12 + (6 / 2);
    bottom_part_diameter = 9; // M12 * 0.75

    support_z_size = 1;
    support_diameter_1 = 14;
    support_diameter_2 = 9 + 1;

    button_z_size = 2;
    button_diameter = 9;

    translate([0, 0, -bottom_part_z_size])
        cylinder(h=bottom_part_z_size, d=bottom_part_diameter, $fn = $fn);

    cylinder(
        h = support_z_size,
        d1 = support_diameter_1,
        d2 = support_diameter_2,
        $fn = $fn
    );

    cylinder(
        h = button_z_size,
        d = button_diameter,
        $fn = $fn
    );
}

onOffButton();