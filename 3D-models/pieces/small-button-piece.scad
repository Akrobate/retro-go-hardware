use <./subpieces/round-button.scad>

include <../configurations/global.scad>

/**
 * smallButtonPiece
 * @name smallButtonPiece
 * @description Cross button of gamepad
 * @type piece
 * @parent gamePadComponent
 * @stl
 */
module smallButtonPiece(
    diameter = controller_small_button_diameter,
    button_z_size = controller_small_button_z_size,
    support_diameter = controller_small_button_support_diameter,
    support_z_size = controller_small_button_support_z_size,
    $fn = controller_small_button_fn
) {

    color("DarkSlateGray")
        roundButton(
            diameter,
            button_z_size,
            support_diameter,
            support_z_size,
            $fn = $fn
        );
}

smallButtonPiece();