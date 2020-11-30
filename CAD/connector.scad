module connector(
    lcolor,
    length,
    height,
    thickness)
{
    color(lcolor)
    translate([height, 0, 0])
    rotate([90, 0, 0])
    {
        translate([length, 0, 0])
        rotate_extrude(
            angle=90,
            $fn=20
        )
        translate([height, 0, 0])
        circle(thickness);
        translate([0, 0, 0])
        rotate([0, 0, 90])
        rotate_extrude(
            angle=90,
            $fn=20
        )
        translate([height, 0, 10])
        circle(thickness);
        translate([0, height, 0])
        rotate([90, 0, 90])
        linear_extrude(
            height=length,
            slices=100,
            twist=240, 
            $fn=10)
        circle(thickness);
    }
}
