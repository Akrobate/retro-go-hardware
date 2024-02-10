
// card width 18mm
// card z 1.9mm

// card metal with 14mm
// card metal z 2mm

// metal / card offset 2.7mm

module sdcardHolderPiece() {

    box_x_size = 25;
    box_y_size = 8;
    box_z_size = 8;

    card_x_size = 19.5;
    card_z_size = 2;
    

    card_metal_x_size = 14;
    card_metal_z_size = 2.2;

    metal_offset = 2.6;
    metal_z_offset = 0.6;



    difference() {
        color("grey", 0.8)
            cube([box_x_size, box_y_size, box_z_size], center = false);


            // card
            translate([
                box_x_size / 2 - card_x_size / 2,
                metal_offset,
                box_z_size / 2 - card_z_size
            ])
                cube([card_x_size, 20, card_z_size], center = false);


            // Metal
            translate([
                box_x_size / 2 - card_metal_x_size / 2,
                -1,
                box_z_size / 2 - metal_z_offset
            ])
                cube([card_metal_x_size, 20, card_metal_z_size + metal_z_offset], center = false);

    }

}

sdcardHolderPiece();
