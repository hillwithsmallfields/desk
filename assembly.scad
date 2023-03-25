include <desk.scad>
include <lift.scad>

color("brown") desk();
translate([0, -rear_frame_depth, 0]) structure(0, 0, 0, 0);
