use <./assets/lcd-screen/screen.scad>

use <./libraries/commons.scad>

include <./configurations/global.scad>
include <./assets/lcd-screen/configurations.scad>


/*
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

*/

module screenFixationThrows(
    // screen configurations
    electronic_board_x_size = electronic_board_x_size,
    electronic_board_y_size = electronic_board_y_size,
    x_margin_left = x_margin_left,
    x_margin_right = x_margin_right,
    y_margin_top = y_margin_top,
    y_margin_bottom = y_margin_bottom,
    $fn = $fn
) {

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
            cylinder(h = throws_z_size, d = throw_diameter, center = false, $fn = $fn);
}


module screenMainThrow(
    electronic_board_x_size = electronic_board_x_size,
    electronic_board_y_size = electronic_board_y_size,
    screen_external_x_size = screen_external_x_size,
    screen_external_y_size = screen_external_y_size,  
) {

    screen_throw_x_margin = 2.8;
    screen_throw_y_margin = 0.5;

    throws_z_size = 20;

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
}


module screenConnectorThrow(
    electronic_board_y_size = electronic_board_y_size
) {
    throws_z_size = 20;

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


module sceenVisibleZoneCube(
    x_margin = 0,
    y_margin = 0,
    z_size = 0,

    electronic_board_x_size = electronic_board_x_size,
    electronic_board_y_size = electronic_board_y_size,
    screen_external_x_size = screen_external_x_size,
    screen_external_y_size = screen_external_y_size,
) {

    translate([
        (electronic_board_x_size - screen_external_x_size) / 2 + 1 - x_margin,
        (electronic_board_y_size - screen_external_y_size) / 2 + 1 - y_margin,
        0
    ])
        cube(
            [
                screen_external_x_size - 1 - 6.5 + (x_margin * 2),
                screen_external_y_size - 1 - 1 + (y_margin * 2),
                z_size,
            ]
        );
}




module screenFrame(
    electronic_board_x_size = electronic_board_x_size,
    electronic_board_y_size = electronic_board_y_size,


) {

    margin = 3;

    left_margin = margin;
    right_margin = margin;
    top_margin = margin;
    bottom_margin = margin;

    screen_frame_z_size = 2;

    glass_embedding_margin = 1;
    glass_embedding_z_depth = 1;

    throws_z_size = 20;

    difference() {
        translate([-left_margin, -bottom_margin, 0])
            cube(
                [
                    electronic_board_x_size + left_margin + right_margin,
                    electronic_board_y_size + top_margin + bottom_margin,
                    screen_frame_z_size
                ]
            );

        translate([0,0, -throws_z_size / 2])
            sceenVisibleZoneCube(
                z_size = throws_z_size
            );


        // Embedding glass
        translate([0,0, screen_frame_z_size - glass_embedding_z_depth])
            sceenVisibleZoneCube(
                x_margin = glass_embedding_margin,
                y_margin = glass_embedding_margin,
                z_size = glass_embedding_z_depth + 0.01
            );

        // Glass embedding
        
    }
}



translate([0,0,-0.01])
    screen($fn = 100);

difference() {
    translate([-15,-30, 1.25])
        color("SaddleBrown")
            cube([100, 100, 4.8]);

    screenFixationThrows($fn = 100);
    screenMainThrow();
    screenConnectorThrow();
}

translate([0, 0, 4.8 + 1.25])
    screenFrame();
