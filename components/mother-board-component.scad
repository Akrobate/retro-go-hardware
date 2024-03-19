include <../configurations/global.scad>

use <./../pieces/subpieces/breadboard.scad>
use <./../pieces/bolt-join-mother-board-piece.scad>

use <./../libraries/electronics.scad>
use <./../libraries/commons.scad>

module motherBoardComponent(
    mother_board_bolt_throws_list = mother_board_bolt_throws_list,
    draw_throws = false
) {

    module dacModule(z_size = 16) {
        genericModule(z_size = z_size, x_points = 7, y_points = 7, color = "FireBrick");
    }

    module sdCardModule(z_size = 16) {
        genericModule(z_size = z_size, x_points = 11, y_points = 6, color = "RoyalBlue");
    }

    module esp32s3(z_size = 16) {
        genericModule(z_size = z_size, x_points = 22, y_points = 11, color = "DarkSlateGray");
    }

    module dc2dc(z_size = 16) {
        genericModule(z_size = z_size, x_points = 15, y_points = 6, color = "RoyalBlue");
    }

    breadboard(
        x_points = 25, y_points = 32,
        throw_3mm_coord_list = mother_board_bolt_throws_list,
        draw_throws = draw_throws, $fn = 16
    );


    module electronicModules() {
        translateBreadboard(3, 11)
            esp32s3();

        translateBreadboard(16, 1)
            sdCardModule();

        translateBreadboard(7, 0)
            dacModule();

        translateBreadboard(0, 26)
            dc2dc();
    }

    #translate([0, 0, 1.5])
        electronicModules();

        forEachCoord([
            for (i = mother_board_bolt_throws_list) [
                i[0] * getPointSize(),
                i[1] * getPointSize(),
                -bolt_join_mother_board_height
            ]
        ])
            boltJoinMotherBoardPiece();
}


motherBoardComponent(
    draw_throws = true
);
