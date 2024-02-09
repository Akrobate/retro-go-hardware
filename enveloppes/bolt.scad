module bolt($fn = $fn) {
    
    epsilone = 0.01;

    color("DimGray")
    translate([0,0,-20])
        union() {
            translate([0,0,22 - 0.01])
                cylinder(h = 4, d = 6.3, center = false, $fn = $fn);

            translate([0,0,20])
                cylinder(h = 2, d1 = 3.3, d2 = 6.3, center = false, $fn = $fn);
            
            translate([0,0,0.01])
                cylinder(h = 20, d = 3.3, center = false, $fn = $fn);
        }

}

bolt($fn = 100);