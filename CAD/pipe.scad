module pipe() {
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
}