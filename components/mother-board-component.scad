use <./../pieces/subpieces/breadboard.scad>
use <./../libraries/electronics.scad>



module motherBoardComponent() {



    module dacModule(z_size = 16) {
        x_points = 7;
        y_points = 7;

        color("Green")
            hull() {
                breadboard(
                    x_points = x_points,
                    y_points = y_points,
                    z_size = z_size,
                    draw_throws = false,
                    $fn = 16
                );
            }

    }



    module sdCardModule(z_size = 16) {
        x_points = 6;
        y_points = 11;

        color("Green")
            hull() {
                breadboard(
                    x_points = x_points,
                    y_points = y_points,
                    z_size = z_size,
                    draw_throws = false,
                    $fn = 16
                );
            }
    }



    module esp32s3(z_size = 16) {

        y_points = 22;
        x_points = 11;

        color("Green")
                hull() {
                    breadboard(
                        x_points = x_points,
                        y_points = y_points,
                        z_size = z_size,
                        draw_throws = false,
                        $fn = 16
                    );
                }
    }


    module dc2dc(z_size = 16) {

        x_points = 6;
        y_points = 15;

        color("Green")
            hull() {
                breadboard(
                    x_points = x_points,
                    y_points = y_points,
                    z_size = z_size,
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


motherBoardComponent();
