include <../configurations/global.scad>
include <../assets/usb-charger/configurations.scad>
use <../assets/usb-charger/usb-charger.scad>


module usbChargerComponent(
    usb_charger_asset_electronic_card_x_size = usb_charger_asset_electronic_card_x_size,
    usb_charger_asset_electronic_card_y_size = usb_charger_asset_electronic_card_y_size,
    usb_charger_asset_electronic_card_z_size = usb_charger_asset_electronic_card_z_size,
) {


    // support_total_x_size = usb_charger_asset_electronic_card_x_size;
    // support_total_y_size = usb_charger_asset_electronic_card_y_size;
    // support_total_z_size = usb_charger_asset_electronic_card_z_size;
    usb_charger_asset_usb_port_y_offset = -1.36;

    support_total_x_size = 17.57 + 4;  // 17.57
    support_total_y_size = 27.85 + 4;  // 27.85
    support_total_z_size = 2;  // 0.87

    encaps_x_size = 17.57 + 1;
    encaps_y_size = 27.85 + 1;
    encaps_z_size = 1;

    translate([
        (support_total_x_size - usb_charger_asset_electronic_card_x_size) / 2,
        abs(usb_charger_asset_usb_port_y_offset),
        support_total_z_size - encaps_z_size
    ])
        #usbCharger();


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

    }

    facade_z_size = 9;

    facade_x_fixation_spacing = 32;
    throw_diam = 3;
    fadace_fn = 100;

    // facade
 
    translate([
        -(facade_x_fixation_spacing - support_total_x_size) / 2,
        0,
        facade_z_size / 2 - 1,
    ])
        rotate([-90, 0, 0])

            difference() {
                hull() {
                    cylinder(h = abs(usb_charger_asset_usb_port_y_offset), d = facade_z_size, $fn = fadace_fn);
                    translate([facade_x_fixation_spacing, 0, 0])
                        cylinder(h = abs(usb_charger_asset_usb_port_y_offset), d = facade_z_size, $fn = fadace_fn);

                }

                cylinder(h = abs(usb_charger_asset_usb_port_y_offset) * 4, d = throw_diam, center = true, $fn = fadace_fn);
                
                translate([facade_x_fixation_spacing, 0, 0])
                    cylinder(h = abs(usb_charger_asset_usb_port_y_offset) * 4, d = throw_diam, center = true, $fn = fadace_fn);
            

            }




}

usbChargerComponent();