 
$fn=60;

screwCutout = 4;

blockHeigth = 24;
blockWidth = 9;
blockLength = 18;

holeSepertation = 8;

//%			mirror([0,90,0]) import("../NEMA_17_back_cover/files/NEMA_17_cover.stl");


BottomCover();
module BottomCover(){
translate([23,  21.0, -26]) rotate([180, 0, 0]) triagleCylinder(46.5, 5, 17, 2);
translate([23, -21.0, -26]) rotate([180, 0, 0]) triagleCylinder(46.5, 5, 17, 2);


	difference(){
		union(){
			translate([0,0,-9.5]) cubeCylinder(47, 47, 37, 2);
			translate([2,0,-33]) coverMount();
		}
		translate([0,0,10]) motorBlank(43, 43, 16);
		translate([0,0,-9]) motorBlank(39, 39, 30);
		translate([0,20,-10]) connectorCutout(16, 14.5);
		translate([28,0,0]) rotate([90,0,90]) scale([1,1,6]) rail(17, 35, 25, 35);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module coverMount(){

//#	translate([48,-24.15,0]) rotate([90,0,180]) import("../D-Bot_Core-XY_3D_Printer/files/1-Motor_Mount_Right.stl");
	
	heigth = 52;
	
	rightY = 6.85;
	leftY = -11.16;

	rightY = 6.85 + .5;
	leftY = -11.16 - .5;

	
	difference(){
		union(){
//			translate([23.375, -.00001, 16]) cubeCylinder(8.75,47,heigth,2);
			translate([23.8, -.00001, 16]) cubeCylinder(9.5,47,heigth,2);
//		translate([28.7495
			translate([29.4995, rightY ,16]) rotate([90,0,90]) rail(7, heigth-6, 11, heigth-2);
			translate([29.4995, leftY  ,16]) rotate([90,0,90]) rail(7, heigth-6, 11, heigth-2);
		}
		translate([19,rightY,-2]) rotate([0,-90,0]) screwCutOut(9, 6);
		translate([19.9,leftY,-2]) rotate([0,-90,0]) screwCutOut(9, 6);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module motorBlank(cutoutX, cutoutY, cutoutHeigth){

//	cutoutHeigth = 16;
//	cutoutX = 43;
//	cutoutY = 43;
	
	difference(){
		cube([cutoutX, cutoutY, cutoutHeigth],center=true);
		for(a=[[1,1,-1],[1,-1,1],[-1,1,1],[-1,-1,-1]]){
			translate([
				a[0]*(cutoutX/2),
				a[1]*(cutoutY/2),
				0]) rotate([0,0,a[2]*45]) cube([10, 5, cutoutHeigth+2],center=true);
		}
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
