right_side = true;
wall_height = 20.6;
bottom_thickness = 3;

controller_pcb_axis_rotation = 0;
controller_pcb_x_offset = 7;
controller_pcb_y_offset = 15.125;
controller_pcb_thickness = 2.2;
controller_pcb_width = 17.78;
controller_pcb_length = 33.02;
controller_pcb_riser_width = 9.5;
controller_pcb_riser_height = 2;
controller_pcb_plug_depth = 1;
trrs_jack_hole_size = 0;
trrs_jack_axis_rotation = 0;
trrs_jack_x_offset = 0;
trrs_jack_y_offset = 0;
trrs_jack_z_offset = 10;
reset_button_hole_size = 0;
reset_button_axis_rotation = 0;
reset_button_x_offset = 0;
reset_button_y_offset = 0;
reset_button_z_offset = 10;

function case_body() {
    linear_extrude(height = wall_height, center = true) {
        import("src/kb_case_wall.svg", center = true, dpi = 96);
    }

    translate([0, 0, right_side ? -(wall_height / 2) : (wall_height / 2) ]) {
        linear_extrude(height = bottom_thickness - 1.5, center = true) {
            import("src/kb_case_bottom.svg", center = true, dpi = 96);
        }
    }

    translate([0, 0, right_side ? -((wall_height / 2) + 1.5) : ((wall_height / 2) + 1.5) ]) {
        linear_extrude(height = 1.5, center = true) {
            import("src/kb_case_bottom_outer.svg", center = true, dpi = 96);
        }
    }

    translate([controller_pcb_x_offset, controller_pcb_y_offset, -((wall_height / 2) - bottom_thickness + 1.5)]) {
        cube([controller_pcb_riser_width, controller_pcb_length + 3, controller_pcb_riser_height]);
    }
}

case_body();
