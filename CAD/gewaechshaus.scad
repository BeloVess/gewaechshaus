use <box.scad>
use <pipe.scad>
use <modules.scad>
use <connector.scad>
use <tree.scad>

box();

translate([7, 7, 15])
boiler(30, 5);
translate([5, 5, 50])
connector("Red", 30, 2, 0.2);

translate([20, 0, 0])
pipe();

translate([25, 4, 40])
mod("DarkKhaki", "Насос");
translate([33, 6, 50])
connector("Green", 2, 2, 0.2);

translate([37, 4, 40])
mod("MediumTurquoise", "Arduino");
rotate([0, 0, 90])
translate([7, -44, 50])
connector("Maroon", 35, 2, 0.2);
translate([44, 46, 17])
color("Maroon")
cylinder(r=0.2, h=33);

translate([49, 4, 10])
mod("MediumTurquoise", "Кран");
translate([45, 5, 50])
connector("Blue", 3, 2, 0.2);
translate([52, 5, 20])
color("Blue")
cylinder(r=0.2, h=30);

translate([61, 4, 40])
mod("MediumTurquoise", "Питание");
translate([45, 7, 50])
connector("Black", 13, 2, 0.2);

translate([12, 7, 17])
l_pipe(37);
translate([12, 7, 42])
l_pipe(15);
rotate([0, 0, 90])
translate([8, -52, 12])
l_pipe(37);
translate([47, 49, 1]) {
    pot(11, 16);
    translate([0, 0, 10])
    simple_tree(11, 4);
}



