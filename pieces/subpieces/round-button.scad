/**
 * roundButton
 * @name roundButton
 * @description Base method for creating buttons
 * @type Supbiece
 * @parent 
 */
module roundButton(
    diameter,
    button_z_size,
    support_diameter,
    support_z_size,
    $fn = $fn
) {
    union() {
        translate([0, 0, support_z_size])
            cylinder(h = button_z_size, d = diameter, center = false, $fn = $fn);

        cylinder(h = support_z_size, d = support_diameter, center = false, $fn = $fn);
    }
}