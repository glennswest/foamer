// PexPro Fitting

$fn=100;

module pexbody()
{
      translate([0,0,0]) cylinder(r=13.5/2,h=20);
      translate([0,0,0]) cylinder(r=21.5/2,h=3.15);
      translate([0,0,18]) cylinder(r=14.5/2,h=2);
      hull(){
        translate([0,0,20-10.5]) cylinder(r=14.62/2,h=5.6);
        translate([0,0,20-10.5]) cylinder(r=15.5/2,h=2);
      }
      translate([0,0,3.15]) cylinder(r=14.10/2,h=4);
}

module pexholes()
{
    translate([0,0,-0.5]) cylinder(r=10.3/2,h=21);
    translate([-15,10,-0.5]) cube([30,10,5]);
    translate([-15,-20,-0.5]) cube([30,10,5]);
}

module pexpro()
{
    difference(){
        pexbody();
        pexholes();
    }
}

pexpro();