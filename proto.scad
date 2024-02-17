use <./components/game-pad-component.scad>
use <./components/battery.scad>
use <./pieces/facade-top.scad>
use <./pieces/facade-bottom.scad>
use <./components/mother-board-component.scad>

include <./configurations/global.scad>


// color("green")
//     cylinder(h = 12, d = 3, $fn = 10);


// translate(concat(facadeControllerCalculateXYOffset(), case_external_panes_thickness))
//    gamePadComponent();



*translate([78, 10, -20])
    rotate([0,0,90])
        motherBoardComponent();

*translate([7.5, 115, -23])
    battery();


translate([0, 0, case_external_z_size - case_external_panes_thickness])
    facadeTop();

translate([0, 0, 0])
    facadeBottom();