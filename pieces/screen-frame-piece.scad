include <../assets/lcd-screen/configurations.scad>

use <../enveloppes/screen-enveloppe.scad>

module screenFramePiece(
    electronic_board_x_size = screen_asset_electronic_board_x_size,
    electronic_board_y_size = screen_asset_electronic_board_y_size,

    screen_frame_electronic_board_margin = 3,
    screen_frame_z_size = 1.5,
    glass_embedding_margin = 1,
    glass_embedding_z_depth = 1,

    throw_diameter = 3.1,

    $fn = 100
) {

    left_margin = screen_frame_electronic_board_margin;
    right_margin = screen_frame_electronic_board_margin;
    top_margin = screen_frame_electronic_board_margin;
    bottom_margin = screen_frame_electronic_board_margin;

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

        screenFixationThrows(
            throw_diameter = throw_diameter,
            $fn = $fn
        );
        
    }
}


screenFramePiece();
