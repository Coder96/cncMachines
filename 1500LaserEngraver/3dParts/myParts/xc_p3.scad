 
$fn=60;

screwCutout = 4;

blockHeigth = 24;
blockWidth = 10;
blockLength = 32;

holeSepertation = 20;

//import("../Modular_carriages_for_4020_v-slot_for_d3m-bot_d-bot_c-bot/files/test1.ast");

//color("red") cube([10,32,24],center=true);

difference(){
//	plate2Point(blockLength,blockHeigth,blockWidth);
	plate4Point(blockWidth,blockLength,blockHeigth,4);
	for(a = [1,-1]){
		translate([0,a * (holeSepertation/2),0])
			cylinder(h=blockHeigth+5, d=screwCutout, center=true);
	}
	translate([blockWidth/2,0,0])
		cylinder(h=blockHeigth+5, d=2, center=true);
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
