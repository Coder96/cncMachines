//translate([-7.01,0,0]) import("HE3D_K280_Corner_Supports/files/Top_Corner_Support.stl");

use<scadlib/library.scad>;
use<scadlib/triangles.scad>;
use<scadlib/tearDrop.scad>;
use<scadlib/edgeTools/corner-tools.scad>;

include<sharedTopCorner.scad>;
include<sharedCorner.scad>;

archTopEdgeType = "r";
archBotEdgeType = "n";

topCorner();
//color("green") translate([-15,-25,23-10]) cube([5,5,10]);
///////////////////////////////////////////////
module topCorner(){
  difference(){
    union(){
      cornerForm(topHeigth);
      adds();
    }
      cutoutsTop(topHeigth);
  }
}
///////////////////////////////////////////////
module adds(){
// inside mount
    translate([-20.7324, 0, topHeigth/2])
     roundedTrapezoid(x1=1, y1=3.5, x2=9, y2=9, z1=topHeigth, d1=4);
// outside mount
    translate([3.1621, 0, topHeigth/2])
     roundedTrapezoid(x1=1, y1=9, x2=10, y2=3.5, z1=topHeigth, d1=4);
  
}
///////////////////////////////////////////////
module cutoutsTop(iHeigth){
// Vertical 2020
  translate([x2020, y2020, 8.5])
    cutout2020(iHeigth,true);
//    cube([hole2020,hole2020,iHeigth],center=true);
// Hole below 2020
  translate([x2020,y2020,iHeigth-2])
    cylinder(h=10,d=15,center=true);
// 2020 Front Mount
  rotate([180,0,0])
    translate([28,0,-12])
    tearDrop(4.2, 12);  
  rotate([180,0,0])
    translate([31.362,0,-12])
    tearDrop(7.2, 4);  
// 
  rotate([180,0,0])
    translate([-15,0,-10.2])
    tearDrop(2.9, 45);  
  rotate([180,0,0])
    translate([-32.231,0,-10.2])
    tearDrop(5.56, 4);  
// Rail Mounts
    mirror([0,90,0])
      rotate([0,0,30])
      translate([-38,-13,33])
      rotate([0,0,-90])
      sideRailHoles(4.4, 7);
    rotate([0,0,30])
      translate([-38,-13,33])
      rotate([0,0,-90])
      sideRailHoles(4.4, 7);
      
   topPlateMountHoles(iHeigth);
}
///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
