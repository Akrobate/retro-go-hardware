use <./pieces/subpieces/screen.scad>
use <./pieces/subpieces/screen.scad>
use <./libraries/commons.scad>

include <./configurations/global.scad>





module screenThrows() {


    electronic_board_x_size = 72.25;
    electronic_board_y_size = 43.25;
    electronic_board_z_size = 1.25;

    screen_external_x_size = 60.25;
    screen_external_y_size = 42.7;
    screen_external_z_size = 4 - 1.25;

    x_margin_left = 1.6 + 1.55;
    x_margin_right = 1.5 + 1.55;
    y_margin_top = 1.55 + 1.55;
    y_margin_bottom = 1.4 + 1.55;

    screen_throw_x_margin = 2.8;
    screen_throw_y_margin = 0.5;


    throws_z_size = 20;
    throw_diameter = 3.1;


    offset_coords_throw_list = [
        [
            x_margin_left,
            y_margin_bottom,
        ],
        [
            x_margin_left,
            electronic_board_y_size - y_margin_top,
        ],
        [
            electronic_board_x_size - x_margin_right,
            electronic_board_y_size - y_margin_top,
        ],
        [
            electronic_board_x_size - x_margin_right,
            y_margin_bottom,
        ]
    ];

    // Fixations throws
    translate([0,0, -throws_z_size / 2])
        forEachCoord(offset_coords_throw_list)
            cylinder(h = throws_z_size, d = throw_diameter, center = false, $fn = 100);



    // Main screen throw
    translate([
        (electronic_board_x_size - screen_external_x_size) / 2 - screen_throw_x_margin,
        (electronic_board_y_size - screen_external_y_size) / 2 - screen_throw_y_margin,
        -throws_z_size / 2
    ])
        cube(
            [
                screen_external_x_size + (screen_throw_x_margin * 2),
                screen_external_y_size + (screen_throw_y_margin * 2),
                throws_z_size,
            ]
        );


    translate(
        [
            0.85 - (0.5 / 2),
            11.3,
            -throws_z_size / 2
        ]
    )
        cube(
            [
                2.5 + 0.5,
                electronic_board_y_size - (11.3 * 2),
                throws_z_size
            ]
        );
}


module screenFrame(
    electronic_board_x_size = 72.25,
    electronic_board_y_size = 43.25,
) {
    cube([electronic_board_x_size, electronic_board_y_size, 2]);
}



translate([0,0,-0.01])
    screen($fn = 100);

difference() {
    translate([-15,-30, 1.25])
        color("SaddleBrown")
            cube([100, 100, 4.8]);

    screenThrows();
}

translate([0, 0, 4.8 + 1.25])
    screenFrame();
