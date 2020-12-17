use <tree.scad>

module pot(lh, ld2) {
    cylinder(h=lh, d1=10, d2=ld2);
    color("Plum")
    translate([
        -ld2 / 4, 
        -ld2 / 4, 
        lh]);
    color("Purple")
    translate([4, 0, 7]) 
    rotate([90, 0, 0])
    linear_extrude(height = 0.8)
    text("БелоВесь", 2);
}

translate([10, 10, 0]) {
    pot(5, 16);
    translate([0, 0, 5])
    simple_tree(12, 4);
}