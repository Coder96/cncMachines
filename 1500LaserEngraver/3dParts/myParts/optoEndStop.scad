 
$fn=60;

screwCutout = 4;

blockHeigth = 24;
blockWidth = 9;
blockLength = 18;

holeSepertation = 8;

boardBoxWidth = 28.5;
boardBoxDepth = 11.2;
boardBoxz = 1.6;
boardBoxWidthHoleBorder = 7;
boardBoxWidthHole = 3.4;



BoardBock();

module BoardBock(){
	boardPlugWidth = 5.7;
	boardPlugDepth = 10.2;
	boardPlugZ = 6.7;

	boardOptoWidth = 13;
	boardOptoDepth = 6;
	boardOptoZ = 10.2;

	difference(){
		union(){
			cube([boardBoxWidth,boardBoxDepth,boardBoxz],center=true);  // Board
//			translate([0,0,-boardBoxz])
//				cube([boardBoxWidth-4.3,boardBoxDepth-1,2],center=true);	// Spacer for Pins
			for(a = [1,-1]){
				translate([(a * (boardBoxWidth/2)),0,0])
					cylinder(h=boardBoxz,d=boardBoxWidthHoleBorder,center=true);	// Outside Hole
			}
		}
		for(a = [1,-1]){
			translate([(a * (boardBoxWidth/2)),0,0])
				cylinder(h=boardBoxz+.1,d=boardBoxWidthHole,center=true);	// Hole
		}
	}
	
	translate([-8.2,0,(boardPlugZ/2)+(boardBoxz/2)])
		cube([boardPlugWidth,boardPlugDepth,boardPlugZ],center=true);		// PlugBlock
	
	translate([2,-2,(boardOptoZ/2)+(boardBoxz/2)])
		difference(){
			cube([boardOptoWidth,boardOptoDepth,boardOptoZ],center=true);		// PlugBlock
			translate([0,0,+1.1])
				cube([5,boardOptoDepth+1,8.2],center=true);		// PlugBlock
		}
}

module aa(){
	difference(){
	//	plate2Point(blockLength,blockHeigth,blockWidth);
		plate4Point(blockWidth,blockLength,blockHeigth,6);
		for(a = [1,-1]){
			translate([.5,(a * (holeSepertation/2))+1,0])
				cylinder(h=blockHeigth+5,d=screwCutout,center=true);
		}
		translate([blockWidth/2,0,0])
			cylinder(h=blockHeigth+5,d=2,center=true);
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
