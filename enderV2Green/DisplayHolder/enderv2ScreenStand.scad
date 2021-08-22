$fn=30;

//translate([((-88.35)+(-88.35)/2)-1,(-30.05)+(-30.05)-9,110.53]) rotate([-74.5,0,0])
//  import("/home/jklein/downloads/easyprint-ender3v2-screen-holder.stl");

baseWidth = 91;
baseThick = 4;

use<../../../ProjectsMisc/scadLib/library.scad>;
use<../../../ProjectsMisc/scadLib/tearDrop.scad>;
 
base();

//////////////////////////////////////////////////////
module base(){
  difference(){
    union(){
    color("blue")
      cube([baseWidth,85,4],center=true);
      walls();  
      translate([-11.35, 0, 3.83])
        rails();
    }     
    rotate([0,90,90])
      translate([0, -13.3, 15.67])
      pinSlots();
////////////////////////////// Top cut
    translate([0, -51, -10])
      rotate([15.2, 0, 0])
      cube([baseWidth+2,30,100],center=true);
////////////////////////////// bottom cut
    translate([0, 58.64, -10])
      rotate([15.2, 0, 0])
      cube([baseWidth+2,30,100],center=true);
////////////////////////////// back cut
    translate([0, 10, -48.7])
      rotate([24.5, 0, 0])
      cube([90+2,100,50],center=true);
  }
}
//////////////////////////////////////////////////////
module rails(){
  rail();
    translate([53.35, 0, 0])
    mirror([0, 90, 0])
    rail();
 }
 //////////////////////////////////////////////////////
module rail(){
  color("green")
  rotate([90,90,-2.7])
    plate2Point(6, 85, 3);
  color("GreenYellow")
  rotate([90,90,-2.7])
    translate([2, 0, 0])
    plate2Point(6, 85, 3);
 }
 //////////////////////////////////////////////////////
module pinSlots(){
  pinSlot();
  translate([0,0,-36])
    pinSlot();
}
 //////////////////////////////////////////////////////
module pinSlot(){

  color("SteelBlue")
    hull(){
      tearDrop(iDiameter=6, iLength=10, iPoint=true);
      translate([0,0,-10])
        tearDrop(iDiameter=6, iLength=10, iPoint=true);
    }
  color("LightSteelBlue")
    translate([0,0,-10])
    rotate([0,90,0])
    cylinder(h=10, d=10.1, center=true);  
}
 //////////////////////////////////////////////////////
module walls(){

  translate([(baseWidth/2)-(baseThick/2), 0, (-50/2)+(4/2)])
  wall();
  translate([-(baseWidth/2)+(baseThick/2), 0, (-50/2)+(4/2)])
    wall();
}
 //////////////////////////////////////////////////////
module wall(){
    cube([baseThick,100,50],center=true);  
}
