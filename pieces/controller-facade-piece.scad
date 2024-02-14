use <./subpieces/controller-breadboard-facade.scad>

include <../configurations/global.scad>

module controllerFacadePiece(
    breadboard_x_size_point = controller_breadboard_x_size_point,
    breadboard_y_size_point = controller_breadboard_y_size_point,
    z_size = controller_facade_z_size,
    
    facade_with_border_x_size = controller_facade_with_border_x_size,
    facade_with_border_y_size = controller_facade_with_border_y_size,

    border_rounded_border_1 = controller_facade_border_rounded_border_1,
    border_rounded_border_2 = controller_facade_border_rounded_border_2,
    border_throws_margin = controller_facade_border_throws_margin,
    border_fn = controller_facade_border_fn,
    
    button_throw_margin = controller_facade_button_throw_margin,
    cross_button_x_y_size = controller_cross_button_x_y_size,
    cross_button_thickness = controller_cross_button_thickness,
    cross_button_round_edges_radius = controller_cross_button_round_edges_radius,
    a_b_button_diameter = controller_a_b_button_diameter,
    a_b_button_z_size = controller_a_b_button_z_size,
    small_button_diameter = controller_small_button_diameter,
    small_button_z_size = controller_small_button_z_size,
    directional_cross_points_coords = controller_directional_cross_points_coords,
    start_button_points_coords = controller_start_button_points_coords,
    select_button_points_coords = controller_select_button_points_coords,
    menu_button_points_coords = controller_menu_button_points_coords,
    option_button_points_coords = controller_option_button_points_coords,
    a_button_points_coords = controller_a_button_points_coords,
    b_button_points_coords = controller_b_button_points_coords,
    bolt_throws_list = controller_bolt_throws_list,
) {

        controllerBreadboardBorderDecoractor(
            facade_x_points = breadboard_x_size_point,
            facade_y_points = breadboard_y_size_point,

            z_size = z_size,
            facade_with_border_x_size = facade_with_border_x_size,
            facade_with_border_y_size = facade_with_border_y_size,

            rounded_border_1 = border_rounded_border_1,
            rounded_border_2 = border_rounded_border_2,
            border_throws_margin = border_throws_margin,
            $fn = border_fn
        )
            controllerBreadboardFacade(
                x_points = breadboard_x_size_point,
                y_points = breadboard_y_size_point,
                z_size = z_size,
                directional_cross_points_coords = directional_cross_points_coords,
                start_button_points_coords = start_button_points_coords,
                select_button_points_coords = select_button_points_coords,
                menu_button_points_coords = menu_button_points_coords,
                option_button_points_coords = option_button_points_coords,
                a_button_points_coords = a_button_points_coords,
                b_button_points_coords = b_button_points_coords,
                
                cross_button_x_y_size = cross_button_x_y_size + button_throw_margin,
                cross_button_thickness = cross_button_thickness + button_throw_margin,
                cross_button_round_edges_radius = cross_button_round_edges_radius,
                a_b_button_diameter = a_b_button_diameter + button_throw_margin,
                small_button_diameter = small_button_diameter + button_throw_margin,

                bolt_throws_list = bolt_throws_list,
                $fn = 100
            );

        
}


controllerFacadePiece();