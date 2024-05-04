use <./subpieces/round-button.scad>

include <../configurations/global.scad>


/**
 * abButtonPiece
 * @name abButtonPiece
 * @description Gamepad A and B buttons
 * @type piece
 * @parent gamePadComponent
 * @stl
 */
module abButtonPiece(
    diameter = controller_a_b_button_diameter,
    button_z_size = controller_a_b_button_z_size,
    support_diameter = controller_a_b_button_support_diameter,
    support_z_size = controller_a_b_button_support_z_size,
    $fn = controller_a_b_button_fn
) {

    color("Crimson")
        roundButton(
            diameter,
            button_z_size,
            support_diameter,
            support_z_size,
            $fn = $fn
        );
}

abButtonPiece();