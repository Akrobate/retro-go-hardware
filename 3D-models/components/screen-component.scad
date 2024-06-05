use <../assets/lcd-screen/screen.scad>
use <../enveloppes/screen-enveloppe.scad>
use <../pieces/screen-frame-piece.scad>
use <../pieces/screen-frame-facade-piece.scad>
use <../pieces/screen-glass-piece.scad>

include <../configurations/global.scad>
include <../assets/lcd-screen/configurations.scad>


/**
 * screenComponent
 * @name screenComponent
 * @description Screen, screenholder and screen glass component
 * @type component
 * @parent root
 */
module screenComponent(
    electronic_board_z_size = screen_asset_electronic_board_z_size,
    panes_thickness = case_external_panes_thickness,
    frame_piece_z_size = screen_frame_piece_z_size,
    frame_piece_glass_embedding_z_depth = screen_frame_piece_glass_embedding_z_depth
) {

    epsilone = 0.01;
    screenFramePiece_z_position = panes_thickness + electronic_board_z_size;
    screenFrameFacadePiece_z_position = screenFramePiece_z_position + frame_piece_z_size;
    screenGlassPiece_z_position = screenFrameFacadePiece_z_position - frame_piece_glass_embedding_z_depth + epsilone;

    translate([0, 0, -epsilone])
        screen($fn = 100);

    translate([0, 0, screenFramePiece_z_position])
        color("DarkSlateGray")
            screenFramePiece();

    translate([0, 0, screenGlassPiece_z_position])
        screenGlassPiece();

    translate([0, 0, screenFrameFacadePiece_z_position])
        color("DarkSlateGray")
            screenFrameFacadePiece();
}


screenComponent();