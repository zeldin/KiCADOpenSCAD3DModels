use <materials.scad>
use <common.scad>


/// STANDARD EDGE CONNECTOR II .100 CENTERLINE

module pins_5530843(n, offs, J, omitted_pin, board_retention, finish) {
  for (i = [0 : n-1]) {
    pin = 2*i+offs;
    if (omitted_pin == undef || !search(pin, omitted_pin))
      translate([0.1*i, 0, 0]) {
	pin(0.02, J, J+0.1);
	difference() {
	  translate([0, 0.0245, 0.47])
	    rotate(90, [0, 1, 0]) scale([0.01, 0.0075, 0.01])
	      cylinder($fs=0.1, 5.5, 8, 8, true);
	  translate([0, -0.1, 0])
	    cube([0.1, 0.2, 2.0], true);
	  translate([0, 0.0245, 0.47])
	    rotate(90, [0, 1, 0]) scale([0.01, 0.0075, 0.01])
	      cylinder($fs=0.1, 6.0, 6, 6, true);
        }
      }
  }
}

module part_5530843(n, J, omitted_pin=undef, board_retention=undef, finish=0.000030) {
  X = n - 1;
  A = n * 0.1 + 0.26;
  B = A - 0.11;
  C = B - 0.05;
  D = C - 0.2;
  Z = C - 0.014;

  scale([25.4, 25.4, 25.4]) {
    brass() {
      pins_5530843(n, 1, J, omitted_pin, board_retention, finish);
      translate([0, 0.191, 0])
	scale([1, -1, 1])
	  pins_5530843(n, 2, J, omitted_pin, board_retention, finish);
    }
    black_pet()
      translate([D/2, 0.191/2, 0])
        difference() {
	  union() {
	    translate([0, 0, 0.610-0.430/2]) cube([A, 0.368, 0.430], true);
	    translate([0, 0, 0.1]) cube([B, 0.3, 0.2], true);
          }
	  translate([0, 0, 0.02]) cube([D+0.1, 0.4, 0.08], true);
	  hull() {
	    translate([0, 0.06, 0.035])
	      rotate(90, [0, 1, 0]) scale([0.01, 0.01, 0.01])
		cylinder($fs=0.1, A*100, 2.6, 2.6, true);
	    translate([0, -0.06, 0.035])
              rotate(90, [0, 1, 0]) scale([0.01, 0.01, 0.01])
		cylinder($fs=0.1, A*100, 2.6, 2.6, true);
	    translate([0, 0.10, -0.05])
	      rotate(90, [0, 1, 0]) scale([0.01, 0.01, 0.01])
		cylinder($fs=0.1, A*100, 2, 2, true);
	    translate([0, -0.10, -0.05])
              rotate(90, [0, 1, 0]) scale([0.01, 0.01, 0.01])
		cylinder($fs=0.1, A*100, 2, 2, true);
	  }
	  translate([0, 0.7, -0.25]) cube([A+2, 1.1, 1], true);
	  translate([0, -0.7, -0.25]) cube([A+2, 1.1, 1], true);
	  translate([0, 0, 0.615-0.300/2]) cube([C, 0.0735, 0.300], true);
	  difference() {
	    translate([0, 0, 0.610]) cube([C+0.120, 0.0735+0.120, 0.120], true);
	    translate([0, 0.0735/2+0.060, 0.610-0.060])
	      rotate(90, [0, 1, 0]) scale([0.01, 0.01, 0.01])
		cylinder($fs=0.1, A*100, 6, 6, true);
	    translate([0, -0.0735/2-0.060, 0.610-0.060])
	      rotate(90, [0, 1, 0]) scale([0.01, 0.01, 0.01])
		cylinder($fs=0.1, A*100, 6, 6, true);
	    hull() {
	      translate([-C/2-0.1, 0, 0.610]) cube([0.04, 1, 0.04] ,true);
	      translate([-C/2, 0, 0.610-0.1]) cube([0.04, 1, 0.04], true);
	    }
	    hull() {
	      translate([C/2+0.1, 0, 0.610]) cube([0.04, 1, 0.04] ,true);
	      translate([C/2, 0, 0.610-0.1]) cube([0.04, 1, 0.04], true);
	    }
	  }
	  for (i = [0 : n-1])
	    translate([-D/2+0.1*i, 0, 0.47])
	      cube([0.07, 0.25, 0.3], true);
        }
  }
}

// module part_9_5530843_5() { part_5530843(12, 0.125,
//                             omitted_pin=[5, 6, 13, 14, 15, 16],
//                             board_retention=[3, 4, 19, 20, 21, 22]); }
module part_9_5530843_4() { part_5530843(8, 0.125,
                            omitted_pin=[5, 6, 7, 8, 11, 12, 13, 14]); }
