
use <./breadboard.scad>
use <../../libraries/electronics.scad>
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

        drawThrowsListByBreadbordCoords(bolt_throws_list);
    }
}



module drawThrowsListByBreadbordCoords(throws_coords_list) {
    for (coords = throws_coords_list)
        translateBreadboard(coords[0], coords[1])
            bolt();
}


module drawThrowsList(throws_coords_list) {
    for (coords = throws_coords_list)
        translate([coords[0], coords[1], 0])
            bolt();
}


module controllerBreadboardBorderDecoractor(
    facade_x_points,
    facade_y_points,
    z_size,
    facade_with_border_x_size,
    facade_with_border_y_size,
    rounded_border_1,
    rounded_border_2,
    border_throws_margin = 0,
    $fn,
) {

    border_margin_size_x = (facade_with_border_x_size - getSizeFromPointCount(facade_x_points)) / 2;
    border_margin_size_y = (facade_with_border_y_size - getSizeFromPointCount(facade_y_points)) / 2;

    echo("facade_with_border_x_size", facade_with_border_x_size);
    echo("facade_with_border_y_size", facade_with_border_y_size);

    union() {
        difference() {
            //color("red")
                roundedPane(
                    [facade_with_border_x_size, facade_with_border_y_size, z_size],
                    rounded_border_1,
                    rounded_border_2,
                    $fn = $fn
                );

            translate([border_margin_size_x, border_margin_size_y, -z_size / 2])
                cube(
                    [
                        getSizeFromPointCount(facade_x_points),
                        getSizeFromPointCount(facade_y_points),
                        z_size * 2,
                    ]
                );

            if (border_throws_margin > 0)
                drawThrowsList([
                    [border_throws_margin, border_throws_margin],
                    [facade_with_border_x_size - border_throws_margin, border_throws_margin],
                    [border_throws_margin, facade_with_border_y_size - border_throws_margin],
                    [facade_with_border_x_size - border_throws_margin, facade_with_border_y_size - border_throws_margin],
                    [facade_with_border_x_size / 2, facade_with_border_y_size - border_throws_margin],
                    [facade_with_border_x_size / 2, border_throws_margin],
                ]);

        }
        translate([border_margin_size_x, border_margin_size_y])
            children();
    }
}
