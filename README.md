# Split Keyboard Case Builder

This tool makes building 3D printed custom split keyboard cases (and plates) easy, if you can use Inkscape, you can build a keyboard case.

## WIP

To Do:

- [ ] Add mounting point and port hole for Pro Micro board
- [ ] Add hole for reset button
- [ ] Add hole for TRRS jack

## Requirements

You must have [Inkscape](https://inkscape.org/) and [OpenSCAD](https://openscad.org/) installed, that's it!

## Editing the Template

All the work is done in `template.svg` using Inkscape.

We need to create and export four SVG files from the template, `kb_plate_locking.svg` makes up the top half of the key plate that the switches can lock into, `kb_plate_open.svg` makes the bottom half of the plate, `kb_case_wall.svg` is the walls of the case, and `kb_case_bottom` is the bottom of the case.

1. Key Layout - Clone the "keycode with clearance" to layout your keys, the black boxes should be touching but not overlapping.
2. `kb_plate_locking.svg` - Clone the layout, draw an outline around all the keys with the pen tool, this is the plate part of the case where the switches mount (use the "Corners" path effect to round out the edges if desired, make sure to do "path" > "object to path" after). Add screw holes between the keyholes, the "screw hole" bit in the template is for 2mm machine screws, adjust it as needed.
3. `kb_plate_open.svg` - Clone the plate locking part you just made, you can now ungroup all the "keycode with clearance" parts (ctrl+a to select all, ctrl+shift+g to ungroup), delete everything except "keyhole locking" from the plate locking part, and everything but the "keyhole open" from the plate open part.
4. `kb_case_wall.svg` - Clone the plate bottom outline and screw holes, use the "offset" path effect with a value of 1mm, this gives the plate a little bit of room to fit into the inner wall of the case, then do "path" > "object to path". Clone the outline in place with "ctrl + d" to make the outer wall of the case, then do another offset of 3mm, for the width of the case wall, "path" > "object to path" again on that one. (we will delete the screw holes after the next step, but we need them for the case bottom).
5. `kb_case_bottom.svg` - Clone the case wall and delete the inner outline, delete the screw holes from the case wall, adjust the screw holes as needed (ctrl+shift while scaling), size them for your heat set inserts, or just make them slightly smaller if you're driving the screws straight into the plastic.
6. For each part created above, clone it, run "path" > "object to path", then "path" > "combine", then "file" > "export", choose "selection", choose "svg" for the filetype, and save to the `src` folder with the appropriate filename.

## Creating the STL files

1. Run `build.sh` to create STL files in the `output` folder, or open the OpenSCAD files to tweak parameters and export STL files manually.
    - Note: If the ports in the case don't line up, you'll need to adjust their location in OpenSCAD via parameters.
2. Print them up and build yourself a keyboard!