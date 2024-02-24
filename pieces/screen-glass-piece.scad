include <../assets/lcd-screen/configurations.scad>
include <../configurations/global.scad>

use <../enveloppes/screen-enveloppe.scad>

module screenGlassPiece(
    visible_zone_x_margin = screen_glass_visible_zone_x_margin,
    visible_zone_y_margin = screen_glass_visible_zone_y_margin,
    z_size = screen_glass_z_size
) {
    color("LightGray", 0.5)
        sceenVisibleZoneCube(
            x_margin = visible_zone_x_margin,
            y_margin = visible_zone_y_margin,
            z_size = z_size
        );
}

screenGlassPiece();