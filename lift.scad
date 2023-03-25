include <dimensions.scad>

module structure(cover_h, cover_v, h_position, v_position) {
     base(cover_h, cover_v, h_position, v_position);
     cover_lift(cover_h, cover_v);
     carrier(h_position, v_position);
}

module base(cover_h, cover_v, h_position, v_position) {
     translate([-base_width/2, 0, 0]) {
          color("blue")
               union() {
               cube([base_width, strut_size, strut_size]);
               cube([strut_size, foot_length, strut_size]);
               cube([strut_size, strut_size, base_height]);
               translate([base_width-strut_size, 0, 0]) {
                    cube([strut_size, foot_length, strut_size]);
                    cube([strut_size, strut_size, base_height]);
               }
               /* the cover lift supports */
               translate([-(cover_frame_width-base_width)/2, -strut_size, base_height-strut_size]) {
                    cube([cover_frame_width, strut_size, strut_size]);
                    translate([0, 0, -cover_lift_depth ]) cube([strut_size, strut_size, cover_lift_depth]);
                    translate([cover_frame_width-strut_size, 0, -cover_lift_depth ]) cube([strut_size, strut_size, cover_lift_depth]);
               }
          }
     }
}

module cover_lift(cover_h, cover_v) {
     translate([-cover_frame_width/2, slider_thickness, cover_v * cover_lift_max + base_height]) {
          color("cyan") {
               translate([0, 0, -cover_lift_depth ]) cube([strut_size, strut_size, cover_lift_depth]);
               translate([0, 0, 0]) cube([strut_size, cover_lift_depth, strut_size]);
               translate([cover_frame_width-strut_size, 0, -cover_lift_depth ]) cube([strut_size, strut_size, cover_lift_depth]);
               translate([cover_frame_width-strut_size, 0, 0]) cube([strut_size, cover_lift_depth, strut_size]);
          }
          cover_carrier(cover_h);
     }
}

module cover_carrier(cover_h) {
     translate([-(slider_thickness + strut_size), cover_h * cover_slide_max, 0]) cube([strut_size, cover_lift_depth, strut_size]);
     translate([cover_frame_width + slider_thickness, cover_h * cover_slide_max, 0]) cube([strut_size, cover_lift_depth, strut_size]);
     translate([(cover_frame_width - top_width)/2, cover_h * cover_slide_max - strut_size - slider_thickness, 0]) cover();
}

module cover() {
     translate([0, 0, strut_size]) cube([top_width, rear_box_depth, cover_thickness]);
}

module carrier(h_position, v_position) {
     translate([0, 0, v_position*carrier_max]) {
          translate([-carrier_width/2, 0, 0]) {
               color("yellow")
                    union() {
                    cube([carrier_width, strut_size, strut_size]);
                    cube([strut_size, strut_size, carrier_height]);
                    translate([carrier_width-strut_size, 0, 0]) cube([strut_size, strut_size, carrier_height]);
               }
          }
          riser(h_position, v_position);
     }
}

module riser(h_position, v_position) {
     translate([-riser_width/2, 0, strut_size + v_position*riser_max]) {
          color("green") union() {
               cube([riser_width, strut_size, strut_size]);
               cube([strut_size, strut_size, riser_height]);
               translate([riser_width-strut_size, 0, 0]) cube([strut_size, strut_size, riser_height]);
               translate([0, 0, riser_height-strut_size]) cube([riser_width, strut_size, strut_size]);
               translate([0, 0, riser_height-strut_size-monitor_bank_depth]) cube([strut_size, riser_depth, strut_size]);
               translate([riser_width-strut_size, 0, riser_height-strut_size-monitor_bank_depth]) cube([strut_size, riser_depth, strut_size]);
          }
     }
     translate([0, 0, strut_size + v_position*riser_max]) fork(h_position);
}

module fork(h_position) {
     translate([0, h_position*fork_max+strut_size, 0]) {
          color("purple") {
               translate([-fork_width/2, 0, 0]) {
                    cube([fork_width, strut_size, strut_size]);
                    cube([strut_size, fork_depth, strut_size]);
                    translate([fork_width-strut_size, 0, 0]) cube([strut_size, fork_depth, strut_size]);
               }
          }
          jib(h_position);
     }
}

module jib(h_position) {
     color("red")
          translate([-jib_width/2, h_position*jib_max+strut_size, 0]) {
          cube([jib_width, strut_size, strut_size]);
          cube([strut_size, jib_depth, strut_size]);
          translate([jib_width-strut_size, 0, 0]) cube([strut_size, jib_depth, strut_size]);
     }
}
