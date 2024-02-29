include <./configurations.scad>

module usbCharger(
    electronic_card_x_size = usb_charger_asset_electronic_card_x_size,
    electronic_card_y_size = usb_charger_asset_electronic_card_y_size,
    electronic_card_z_size = usb_charger_asset_electronic_card_z_size,
    usb_port_x_size = usb_charger_asset_usb_port_x_size,
    usb_port_y_size = usb_charger_asset_usb_port_y_size,
    usb_port_z_size = usb_charger_asset_usb_port_z_size,
    draw_rounded_usb = usb_charger_asset_draw_rounded_usb,
    usb_port_x_offset = usb_charger_asset_usb_port_x_offset,
    usb_port_y_offset = usb_charger_asset_usb_port_y_offset,
    _fn = usb_charger_asset_fn
) {
    color("RoyalBlue")
        cube([
            electronic_card_x_size,
            electronic_card_y_size,
            electronic_card_z_size
        ]);

    if (draw_rounded_usb) {

        round_radius = 1;

        usb_edges_coords = [
            [
                round_radius,
                round_radius
            ],
            [
                usb_port_x_size - round_radius,
                round_radius
            ],
            [
                usb_port_x_size - round_radius,
                usb_port_z_size - round_radius
            ],
            [
                round_radius,
                usb_port_z_size - round_radius
            ],
        ];

        color("DarkGray")
            translate([
                usb_port_x_offset,
                usb_port_y_offset,
                electronic_card_z_size
            ])
                hull() {
                    for (edge = usb_edges_coords) {
                        translate([edge[0], 0, edge[1]])
                            rotate([-90,0,0])
                                cylinder(h = usb_port_y_size, r = round_radius, $fn = _fn);
                    }
                }
    } else {

        color("DarkGray")
            translate([
                usb_port_x_offset,
                usb_port_y_offset,
                electronic_card_z_size
            ])
                cube([
                    usb_port_x_size,
                    usb_port_y_size,
                    usb_port_z_size
                ]);
    }
}

usbCharger();