
use <./breadboard.scad>
use <./directional-cross.scad>
use <../../enveloppes/bolt.scad>
use <./rounded-pane.scad>


module controllerBreadboardFacade(
    x_points,
    y_points,
    z_size,

    directional_cross_points_coords,
    start_button_points_coords,
    select_button_points_coords,
    menu_button_points_coords,
    option_button_points_coords,
    a_button_points_coords,
    b_button_points_coords,

    cross_button_x_y_size,
    cross_button_thickness,
    cross_button_round_edges_radius,

    a_b_button_diameter,
    small_button_diameter,

    bolt_throws_list,
    $fn = $fn
) {

    difference() {
        cube([getSizeFromPointCount(x_points), getSizeFromPointCount(y_points), z_size]);

        translateBreadboard(
            directional_cross_points_coords[0],
            directional_cross_points_coords[1]
        )
            directionalCross(
                button_x_size = cross_button_x_y_size,
                button_y_size = cross_button_x_y_size,
                button_z_size = z_size * 3,
                button_thickness = cross_button_thickness,
                button_round_edges_radius = cross_button_round_edges_radius,
                $fn = $fn
            );

        for(coords = [start_button_points_coords, select_button_points_coords, menu_button_points_coords, option_button_points_coords])
            translateBreadboard(coords[0], coords[1])
                cylinder(
                    h = z_size * 3,
                    d = small_button_diameter,
                    center = true,
                    $fn = $fn
                );

        for(coords = [a_button_points_coords, b_button_points_coords])
            translateBreadboard(coords[0], coords[1])
                cylinder(
                    h = z_size * 3,
                    d = a_b_button_diameter,
                    center = true,
                    $fn = $fn
                );

        drawThrowsList(bolt_throws_list, z_size);
    }
}



module drawThrowsList(throws_coords_list, z_size) {
    for (coords = throws_coords_list)
        translateBreadboard(coords[0], coords[1])
            bolt();
}



module controllerBreadboardBorder(
    facade_x_points,
    facade_y_points,
    z_size,
    border_margin_size_x,
    border_margin_size_y,
    rounded_border_1,
    rounded_border_2
) {
    roundedPane(
        [
            getSizeFromPointCount(facade_x_points) + border_margin_size_x * 2,
            getSizeFromPointCount(facade_y_points) + border_margin_size_y * 2,
            z_size,
        ],
        rounded_border_1,
        rounded_border_2
    );
}



module controllerBreadboardBorderDecoractor(
    facade_x_points,
    facade_y_points,
    z_size,
    border_margin_size_x,
    border_margin_size_y,
    rounded_border_1,
    rounded_border_2,
) {
    union() {
        translate([-border_margin_size_x, -border_margin_size_y])
            difference() {
                controllerBreadboardBorder(
                    facade_x_points = facade_x_points,
                    facade_y_points = facade_y_points,
                    z_size = z_size,
                    border_margin_size_x = border_margin_size_x,
                    border_margin_size_y = border_margin_size_y,
                    rounded_border_1 = rounded_border_1,
                    rounded_border_2 = rounded_border_2
                );

                translate([border_margin_size_x, border_margin_size_y, -z_size / 2])
                    cube(
                        [
                            getSizeFromPointCount(facade_x_points),
                            getSizeFromPointCount(facade_y_points),
                            z_size * 2,
                        ]
                    );
            }
        children();
    }
}
