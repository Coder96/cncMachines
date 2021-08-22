//translate([-7.01,0,0]) import("HE3D_K280_Corner_Supports/files/Top_Corner_Support.stl");

use<scadlib/library.scad>;
use<scadlib/triangles.scad>;
use<scadlib/tearDrop.scad>;
use<scadlib/edgeTools/corner-tools.scad>;

include<sharedTopCorner.scad>;
include<sharedCorner.scad>;

use<topCorner.scad>;

archTopEdgeType = "r";
archBotEdgeType = "n";

archTopCoverHeigth = 6;

rotate([180,0,0]) translate([0,0,-29.1])
%topCorner();

//difference(){
topCornerCover();
//  translate([0,0,-9])
//    scale([.95,.95,3])
//      topCornerCover();
//}

///////////////////////////////////////////////
module topCornerCover(){
  difference(){
    hull()
    union(){
      cornerForm(archTopCoverHeigth);
      adds();
    }
      cutoutsTop(archTopCoverHeigth);
  }
}
///////////////////////////////////////////////
module adds(){

  X=-47;
  Y=63;
  D=7;

  translate([X,Y,D/2]){
    difference(){
      sphere(d=D);
      translate([0,0,D/4])
        cylinder(h=D/2, d=D, center=true);
    }
  }
  translate([X,Y,archTopCoverHeigth-(1/2)])
    cylinder(h=1, d=D, center=true);
  
  translate([X,-Y,D/2]){
    difference(){
      sphere(d=D);
      translate([0,0,D/4])
        cylinder(h=D/2, d=D, center=true);
    }
  }
    
  translate([X,-Y,archTopCoverHeigth-(1/2)])
    cylinder(h=1, d=D, center=true);
}
///////////////////////////////////////////////
module cutoutsTop(iHeigth){
  topPlateMountHoles(iHeigth);

  rotate([0,0,-30])
    topPlateMountRailHoles();
  mirror([0,90,0])
    rotate([0,0,-30])
      topPlateMountRailHoles();

}
///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
