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
    
    usb_charger_asset_usb_port_z_size = 3.29;

    usb_charger_asset_electronic_card_z_size = 0.87;

    support_total_x_size = 17.57 + 15;  // 17.57
    support_total_y_size = 12;  // 27.85
    support_total_z_size = 2;  // 0.87

    fixation_support_z_size = 5;

    encaps_x_size = 17.57 + 1;
    encaps_y_size = 27.85 + 1;
    encaps_z_size = 1;

    facade_z_size = 15;

    facade_x_fixation_spacing = 52;
    throw_diam = 3;

    fixation_facade_y_margin = 0.5;

    throw_offset_y = 4.5;
    throw_offset_x = 3.5;

    fadace_fn = 100;



    translate([
        (support_total_x_size - usb_charger_asset_electronic_card_x_size) / 2,
        abs(usb_charger_asset_usb_port_y_offset),
        support_total_z_size - encaps_z_size
    ])
        usbCharger();


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
        ])
            %cylinder(h = support_total_z_size * 4, d = throw_diam, center = true, $fn = fadace_fn);
            
        translate([
            support_total_x_size - throw_offset_x,
            abs(usb_charger_asset_usb_port_y_offset) + throw_offset_y,
            0
        ])
            %cylinder(h = support_total_z_size * 4, d = throw_diam, center = true, $fn = fadace_fn);
    }

    
    // circuit fixation
    translate([
        0,
        abs(usb_charger_asset_usb_port_y_offset) + fixation_facade_y_margin,
        support_total_z_size
    ])
        color("Yellow")
        usbChargerFixationPiece(
            support_total_x_size = support_total_x_size,
            support_total_y_size = support_total_y_size - abs(usb_charger_asset_usb_port_y_offset) - fixation_facade_y_margin,
            support_total_z_size = fixation_support_z_size,

            encaps_x_size = encaps_x_size,
            encaps_1_y_size = 5.8,
            encaps_1_z_size = usb_charger_asset_usb_port_z_size - (encaps_z_size - usb_charger_asset_electronic_card_z_size), // Not perfect
            encaps_2_y_size = 10,
            encaps_2_z_size = usb_charger_asset_usb_port_z_size - (encaps_z_size - usb_charger_asset_electronic_card_z_size) - 1.3,

            throw_offset_y = throw_offset_y - fixation_facade_y_margin,
            throw_offset_x = throw_offset_x,

            throw_diam = throw_diam,

            fadace_fn = fadace_fn
        );

    // facade
 
    *translate([
        -(facade_x_fixation_spacing - support_total_x_size) / 2,
        0,
        facade_z_size / 2 - 4,
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


module usbChargerFixationPiece(
    support_total_x_size,
    support_total_y_size,
    support_total_z_size,
    encaps_x_size,
    encaps_1_y_size,
    encaps_1_z_size,
    encaps_2_y_size,
    encaps_2_z_size, 

    throw_offset_y,
    throw_offset_x,
    throw_diam,

    fadace_fn
) {
    difference() {
        translate([
            0,
            0,
            0
        ])
            cube([
                support_total_x_size,
                support_total_y_size,
                support_total_z_size,
            ]);

        // Encaps on usb
        translate([
            (support_total_x_size - encaps_x_size) / 2,
            -0.01,
            -0.01
        ])
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

        // Throws
        translate([
            throw_offset_x,
            throw_offset_y,
            0
        ])
            cylinder(h = support_total_z_size * 4, d = throw_diam, center = true, $fn = fadace_fn);
            
        translate([
            support_total_x_size - throw_offset_x,
            throw_offset_y,
            0
        ])
            cylinder(h = support_total_z_size * 4, d = throw_diam, center = true, $fn = fadace_fn);
    }
}


usbChargerComponent();