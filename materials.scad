material = undef;
dump_materials = undef;

module material(name, c) {
  if(dump_materials != undef)
    echo(material=name);
  else if(material == undef)
    color(c) children();
  else if(material == name)
    children();
}

module tin() { material("tin", [0.824, 0.820, 0.781]) children(); }
module brass() { material("brass", [0.859, 0.738, 0.496]) children(); }

module green_pa() { material("green_pa", [0.34, 0.68, 0.445]) children(); }
module blue_pa() { material("blue_pa", [0.34, 0.445, 0.68]) children(); }
module black_ppa() { material("black_ppa", [0.148, 0.145, 0.145]) children(); }
module black_pet() { material("black_pet", [0.148, 0.145, 0.145]) children(); }
