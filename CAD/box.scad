module box() {
    color("DarkGray")
    cube([100,100,1]);
    color("DarkSlateGray");
    cube([1,1,50]);
    translate([99, 0, 0])
    cube([1,1,50]);
    translate([0, 99, 0])
    cube([1,1,50]);
    translate([99, 99, 0])
    cube([1,1,50]);
    translate([0, 0, 49])
    cube([100,1,1]);
    translate([99, 0, 49])
    cube([1,100,1]);
    translate([0, 99, 49])
    cube([100,1,1]);
    translate([0, 0, 49])
    cube([1,100,1]);
}