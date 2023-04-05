$fa=1;
$fs=0.4;

linear_extrude(height = 1.5, center = true) {
    import("src/kb_plate_open.svg", center=true, dpi = 96);
};

translate([0, 0, 1.5]) {
    linear_extrude(height = 1.5, center = true) {
        import("src/kb_plate_locking.svg", center=true, dpi = 96);
    }
}
