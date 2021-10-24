include <desk.scad>
include <lift.scad>

color("brown") desk();
translate([0, -rear_box_depth, 0]) base(4, 6, 8, 12);
