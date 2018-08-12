/*
 *    pipe_adapter.scad
 *
 */
include <polyScrewThread.scad>

PI=3.141592;

/* Usage Example: 
 * Just a 100mm long threaded rod.
 *
 * screw_thread(15,   // Outer diameter of the thread
 *               4,   // Step, traveling length per turn, also, tooth height, whatever...
 *              55,   // Degrees for the shape of the tooth 
 *                       (XY plane = 0, Z = 90, btw, 0 and 90 will/should not work...)
 *             100,   // Length (Z) of the tread
 *            PI/2,   // Resolution, one face each "PI/2" mm of the perimeter, 
 *               0);  // Countersink style:
 *                         -2 - Not even flat ends
 *                         -1 - Bottom (countersink'd and top flat)
 *                          0 - None (top and bottom flat)
 *                          1 - Top (bottom flat)
 *                          2 - Both (countersink'd)
 */
difference () {
cylinder(h=20,r=16,$fn=6);					// Outside Body
union () {
screw_thread(21.34,1.81432,55,10,PI/2,2);  // 1/2" NPT
screw_thread(13.72,1.41122,55,22,PI/2,2);  // 1/4" NPT
}
}


// Note the threads above don't have a taper per NPT standard.
// The informational table on outer diameter and pitch was mined from Wikipedia
// http://en.wikipedia.org/wiki/National_pipe_thread

/********************************************************* 
Pipe Size 	Thread OD				Thread Pitch
(in)
----------------------------------------------------------
1⁄16		0.3125 in (7.94 mm)		0.03704 in (0.94082 mm)
1⁄8			0.405 in (10.29 mm)		0.03704 in (0.94082 mm)
1⁄4			0.540 in (13.72 mm)		0.05556 in (1.41122 mm)
3⁄8			0.675 in (17.15 mm)		0.05556 in (1.41122 mm)
1⁄2			0.840 in (21.34 mm)		0.07143 in (1.81432 mm)
3⁄4			1.050 in (26.67 mm)		0.07143 in (1.81432 mm)
1			1.315 in (33.40 mm)		0.08696 in (2.20878 mm)
1 1⁄4		1.660 in (42.16 mm)		0.08696 in (2.20878 mm)
1 1⁄2		1.900 in (48.26 mm)		0.08696 in (2.20878 mm)
2			2.375 in (60.33 mm)		0.08696 in (2.20878 mm)
*********************************************************/

