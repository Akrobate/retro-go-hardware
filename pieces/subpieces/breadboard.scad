module breadboard(
    x_points,
    y_points,
    z_size = 1.5,
    center = false,
    $fn = $fn
) {

    point = 2.54;
    throw_diameter = 1.3;
    
    x_size = (x_points + 1) * point;
    y_size = (y_points + 1) * point;

    module _breadboard() {
        difference() {
            color("DarkOrange")
                cube([x_size, y_size, z_size], center = false);
            for (x_index = [0 : x_points + 1]) {
                for (y_index = [0 : y_points + 1]) {
                    translate([x_index * point, y_index * point, -z_size / 2])
                    cylinder(
                        h = z_size * 2,
                        d = throw_diameter,
                        $fn = $fn
                    );
                }
            }
        }
    }

    if (center) {
        translate([-x_size / 2, -y_size / 2, -z_size / 2])
            _breadboard();
    } else {
        _breadboard();
    }
}


module translateBreadboard(x, y, z = 0) {
    point = 2.54;
    translate([x * point, y * point, z])
        children();
}