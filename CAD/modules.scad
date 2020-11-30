module boiler(height, radius) {
    color("SkyBlue")
    cylinder(h=height, r=radius, $fn=200);
    color("Plum")
    translate([
        -radius + radius / 2, 
        -radius + radius / 2, 
        height])
    cube([radius / 5, radius / 5, radius]);
    color("Black")
    translate([radius * 1.5, 0, height + height / 15])
    rotate([90, 0, 180])
    linear_extrude(height = radius / 25)
    text("Датчик уровня", 1);
}

module pot(lh, ld2) {
    cylinder(h=lh, d1=10, d2=ld2);
    color("Plum")
    translate([
        -ld2 / 4, 
        -ld2 / 4, 
        lh]) 
    cube([2, 2, lh/2]);
    color("Black")
    translate([
        -ld2 / 4, 
        -ld2 / 4 + 4, 
        lh + 3]) 
    rotate([90, 0, 180])
    linear_extrude(height = 0.2)
    text("Датчик влажности", 1);
}

module mod(lcolor, ltext) {
    color(lcolor)
    cube([10, 4, 10]);
    color("Black")
    translate([7, 4, 8])
    rotate([90, 0, 180])
    linear_extrude(height = 0.2)
    text(ltext, 1);
}

module l_pipe(lheight) {
    color("MediumSpringGreen")
    rotate([90, 0, 90])
    linear_extrude(
        height=lheight,
        slices=100,
        twist=240, 
        $fn=10)
    circle(0.5);
}