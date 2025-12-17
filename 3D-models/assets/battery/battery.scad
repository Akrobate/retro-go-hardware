include <./configurations.scad>

/**
 * battery
 * @name battery
 * @description battery
 * @type component
 * @parent root
 */
module battery(
    center = false,
) {
    color("red")
    cube([
        battery_x_size,
        battery_y_size,
        battery_z_size
    ], center = center);
}


battery();
