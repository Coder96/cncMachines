 
$fn=60;


difference(){
	import("../D-Bot_Core-XY_3D_Printer/files/1-Motor_Mount_Left.stl");

	translate([15, 27.5, 25]) cube([30, 7, 20],center=true);
	
	
	
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
