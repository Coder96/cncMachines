
	use <rightMotorBottomCover.scad>;

//	 color("grey") translate([16.4, 23, 14]) # cube([10, 10, 10],center=true);

difference(){
	
	mirror([0,90,0]) BottomCover();
//	translate([26.4,1,-3.5]) cube([10, 45, 28],center=true);
	translate([26.4,1,-1.5]) cube([10, 45, 28],center=true);
	translate([32.4,1,-1.5]) cube([10, 45, 28],center=true);
	rotate([0, 45, 0]) translate([5, 23, 18]) cube([30, 4, 7],center=true);
}
