use <materials.scad>
use <common.scad>

/// USB-C

module part_TYPE_C_31_M_12() {
 translate([0, -7.35/2, 3.16/2]) rotate(-90, [1, 0, 0]) rotate(180, [0, 0, 1]) {
  tin() {
    difference() {
      linear_extrude(7.35)
        offset(r=1.3, $fs=0.1)
          square([8.94-2.6, 3.15-2.6], true);
      translate([0, 0, -1])
        linear_extrude(5.8)
          offset(r=1, $fs=0.1)
            square([8.94-2.6, 3.15-2.6], true);
      translate([0, 0, 6.65])
        linear_extrude(1.0)
          offset(r=1, $fs=0.1)
            square([8.94-2.6, 3.15-2.6], true);
      translate([-3.4, -1.6, 2.85])
        cube([3, 3, 2], true);
      translate([3.4, -1.6, 2.85])
        cube([3, 3, 2], true);
      translate([0, -1.46, 6.8])
        cube([9, 3, 2], true);
      translate([0, 0.5, 7.15])
        cube([9, 1, 1], true);
    }
    translate([-8.94/2, 0, 2.85])
      rotate(90, [0, 1, 0]) {
        p = [[-0.55, 0], [-0.55, -1.58], [-0.05, -1.58], [-0.05, -2.2],
	     [0.07, -2.53], [0.43, -2.53], [0.55, -2.2], [0.55, 0]];
        linear_extrude(0.3) offset(r=0.1, $fs=0.04) polygon(p);
        translate([0, 0, 8.94-0.3])
          linear_extrude(0.3) offset(r=0.1, $fs=0.04) polygon(p);
      }
    translate([-8.94/2, 0, 6.8])
      rotate(90, [0, 1, 0]) {
        p = [[-0.43, -0.05], [-0.43, -2.1], [-0.2, -2.53],
             [0.25, -2.53], [0.47, -2.1], [0.47, 0.1], [0.4, -0.05]];
        linear_extrude(0.3) offset(r=0.1, $fs=0.04) polygon(p);
        translate([0, 0, 8.94-0.3])
          linear_extrude(0.3) offset(r=0.1, $fs=0.04) polygon(p);
      }
    for (i = [each [0.25:0.5:1.75], 2.27, 2.53, 3.07, 3.33]) {
      translate([i, -1.58-0.1/2, 7.35])
	cube([0.2, 0.1, 0.7], true);
      translate([-i, -1.58-0.1/2, 7.35])
	cube([0.2, 0.1, 0.7], true);
    }
  }
  black_lcp() {
    translate([0, -0.67, 6.575])
      cube([8.34, 1.82, 1.55], true);
    translate([0, 0.5, 7])
      cube([8.94, 0.9, 0.7], true);
    translate([0, 0, 6.65])
      intersection() {
        linear_extrude(0.7)
          offset(r=0.95, $fs=0.1)
            square([8.94-2.6, 3.15-2.6], true);
	translate([-4.5, 0.5, -1]) cube([9, 3, 2]);
      }
    translate([0, -1.58-0.75, 6.28]) rotate(90, [-1, 0, 0]) {
      translate([5.78/2, 0, 0]) cylinder($fs=0.1, 1, 0.25, 0.25);
      translate([-5.78/2, 0, 0]) cylinder($fs=0.1, 1, 0.25, 0.25);
    }
  }
  black_lcp() {  
    translate([0, 0, 3.4]) cube([6.65, 0.65, 6], true);
    translate([0, 0, 4.725]) cube([6.65, 1.2, 3], true);
  }
  brass() {
    for (t = [[1, 1, 1], [-1, 1, 1], [1, -1, 1], [-1, -1, 1]])
      scale(t)
        for (i = [each [0:2], 5]) {
          l = (i == 2 || i == 5? 2.35 : 1.85);
          translate([i*0.5 + 0.25, 0.65/2+0.03/2, 3.225-l/2])
	    cube([0.25, 0.03, l], true);
        }
  }
 }
}
