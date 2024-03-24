use <../assets/lcd-screen/screen.scad>
use <../enveloppes/screen-enveloppe.scad>
use <../pieces/screen-frame-piece.scad>
use <../pieces/screen-frame-facade-piece.scad>
use <../pieces/screen-glass-piece.scad>

include <../configurations/global.scad>
include <../assets/lcd-screen/configurations.scad>


module screenComponent(
    electronic_board_z_size = screen_asset_electronic_board_z_size,
    panes_thickness = case_external_panes_thickness,
    frame_piece_z_size = screen_frame_piece_z_size,
    frame_piece_glass_embedding_z_depth = screen_frame_piece_glass_embedding_z_depth
) {

    translate([0, 0, -0.01])
        screen($fn = 100);

    translate([0, 0, panes_thickness + electronic_board_z_size])
        color("DarkSlateGray")
            screenFramePiece();

    translate(
        [
            0,
            0,
            panes_thickness + electronic_board_z_size + (frame_piece_z_size - frame_piece_glass_embedding_z_depth) + 0.01
        ]
    )
        screenGlassPiece();


    translate(
        [
            0,
            0,
            panes_thickness + electronic_board_z_size + frame_piece_z_size
        ]
    )
        color("DarkSlateGray")
            screenFrameFacadePiece();
}


screenComponent();