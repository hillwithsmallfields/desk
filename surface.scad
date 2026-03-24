/*
  Top surface of the desk:

  Plane away old veneer
  
  Pocket for leather writing pad

  Circle for turntable

*/

inch = 25.4;

desk_width = 5 * 12 * inch;
desk_depth = 2.5 * 12 * inch;
desk_thickness = (3 / 4) * inch;

veneer_thickness = 1;           /* measure */

leather_width = 24 * inch;
leather_depth = 18 * inch;
leather_offset = 0.51 * inch;
leather_thickness = 1.6;        /* measure */

turntable_outer_diameter = 200;
turntable_inner_diameter = 145;
turntable_depth = 15;

turntable_from_right = 9.5 * inch;
turntable_from_front = 6 * inch;

pen_groove_length = 12 * inch;
pen_groove_width = 0.5 * inch;
pen_groove_depth = 0.125 * inch;

module pen_groove() {
     translate([-pen_groove_length/2,
                0,
                desk_thickness + (pen_groove_width/2 - pen_groove_depth)])
          union() {
               rotate([0, 90, 0]) cylinder(h=pen_groove_length, d=pen_groove_width);
               sphere(d=pen_groove_width);
               translate([pen_groove_length, 0, 0]) sphere(d=pen_groove_width);
          }
}

difference() {
     cube([desk_width, desk_depth, desk_thickness]);
     translate([(desk_width - leather_width) / 2,
                leather_offset,
                desk_thickness - leather_thickness]) {
          cube([leather_width, leather_depth, leather_thickness]);
     }
     translate([desk_width - turntable_from_right,
                turntable_from_front,
                desk_thickness - turntable_depth]) {
          difference() {
               cylinder(h=turntable_depth,
                        d=turntable_outer_diameter);
               cylinder(h=turntable_depth,
                        d=turntable_inner_diameter);
          }
     }
     translate([desk_width/2, leather_offset + leather_depth + leather_offset, 0]) pen_groove();
}
