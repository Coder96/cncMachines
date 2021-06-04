 
$fn=30;

include <wireBoxVarables.scad>;

vSlotSize = 24.5;
vSlotBack = 4;

spacerConnectorLeft  = 30;
spacerConnectorRight = 53;

% translate([0,(wbBoxDepth/2)+10,0]) color("orange") cube([10,10,10],center=true);

use <../../../ewGRBLDuino/EccentricWorkshopGrblDuinoMegaInergradedv1Holder.scad>;
use <utilityFunctions.scad>;

//translate([0,0,-15]) color("aqua") boardMount();		// For Reference.

//rotate([90,0,0]) translate([5,0,-5]) triagleSphere(10, 10, 10, 4);

// difference(){
 mainBox();
//  translate([-15,0,0]) cube([wbBoxWidth+1,wbBoxDepth+1,wbBoxHeigth/+1],center=true);	// Printing test cutout X
//  translate([0,-60,0]) cube([wbBoxWidth+1,wbBoxDepth+1,wbBoxHeigth/+1],center=true);	// Printing test cutout Y
//  translate([0,0,30]) cube([wbBoxWidth+1,wbBoxDepth+1,wbBoxHeigth/+1],center=true);	// Printing test cutout Z
// }

/*
translate([
	-(wbBoxWidth/2)+7,
	(wbBoxDepth/2)-(spacerConnectorLeft/2),
	0]) color("blue")
	cube([10,spacerConnectorLeft,10],center=true);

translate([
	(wbBoxWidth/2)-7,
	(wbBoxDepth/2)-(spacerConnectorRight/2),
	0]) color("red")
	cube([10,spacerConnectorRight,10],center=true);
*/
//mainBoxCover();
//coverSupports("mh");
////////////////////////////////////////////////////////////////////////////////////////////////////
module mainBox(){
	difference(){
		union(){
			difference(){
				cubeSphere(wbBoxWidth,wbBoxDepth,wbBoxHeigth,4);
				translate([0,0,4]) cubeSphere(wbBoxWidth-8,wbBoxDepth-8,wbBoxHeigth,6); // box cutout
			}
		//translate([0,0,-20])
		coverSupports();
		}
		translate([0,0,(wbBoxHeigth/2)]) plate4Point(wbBoxWidth-4,wbBoxDepth-4,4,4);	// Top cut out

		translate([-(wbBoxWidth/2),((wbBoxDepth/2)-(14.5/2))-spacerConnectorLeft,5]) color("blue")	// Left top
			rotate([0,90,90]) 
				connectorCutout(16, 14.5);
			
// 		translate([0,(wbBoxDepth/2)-(spacerConnectorLeft/2)-(14.5*1.6),0]) color("green")
// 			translate([wbBoxWidth/2,0,0]) rotate([0,90,90]) connectorCutout(16, 14.5);	// Left bot
// 			-(wbBoxDepth/2)+(spacerConnectorRight/2)+(16/2)
		
		translate([wbBoxWidth/2,((wbBoxDepth/2)-(14.5/2))-spacerConnectorRight,5]) color("red") // Right
			rotate([0,90,90]) 
				connectorCutout(16, 14.5); 
	}
	translate([0,0,-22]) scale([1,1,.5]) boardCornerConeMounts(3.9);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module mainBoxCover(){
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module cornerMount2020(){

	difference(){
		railMount(vSlotSize, vSlotBack);
		railMountHoles(vSlotSize, vSlotBack, 4, 10);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module railMountHoles(m1, m2, HoleSize, startOffset){
	
	spacing = 20;
	count = (wbBoxWidth/spacing)-1;
	
	translate([-startOffset, 0, 0])
	for(a=[0:count]){
		translate([a*spacing, 0, 0]) railMountHoles2(m1, m2, HoleSize);
		translate([a*spacing, (m1/2)-(m2/2), (m1/2)-(m2/2)]) rotate([90, 180, 0]) railMountHoles2(m1, m2, HoleSize);
		}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module railMountHoles2(m1, m2, HoleSize){
	
	translate([0, -(m2/2), 2]) screwCutOut(HoleSize, HoleSize+3);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module railMount(m1, m2){
//	m1 = 24.5;
//	m2 = 4;

	difference(){
		union(){
			railMount2(m1, m2);
			translate([0, (m1/2)-(m2/2), (m1/2)-(m2/2)]) rotate([90, 180, 0]) railMount2(m1, m2);
		}
		translate([0, (m1/2)-(m2)-.1, (m2/2)+.1]) rotate([0,90,0]) cylinder(d=.5,h=wbBoxWidth+4,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module railMount2(m1, m2){

	cubeSphere(wbBoxWidth, m1, m2, 2);
	translate([0, -(m2/2), 2.9945]) rail(wbBoxWidth-8, 7, wbBoxWidth-4, 11);
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
module coverSupports(type){
	supportSize = 15;
	holeOffset = 5;
	for(a = [[1,1,0],[-1,1,90],[1,-1,-90],[-1,-1,180],[0,-1,45],[0,1,-135]]){
		translate([
			a[0]*((wbBoxWidth/2)-supportSize/2),
			a[1]*((wbBoxDepth/2)-supportSize/2),
			0]){
			if(type == "mh"){
				cylinder(d=3.5,h=90,center=true);
			} else {
				difference(){
					if(a[0] == 0){
						difference(){
							cubeSphere(supportSize*.75,supportSize*.75,wbBoxHeigth,4);
							translate([0,0,-10]) rotate([-50,0,(a[2]-45)]) cube([25,25,150],center=true);	// Cut bot off
						}
					} else {
						rotate([90,0,a[2]]) 
							translate([supportSize/2,0,-supportSize/2]) 
							difference(){
							triagleSphere(supportSize, wbBoxHeigth, supportSize, 4);	// Corner
							 
							translate([0,-30,0]) rotate([-55,-45,0]) cube([25,25,150],center=true);	// Cut bot off
						}
					}
					translate([
						(a[0]*(supportSize/2)-a[0]*(3.4/2)-a[0]*holeOffset),
						(a[1]*(supportSize/2)-a[1]*(3.4/2)-a[1]*holeOffset),
						0])
						cylinder(d=3.2,h=90,center=true);
					translate([0,0,(-wbBoxHeigth/2)+15]){
// 					cube([5.6,20.2,5],center=true); // Nuttt slot
					}
				}
			}
		}
	}
}
