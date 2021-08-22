//import("HE3D_K280_Corner_Supports/files/2_BottomCornerMotorSupportOnePiece.stl");

use<scadlib/library.scad>;
use<scadlib/triangles.scad>;
use<scadlib/tearDrop.scad>;
use<scadlib/edgeTools/corner-tools.scad>;

include<sharedCorner.scad>;

archTopEdgeType = "r";
archBotEdgeType = "n";


//bottombase();
difference(){
  cornerForm(baseHeigth);
  cutoutsBottum(baseHeigth);
}
///////////////////////////////////////////////
module cutoutsBottum(iHeigth){
// Vertical 2020
  translate([x2020, y2020, 26.5])
    cutout2020(iHeigth,true);
//    cube([hole2020,hole2020,iHeigth],center=true);
// Hole below 2020
  translate([x2020,y2020,63])
    cylinder(h=10,d=15,center=true);
// Top Vertical Mount
  rotate([180,0,0])
    translate([28,0,-12])
    tearDrop(4.2, 12);  
  rotate([180,0,0])
    translate([31.362,0,-12])
    tearDrop(7.2, 4);  
// Bot Ver Mount
  rotate([180,0,0])
    translate([28,0,-50])
    tearDrop(4.2, 12);  
  rotate([180,0,0])
    translate([31.362,0,-50])
   tearDrop(7.2, 4);  
// Virtical Beam Access Hole
  translate([3,0,17])
    rotate([180,0,0])
    tearDrop(20.2, 7);
  translate([3,0,35])
    rotate([0,90,0])
    plate4Point(42,20.2,7,4);
// Mortor Mount holes
  translate([-30,0,30])
    motorMountHoles(3.2, 7);
// Mortor Shaft hole
  translate([-30,0,30])
    rotate([180,0,0])
    tearDrop(25, 7);
// Motor Screw access
  translate([12,0,30])
    motorMountHoles(4, 40);
  railMountsHoles();
}
///////////////////////////////////////////////
module bottombase(){
  difference(){
    union(){
      rotate([0,0,-90]) translate([0,-22,baseHeigth/2])
        Equilateral_Triangle(l=90,height=baseHeigth,center=true);
      translate([-5 ,0,baseHeigth/2])
        arcBlock(baseHeigth);
    }
    translate([-5 ,0,baseHeigth/2])
    arcRoundOver(baseHeigth);
// Vertical 2020
    translate([x2020, y2020, 26.5])
      cube([hole2020,hole2020,baseHeigth],center=true);
// Hole below 2020
    translate([x2020,y2020,63])
      cylinder(h=10,d=15,center=true);
// Virtical Beam Access Hole
    translate([3,0,17])
      rotate([180,0,0])
      tearDrop(20.2, 7);
    translate([3,0,35])
      rotate([0,90,0])
      plate4Point(42,20.2,7,4);
// Top Vertical Mount
     rotate([180,0,0])
    translate([28,0,-12])
     tearDrop(4.2, 12);  
    rotate([180,0,0])
      translate([31.362,0,-12])
     tearDrop(7.2, 4);  
// Bot Ver Mount
    rotate([180,0,0])
      translate([28,0,-50])
      tearDrop(4.2, 12);  
    rotate([180,0,0])
      translate([31.362,0,-50])
     tearDrop(7.2, 4);  
// Mid Polygon
    midCutOut(x1=1.83, y1=10.2, x2=25.24, y2=23.75, z1=baseHeigth);
// Bot Polygon
      translate([-33.4,0,0])
        midCutOut(x1=1.83, y1=29.5, x2=25.24, y2=43, z1=baseHeigth);
// Rail Mounts
    mirror([0,90,0])
      rotate([0,0,30])
      translate([-38,-13,30])
      rotate([0,0,-90])
      sideRailHoles(4.4, 7);
    rotate([0,0,30])
      translate([-38,-13,30])
      rotate([0,0,-90])
      sideRailHoles(4.4, 7);
// Mortor Mount holes
    translate([-30,0,30])
      motorMountHoles(3.2, 7);
// Mortor Shaft hole
    translate([-30,0,30])
      rotate([180,0,0])
      tearDrop(25, 7);
// Motor Screw access
    translate([12,0,30])
      motorMountHoles(4, 40);
  }
}
///////////////////////////////////////////////
module motorMountHoles(size=1, l=1){
  hs=31;
  for(a=[[1,1],[-1,1],[-1,-1],[1,-1]]){
    translate([0,a[0]*(hs/2),a[1]*(hs/2)])
      rotate([180,0,0])
        tearDrop(size, l);  
    }
}
///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
