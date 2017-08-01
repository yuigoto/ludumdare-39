/// @description DescriptionGoesHere

/// Move away from other enemies exact same spot
if (x == other.x && y = other.y) {
    move(sign(other.id - id), 0);
}

var dir = point_direction(other.x, other.y, x, y);
var hspd = lengthdir_x(.5, dir * 2);
var vspd = lengthdir_y(.5, dir * 2);
move(hspd, vspd);
