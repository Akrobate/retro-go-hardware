
/**
 * getPointSize
 * @returns Point size (mil)
 */
function getPointSize() = 2.54;


/**
 * getSizeFromPointCount
 * @returns dimension in milimeters from points numbers
 */
function getSizeFromPointCount(point_count) = (point_count + 1) * getPointSize();
