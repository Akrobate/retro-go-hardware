include <../configurations/global.scad>
include <../assets/usb-charger/configurations.scad>
use <../assets/usb-charger/usb-charger.scad>

use <../pieces/usb-charger-fixation-piece.scad>
use <../pieces/usb-charger-facade-holder-piece.scad>

module usbChargerComponent(
    support_total_x_size = usb_charger_support_total_x_size,
    support_total_z_size = usb_charger_support_total_z_size,
    encaps_z_size = usb_charger_encaps_z_size,
    fixation_facade_y_margin = usb_charger_fixation_facade_y_margin,
    usb_charger_asset_electronic_card_x_size = usb_charger_asset_electronic_card_x_size,
    usb_charger_asset_usb_port_y_offset = usb_charger_asset_usb_port_y_offset,
) {

    translate([
        (support_total_x_size - usb_charger_asset_electronic_card_x_size) / 2,
        abs(usb_charger_asset_usb_port_y_offset),
        support_total_z_size - encaps_z_size
    ])
        usbCharger();

    usbChargerFacadeHolderPiece();

    
    // circuit fixation
    translate([
        0,
        abs(usb_charger_asset_usb_port_y_offset) + fixation_facade_y_margin,
        support_total_z_size
    ])
        color("Yellow")
        usbChargerFixationPiece();
}

usbChargerComponent();