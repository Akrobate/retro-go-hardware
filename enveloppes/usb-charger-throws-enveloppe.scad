include <../configurations/global.scad>

/**
 * usbChargerThrowsEnveloppe
 * @name usbChargerThrowsEnveloppe
 * @description usbChargerThrowsEnveloppe
 * @type enveloppe
 * @parent root
 */
module usbChargerThrowsEnveloppe(
    case_external_panes_thickness = case_external_panes_thickness,
    support_total_x_size = usb_charger_support_total_x_size,

    facade_z_size = usb_charger_facade_z_size,
    facade_x_fixation_spacing = usb_charger_facade_x_fixation_spacing,
    facade_holder_z_offset = usb_charger_facade_holder_z_offset,

    usb_charger_external_facade_main_throw_margin = usb_charger_external_facade_main_throw_margin,
    usb_charger_external_facade_main_throw_diameter = usb_charger_external_facade_main_throw_diameter

) {

    translate([
        -(facade_x_fixation_spacing - support_total_x_size) / 2,
        0,
        facade_z_size / 2 - facade_holder_z_offset,
    ]) {
        rotate([-90, 0, 0]) {
            cylinder(h = case_external_panes_thickness * 4, d = usb_charger_external_facade_main_throw_diameter, center = true, $fn = 100);

            translate([facade_x_fixation_spacing, 0, 0])
                cylinder(h = case_external_panes_thickness * 4, d = usb_charger_external_facade_main_throw_diameter, center = true, $fn = 100);
        }
    }

    translate([
        0 - usb_charger_external_facade_main_throw_margin,
        -case_external_panes_thickness * 2,
        0 - usb_charger_external_facade_main_throw_margin]
    )
        cube([
            support_total_x_size + usb_charger_external_facade_main_throw_margin * 2,
            case_external_panes_thickness * 4,
            usb_charger_support_total_z_size
                + usb_charger_fixation_support_z_size
                + usb_charger_external_facade_main_throw_margin * 2,
        ]);
}