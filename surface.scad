/*
  Top surface of the desk:

  Plane away old veneer
  
  Pocket for leather writing pad

  Circle for turntable

*/

inch = 25.4;

desk_width = 5 * 12 * inch;
desk_depth = 3 * 12 * inch;
desk_thickness = 1 * inch;

veneer_thickness = 1;           /* measure */

leather_width = 24 * inch;      /* measure */
leather_depth = 18 * inch;      /* measure */
leather_offset = 1 * inch;
leather_thickness = 1.6;        /* measure */

turntable_outer_diameter = 10 * inch; /* measure */
turntable_inner_diameter = 9 * inch;  /* measure */
turntable_depth = 10;                 /* measure */

turntable_from_right = 11 * inch; /* measure */
turntable_from_front = 8 * inch;  /* measure */

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
}
