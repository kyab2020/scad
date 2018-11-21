// Coin Trap; a 3d-printed cage to hold a coin
// by kyaboileau
// nov.19, 2018
// nov.21, 2018

// parameters ------------------------------------------------------- 
coin_d = 23.88;   
coin_th = 1.58; 
gap=1;
$fa=1;
$fs=1;

//render -------------------------------------------------------------

trap(coin_d,coin_th);

//modules ------------------------------------------------------------

module coin(coin_d,coin_th) {
    %cylinder(r=coin_d/2,th=coin_th,center=true);
}

module trap(coin_d,coin_th) {
    translate([0,0,coin_d/2]) {
    coin(coin_d,coin_th);
    difference () {
    minkowski(){
    cube(size=.8*coin_d,center=true);
      sphere(r=.1*coin_d);  
    }
    translate(0,0,coin_d) cylinder(h=coin_d*2, d=coin_d*0.55);
    cylinder(r=coin_d/3,h=coin_d*1.5,center=true);
    rotate([90,0,0]) cylinder(r=coin_d/3, h=coin_d*1.4, center=true);
    rotate([0,90,0]) cylinder(r=coin_d/3, h=coin_d*1.4, center=true);
    sphere(d=coin_d+gap);
    translate([coin_d*0.75,0,0]) sphere(d=coin_d);
    translate([coin_d*-0.75,0,0]) sphere(d=coin_d);
    translate([0,coin_d*0.75,0]) sphere(d=coin_d);
    translate([0,0,coin_d*0.75]) sphere(d=coin_d);
    translate([0,0,coin_d*-0.75]) sphere(d=coin_d);
}
   }
   }