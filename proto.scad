use <./components/game-pad-component.scad>
use <./components/battery.scad>
use <./components/housing-component.scad>
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


housingComponent();