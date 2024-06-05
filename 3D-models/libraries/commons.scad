
/**
 * forEachCoord
 * Wrapper to apply child on each element
 */
module forEachCoord(coords_list) {
    for (coords = coords_list)
        translate(
            [
                coords[0] == undef ? 0 : coords[0],
                coords[1] == undef ? 0 : coords[1],
                coords[2] == undef ? 0 : coords[2],
            ]
        )
            children();
}
