#!/bin/bash

openscad -D right_side=false -o output/kb_case_left.stl ./kb_case.scad
openscad -D right_side=true -o output/kb_case_right.stl ./kb_case.scad
openscad -D right_side=false -o output/kb_plate_left.stl ./kb_plate.scad
openscad -D right_side=true -o output/kb_plate_right.stl ./kb_plate.scad