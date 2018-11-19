// Coin Trap; a 3d-printed cage to hold a coin
// by kyaboileau
// november 19, 2018

// parameters 
coin_d = 23.88;   
coin_th = 1.58; 

// the coin 
%cylinder(r=coin_d/2,th=coin_th,center=true);

// the trap
difference () {
cube(size=coin_d,center=true);
cylinder(r=coin_d/3,h=coin_d*1.5,center=true);
rotate([90,0,0]) cylinder(r=coin_d/3, h=coin_d*1.5, center=true);
   rotate([0,90,0]) cylinder(r=coin_d/3, h=coin_d*1.5, center=true);
    sphere(d=coin_d+gap);
}
   