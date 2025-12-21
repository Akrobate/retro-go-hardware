include <./configurations.scad>

/**
 * roundButton
 * @name roundButton
 * @description Base method for creating buttons
 * @type Supbiece
 * @parent 
 */
module roundButton(
    diameter = round_button_1_diameter,
    button_z_size =round_button_1_z_size,
    support_diameter = round_button_1_support_diameter,
    support_z_size =round_button_1_support_z_size,
    $fn = round_button_1_fn
) {
    union() {
        translate([0, 0, support_z_size])
            cylinder(h = button_z_size, d = diameter, center = false, $fn = $fn);

        cylinder(h = support_z_size, d = support_diameter, center = false, $fn = $fn);
    }
}



roundButton($fn = 100);