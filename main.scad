use <./components/game-pad-component.scad>
use <./components/battery.scad>
use <./components/housing-component.scad>
use <./components/screen-component.scad>
use <./components/mother-board-component.scad>
use <./components/usb-charger-component.scad>

use <./assets/on-off-button/on-off-button.scad>
use <./assets/speaker-28mm/speaker-28mm.scad>

use <./pieces/facade-front-piece.scad>
use <./pieces/facade-top-piece.scad>
use <./pieces/speaker-facade-piece.scad>

include <./configurations/global.scad>

// Controller GamePad
translate(concat(facadeControllerCalculateXYOffset(), case_external_z_size))
    gamePadComponent();

// Screen component
translate(concat(facadeScreenCalculateXYOffset(), case_external_z_size - case_external_panes_thickness - 1.25))
    screenComponent();


// Mother board // x 10
translate([
    mother_board_coords[0],
    mother_board_coords[1],
    case_external_panes_thickness + mother_board_coords[2]
])
    motherBoardComponent(
        draw_throws = false
    );


// Battery // x 98
translate([7.5, 20, case_external_panes_thickness])
    battery();

housingComponent();

translate([
    facade_top_on_off_button_coords[0],
    case_external_y_size,
    facade_top_on_off_button_coords[1]
])
    rotate([-90,0,0])
        onOffButton();

translate([usb_charger_coords[0], usb_charger_coords[1], -usb_charger_facade_y_size])
    rotate([90,0,0])
        usbChargerComponent();


translate([
    mother_board_coords[0] - speaker_facade_rounded_radius + getMin(mother_board_bolt_throws_list, 0),
    mother_board_coords[1] - speaker_facade_rounded_radius + getMin(mother_board_bolt_throws_list, 1),
    -speaker_facade_z_size
])
    speakerFacadePiece();

translate([
    mother_board_coords[0] + getThrowsSpaceCenterXYCoords(mother_board_bolt_throws_list)[0],
    mother_board_coords[1] + getThrowsSpaceCenterXYCoords(mother_board_bolt_throws_list)[1],
    0,
])
    rotate([180,0,0])
        speaker28mm();
