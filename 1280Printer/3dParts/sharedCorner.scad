
// Common Values
$fn=360;
cFN=$fn;

arcDiamiter  = 75;
arcRoundOver = 5;
arcRoundOrChamfer="Round"; // Round|Chamfer

width2020 = 20.2;
x2020 = 15.262;
y2020 = 0;

// Bottom Corner
baseHeigth=67;

// Top Corner
topHeigth=23;

archTopEdgeType = "r"; // n=none,r=round,c=chamfer
archBotEdgeType = "r"; // n=none,r=round,c=chamfer
  
///////////////////////////////////////////////
module arcBlock(iHeigth){
  difference(){
    cylinder(h=iHeigth,d=75,center=true);
    arcBulkCutOuts(iHeigth);
  }
}
///////////////////////////////////////////////
module arcRoundOver(iHeigth, iTopEdge="r", iBotEdge="r"){
  difference(){
    union(){
// top
    translate([0,0,-iHeigth/2])
      rotate([0,180,0])
			if(iTopEdge == "r"){
				fillet_r(arcRoundOver, 75/2, 1, cFN);
			}
			if(iTopEdge == "c"){
				chamfer_r(arcRoundOver, 75/2, 1, cFN);
			}
// Bot
    translate([0,0,iHeigth/2])
			if(iBotEdge == "r"){
				fillet_r(arcRoundOver, 75/2, 1, cFN);
			}
			if(iBotEdge == "c"){
				chamfer_r(arcRoundOver, 75/2, 1, cFN);
			}
    }
    arcBulkCutOuts(iHeigth);
  }
}
///////////////////////////////////////////////
module arcBulkCutOuts(iHeigth){
//  Remove Bulk
    translate([-16.7,0,0])
     cube([50,100,iHeigth+2],center=true);
//  Remove Left
    translate([-16.356,0,0])
      rotate([0,0,-30])
      cube([27.5,100,iHeigth+2],center=true);
    rotate([0,0,-30])
      translate([0,17,0])
      translate([-1,1,0])   
      cylinder(h=iHeigth+2,d=2,center=true);
//  Remove Right
    mirror([0,90,0])
      translate([-16.356,0,0])
      rotate([0,0,-30])
     cube([27.5,100,iHeigth+2],center=true);
    mirror([0,90,0])
      rotate([0,0,-30])
      translate([0,17,0])
      translate([-1,1,0])   
      cylinder(h=iHeigth+2,d=2,center=true);
}
///////////////////////////////////////////////
module sideRailHoles(size=1, l=1){
  hs=40;
  ws=30;
  for(a=[[1,1,"green"],[-1,1,"red"],[-1,-1,"orange"],[1,-1,"blue"]]){
    translate([0,a[0]*(ws/2),a[1]*(hs/2)])
      rotate([180,0,0]) color(a[2])
        tearDrop(size, l);  
    }
}
///////////////////////////////////////////////
module roundedTrapezoid(x1=1, y1=1,x2=1, y2=1, z1=1, d1=6){
  hull(){
  // top Right
    translate([-x1,y1,0])
      cylinder(h=z1,d=d1,center=true);
  // Top Left
    translate([-x1,-y1,0])
      cylinder(h=z1,d=d1,center=true);
  // Bottom Right
    translate([-x2,y2,0])
      cylinder(h=z1,d=d1,center=true);
  // Bottom Left
    translate([-x2,-y2,0])
      cylinder(h=z1,d=d1,center=true);
  }
}
///////////////////////////////////////////////
module cornerForm(iHeigth){
  difference(){
    union(){
      rotate([0,0,-90]) translate([0,-22,iHeigth/2])
        Equilateral_Triangle(l=90,height=iHeigth,center=true);
//%      rotate([0,0,-90]) translate([0,-10,iHeigth/2]) Equilateral_Triangle(l=138.5,height=1,center=true);
      translate([-5 ,0,iHeigth/2])
        arcBlock(iHeigth);
    }
    cornerFormCutouts(iHeigth);
  }
}
///////////////////////////////////////////////
module cornerFormCutouts(iHeigth){
    translate([-5 ,0,iHeigth/2])
      arcRoundOver(iHeigth, archTopEdgeType, archBotEdgeType);
// Mid Trapezoid
    translate([0,0,iHeigth/2])
      roundedTrapezoid(x1=1.83, y1=10.2, x2=25.24, y2=23.75, z1=iHeigth+2);
// Back Trapezoid
    translate([-33.4,0,iHeigth/2])
      roundedTrapezoid(x1=1.83, y1=29.5, x2=25.24, y2=43, z1=iHeigth+2);  
}
///////////////////////////////////////////////
module railMountsHoles(){
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
}
///////////////////////////////////////////////
module cutout2020(iHeigth=10, cornerSpace=false){
  cube([width2020,width2020,iHeigth],center=true);
  if(cornerSpace == true){
    for(a=[[1,1,"green"],[-1,1,"red"],[-1,-1,"orange"],[1,-1,"blue"]]){
      translate([a[0]*((width2020-1)/2),a[1]*((width2020-1)/2),0])
        rotate([180,0,0]) color(a[2])
       cylinder(h=iHeigth,d=2,center=true);  
    }
  }
}