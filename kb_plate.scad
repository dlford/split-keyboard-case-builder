$fa=1;
$fs=0.4;

right_side = false;

linear_extrude(height = 1.5, center = true) {
    if (right_side) {
            import("src/kb_plate_open.svg", center=true, dpi = 96); 
    } else {
            import("src/kb_plate_locking.svg", center = true, dpi = 96);
    }
};

translate([0, 0, 1.5]) {
    linear_extrude(height = 1.5, center = true) {
        if (right_side) {
                import("src/kb_plate_locking.svg", center=true    , dpi = 96); 
        } else {
                import("src/kb_plate_open.svg", center =     true, dpi = 96);
        }
    }
}
