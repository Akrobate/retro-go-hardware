include <../configurations/global.scad>
include <../assets/usb-charger/configurations.scad>

/**
 * usbChargerFacadeHolderPiece
 * @name usbChargerFacadeHolderPiece
 * @description Usb charger fixation to facade holder piece
 * @type component
 * @parent usbChargerComponent
 */
module usbChargerFixationPiece(
    support_total_x_size = usb_charger_support_total_x_size,
    support_total_y_size = usb_charger_support_total_y_size - abs(usb_charger_asset_usb_port_y_offset) - usb_charger_fixation_facade_y_margin,
    support_total_z_size = usb_charger_fixation_support_z_size,
    encaps_x_size = usb_charger_encaps_x_size,
    encaps_1_y_size = 5.8,
    encaps_1_z_size = usb_charger_asset_usb_port_z_size - (usb_charger_encaps_z_size - usb_charger_asset_electronic_card_z_size),
    encaps_2_y_size = 10,
    encaps_2_z_size = usb_charger_asset_usb_port_z_size - (usb_charger_encaps_z_size - usb_charger_asset_electronic_card_z_size) - 1.3,

    throw_offset_y = usb_charger_throw_offset_y - usb_charger_fixation_facade_y_margin,
    throw_offset_x = usb_charger_throw_offset_x,
    throw_diameter = usb_charger_throw_diameter,

    fadace_fn = usb_charger_fadace_fn
) {
    difference() {
        translate([0, 0, 0])
            cube([
                support_total_x_size,
                support_total_y_size,
                support_total_z_size,
            ]);

        // Encaps on usb
        translate([
            (support_total_x_size - encaps_x_size) / 2, -0.01, -0.01])
            cube([
                encaps_x_size,
                encaps_1_y_size + 0.01,
                encaps_1_z_size + 0.01,
            ]);

        // encaps rest
        translate([
            (support_total_x_size - encaps_x_size) / 2,
            encaps_1_y_size - 0.01,
            -0.01
        ])
            cube([
                encaps_x_size,
                encaps_2_y_size + 0.01,
                encaps_2_z_size + 0.01,
            ]);


        nut_encaps_diameter = 6;
        nut_encaps_depth = 2.8;
        // Throws
        translate([
            throw_offset_x,
            throw_offset_y,
            0
        ]) {
            cylinder(h = support_total_z_size * 4, d = throw_diameter, center = true, $fn = fadace_fn);
            translate([0,0,support_total_z_size - nut_encaps_depth])
                rotate([0,0,90])
                cylinder(h = 5, r = nut_encaps_diameter / 2 / cos(30) , $fn = 6);
        }
        
            
        translate([
            support_total_x_size - throw_offset_x,
            throw_offset_y,
            0
        ]) {
            cylinder(h = support_total_z_size * 4, d = throw_diameter, center = true, $fn = fadace_fn);
            translate([0,0,support_total_z_size - nut_encaps_depth])
                rotate([0,0,90])
                cylinder(h = 5, r = nut_encaps_diameter / 2 / cos(30) , $fn = 6);
        }

    }

}


translate(
    [
        0,
        0,
        usb_charger_support_total_y_size - abs(usb_charger_asset_usb_port_y_offset) - usb_charger_fixation_facade_y_margin
    ]
)
    rotate(
        [
            -90,
            0,
            0
        ]
    )
        usbChargerFixationPiece();
