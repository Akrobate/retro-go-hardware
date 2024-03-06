use <./components/game-pad-component.scad>
use <./components/battery.scad>
use <./components/housing-component.scad>
use <./components/screen-component.scad>
use <./components/mother-board-component.scad>
use <./components/usb-charger-component.scad>

use <./pieces/facade-front-piece.scad>

include <./configurations/global.scad>

// Controller GamePad
translate(concat(facadeControllerCalculateXYOffset(), case_external_z_size))
    gamePadComponent();

// Screen component
translate(concat(facadeScreenCalculateXYOffset(), case_external_z_size - case_external_panes_thickness - 1.25))
    screenComponent();

// Mother board // x 10
translate([78, 45, case_external_panes_thickness + 3])
    rotate([0,0,90])
        motherBoardComponent();

// Battery // x 98
translate([7.5, 20, case_external_panes_thickness])
    battery();

housingComponent();


// translate([28, 8, case_external_z_size + 1.36])
//     rotate([-90,0,0])
//         usbChargerComponent();

translate([usb_charger_coords[0], usb_charger_coords[1], -usb_charger_facade_y_size])
    rotate([90,0,0])
        usbChargerComponent();