
use <aro_air_fitting.scad>;
use <MCAD/nuts_and_bolts.scad>;
use <MCAD/regular_shapes.scad>;

inch = 25.4;  // 25.4 mm to inch

$fn=200;

module endcap_body()
{ 
  
    translate([0,0,0])   cylinder(r=1*inch,h=9);  
}

module bolt()
{
    translate([0,0,-22.40]) cylinder(r=3.3,h=8);
    translate([0,0,0])boltHole(3.1,length=6);
    %translate([0,0,0])boltHole(3.1,length=6.2);
    translate([0,0,4]) nut_trap();
}
    
module endcap_holes()
{
    translate([0,0,-20]) cylinder(r=4.99,h=100);
    translate([.85 * inch,0,-1]) bolt();
    translate([-.85 * inch,0,-1]) bolt();
    translate([0,-.85 * inch,-1]) bolt();
    translate([-.58 * inch,-.58 * inch,-1]) bolt(); 
    translate([-.58 * inch, .58 * inch,-1]) bolt();
    translate([ .58 * inch, .58 * inch,-1]) bolt();
    translate([ .58 * inch,-.58 * inch,-1]) bolt();
    translate([0,0,3]) cylinder_tube(2, 1*inch+1, 5);
}


module bubble_gen()
{
    difference(){
        cone(10, 1*inch);
        translate([0,0,-1]) cone(10, 1 * inch);
        pathRadius=2;
        num=20;
        for (pathRadius=[7.5:2.5:22]){
          num = num + pathRadius / 1.5;
          for (i=[1:num])  {
	         translate([pathRadius*cos(i*(360/num)),pathRadius*sin(i*(360/num)),0]) cylinder(r=.5,h=30,          $fn=20);
              }
          }
    }
}

module endcap()
{
    difference(){
        endcap_body();
        endcap_holes();
    }
}

//nut trap
//default values are for M3 nut
//if you use this module as a nut trap cutout, you need to add +de (ie 0.1mm or similiar) to height
//in order to get non-manifold cutouts
module nut_trap (
        w = 5.5,
        h = 3.1
        )
{
        cylinder(r = w / 2 / cos(180 / 6) + 0.05, h=h, $fn=6);
}    


  endcap();
  for (lv=[0:5:150]){
    translate([0,0,lv+6]) bubble_gen();
    }
   translate([0,0,5]) cylinder_tube(160, 1 * inch, 2);
   difference(){ 
     hull(){
        translate([0,0,165]) cylinder_tube(1, 1 * inch, 2);    
        translate([0,0,190]) cylinder_tube(1, .540 * inch, 2);
        }
     translate([0,0,164]) cylinder(r=.540 * inch / 2,h=100);
     }    