include <desk.scad>
include <lift.scad>

stages = [ 0.0, 0.2, 0.4, 0.6, 1.0];

/* which of a series of stages a value is in */
function stage(stages, threshold, i) =
     ((i >= len(stages))
      ? i : (stages[i] > threshold
             ? i-1
             : stage(stages, threshold, i+1)));

/* how far through its stage a value is */
function offset_in_stage(stages, f, stage) =
     max(0, min(1, (f - stages[stage]) / (stages[stage+1] - stages[stage])));

/* return the position of something that moves in stage m, when the variable is f */
function position(stages, m, f) = (let (s = stage(stages, f, 0))
                          s < m ? 0 : (s > m ? 1 : offset_in_stage(stages, f, s)));

function in_and_out(f) = (f <= 0.5 ? f : (1.0 - f)) * 2.0;

color("brown") desk();
t = in_and_out($t);
translate([0, -rear_frame_depth, 0]) structure(position(stages, 1, t),
                                               position(stages, 0, t),
                                               position(stages, 3, t),
                                               position(stages, 2, t));
