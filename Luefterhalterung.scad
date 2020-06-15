// Lüfter-Halterung Anzcubic i3 Mega-S (ohne Hub-Platine)

t = 0.001; // tolerance

plate_height = 2;

fan_box_height = 10;

// Lochradius M3 Schrauben
sr1 = 3.8 / 2;

// Lüfterschrauben-Lochdurchmesser / Phase
sr2 = 5.4 / 2;
sr3 = 6.5 / 2;

// Lüfter-Aussparung
fr1 = 60 / 2;

difference() {

    union() {
        // Hauptkörper
        translate([-50, 0, 0])
            cube([125, 9, 28]);

        // Lueftersockel
        translate([-31, -7, 28 - plate_height])
            cube([62, 15, plate_height]);
    }


    difference() {
        // Motorstecker-Aussparung
        translate([-40, -0.5, -1])
            cube([90, 10, 27]);

        // Motorstecker-Aussparung (ecke links)
        translate([-50, -0.5, 25])
            rotate([0, 45, 0])
                cube([10, 10, 20]);

        // Motorstecker-Aussparung (ecke rechts)
        translate([50, -0.5, 20])
            rotate([0, -45, 0])
                cube([10, 10, 20]);

    }

    // rechte Aussparung
    translate([52, -2, 2])
        cube([25, 10, 30]);

    // rechte Abschrägung
    translate([76, 0, 1.5])
        rotate([0,-42,0])
            cube([25, 10, 37]);

    // linke Aussparung
    translate([-52, -2, 2])
        cube([10, 10, 30]);

    // linke Abschrägung
    translate([-60.5,5,3])
        rotate([0,17.5,0])
            cube([10, 10, 30]);

    translate([-46, 4, -10])
        cylinder(h = 30, r1 = sr1, r2 = sr1, $fn = 60);

    translate([117.6 - 46, 4, -10])
        cylinder(h = 30, r1 = sr1, r2 = sr1, $fn = 60);

    translate([117.6 - 46 - 12.5, 4, -10])
        cylinder(h = 30, r1 = sr1, r2 = sr1, $fn = 60);        

    // Luefter Loch 1 (Bohrung)
    translate([-25, 2, 15])
        cylinder(h = 30, r1 = sr2, r2 = sr2, $fn = 60);

    // Luefter Loch 2 (Phase)
    translate([-25, 2, 26])
        cylinder(h = 0.6, r1 = sr3, r2 = sr2, $fn = 60);

    // Luefter Loch 2 (rechts)
    translate([25, 2, 15])
        cylinder(h = 30, r1 = sr2, r2 = sr2, $fn = 60);

    // Luefter Loch 2 (rechts)
    translate([25, 2, 26])
        cylinder(h = 0.6, r1 = sr3, r2 = sr2, $fn = 60);


    // Lüfter-Loch
    translate([0, 28, 0])
        cylinder(h = 30, r1 = fr1, r2 = fr1, $fn = 80);

}




// // Stuetzblock
// translate([32, -28, -21])
//     cube([10, 18, 10 + t]);

// // Loch 1  tiefer
// translate([117.6 - 46 - 33.4, 4 - 17.1, -25])
//   cylinder(h = 30, r1 = sr1, r2 = sr1, $fn = 60);

// // Loch 2  tiefer
// translate([117.6 - 46 - 33.4, 4 - 17.1 - 11.14, -25])
//   cylinder(h = 30, r1 = sr1, r2 = sr1, $fn = 60);