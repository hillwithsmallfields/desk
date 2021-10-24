include <dimensions.scad>

module leg() {
       cube([leg_width, leg_depth, leg_length]);
}

module plinth() {
     union() {
          translate ([0, 0, leg_length-plinth_height]) cube([plinth_width, plinth_depth, plinth_height]);
          leg();
          translate([plinth_width - leg_width, 0, 0]) leg();
          translate([0, plinth_depth - leg_depth, 0]) leg();
          translate([plinth_width - leg_width, plinth_depth - leg_depth, 0]) leg();
     }
}

module desk() {
     half_width = top_width / 2;
     translate([top_overhang-half_width, top_overhang, 0]) plinth();
     translate([half_width-top_overhang-plinth_width, top_overhang, 0]) plinth();
     translate([-half_width, 0, leg_length]) cube([top_width, top_depth, top_thickness]);
}
