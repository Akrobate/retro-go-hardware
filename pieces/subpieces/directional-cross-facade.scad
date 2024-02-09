use <./directional-cross.scad>
use <./rounded-pane.scad>
use <./breadboard.scad>
use <../../enveloppes/bolt.scad>

directionnalCrossFacade(
    cross_button_x_y_size = 20 + 1,
    cross_button_thickness = 6 + 1,
    cross_button_round_edges_radius = 1,
    facade_x_size = 40,
    facade_y_size = 40,
    facade_z_size = 2,
    center = false,
    $fn = 150
);


module directionnalCrossFacade(
    cross_button_x_y_size,
    cross_button_thickness,
    cross_button_round_edges_radius,
    facade_x_size,
    facade_y_size,
    facade_z_size,
    center = false,
    $fn = $fn
) {
    

    module _directionnalCrossFacade() {

        difference() {
            roundedPane(
                [
                    facade_x_size,
                    facade_y_size,
                    facade_z_size
                ],
                r1 = 6,
                r2 = 3.5,
                $fn = $fn
            );

            translate([facade_x_size / 2, facade_y_size / 2, facade_z_size / 2])
                directionalCross(
                    button_x_size = cross_button_x_y_size,
                    button_y_size = cross_button_x_y_size,
                    button_z_size = facade_z_size * 3,
                    button_thickness = cross_button_thickness,
                    button_round_edges_radius = cross_button_round_edges_radius,
                    $fn = $fn
                );
            breadboardBoltThrows();
            BoltThrows();
        }
    }

    module BoltThrows() {
        internal_margin = 7;
        translate([facade_x_size / 2, facade_y_size / 2, 0]) {
            translate([facade_x_size / 2 - internal_margin, facade_y_size / 2 - internal_margin])
                bolt();
            translate([facade_x_size / 2 - internal_margin, -facade_y_size / 2 + internal_margin])
                bolt();
            translate([-facade_x_size / 2 + internal_margin, -facade_y_size / 2 + internal_margin])
                bolt();
            translate([-facade_x_size / 2 + internal_margin, facade_y_size / 2 - internal_margin])
                bolt();
        }
    }


    module breadboardBoltThrows() {
        translate([facade_x_size / 2, facade_y_size / 2, 0]) {
            translateBreadboard(3, 3)
                bolt();
            translateBreadboard(3, -3)
                bolt();
            translateBreadboard(-3, -3)
                bolt();
            translateBreadboard(-3, 3)
                bolt();
        }
    }


    if (center) {
        translate([-facade_x_size / 2, -facade_y_size / 2, -facade_z_size / 2 ])
        _directionnalCrossFacade();
    } else {
        _directionnalCrossFacade();
    }
    

}