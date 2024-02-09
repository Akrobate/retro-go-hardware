module simpleButton(center = false, $fn = $fn) {

    x_size = 6;
    y_size = 6;
    z_size = 4;

    button_diameter = 3.4;
    button_z_size = 1.4;

    module _simpleButton() {
        color("DimGray")
            cube([x_size, y_size, z_size - 1], center = false);

        color("LightGrey")
            translate([0,0, z_size - 1])
            cube([x_size, y_size, 1], center = false);

        color("DimGray")
            translate([x_size / 2, y_size / 2, z_size])
                cylinder(h = button_z_size, d = button_diameter, $fn = $fn);
    }

    if (center) {
        translate([-x_size / 2, -y_size / 2, 0])
            _simpleButton();
    } else {
        _simpleButton();
    }
}