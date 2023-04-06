$fa=1;
$fs=0.4;

show_voids = false;

wall_height = 20.6;
bottom_thickness = 3;

controller_pcb_axis_rotation = 00;
controller_pcb_x_offset = 7.00;
controller_pcb_y_offset = 16.75;
controller_pcb_thickness = 2.20;
controller_pcb_width = 18.05;
controller_pcb_length = 32.82;
controller_pcb_riser_width = 9.50;
controller_pcb_riser_height = 1.50;
controller_pcb_plug_depth = 1.00;
controller_usb_port_width = 12.00;
controller_usb_port_height = 8.00;
controller_usb_port_depth = 5.00;
trrs_jack_hole_size = 8.50;
trrs_jack_axis_rotation = 90;
trrs_jack_x_offset = -45.00;
trrs_jack_y_offset = 30.00;
trrs_jack_z_offset = 4.00;
reset_button_hole_size = 7.50;
reset_button_axis_rotation = 0;
reset_button_x_offset = 33.00;
reset_button_y_offset = 55.00;
reset_button_z_offset = 3.50;

module case_wall() {
    linear_extrude(height = wall_height, center = true) {
        import("src/kb_case_wall.svg", center = true, dpi = 96);
    }
}

module case_bottom() {
    linear_extrude(height = bottom_thickness - 1.5, center = true) {
        import("src/kb_case_bottom.svg", center = true, dpi = 96);
    }
    translate([0, 0, -1.5]) {
        linear_extrude(height = 1.5, center = true) {
            import("src/kb_case_bottom_outer.svg", center = true, dpi = 96);
        }
    }
}

module pcb_mount() {
    // riser
    cube([controller_pcb_riser_width, controller_pcb_length + 1, controller_pcb_riser_height]);
    // clip
    translate([0, -1.5, 0]) {
        difference() {
            cube([controller_pcb_riser_width, 4.5, 2 + controller_pcb_thickness + 0.15 + controller_pcb_riser_height]);
            translate([0, 4, 3.5]) {
                rotate([20, 0, 0])
                    cube([controller_pcb_riser_width + 0.15, 5, 5]);
            }
        }
    }
}

module pcb_slot() {
    translate([-((controller_pcb_width - controller_pcb_riser_width) / 2), 2, controller_pcb_riser_height]) {
        difference() {
            cube([controller_pcb_width + 0.15, controller_pcb_length + 0.65, controller_pcb_thickness + 1.15]);
            translate([0, -1, 1]) {
                rotate([45, 0, 0])
                    cube([controller_pcb_width + 0.15, 5, 5]);
            }
            translate([0, controller_pcb_length - 1.65, 4]) {
                rotate([-45, 0, 0])
                    cube([controller_pcb_width + 0.15, 5, 5]);
            }
        }
    }
}

module pcb_port() {
    hull() {
        rotate([90,0,0]) {
            cylinder(h=controller_usb_port_depth,r=controller_usb_port_height / 2);
            translate([controller_usb_port_width / 2, 0, 0]) {
                cylinder(h=controller_usb_port_depth,r=controller_usb_port_height / 2);
            }
        }
    }
}

module trrs_port(){
    translate([trrs_jack_x_offset, trrs_jack_y_offset, -((wall_height / 2) - bottom_thickness) + trrs_jack_z_offset])
        rotate([90, 0, trrs_jack_axis_rotation])
            cylinder(h=10,r=trrs_jack_hole_size / 2);
}

module reset_button_port() {
    translate([reset_button_x_offset, reset_button_y_offset, -((wall_height / 2) - bottom_thickness) + reset_button_z_offset])
        rotate([90, 0, reset_button_axis_rotation])
            cylinder(h=10,r=reset_button_hole_size / 2);
}

module case_body() {
    case_wall();

    translate([0, 0, -(wall_height / 2) ]) {
        case_bottom();
    }

    translate([controller_pcb_x_offset, controller_pcb_y_offset, -((wall_height / 2) - bottom_thickness + 2.15)]) {
        rotate([0, 0, controller_pcb_axis_rotation])
            pcb_mount();
    }
}

if (show_voids) {
    case_body();
    translate([controller_pcb_x_offset, controller_pcb_y_offset, -((wall_height / 2) - bottom_thickness + 2.15)]) {
        rotate([0, 0, controller_pcb_axis_rotation])
            translate([-(((controller_usb_port_width / 2) - controller_pcb_riser_width) / 2), controller_pcb_length + 1 + controller_usb_port_depth, controller_pcb_riser_height + controller_pcb_thickness]) {
                pcb_port();
            }
        rotate([0, 0, controller_pcb_axis_rotation])
            pcb_slot();
    }
    trrs_port();
    reset_button_port();
} else {
    difference() {
        case_body();
        translate([controller_pcb_x_offset, controller_pcb_y_offset, -((wall_height / 2) - bottom_thickness + 2.15)]) {
            rotate([0, 0, controller_pcb_axis_rotation])
                translate([-(((controller_usb_port_width / 2) - controller_pcb_riser_width) / 2), controller_pcb_length + 1 + controller_usb_port_depth, controller_pcb_riser_height + controller_pcb_thickness]) {
                    pcb_port();
                }
            rotate([0, 0, controller_pcb_axis_rotation])
                pcb_slot();
        }
        trrs_port();
        reset_button_port();
    }
}