include <../assets/usb-charger/configurations.scad>

/**
 * usbCConnectorEnveloppe
 * @name usbCConnectorEnveloppe
 * @description usbCConnectorEnveloppe
 * @type enveloppe
 * @parent root
 */
module usbCConnectorEnveloppe(
    usb_port_x_size = usb_charger_asset_usb_port_x_size,
    usb_port_y_size = usb_charger_asset_usb_port_y_size,
    usb_port_z_size = usb_charger_asset_usb_port_z_size,
    usb_round_radius = usb_charger_asset_usb_round_radius,
    _fn = usb_charger_asset_fn
) {

    usb_edges_coords = [
        [
            usb_round_radius,
            usb_round_radius
        ],
        [
            usb_port_x_size - usb_round_radius,
            usb_round_radius
        ],
        [
            usb_port_x_size - usb_round_radius,
            usb_port_z_size - usb_round_radius
        ],
        [
            usb_round_radius,
            usb_port_z_size - usb_round_radius
        ],
    ];

    translate([-usb_port_x_size / 2, -usb_port_y_size / 2, -usb_port_z_size / 2])
    hull() {
        for (edge = usb_edges_coords) {
            translate([edge[0], 0, edge[1]])
                rotate([-90,0,0])
                    cylinder(h = usb_port_y_size, r = usb_round_radius, $fn = _fn);
        }
    }
}


usbCConnectorEnveloppe();