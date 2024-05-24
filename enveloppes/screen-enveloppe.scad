include <../assets/lcd-screen/configurations.scad>

use <../libraries/commons.scad>

/**
 * screenFixationThrows
 * @name screenFixationThrows
 * @description screenFixationThrows
 * @type enveloppe
 * @parent root
 */
module screenFixationThrows(
    electronic_board_x_size = screen_asset_electronic_board_x_size,
    electronic_board_y_size = screen_asset_electronic_board_y_size,
    x_margin_left = screen_asset_x_margin_throws_left,
    x_margin_right = screen_asset_x_margin_throws_right,
    y_margin_top = screen_asset_y_margin_throws_top,
    y_margin_bottom = screen_asset_y_margin_throws_bottom,
    throw_diameter = 3.1,
    $fn = $fn
) {

    throws_z_size = 20;

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


/**
 * screenMainThrow
 * @name screenMainThrow
 * @description screenMainThrow
 * @type enveloppe
 * @parent root
 */
module screenMainThrow(
    electronic_board_x_size = screen_asset_electronic_board_x_size,
    electronic_board_y_size = screen_asset_electronic_board_y_size,
    screen_external_x_size = screen_asset_screen_external_x_size,
    screen_external_y_size = screen_asset_screen_external_y_size,
    screen_throw_x_margin = 2.8,
    screen_throw_y_margin = 0.5
) {

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

/**
 * screenConnectorThrow
 * @name screenConnectorThrow
 * @description screenConnectorThrow
 * @type enveloppe
 * @parent root
 */
module screenConnectorThrow(
    electronic_board_y_size = screen_asset_electronic_board_y_size
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

/**
 * sceenVisibleZoneCube
 * @name sceenVisibleZoneCube
 * @description sceenVisibleZoneCube
 * @type enveloppe
 * @parent root
 */
module sceenVisibleZoneCube(
    x_margin = 0,
    y_margin = 0,
    z_size = 0,

    electronic_board_x_size = screen_asset_electronic_board_x_size,
    electronic_board_y_size = screen_asset_electronic_board_y_size,
    screen_external_x_size = screen_asset_screen_external_x_size,
    screen_external_y_size = screen_asset_screen_external_y_size,
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
