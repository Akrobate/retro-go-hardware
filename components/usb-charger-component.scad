include <../configurations/global.scad>
include <../assets/usb-charger/configurations.scad>
use <../assets/usb-charger/usb-charger.scad>


module usbChargerComponent(
    usb_charger_asset_electronic_card_x_size = usb_charger_asset_electronic_card_x_size,
    usb_charger_asset_electronic_card_y_size = usb_charger_asset_electronic_card_y_size,
    usb_charger_asset_electronic_card_z_size = usb_charger_asset_electronic_card_z_size,
) {

    translate([0,0,5])
        #usbCharger();

    // support_total_x_size = usb_charger_asset_electronic_card_x_size;
    // support_total_y_size = usb_charger_asset_electronic_card_y_size;
    // support_total_z_size = usb_charger_asset_electronic_card_z_size;


    support_total_x_size = 17.57 + 4;  // 17.57
    support_total_y_size = 27.85 + 4;  // 27.85
    support_total_z_size = 2;  // 0.87

    encaps_x_size = 17.57 + 1;
    encaps_y_size = 27.85 + 1;
    encaps_z_size = 1;


    difference() {
        cube([
            support_total_x_size,
            support_total_y_size,
            support_total_z_size,
        ]);
            translate([
                (support_total_x_size - encaps_x_size) / 2,
                (support_total_y_size - encaps_y_size) / 2,
                support_total_z_size - encaps_z_size
            ])
                cube([
                    encaps_x_size,
                    encaps_y_size,
                    4,
                ]);

    }
}

usbChargerComponent();