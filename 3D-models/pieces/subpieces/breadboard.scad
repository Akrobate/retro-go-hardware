use <../../libraries/electronics.scad>

/**
 * breadboard
 * @name breadboard
 * @description Electronic breadbord
 * @type asset
 * @parent 
 */
module breadboard(
    x_points,
    y_points,
    z_size = 1.5,
    throw_3mm_coord_list = [],
    draw_throws = true,
    center = false,
    $fn = $fn
) {
    throw_diameter = 1.3;

    x_size = getSizeFromPointCount(x_points);
    y_size = getSizeFromPointCount(y_points);

    module _breadboard() {
        difference() {
            color("DarkOrange")
                cube([x_size, y_size, z_size], center = false);

            if (draw_throws) {
                for (x_index = [0 : x_points + 1]) {
                    for (y_index = [0 : y_points + 1]) {
                        breadboardThrow(x_index, y_index, z_size, throw_diameter, $fn = $fn);
                    }
                }
            } else {
                breadboardThrow(x_points + 1, y_points + 1, z_size, throw_diameter, $fn = $fn);
                breadboardThrow(x_points + 1, 0, z_size, throw_diameter, $fn = $fn);
                breadboardThrow(0, y_points + 1, z_size, throw_diameter, $fn = $fn);
                breadboardThrow(0, 0, z_size, throw_diameter, $fn = $fn);
            }

            for (throw_3mm_coord = throw_3mm_coord_list) {
                breadboardThrow(throw_3mm_coord[0], throw_3mm_coord[1], z_size, 3, $fn = $fn);
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
    translate([x * getPointSize(), y * getPointSize(), z])
        children();
}


module breadboardThrow(x_index, y_index, z_size, throw_diameter, $fn = $fn) {
    translateBreadboard(x_index, y_index, -z_size / 2)
        cylinder(
            h = z_size * 2,
            d = throw_diameter,
            $fn = $fn
        );
}


module genericModule(
    z_size = 0,
    x_points = 0,
    y_points = 0,
    color = "FireBrick"
) {
    color(color)
        hull() {
            breadboard(
                x_points = x_points,
                y_points = y_points,
                z_size = z_size,
                draw_throws = false,
                $fn = 16
            );
        }
}
