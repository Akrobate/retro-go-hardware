use <./../pieces/facade-front.scad>
use <./../pieces/facade-back.scad>
use <./../pieces/facade-top.scad>
use <./../pieces/facade-left.scad>
use <./../pieces/facade-corner.scad>

include <./../configurations/global.scad>


module housingComponent() {
    translate([0, 0, case_external_z_size - case_external_panes_thickness])
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
}


housingComponent();

