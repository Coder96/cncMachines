//
//  Step 3
//  
//  Add pieces to model
//
addPieces();
///////////////////////////////////////////////////////
module addPieces(){
//    import("2_BottomCornerMotorSupportOnePiece.stl");
  
    mh = 60;
  // Fill in holes
    translate([-28.5,29.5,(mh/2)])
      cylinder(h=mh,d=7,center=true,$fn=90);
    translate([-28.5,-29.5,(mh/2)])
      cylinder(h=mh,d=7,center=true,$fn=90);
  // Fill above motor
    translate([-30.23,0,(mh-5.5)])
     cube([3.99,50,11],center=true);
  // Fill in floor hole
    translate([17,0,(mh)+2])
       cylinder(h=2,d=20,center=true,$fn=90);
}
//
//  Step 2
//  
//  Cut Down to one piece
//
//jointThePieces();
///////////////////////////////////////////////////////
module jointThePieces(){
  import("BottomCornerSupportOnePiece.stl");
  translate([-25.23,0,60/2]) rotate([0,-90,0]) import("BottomMotorOnePiece.stl"); 
}
///////////////////////////////////////////////////////
//
//  Step 1
//  
//  Cut Down to one piece
//
//cut2OneCorner();
//cut2OneMotor();
///////////////////////////////////////////////////////
module cut2OneCorner(){
  difference(){
    import("Bottom_Corner_Support.stl");
    mCube=65;

    translate([-mCube-5,0,(mCube/2)-1])
  #    cube([mCube+1,mCube+25,mCube],center=true);
    
    translate([mCube+3,0,(mCube/2)-1])
  #   cube([mCube+1,mCube+25,mCube],center=true);
  }
}
///////////////////////////////////////////////////////
module cut2OneMotor(){
  difference(){
    import("Stepper_Mount.stl");
    mCube=65;

    translate([-mCube-1,0,(mCube/2)-1])
  #    cube([mCube+1,mCube+25,mCube],center=true);
    
    translate([mCube+1,0,(mCube/2)-1])
  #   cube([mCube+1,mCube+25,mCube],center=true);
  }
}