// module part_9_5530843_3() { ... }
module part_9_5530843_2() { part_5530843(18, 0.125,
                            omitted_pin=[3, 4, 21, 22, 25,
                                         26, 29, 30, 33, 34]); }
module part_9_5530843_1() { part_5530843(20, 0.125,
                            omitted_pin=[9, 10, 11, 12, 19, 20,
                                         21, 22, 29, 30, 31, 32]); }
module part_9_5530843_0() { part_5530843(20, 0.125,
                            omitted_pin=[13, 14, 15, 16, 27, 28, 29, 30]); }
module part_8_5530843_9() { part_5530843(12, 0.125,
                            omitted_pin=[3, 4, 5, 6, 9, 10, 13,
                                         14, 17, 18, 19, 20, 21, 22]); }
module part_8_5530843_8() { part_5530843(20, 0.125,
                            omitted_pin=[11, 12, 23, 24, 29,
                                         30, 35, 36, 37, 38]); }
module part_8_5530843_7() { part_5530843(12, 0.125,
                            omitted_pin=[17, 18, 19, 20]); }
// module part_8_5530843_6() { ... }
module part_8_5530843_5() { part_5530843(12, 0.187); }
module part_8_5530843_4() { part_5530843(31, 0.125,
                            omitted_pin=[19, 20, 21, 22, 23, 24, 27, 28, 31,
                                         32, 35, 36, 39, 40, 43, 44, 45, 46,
                                         47, 48, 51, 52, 55, 56, 59, 60]); }
// module part_8_5530843_3() { part_5530843(12, 0.125,
//                             board_retention=[3, 4, 5, 6, 19, 20, 21, 22]); }
module part_7_5530843_7() { part_5530843(3, 0.125); }
module part_5530843_9() { part_5530843(5, 0.187); }
module part_7_5530843_6() { part_5530843(6, 0.187); }
module part_7_5530843_5() { part_5530843(6, 0.125); }
// module part_7_5530843_0() { part_5530843(31, 0.125, finish=0.000015); }
module part_6_5530843_5() { part_5530843(31, 0.125); }
module part_5_5530843_4() { part_5530843(20, 0.125); }
module part_5_5530843_3() { part_5530843(17, 0.125); }
module part_5_5530843_0() { part_5530843(10, 0.125); }
// module part_2_5530843_7() { part_5530843(18, 0.125, finish=0.000015); }
module part_2_5530843_3() { part_5530843(35, 0.125); }
module part_2_5530843_2() { part_5530843(50, 0.187); }
module part_2_5530843_0() { part_5530843(40, 0.187); }
module part_1_5530843_8() { part_5530843(30, 0.187); }
module part_1_5530843_6() { part_5530843(25, 0.187); }
module part_1_5530843_0() { part_5530843(43, 0.125); }
module part_5530843_8() { part_5530843(36, 0.125); }
module part_5530843_7() { part_5530843(30, 0.125); }
module part_5530843_6() { part_5530843(28, 0.125); }
module part_5530843_5() { part_5530843(25, 0.125); }
module part_5530843_4() { part_5530843(22, 0.125); }
module part_5530843_3() { part_5530843(18, 0.125); }
module part_5530843_2() { part_5530843(15, 0.125); }
module part_5530843_1() { part_5530843(12, 0.125); }


/// BUCHANAN terminal blocks

module buchanan_right_angle_header(n, pitch) {
  scale ([1, -1, 1])
    for (i = [0 : n-1])
      translate([pitch*i, 0, 0 ])
        right_angle_pin(0.8, 3.4, 6.4, 6.75);
}

module buchanan_right_angle_header_housing(n, pitch, Aoffs, Boffs) {
  A = (n-1)*pitch + Aoffs;
  B = A + Boffs;

