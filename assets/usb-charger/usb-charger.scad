module usbCharger() {

    electronic_card_x_size = 17.57;
    electronic_card_y_size = 27.85;
    electronic_card_z_size = 0.87;

    usb_port_x_size = 9;
    usb_port_y_size = 7.39;
    usb_port_z_size = 3.29;

    usb_port_x_offset = 4.5;
    usb_port_y_offset = -1.36;
    _fn = 20;

    color("RoyalBlue")
        cube([
            electronic_card_x_size,
            electronic_card_y_size,
            electronic_card_z_size
        ]);
/*
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
*/

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
}