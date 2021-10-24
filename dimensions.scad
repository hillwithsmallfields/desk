// Dimensions in inches, the way it was made

top_width     = 60;
top_depth     = 30;
top_thickness = 0.75;
top_overhang  = 1.5;

leg_length = 29;
leg_width  = 1.25;
leg_depth  = 1.5;

plinth_width  = 15.75;
plinth_depth  = 27;
plinth_height = 20;

strut_size  = 1.25;             /* actually 30mm */

rear_box_depth = 18;
rear_frame_depth = rear_box_depth - strut_size;

full_extension = 3.0 / 4.0;

cover_frame_width = top_width - strut_size * 6;
cover_lift_depth = 12;
cover_lift_max = cover_lift_depth * full_extension;

cover_thickness = 0.5;

base_height = 28;
base_width  = 32;               /* will need adjusting */
foot_length = 24;

slider_thickness = 0.4;         /* measure when I get some */

cover_slide_max = rear_box_depth * full_extension;

carrier_width = base_width - (strut_size + slider_thickness) * 2;
carrier_height = base_height - strut_size;
carrier_max = carrier_height * full_extension;

monitor_bank_depth = 24;        /* top of desk to top of monitor */

riser_width = carrier_width - (strut_size + slider_thickness) * 2;
riser_height = carrier_height - strut_size;
riser_depth = rear_frame_depth - strut_size;
riser_max = riser_height * full_extension;

fork_width = riser_width  - (strut_size + slider_thickness) * 2;
fork_depth = riser_depth - strut_size;
fork_max = fork_depth * full_extension;

jib_width = fork_width - (strut_size + slider_thickness) * 2;
jib_depth = fork_depth - strut_size;
jib_max = jib_depth * full_extension;
