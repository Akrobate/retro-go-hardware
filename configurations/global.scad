housing_facades_throws_diameter = 3.8;

// external size
case_external_x_size = 90;
case_external_y_size = 140;
case_external_z_size = 38;
case_external_panes_thickness = 4.8;

facade_front_round_edges_radius = 5;
facade_throws_margin = 5;

facade_front_fixation_throws_diameter = housing_facades_throws_diameter;

// facade corners
facade_corners_offset_lenght = 9;
facade_corners_main_x_size = 19;
facade_corners_main_y_size = 19;
facade_corners_main_thickness = 11;

facade_fn = 100;


facade_controller_coords = [
    case_external_x_size / 2,
    case_external_y_size / 2 - 30,
];


// Screen frames
screen_frame_electronic_board_margin = 3;
screen_frame_throw_diameter = 3.5;
screen_frame_piece_z_size = 1.5;
screen_frame_piece_glass_embedding_margin = 1;
screen_frame_piece_glass_embedding_z_depth = 1;
screen_frame_facade_piece_z_size = 1;
screen_frame_fn = 100;

screen_glass_visible_zone_x_margin = 0.7;
screen_glass_visible_zone_y_margin = 0.7;
screen_glass_z_size = 1;

facade_screen_coords = [
    case_external_x_size / 2,
    case_external_y_size / 2 + 28,
];


// Generics
insert_throw_diameter = 4.2;
insert_throw_length = 6 + 2;


// Controller facade
controller_breadboard_x_size_point = 28;
controller_breadboard_y_size_point = 9;

controller_facade_z_size = 2;
controller_facade_button_throw_margin = 1;

controller_facade_border_rounded_border_1 = 5;
controller_facade_border_rounded_border_2 = 4;

controller_facade_with_border_x_size = 82;
controller_facade_with_border_y_size = 47;

controller_facade_border_throws_margin = 5;
controller_braidboard_throw_margin = 1;

controller_facade_border_fn = 80;


// Cross Button
controller_cross_button_x_y_size = 20;
controller_cross_button_z_size = 4;
controller_cross_button_thickness = 6;
controller_cross_button_round_edges_radius = 1;
controller_cross_button_support_x_y_size = 22;
controller_cross_button_support_z_size = 1;
controller_cross_button_fn = 150;


// A and B Buttons
controller_a_b_button_diameter = 7;
controller_a_b_button_z_size = 4;
controller_a_b_button_support_diameter = 9;
controller_a_b_button_support_z_size = 1;
controller_a_b_button_fn = 80;


// small Buttons
controller_small_button_diameter = 5;
controller_small_button_z_size = 3;
controller_small_button_support_diameter = 7;
controller_small_button_support_z_size = 1;
controller_small_button_fn = 80;

// Directional cross
controller_directional_cross_points_coords = [6, 5];
controller_start_button_points_coords = [14, 3];
controller_select_button_points_coords = [18, 3];
controller_menu_button_points_coords = [14, 7];
controller_option_button_points_coords = [18, 7];
controller_a_button_points_coords = [23, 4];
controller_b_button_points_coords = [27, 6];
controller_bolt_throws_list = [
    [2, 2],
    [2, 8],
    [10, 2],
    [10, 8],
    [27, 2],
    [23, 8],
];


// usb charger holder
usb_charger_support_total_x_size = 17.57 + 15;
usb_charger_support_total_y_size = 12;
usb_charger_support_total_z_size = 2;


usb_charger_fixation_support_z_size = 4.5;
usb_charger_encaps_x_size = 17.57 + 1;
usb_charger_encaps_y_size = 27.85 + 1;
usb_charger_encaps_z_size = 1;

usb_charger_facade_x_fixation_spacing = 42;
usb_charger_facade_y_size = 1.36;
usb_charger_facade_z_size = 14;

usb_charger_throw_diameter = 3.5;
usb_charger_facade_holder_z_offset = 3.5; //
usb_charger_fixation_facade_y_margin = 0.5;
usb_charger_throw_offset_y = 4.5;
usb_charger_throw_offset_x = 3.5;
usb_charger_fadace_fn = 100;

usb_charger_external_facade_main_throw_margin = 2;
usb_charger_external_facade_main_throw_diameter = 3.5;

usb_charger_coords = [
    28, 15
];


facade_top_on_off_button_throw_diameter = 10;

facade_top_on_off_button_coords = [
    case_external_x_size / 2 + 18,
    case_external_z_size / 2
];


// Bolt join Piece
bolt_join_mother_board_internal_diameter = 3.5;
bolt_join_mother_board_external_diameter = 3.5 + (0.4 * 6);
bolt_join_mother_board_height = 3;

bolt_join_game_pad_internal_diameter = 3.5;
bolt_join_game_pad_external_diameter = 3.5 + (0.4 * 6);
bolt_join_game_pad_height = 8 - 1.5;

bolt_join_fn = 500;


// Mother board breadboard
mother_board_x_size_point = 25;
mother_board_y_size_point = 32;

mother_board_coords = [
    case_external_x_size / 2 - ((mother_board_x_size_point+1) * 2.54) / 2,
    44,
    3
];

mother_board_bolt_throws_list = [
    [3, 2],
    [3, 17],
    [23, 2],
    [23, 17],
];


// Speaker
speaker_facade_throw_diameter = 28 + 1;
speaker_facade_z_size = 1.36;
speaker_facade_rounded_radius = 5;
