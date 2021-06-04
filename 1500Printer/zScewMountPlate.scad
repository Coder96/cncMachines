$fn=30;

//color("green") translate([9,0,0]) cube([43,2,10],center=true);



difference(){
	Plate(10,40,3);
	cylinder(h=20,d=10.5,center=true);
	ScrewHoles(11.3);
	translate([30,0,0]) ScrewSlots(8);
}

module ScrewSlots(Space){
	color("red") translate([0,-Space,0]) ScrewSlot(8);
	color("red") translate([0,Space,0]) ScrewSlot(8);
}
module ScrewSlot(Size){
	hull(){	
		color("green") translate([Size/2,0,0]) cylinder(h=10, d=5.3, center=true);
		color("blue") translate([-Size/2,0,0]) cylinder(h=10, d=5.3, center=true);
	}
}

module ScrewHoles(Space){
	translate([Space/2,Space/2,0]) cylinder(h=15, d=3.3, center=true);
	translate([-Space/2,Space/2,0]) cylinder(h=15, d=3.3, center=true);
	translate([Space/2,-Space/2,0]) cylinder(h=15, d=3.3, center=true);
	translate([-Space/2,-Space/2,0]) cylinder(h=15, d=3.3, center=true);
}

module Plate(Width,length,Height){
	hull(){
		color("green") translate([length,Width,0]) cylinder(h=Height, d=7, center=true);
		color("blue") translate([length,-Width,0]) cylinder(h=Height, d=7, center=true);
		color("red") translate([-Width,Width,0]) cylinder(h=Height, d=7, center=true);
		color("grey") translate([-Width,-Width,0]) cylinder(h=Height, d=7, center=true);
	}
}