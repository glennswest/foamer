
use <nutsbolts.scad>;
inch = 25.4;  // 25.4 mm to inch

$fn=200;

module endcap_body()
{ 
  hull(){
    translate([0,0,-17]) cylinder(r=.30*inch,h=2);
    translate([0,0,0])   cylinder(r=1*inch,h=10);
    translate([0,20,-10]) rotate([60,0,0]) cylinder(r=.30*inch,h=2);  
   }
}

module endcap_holes()
{
    translate([0,0,-20]) cylinder(r=.25 * inch,h=100);
    translate([0,22,-11]) rotate([60,0,0]) cylinder(r=.25 * inch,h=35);
    translate([.85 * inch,0,-10]) cylinder(r=1.6,h=30);
    translate([-.85 * inch,0,-10]) cylinder(r=1.6,h=30);
    translate([0,-.85 * inch,-10]) cylinder(r=1.6,h=30);
    translate([-.58 * inch,-.58 * inch,-10]) cylinder(r=1.6,h=30);
    translate([-.58 * inch, .58 * inch,-10]) cylinder(r=1.6,h=30);
    translate([ .58 * inch, .58 * inch,-10]) cylinder(r=1.6,h=30);
    translate([ .58 * inch,-.58 * inch,-10]) cylinder(r=1.6,h=30);
}


module endcap()
{
    difference(){
        endcap_body();
        endcap_holes();
    }
}


endcap();