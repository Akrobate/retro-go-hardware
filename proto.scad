use <./components/game-pad-component.scad>
use <./pieces/facade-top.scad>

include <./configurations/global.scad>


// color("green")
//     cylinder(h = 12, d = 3, $fn = 10);


translate(concat(facadeControllerCalculateXYOffset(), facade_front_z_size))
    gamePadComponent();

facadeTop();
