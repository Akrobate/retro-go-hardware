use <./subpieces/round-button.scad>


module abButtonPiece(
    diameter,
    button_z_size,
    support_diameter,
    support_z_size,
    $fn
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