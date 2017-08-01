/// move(hspd, vspd)
var hspd = argument[0];
var vspd = argument[1];

var face = point_direction(x, y, x + hspd, y + vspd);
var dist = point_distance(x, y, x + hspd, y + vspd);

// H collisions
if (grid_place_meeting(x + hspd, y)) {
    while (!grid_place_meeting(x + sign(hspd), y)) {
        x += sign(hspd);
    }
    hspd = 0;
}

// Move H
x += hspd;

// V collisions
if (grid_place_meeting(x, y + vspd)) {
    while (!grid_place_meeting(x, y + sign(vspd))) {
        y += sign(vspd);
    }
    vspd = 0;
}

// Move V
y += vspd;
