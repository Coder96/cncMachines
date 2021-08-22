
var=0;

module topPlateMountRailHoles(){
  translate([-23,25,0]){
    translate([0,0,0])
      cylinder(h=30, d=4, center=true);
    translate([-30,0,0])
      cylinder(h=30, d=4, center=true);
  }
}
/////////////////////////////////////////////////////////////
module topPlateMountHoles(iHeigth){
 
  H=20;
  D=4;
  translate([x2020,17,iHeigth-2])
    cylinder(h=H,d=D,center=true);
  mirror([0,90,0])
    translate([x2020,17,iHeigth-2])
      cylinder(h=H,d=D,center=true);

  translate([-25,0,iHeigth-2])
    cylinder(h=H,d=D,center=true);

  
}