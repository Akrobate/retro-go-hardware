use <../assets/lcd-screen/screen.scad>

use <../libraries/commons.scad>

include <../configurations/global.scad>
include <../assets/lcd-screen/configurations.scad>

use <../enveloppes/screen-enveloppe.scad>

use <../pieces/screen-frame-piece.scad>
use <../pieces/screen-frame-facade-piece.scad>
use <../pieces/screen-glass-piece.scad>

module screenComponent() {

    translate([0,0,-0.01])
        screen($fn = 100);

    difference() {
        translate([-15,-30, 1.25])
            color("SaddleBrown")
                cube([100, 100, 4.8]);

        screenFixationThrows($fn = 100);
        screenMainThrow();
        screenConnectorThrow();
    }

    translate([0, 0, 4.8 + 1.25])
        color("DarkSlateGray")
            screenFramePiece();

    translate([0,0, 4.8 + 1.25 + 0.5 + 0.01])
        screenGlassPiece();


    translate([0, 0, 4.8 + 1.25 + 1.5])
        color("DarkSlateGray")
            screenFrameFacadePiece();
}


screenComponent();