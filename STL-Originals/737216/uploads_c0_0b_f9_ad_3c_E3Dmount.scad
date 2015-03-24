$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

gap = 38;
screw_hole = 1.6;

bottomU = 2.2;
bottomU_slot = 15.5;

topU = 4.8;
topU_slot = 12.3;

length_y = 40;
width_x = gap+topU+bottomU;
height_z = 27;

fan_hole_centres = 32;

module fan_screw_holes(centres = 32, holeR = 1.6, depth = 4) {
	for(xp = [0:1]) { //4 x screw holes
		for(yp = [0:1]) { 
			translate([(centres/2) - (xp*centres), (centres/2) - (yp*centres),-.1]) cylinder(depth,holeR,holeR);
		}
	}
}

module bottom_slot() {
	hull() {
		translate([-7.5,length_y/2,(25/2)+2]) rotate([0,90,0]) cylinder(r=bottomU_slot/2, 10);
		translate([-7.5,length_y/2,(25)+2]) rotate([0,90,0]) cylinder(r=bottomU_slot/2, 10);
	}
}

module top_slot() {
	hull() {
		translate([width_x-7.5,length_y/2,(25/2)+2]) rotate([0,90,0]) cylinder(r=topU_slot/2, 10);
		translate([width_x-7.5,length_y/2,(25)+2]) rotate([0,90,0]) cylinder(r=topU_slot/2, 10);
	}    
}

module my_carriage() {
    //heatsink screw holes
    translate([20,4,-1]) cylinder(r=screw_hole,h=6);
    translate([20,36,-1]) cylinder(r=screw_hole,h=6);
}

module rrp_carriage() {
    //heatsink screw holes
    translate([5,12.5,-1]) cylinder(r=screw_hole,h=6);
    translate([5,27.5,-1]) cylinder(r=screw_hole,h=6);
}

difference() {
    union() {
        difference() {
            cube([width_x,length_y,3]); //Base/back
            my_carriage();
            rrp_carriage();

        }
        
        difference() {
            cube([bottomU,length_y,height_z]); //bottom U
            bottom_slot();
        }

        difference() {
            translate([width_x-topU,0,0]) cube([topU,length_y,height_z]); //top U
            top_slot();
        }

        cube([15,6,height_z]);
        translate([0,length_y-6,0]) cube([15,6,height_z]);
    }
    
    translate([width_x-(fan_hole_centres/2)-(topU/2),length_y/2,height_z-9]) fan_screw_holes(fan_hole_centres, 1.4, 10);
}