  scale ([1, -1, 1])
   translate([-Aoffs*0.5, -1.2, 0])
    difference() {
      if (Boffs == 0)
	cube([A, 9.2, 7.3]);
      else
        union() {
	  cube([A, 9.0, 7.3]);
          hull() {
	    translate([0, 8.0, 0])
	      cube([A, 0.5, 7.3]);
	    translate([-Boffs*0.5, 8.7, 0])
	      cube([B, 0.5, 7.3]);
          }
	}
      for (i = [0 : n-1])
        translate([Aoffs*0.5+pitch*i-pitch*0.5, 0, 0 ]) {
          difference() {
	    translate([0.2, 2.5, 0.7])
	      cube([pitch-0.4, 8, 7.3-1.5]);
	    translate([pitch*0.5, 0, 0.7-pitch*0.3])
	      rotate(90, [-1, 0, 0])
                cylinder($fs=0.1, 10, pitch*0.4, pitch*0.4, false);
	    translate([0, 0, 5.2])
              cube([pitch/3, 10, 0.5]);
	    translate([pitch*2/3, 0, 5.2])
              cube([pitch/3, 10, 0.5]);
	    translate([0, 0, 5.4])
              cube([pitch/6, 10, 3]);
	    translate([pitch*5/6, 0, 5.4])
              cube([pitch/6, 10, 3]);
          }
	  translate([pitch*0.3, -0.5, 4.2])
	    cube([pitch*0.4, 2.3, 3.5]);
	  translate([pitch*0.1, 1.0, 4.2])
	    cube([pitch*0.8, 0.8, 3.5]);
	}
      translate([-pitch*0.2, -0.5, 4.2])
	cube([pitch*0.4, 1.0, 2.15]);
      translate([A-pitch*0.2, -0.5, 4.2])
	cube([pitch*0.4, 1.0, 2.15]);
      difference() {
	translate([-Boffs*0.5-1, -1, 7.05])
          cube([B+2, 9.7, 1]);
	translate([Aoffs*0.5-0.22, 8.2, 0])
	  cube([0.5, 1, 10]);
      }
  }
}

// Right-Angle, Closed End Headers, 3.5 mm Centerline

module part_284512(n) {
  tin() buchanan_right_angle_header(n, 3.5);
  green_pa() buchanan_right_angle_header_housing(n, 3.5, 4.5, 1.0);
}

module part_796695(n) {
  tin() buchanan_right_angle_header(n, 3.5);
  blue_pa() buchanan_right_angle_header_housing(n, 3.5, 4.5, 1.0);
}

module part_1776134(n) {
  tin() buchanan_right_angle_header(n, 3.5);
  black_ppa() buchanan_right_angle_header_housing(n, 3.5, 4.5, 1.0);
}

module part_284512_2() { part_284512(2); }
module part_284512_3() { part_284512(3); }
module part_284512_4() { part_284512(4); }
module part_284512_5() { part_284512(5); }
module part_284512_6() { part_284512(6); }
module part_284512_7() { part_284512(7); }
module part_284512_8() { part_284512(8); }
module part_284512_9() { part_284512(9); }
module part_1_284512_0() { part_284512(10); }
module part_1_284512_1() { part_284512(11); }
module part_1_284512_2() { part_284512(12); }
module part_1_284512_3() { part_284512(13); }
module part_1_284512_4() { part_284512(14); }
module part_1_284512_5() { part_284512(15); }
module part_1_284512_6() { part_284512(16); }
module part_1_284512_7() { part_284512(17); }
module part_1_284512_8() { part_284512(18); }
module part_1_284512_9() { part_284512(19); }
module part_2_284512_0() { part_284512(20); }
module part_2_284512_1() { part_284512(21); }
module part_2_284512_2() { part_284512(22); }
module part_2_284512_3() { part_284512(23); }
module part_2_284512_4() { part_284512(24); }
module part_2_284512_5() { part_284512(25); }
module part_796695_2() { part_796695(2); }
module part_796695_3() { part_796695(3); }
module part_796695_4() { part_796695(4); }
module part_796695_5() { part_796695(5); }
module part_796695_6() { part_796695(6); }
module part_796695_7() { part_796695(7); }
module part_796695_8() { part_796695(8); }
module part_796695_9() { part_796695(9); }
module part_1_796695_0() { part_796695(10); }
module part_1_796695_1() { part_796695(11); }
module part_1_796695_2() { part_796695(12); }
module part_1_796695_3() { part_796695(13); }
module part_1_796695_4() { part_796695(14); }
module part_1_796695_5() { part_796695(15); }
module part_1_796695_6() { part_796695(16); }
module part_1_796695_7() { part_796695(17); }
module part_1_796695_8() { part_796695(18); }
module part_1_796695_9() { part_796695(19); }
module part_2_796695_0() { part_796695(20); }
module part_2_796695_1() { part_796695(21); }
module part_2_796695_2() { part_796695(22); }
module part_2_796695_3() { part_796695(23); }
module part_2_796695_4() { part_796695(24); }
module part_2_796695_5() { part_796695(25); }
module part_1776134_2() { part_1776134(2); }
module part_1776134_3() { part_1776134(3); }
module part_1776134_4() { part_1776134(4); }
module part_1776134_5() { part_1776134(5); }
module part_1776134_6() { part_1776134(6); }
module part_1776134_7() { part_1776134(7); }
module part_1776134_8() { part_1776134(8); }
