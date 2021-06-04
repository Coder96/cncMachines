 
$fn=60;

screwCutout = 5.9;

outterDiameter = 8;
baseHeigth = 3.35;
coneHeigth = 2;

//translate([-4,-4,0]) import("../Wheel_spacers_alternative/files/32-Wheel_Spacer_Upgraded.STL");

difference(){
	union(){
		translate([0,0,0]) 					// Base
			cylinder(d=outterDiameter,h=baseHeigth);
		translate([0,0,baseHeigth])
			cylinder(h=coneHeigth,d1=outterDiameter,d2=screwCutout+1);
	}
	translate([0,0,0]) 					// Cut out
		cylinder(d=screwCutout,h=20,center=true);
}
	
////////////////////////////////////////////////////////////////////////////////////////////////////
module plate2Point(y,z,d){
	hull(){
		color("green") translate([0 ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([0 ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}
