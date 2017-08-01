/// @description Handles movement and subpixel movement, gun direction

var new_spd_x, new_spd_y;

// Subpixel calculation
walk_sub_x += walk_spd_x;
walk_sub_y += walk_spd_y;
new_spd_x   = round(walk_sub_x);
new_spd_y   = round(walk_sub_y);
walk_sub_x -= new_spd_x;
walk_sub_y -= new_spd_y;

// Define the facing direction
facing_dir  = point_direction(x, y, x + new_spd_x, y + new_spd_y);

// Moving distance
moving_dir  = point_distance(x, y, x + new_spd_x, y + new_spd_y);
if (new_spd_x != 0 || new_spd_y != 0) moving_dir += dashing_spd;

// Define new X and Y
if (!grid_place_meeting(x + lengthdir_x(moving_dir, facing_dir), y)) {
    x += lengthdir_x(moving_dir, facing_dir);
}

if (!grid_place_meeting(x, y + lengthdir_y(moving_dir, facing_dir))) {
    y += lengthdir_y(moving_dir, facing_dir);
}

// Clamp position
x = clamp(x, 16, room_width - 16);
y = clamp(y, 16, room_height - 16);

var temp_dirs = point_direction(x, y, mouse_x, mouse_y);
    
gamepad_set_axis_deadzone(0, .2);
if (abs(gamepad_axis_value(0,gp_axisrh)) > .3 || abs(gamepad_axis_value(0,gp_axisrv)) > .3) {
    temp_dirs = point_direction(x, y, x + gamepad_axis_value(0, gp_axisrh), y + gamepad_axis_value(0, gp_axisrv));
}
    
if (temp_dirs >= 90 && temp_dirs < 270) temp_dirs += player_gun.shot_angle;
if (temp_dirs < 90 || temp_dirs >= 270) temp_dirs -= player_gun.shot_angle;

var gun_sign = (temp_dirs >= 90 && temp_dirs < 270) ? -1 : 1;

player_gun.direction    = temp_dirs;
player_gun.image_angle  = temp_dirs;

if (temp_dirs >= 90 && temp_dirs < 270) {
    image_xscale = -1;
    player_gun.image_yscale = -1;
} else if (temp_dirs < 90 || temp_dirs >= 270) {
    image_xscale = 1;
    player_gun.image_yscale = 1;
}

if (temp_dirs < 180) {
    sprite_index = spr_playerFrontR;
    player_gun.depth = depth + 1;
} else if (temp_dirs < 360) {
    sprite_index = spr_playerFront;
    player_gun.depth = depth - 1;
}

// Handle rotation and gun position
player_gun.x = x + player_gun_x * gun_sign;
player_gun.y = y + player_gun_y;

// Handle sprite moving

if (new_spd_x != 0 || new_spd_y != 0) {
    image_speed = 1;
} else {
    image_index = 0;
    image_speed = 0;
}
