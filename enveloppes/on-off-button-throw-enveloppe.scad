include <../configurations/global.scad>

/**
 * onOffButtonThrowEnveloppe
 * @name onOffButtonThrowEnveloppe
 * @description onOffButtonThrowEnveloppe
 * @type enveloppe
 * @parent root
 */
module onOffButtonThrowEnveloppe(
    z_size = case_external_panes_thickness * 2,
    throw_diameter = facade_top_on_off_button_throw_diameter
) {
    cylinder(h = z_size, d = throw_diameter, center = true, $fn = $fn);
}
