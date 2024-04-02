include <../configurations/global.scad>
include <../assets/usb-charger/configurations.scad>
use <../enveloppes/usb-c-connector-enveloppe.scad>
use <../enveloppes/bolt.scad>

module usbChargerFacadeHolderPiece(
    support_total_x_size = usb_charger_support_total_x_size,
    support_total_y_size = usb_charger_support_total_y_size,
    support_total_z_size = usb_charger_support_total_z_size,

    encaps_x_size = usb_charger_encaps_x_size,
    encaps_y_size = usb_charger_encaps_y_size,
    encaps_z_size = usb_charger_encaps_z_size,

    facade_z_size = usb_charger_facade_z_size,
    facade_y_size = usb_charger_facade_y_size,
    facade_x_fixation_spacing = usb_charger_facade_x_fixation_spacing,
    throw_diameter = usb_charger_throw_diameter,

    facade_holder_z_offset = usb_charger_facade_holder_z_offset,

    throw_offset_y = usb_charger_throw_offset_y,
    throw_offset_x = usb_charger_throw_offset_x,
    fadace_fn = usb_charger_fadace_fn,

    usb_charger_asset_electronic_card_x_size = usb_charger_asset_electronic_card_x_size,
    usb_charger_asset_electronic_card_z_size = usb_charger_asset_electronic_card_z_size,

    usb_charger_asset_usb_port_y_offset = usb_charger_asset_usb_port_y_offset,
    usb_charger_asset_usb_port_z_size = usb_charger_asset_usb_port_z_size  
) {

    FIXATION_FOR_FLAT_HEAD_BOLT = false;


    difference() {
        union() {
            // circuit support
            difference() {
                cube([
                    support_total_x_size,
                    support_total_y_size,
                    support_total_z_size,
                ]);
                translate([
                    (support_total_x_size - encaps_x_size) / 2,
                    abs(usb_charger_asset_usb_port_y_offset),
                    support_total_z_size - encaps_z_size
                ])
                    cube([
                        encaps_x_size,
                        encaps_y_size,
                        4,
                    ]);

                translate([
                    throw_offset_x,
                    abs(usb_charger_asset_usb_port_y_offset) + throw_offset_y,
                    0
                ]) {
                    
                    translate([0, 0, 2])
                        rotate([-180,0,0])
                            if (FIXATION_FOR_FLAT_HEAD_BOLT) {
                                bolt($fn = 100);
                            } else {
                                cylinder(h = support_total_z_size * 4, d = throw_diameter, center = true, $fn = fadace_fn);
                            }
                }           
                    
                translate([
                    support_total_x_size - throw_offset_x,
                    abs(usb_charger_asset_usb_port_y_offset) + throw_offset_y,
                    0
                ]) {
                    
                    translate([0, 0, 2])
                        rotate([-180,0,0])
                            if (FIXATION_FOR_FLAT_HEAD_BOLT) {
                                bolt($fn = 100);
                            } else {
                                cylinder(h = support_total_z_size * 4, d = throw_diameter, center = true, $fn = fadace_fn);
                            }
                }
            }

            // facade
            translate([
                -(facade_x_fixation_spacing - support_total_x_size) / 2,
                0,
                facade_z_size / 2 - facade_holder_z_offset,
            ])
                rotate([-90, 0, 0])

                    difference() {
                        hull() {
                            cylinder(h = abs(usb_charger_asset_usb_port_y_offset), d = facade_z_size, $fn = fadace_fn);
                            translate([facade_x_fixation_spacing, 0, 0])
                                cylinder(h = abs(usb_charger_asset_usb_port_y_offset), d = facade_z_size, $fn = fadace_fn);

                        }

                        cylinder(h = abs(usb_charger_asset_usb_port_y_offset) * 4, d = throw_diameter, center = true, $fn = fadace_fn);
                        
                        translate([facade_x_fixation_spacing, 0, 0])
                            cylinder(h = abs(usb_charger_asset_usb_port_y_offset) * 4, d = throw_diameter, center = true, $fn = fadace_fn);
                    
                    }
        }

        translate([
            usb_charger_asset_usb_port_x_offset
                + (support_total_x_size - usb_charger_asset_electronic_card_x_size) / 2
                + usb_charger_asset_usb_port_x_size / 2,
            2,
            support_total_z_size - encaps_z_size + usb_charger_asset_electronic_card_z_size
                + usb_charger_asset_usb_port_z_size / 2
        ])
            usbCConnectorEnveloppe(
                usb_port_x_size = usb_charger_asset_usb_port_x_size + 2,
                usb_port_y_size = usb_charger_asset_usb_port_y_size,
                usb_port_z_size = usb_charger_asset_usb_port_z_size + 2
            );

    }

}

rotate([90,0,0])
    usbChargerFacadeHolderPiece();