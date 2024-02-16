use <./components/game-pad-component.scad>
use <./components/battery.scad>
use <./pieces/facade-top.scad>
use <./pieces/facade-bottom.scad>
use <./mother-board.scad>

include <./configurations/global.scad>


// color("green")
//     cylinder(h = 12, d = 3, $fn = 10);


// translate(concat(facadeControllerCalculateXYOffset(), facade_front_z_size))
//    gamePadComponent();
// facadeTop();

translate([78, 10, -20])
    rotate([0,0,90])
        motherBoard();

translate([7.5, 115, -23])
    battery();

translate([0, 0, -30])
    facadeBottom();