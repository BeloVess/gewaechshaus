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
translate([20, 0, 0])
color("MediumSpringGreen"){
    translate([7, -2, 30])
    linear_extrude(
        height=20,
        slices=100,
        twist=240, 
        $fn=10)
    circle(0.5);
    translate([5, 2, 50])
    rotate([90, 0, 90])
    rotate_extrude(
        angle=180,
        $fn=20
    )
    translate([4, 2, 0])
    circle(0.5);
    translate([9, -6, 30])
    rotate([-90, 0, 90])
    rotate_extrude(
        angle=90,
        $fn=20
    )
    translate([4, 2, 0])
    circle(0.5);
    translate([7, -6, 26])
    rotate([90, 0, 0])
    linear_extrude(
        height=30,
        slices=100,
        twist=240, 
        $fn=10)
    circle(0.5);
    translate([7, 6, 45])
    linear_extrude(
        height=5,
        slices=100,
        twist=240, 
        $fn=10)
    circle(0.5);
}
color("Plum")
translate([4, 6, 45])
cube([1, 1, 5]);
color("DarkKhaki")
translate([25, 4, 40])
cube([10, 4, 10]);
color("MediumSpringGreen")
translate([12, 7, 42])
rotate([90, 0, 90])
linear_extrude(
    height=15,
    slices=100,
    twist=240, 
    $fn=10)
circle(0.5);
color("MediumTurquoise")
translate([37, 4, 40])
cube([10, 4, 10]);
color("Red") {
    translate([35, 6.5, 50])
    rotate([90, 0, 0])
    rotate_extrude(
        angle=90,
        $fn=20
    )
    translate([10, 0, 0])
    circle(0.2);
    translate([14.5, 6.5, 50])
    rotate([0, -90, 90])
    rotate_extrude(
        angle=90,
        $fn=20
    )
    translate([10, 0, 0])
    circle(0.2);
    translate([14.5, 6.5, 60])
    rotate([90, 0, 90])
    linear_extrude(
        height=21,
        slices=100,
        twist=240, 
        $fn=10)
    circle(0.2);
}
color("Red"){
    translate([45, 8, 48])
    rotate([90, 0, 180])
    linear_extrude(height = 0.2)
    text("Arduino", 1);
    translate([15, 8, 48])
    rotate([90, 0, 180])
    linear_extrude(height = 0.2)
    text("Датчик уровня", 1);
    translate([30, 8, 48])
    rotate([90, 0, 180])
    linear_extrude(height = 0.2)
    text("Насос", 1);
}