
use <aro_air_fitting.scad>;
use <MCAD/nuts_and_bolts.scad>;
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

module bolt()
{
    translate([0,0,-22.40]) cylinder(r=3.5,h=20);
    translate([0,0,0])boltHole(3.1,length=20);
    %translate([0,0,0])boltHole(3.1,length=20);
}
    
module endcap_holes()
{
    translate([0,0,-20]) cylinder(r=4.99,h=100);
    translate([0,22,-11]) rotate([60,0,0]) cylinder(r=4.99,h=35);
    translate([.85 * inch,0,-1]) bolt();
    translate([-.85 * inch,0,-1]) bolt();
    translate([0,-.85 * inch,-1]) bolt();
    translate([-.58 * inch,-.58 * inch,-1]) bolt(); 
    translate([-.58 * inch, .58 * inch,-1]) bolt();
    translate([ .58 * inch, .58 * inch,-1]) bolt();
    translate([ .58 * inch,-.58 * inch,-1]) bolt();
}


module endcap()
{
    difference(){
        endcap_body();
        endcap_holes();
    }
    translate([0,0,-10]) airfitting(0);
    translate([0,14,-6]) rotate([60,0,0]) airfitting(0);
}


endcap();