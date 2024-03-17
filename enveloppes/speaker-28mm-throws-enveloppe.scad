include <../assets/speaker-28mm/configurations.scad>
include <../configurations/global.scad>



module speaker28mmThrowsEnveloppe(
    speaker_facade_throw_diameter = speaker_facade_throw_diameter,
    case_external_panes_thickness = case_external_panes_thickness

) {
    cylinder(
        d = speaker_facade_throw_diameter,
        h = case_external_panes_thickness * 2,
        $fn = 100
    );
}

speaker28mmThrowsEnveloppe();