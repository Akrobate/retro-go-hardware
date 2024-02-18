use <./components/game-pad-component.scad>
use <./components/battery.scad>
use <./pieces/facade-front.scad>
use <./pieces/facade-back.scad>
use <./pieces/facade-top.scad>
use <./pieces/facade-left.scad>
use <./pieces/facade-corner.scad>

use <./components/mother-board-component.scad>

include <./configurations/global.scad>


// color("green")
//     cylinder(h = 12, d = 3, $fn = 10);


*translate(concat(facadeControllerCalculateXYOffset(), case_external_panes_thickness))
    gamePadComponent();


// Mother board
*translate([78, 10, -20])
    rotate([0,0,90])
        motherBoardComponent();

// Battery
*translate([7.5, 115, -23])
    battery();



*translate([0, 0, case_external_z_size - case_external_panes_thickness])
    facadeFront();

translate([0, 0, 0])
    facadeBack();

translate([facade_corners_offset_lenght, case_external_panes_thickness - 0.01, case_external_panes_thickness])
    rotate([90,0,0])
        facadeTop();

translate([facade_corners_offset_lenght, case_external_y_size + 0.01, case_external_panes_thickness])
    rotate([90,0,0])
        facadeTop();

translate([0 - 0.01, facade_corners_offset_lenght, case_external_panes_thickness])
    rotate([90,0,90])
        facadeLeft();

translate([case_external_x_size - case_external_panes_thickness + 0.01, facade_corners_offset_lenght, case_external_panes_thickness])
    rotate([90,0,90])
        facadeLeft();

// Corners (bottom left)
translate([0, 0, case_external_panes_thickness])
    facadeCorner();

// Corners (bottom right)
translate([case_external_x_size, 0, case_external_panes_thickness])
    rotate([0, 0, 90])
        facadeCorner();

// Corners (top left)
translate([0, case_external_y_size, case_external_panes_thickness])
    rotate([0, 0, -90])
        facadeCorner();

// Corners (bottom right)
translate([case_external_x_size, case_external_y_size, case_external_panes_thickness])
    rotate([0, 0, -180])
        facadeCorner();