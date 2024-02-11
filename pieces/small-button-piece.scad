use <./subpieces/round-button.scad>


module smallButtonPiece(
    diameter,
    button_z_size,
    support_diameter,
    support_z_size,
    $fn
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