// Coin Trap; a 3d-printed cage to hold a coin
// by kyaboileau
// nov.19, 2018
// nov.21, 2018

// parameters ------------------------------------------------------- 
quarter_d = 23.88;   
quarter_th = 1.58; 
penny_d=19.05;
penny_th=1.45;
gap=1;
$fa=1;
$fs=1;

//render ---------------------------------------------------------

trap(quarter_d,quarter_th);
translate([0,-25,0])trap(penny_d,penny_th);
!base(quarter_d);

//modules ------------------------------------------------------------
module base(coin_d) { 
    difference() {
    minkowski() {
        translate([0,0,0]) sphere(d=coin_d);
       translate([0,0,-coin_d/2]) #cube(size=[coin_d*1.05,coin_d*1.05,coin_d],center=true); 
    } 
}
}
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
    translate(0,0,coin_d) cylinder(h=coin_d*2, d=coin_d*0.66);
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