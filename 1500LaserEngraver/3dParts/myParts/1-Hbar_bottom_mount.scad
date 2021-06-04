 
$fn=10;
//$fn=60;


translate([0,-10,-34.5]) import("../Modular_carriages_for_4020_v-slot_for_d3m-bot_d-bot_c-bot/files/mbot_yc_p2_1_v2.stl");
color("red") translate([-4,0,0]) cube([7,90,20],center=true);

mountingBar();

////////////////////////////////////////////////////////////////////////////////////////////////////
module mountingBar(){
	difference(){
		union(){
			color("green") translate([8.5,0,0]) cubeCylinder(18, 100, 4, 2);
			translate([0,17,-2]) color("green") translate([8.5,0,0]) cubeCylinder(18, 4, 6, 2);
		}
		color("violet") translate([7.5,0,0]) cylinder(d=5,h=40,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module rail(topX, topY, botX, botY){

	hull(){
		cube([topX,topY,.001],center=true);
		translate([0,0,-2])
			cube([botX,botY,.001],center=true);
	}
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
////////////////////////////////////////////////////////////////////////////////////////////////////
module screwCutOut(headDiamitor, shaftDiamitor){

        cylinder(h=10, d=headDiamitor, center=true);
        translate([0,0,-9])
                cylinder(h=10, d=shaftDiamitor, center=true);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module connectorCutout(Diamitor, heigth){

intersection() {
		cube([Diamitor,10,heigth],center=true);
		rotate([90,90,0]) cylinder(d=Diamitor, h=10, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module cubeCylinder(iX, iYm, iZ, iD){

	edgeDiamitor = iD;
	
	hull(){
		for(a=[[1,1,1],[-1,1,1],[1,-1,1],[-1,-1,1],[1,1,-1],[-1,1,-1],[1,-1,-1],[-1,-1,-1]]){
			translate([
				a[0]*((iX/2) -(edgeDiamitor/2)), 
				a[1]*((iYm/2)-(edgeDiamitor/2)), 
				a[2]*((iZ/2) -(edgeDiamitor/2))]) sphere(d=edgeDiamitor);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module triagleCylinder(iX, iY, iZ, iD){
	
	halfD = iD/2;
	hull(){
		color("red")		translate([-halfD   , (iY/2)-halfD, halfD]) sphere(d=iD);	
		color("grey")		translate([-iX+halfD, (iY/2)-halfD, halfD]) sphere(d=iD);
		color("green")	translate([-halfD   , (iY/2)-halfD, iZ-halfD]) sphere(d=iD);

		color("red")		translate([-halfD   , -(iY/2)+halfD, halfD]) sphere(d=iD);	
		color("grey")		translate([-iX+halfD, -(iY/2)+halfD, halfD]) sphere(d=iD);
		color("green")	translate([-halfD   , -(iY/2)+halfD, iZ-halfD]) sphere(d=iD);
	}
}
