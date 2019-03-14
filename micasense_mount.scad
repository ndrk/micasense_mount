seatDiameter = 12;
seatLength = 10;
seatWidth = seatDiameter;
seatHeight = seatDiameter/2+3;
seatLengthInset = 10;

slotWidth = 5;

plateWidth = 126+seatDiameter;
plateLength = 65;
plateThickness = 2;

mountHoleDiameter = 3;
mountHoleWidthSpacing = 60;
mountHoleLengthSpacing = 35;

smoothness = 80;

union() {
	plate();
	mountSeats();
}

module mountSeats() {
	translate([plateLength/2-seatLength-seatLengthInset,plateWidth/2-seatWidth,0])
		mountSeat();
	translate([-plateLength/2+seatLengthInset,plateWidth/2-seatWidth,0])
		mountSeat();
	translate([-plateLength/2+seatLengthInset,-plateWidth/2,0])
		mountSeat();
	translate([plateLength/2-seatLength-seatLengthInset,-plateWidth/2,0])
		mountSeat();
}

module mountSeat() {
	difference() {
		cube([seatLength, seatWidth, seatHeight]);
		translate([-0.5,seatWidth/2,seatHeight])
			rotate([90,0,90])
				cylinder(d=seatDiameter, h=seatLength+1, $fn=smoothness);
	}
}

module plate() {
	difference() {
		rotate(0,0,0)
			translate([-plateLength/2, -plateWidth/2, -plateThickness])
				cube([plateLength, plateWidth, plateThickness]);
		rotate(0,0,0)
			translate([-mountHoleLengthSpacing/2, 0, -plateThickness])
				cylinder(d=mountHoleDiameter, h=plateThickness, $fn=smoothness);
		rotate(0,0,0)
			translate([mountHoleLengthSpacing/2, 0, -plateThickness])
				cylinder(d=mountHoleDiameter, h=plateThickness, $fn=smoothness);
		rotate(0,0,0)
			translate([0, -mountHoleWidthSpacing/2, -plateThickness])
				cylinder(d=mountHoleDiameter, h=plateThickness, $fn=smoothness);
		rotate(0,0,0)
			translate([0, mountHoleWidthSpacing/2, -plateThickness])
				cylinder(d=mountHoleDiameter, h=plateThickness, $fn=smoothness);
		rotate(0,0,0)
			translate([plateLength/2-seatLength-seatLengthInset,plateWidth/2-seatWidth-slotWidth,-plateThickness])
				cube([seatLength, slotWidth, plateThickness]);
		rotate(0,0,0)
			translate([-plateLength/2+seatLengthInset,plateWidth/2-seatWidth-slotWidth,-plateThickness])
				cube([seatLength, slotWidth, plateThickness]);
		rotate(0,0,0)
			translate([plateLength/2-seatLength-seatLengthInset,-plateWidth/2+seatWidth,-plateThickness])
				cube([seatLength, slotWidth, plateThickness]);
		rotate(0,0,0)
			translate([-plateLength/2+seatLengthInset,-plateWidth/2+seatWidth,-plateThickness])
				cube([seatLength, slotWidth, plateThickness]);
	}
}