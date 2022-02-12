use <materials.scad>
use <common.scad>

/// Micro headers

module pins_FTSH(n, pitch, len, post, d) {
  for (i = [0 : n-1]) {
    translate([pitch*i, 0, d/2])
      rotate(180, [0, 0, 1]) rotate(90, [1, 0, 0])
        tin() right_angle_pin(d, post, post, 1);
    translate([pitch*i, 0, d+1])
	gold() pin(d, 0, len-1);
  }
}

module part_FTSH_1xx(n, A) {
  pins_FTSH(n, 1.27, A+2.51, 2.265, 0.41);
  translate([0, 1.27, 0])
    scale([1, -1, 1])
      pins_FTSH(n, 1.27, A+2.51, 2.265, 0.41);
  black_lcp()
    translate([1.27*(n-1)/2, 1.27/2, 0.41])
      difference() {
        translate([0, 0, 2.51/2]) cube([1.27*n, 3.43, 2.51], true);
        translate([0, 2.1, 2.51/2]) cube([1.5*n, 1.27, 1.27], true);
        translate([0, -2.1, 2.51/2]) cube([1.5*n, 1.27, 1.27], true);
      }
}

module part_FTSH_1xx_K(n, A) {
  union() {
     part_FTSH_1xx(n, A);
     black_lcp()
       translate([1.27*(n-1)/2, 1.27/2, 0.41])
         difference() {
	   translate([0, 0, 5.71/2]) cube([5.08, 5.08, 5.71], true);
	   translate([0, 0, 3]) cube([6, 3.43, 8], true);
	   translate([0, -5, 4.21]) cube([2.16, 10, 3.4], true);
	   rotate(90, [1, 0, 0])
	     linear_extrude(3)
	       polygon([[0, 3.05], [1.5, 6.05], [-1.5, 6.05]]);
         }
  }
}

module part_FTSH_105_01_K() { part_FTSH_1xx_K(5, 3.05); }
module part_FTSH_108_01_K() { part_FTSH_1xx_K(8, 3.05); }
module part_FTSH_110_01_K() { part_FTSH_1xx_K(10, 3.05); }
module part_FTSH_113_01_K() { part_FTSH_1xx_K(13, 3.05); }
module part_FTSH_115_01_K() { part_FTSH_1xx_K(15, 3.05); }
module part_FTSH_117_01_K() { part_FTSH_1xx_K(17, 3.05); }
module part_FTSH_120_01_K() { part_FTSH_1xx_K(20, 3.05); }
module part_FTSH_125_01_K() { part_FTSH_1xx_K(25, 3.05); }
