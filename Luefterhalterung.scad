// Lüfter-Halterung Anzcubic i3 Mega-S (ohne Hub-Platine)
//
// TODO:
// - Luefter ist nicht mittig: muss 3mm nach rechts (done)
// - Öffnung 2mm nach unten und fr1 1mm kleiner (done)
// - Lueftersockel ecken abrunden / schöner machen (done)
// - Loch 3 kann 0,25 mm nach links (und durch 3mm Zylinder ersetzt werden) (done)
// 

t = 0.001; // tolerance

plate_height = 2;

fan_box_height = 10;

fan_center_x = 2;
fan_center_y = 27;
fan_z = 27;

// Lochradius M3 Schrauben
sr1 = 3.8 / 2;

// Lüfterschrauben-Lochdurchmesser / Phase
zr = 2.9 / 2;
sr2 = 5.4 / 2;
sr3 = 6.5 / 2;

// Lüfter-Aussparung
fr1 = 59 / 2;
fr2 = 70 / 2;

fan_loch1_x = fan_center_x - 25;
fan_loch1_y = fan_center_y - 25;
fan_loch2_x = fan_center_x + 25;
fan_loch2_y = fan_loch1_y;

difference() {

    union() {
        // Hauptkörper
        translate([-50, 0, 0])
            cube([125, 9, 28]);

        // Lueftersockel
        // translate([-31, -7, 28 - plate_height])
        //     cube([62, 15, plate_height]);

        translate(v = [fan_center_x, fan_center_y, fan_z])
            cylinder(h = 2, r1 = fr1 + 12, r2 = fr1 + 12, center = true, $fn = 180);

        // Loch 3 (rechts innen)
        translate([117.6 - 46 - 12.7, 4, -1.5])
            cylinder(h = 30, r1 = zr, r2 = zr, $fn = 60);        
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

    // rest vom Kreis abschneiden
    translate([-50, 9, 2])
        cube([130, 100, 50]);

    // rest vom Kreis abschneiden
    translate([-50, -28, 2])
        cube([130, 20, 50]);


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

    // Loch 1 (links)
    translate([-46, 4, -10])
        cylinder(h = 30, r1 = sr1, r2 = sr1, $fn = 60);

    // Loch 2 (ganz außen)
    translate([117.6 - 46, 4, -10])
        cylinder(h = 30, r1 = sr1, r2 = sr1, $fn = 60);

    // Luefter Loch 1 (Bohrung)
    translate([fan_loch1_x, fan_loch1_y, 15])
        cylinder(h = 30, r1 = sr2, r2 = sr2, $fn = 60);

    // Luefter Loch 2 (Phase)
    translate([fan_loch1_x, fan_loch1_y, 26])
        cylinder(h = 0.6, r1 = sr3, r2 = sr2, $fn = 60);

    // Luefter Loch 2 (rechts)
    translate([fan_loch2_x, fan_loch2_y, 15])
        cylinder(h = 30, r1 = sr2, r2 = sr2, $fn = 60);

    // Luefter Loch 2 (rechts)
    translate([fan_loch2_x, fan_loch2_y, 26])
        cylinder(h = 0.6, r1 = sr3, r2 = sr2, $fn = 60);

    // Lüfter-Loch
    translate(v = [fan_center_x, fan_center_y, fan_z + 0.5])
        cylinder(h = 4, r1 = fr1, r2 = fr1, center = true, $fn = 180);
}
