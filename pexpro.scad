// This is a fitting for connecting pneumatic air tools to an air hose.  Specifically, this is an 
// ARO interchange 1/4" (inside) diameter male connection.  
//
// Though there are a lot of different air fittings, this is the most common connector in the USA, 
// as found in most hardware stores.
//
// CAUTION:  It should go without saying, but I'm going to say it anyway.  3D printed parts will 
// leak unless treated, and may fail under pressure regardless.
//
// Liscenced under Creative Commons + Attribution license.
//
// To fulfill the attribution requirement, please provide a link to one of:
// http://theheadlesssourceman.wordpress.com/2018/05/27/air-fitting/
// https://www.thingiverse.com/thing:2933158


// resolution 1=low(aka 1x) 2=mid 3=high
resfactor=2;

// make $fn more automatic
function myfn(r)=max(3*r,12)*resfactor;
module cyl(r=undef,h=undef,r1=undef,r2=undef){cylinder(r=r,h=h,r1=r1,r2=r2,$fn=myfn(r!=undef?r:max(r1,r2)));}
module circ(r=undef){circle(r=r,$fn=myfn(r));}
module ball(r=undef){sphere(r=r,$fn=myfn(r));}

// not including hex area:
airfitting_size=[11.82,11.82,0.5+5.01+1.61+1.11+1.74+2.66+2.14+9.94];

module airfitting(hex_length=12.5){
	// specifically, an ARO interchange 1/4 inch plug
	translate([0,0,-(0.5+5.01+1.61+1.11+1.74+2.66+2.14+9.94+hex_length)]) difference(){
		union(){
			cyl(r1=7.55/2,r2=7.93/2,h=0.5);
			translate([0,0,0.5]) cyl(r=7.93/2,h=5.01);
			translate([0,0,0.5+5.01]) cyl(r1=7.93/2,r2=10.71/2,h=1.61);
			translate([0,0,0.5+5.01+1.61]) cyl(r=10.71/2,h=1.11);
			translate([0,0,0.5+5.01+1.61+1.11]) cyl(r1=10.71/2,r2=8.02/2,h=1.74);
			translate([0,0,0.5+5.01+1.61+1.11+1.74]) cyl(r=8.02/2,h=2.66);
			translate([0,0,0.5+5.01+1.61+1.11+1.74+2.66]) cyl(r1=8.02/2,r2=11.82/2,h=2.14);
			translate([0,0,0.5+5.01+1.61+1.11+1.74+2.66+2.14]) cyl(r=11.82/2,h=9.94);
			translate([0,0,0.5+5.01+1.61+1.11+1.74+2.66+2.14+9.94]) cylinder(r=18.27/2,h=hex_length,$fn=6);
		}
		translate([0,0,-0.5]) cyl(r=4.99/2,h=0.5+5.01+1.61+1.11+1.74+2.66+2.14+9.94+hex_length+1.0);
	}
}

//mirror([0,0,1])
color([1.0,0.9,0.75]) airfitting();