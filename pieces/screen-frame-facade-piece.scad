include <../assets/lcd-screen/configurations.scad>
include <../configurations/global.scad>

use <../enveloppes/screen-enveloppe.scad>


module screenFrameFacadePiece(
    electronic_board_x_size = screen_asset_electronic_board_x_size,
    electronic_board_y_size = screen_asset_electronic_board_y_size,

    screen_frame_electronic_board_margin = screen_frame_electronic_board_margin,
    screen_frame_z_size = screen_frame_facade_piece_z_size,
    throw_diameter = screen_frame_throw_diameter,
    $fn = screen_frame_fn
) {

    left_margin = screen_frame_electronic_board_margin;
    right_margin = screen_frame_electronic_board_margin;
    top_margin = screen_frame_electronic_board_margin;
    bottom_margin = screen_frame_electronic_board_margin;

    throws_z_size = 20;

    bottom_part_z = 0.2;
    top_part_z = 0.1;
    top_part_throws_x_y_margin = 0;

    difference() {
        hull() {
            translate([-left_margin, -bottom_margin, 0])
                cube(
                    [
                        electronic_board_x_size + left_margin + right_margin,
                        electronic_board_y_size + top_margin + bottom_margin,
                        bottom_part_z
                    ]
                );

            translate([
                -top_part_throws_x_y_margin,
                -top_part_throws_x_y_margin,
                screen_frame_z_size - top_part_z
            ])
                cube(
                    [
                        electronic_board_x_size + top_part_throws_x_y_margin * 2,
                        electronic_board_y_size + top_part_throws_x_y_margin * 2,
                        top_part_z
                    ]
                );
        }

        translate([0,0, -throws_z_size / 2])
            sceenVisibleZoneCube(
                z_size = throws_z_size
            );

        screenFixationThrows(
            throw_diameter = throw_diameter,
            $fn = $fn
        );        
    }
}


screenFrameFacadePiece();
