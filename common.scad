module pin(d, post, len) {
  hull() {
    translate([-d/2, -d/2, -post+d/3])
      cube([d, d, len-2*d/3]);
    translate([-d/6, -d/6, -post])
      cube([d/3, d/3, len]);
  }
}

module right_angle_pin(d, post, len, mating) {
  union() {
    pin(d, post, len+d/2);
    translate([0, -d/2, len-post])
      rotate(90, [-1, 0, 0])
        pin(d, 0, mating+d/2);
  }
}
