 
$fn=30;

include <wireBoxVarables.scad>;

function wbbpMakePositive(n)=(n<0) ? (n*-1) : n ;

use <../Button_PBS-33B/button_PBS-33B.scad>;


//wbbpTest(3);
wbbpPannel(3);


////////////////////////////////////////////////////////////////////////////////////////////////////
module wbbpPannel(iCount){
	difference(){
		plate4Point((iCount*wbbpSpaceBetweenButtons)+wbbpEndSpacer,wbbpButtonDepth,3,4);
		wbbpCornerHoles(iCount);
		translate([(-((iCount-1)*wbbpSpaceBetweenButtons)/2),0,0]){
			for(c=[1:iCount]){
				translate([(c-1)*wbbpSpaceBetweenButtons,0,-.3]){
					rotate([0,0,90])
						PBS_33B_Simple();
				}
			}
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module wbbpCornerHoles(iCount){

	holeOffset = 5;
	
	for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
		translate([
			(a[0]*((iCount*wbbpSpaceBetweenButtons)+wbbpEndSpacer)/2)-a[0]*holeOffset,
			(a[1]*(wbbpButtonDepth/2))-a[1]*holeOffset,
			0])
			screwCutOut(3.2,3.2);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module wbbpTest(iCount){
	for(c=[-iCount:iCount]){
		translate([0,(wbbpButtonDepth*c)-1,0]) 
			wbbpPannel(wbbpMakePositive(c));
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
module cubeSphere(iX, iYm, iZ, iD){

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
module triagleSphere(iX, iY, iZ, iD){
	
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
////////////////////////////////////////////////////////////////////////////////////////////////////
