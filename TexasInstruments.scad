use <materials.scad>
use <common.scad>

module part_X2QFN_12() {
  white_paint()
    translate([-1.6/2, -1.6/2, 0.4])
      translate([0.08, 1.12, -0.1])
        cube([0.4, 0.4, 0.08]);
  black_lcp()
    translate([-1.6/2, -1.6/2, 0.05])
       difference() {
         cube([1.6, 1.6, 0.4-0.05]);
         translate([0.28, 1.32, 0.4-0.1])
           cylinder($fs=0.05, 0.5, 0.1, 0.1);
       }
  tin() {
    translate([-1.6/2-0.001, 0.1, 0.0])
      difference() {
        cube([0.5, 0.2, 0.1]);
        translate([0.15, 0.3, -0.1])
          rotate(-30, [0, 0, 1])
            cube([1.0, 1.0, 0.3]);
      }
    translate([-1.6/2-0.001, -0.3, 0.0])
      cube([0.5, 0.2, 0.1]);
    translate([1.6/2-0.5+0.001, 0.1, 0.0])
      cube([0.5, 0.2, 0.1]);
    translate([1.6/2-0.5+0.001, -0.3, 0.0])
      cube([0.5, 0.2, 0.1]);
    for (i = [each [-0.7:0.4:0.5]]) {
      translate([i, -1.6/2-0.01, 0.0])
        cube([0.2, 0.3, 0.1]);
      translate([i, 1.6/2-0.3+0.01, 0.0])
        cube([0.2, 0.3, 0.1]);
    }
  }
}
