$fn = 30;

depth = 10.5;


//plate4Point(40,20,10.5,7); // 10.5 is the default spacer needed. Save for checking.


difference(){
	plate4Point(74,70,depth,7); // back
	translate([0,22,4]) color("RED") plateCutout();
}

mountRails(-33.5,0,10.25);

translate([0,0,-5.05]) plate4Point(120,120,.4,70); // for extra hold to the bed.


//# translate([0,0,16]) cube([60,100,20],center=true); // 20 X 60 mm rail

module plateCutout(){
	hull(){
		cube([18, 62, 7], center=true);
		translate([0,22,0]) cube([62, 18, 7], center=true);

	}
	translate([0,22,0]) cube([70, 18, 7], center=true);

	translate([0,30,3]) hull(){
		sphere(r = 10);
		translate([0,-50,0]) sphere(r = 10);
	}

}

module mountRails(x,y,z){
	x1 = 5;
	y1 = 70;
	z1 = 31;
	d1 = 7;
	translate([x,y,z]) mountRail(x1,y1,z1,7);
	mirror([90,0,0]) translate([x,y,z]) mountRail(x1,y1,z1,7);
}

module mountRail(x,y,z,d){
	difference(){
		union(){
			plate2Point(x,y,z,d);
			translate([-3,13,0]) mountRailRidge(z,d);
			translate([-3,-13,0]) mountRailRidge(z,d);
		}
		translate([0,0,5]) bolt5mm(z,d);
		translate([0,25,5]) bolt5mm(z,d);
		translate([0,-25,5]) bolt5mm(z,d);
	}
}

module mountRailRidge(h,d){
cylinder(h=h, d=d, center=true);
}


module plate2Point(x,y,z,d){
	hull(){
		color("green") translate([0 ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([0 ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}

module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}



module bolt5mm(){
	color("Green") rotate([0,90,0]) cylinder(d=5.3,h=100,center=true);
}