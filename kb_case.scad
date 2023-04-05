right_side = true;
wall_height = 20.6;
bottom_thickness = 4;

linear_extrude(height = wall_height, center = true) {
    import("src/kb_case_wall.svg", center = true, dpi = 96);
}

translate([0, 0, right_side ? -(wall_height / 2) : (wall_height / 2) ]) {
    linear_extrude(height = 1.5, center = true) {
        import("src/kb_case_bottom.svg", center = true, dpi = 96);
    }
}
