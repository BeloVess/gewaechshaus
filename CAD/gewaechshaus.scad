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
translate([7, 7, 15])
color("SkyBlue")
cylinder(h=30, r=5, $fn=200);
color("MediumSpringGreen"){
    translate([7, -2, 30])
    linear_extrude(
        height=20,
        slices=100,
        twist=240, 
        $fn=10)
    circle(0.5);
    translate([5, 0, 50])
    rotate([90, 0, 90])
    rotate_extrude(
        angle=180,
        $fn=20
    )
    translate([2, 2, 0])
    circle(0.5);
}
