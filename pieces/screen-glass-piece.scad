include <../assets/lcd-screen/configurations.scad>
use <../enveloppes/screen-enveloppe.scad>

module screenGlassPiece(
    visible_zone_x_margin = 0.7,
    visible_zone_y_margin = 0.7,
    z_size = 1
) {
    color("LightGray", 0.5)
        sceenVisibleZoneCube(
            x_margin = visible_zone_x_margin,
            y_margin = visible_zone_y_margin,
            z_size = 1
        );
}

screenGlassPiece();