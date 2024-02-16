use <./pieces/subpieces/breadboard.scad>
use <./libraries/electronics.scad>



module motherBoard() {



    module dacModule() {
        x_points = 7;
        y_points = 7;

        support_z_size = 0; // 2.5

        color("Green")
        translate([0, 0, support_z_size])
            hull() {
                breadboard(
                    x_points = x_points,
                    y_points = y_points,
                    z_size = 7.1 - support_z_size,
                    draw_throws = false,
                    $fn = 16
                );
            }

    }



    module sdCardModule() {
        x_points = 6;
        y_points = 11;

        support_z_size = 0; // 2.5

        color("Green")
        translate([0, 0, support_z_size])
            hull() {
                breadboard(
                    x_points = x_points,
                    y_points = y_points,
                    z_size = 7.1 - support_z_size,
                    draw_throws = false,
                    $fn = 16
                );
            }
    }



    module esp32s3() {

        y_points = 22;
        x_points = 11;

        support_z_size = 0; // 2.5

        color("Green")
        translate([0, 0, support_z_size])
            hull() {
                breadboard(
                    x_points = x_points,
                    y_points = y_points,
                    z_size = 7.1 - support_z_size,
                    draw_throws = false,
                    $fn = 16
                );
            }
    }


    module dc2dc() {

        x_points = 6;
        y_points = 15;

        support_z_size = 0; // 2.5

        color("Green")
        translate([0, 0, support_z_size])
            hull() {
                breadboard(
                    x_points = x_points,
                    y_points = y_points,
                    z_size = 7.1 - support_z_size,
                    draw_throws = false,
                    $fn = 16
                );
            }
    }


    breadboard(
        x_points = 32,
        y_points = 25,
        draw_throws = false,
        $fn = 16
    );

    translate([0, 0, 1.5]) {
        translateBreadboard(11, 0)
            esp32s3();

        translateBreadboard(2, 0)
            sdCardModule();

        translateBreadboard(2, 14)
            dacModule();

        translateBreadboard(26, 4)
            dc2dc();     
    }
}


motherBoard();
