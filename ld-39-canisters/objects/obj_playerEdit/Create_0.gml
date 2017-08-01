/// @description Initialize player variables

player_srfc     = noone;

// Player health
player_health   = 100;

// Ammo indicators
player_ammo     = 200;
player_max_ammo = 200;

// Walking speed max
walk_spd_max    = 2;

// Current walking speed
walk_spd_x      = 0;
walk_spd_y      = 0;

// Subpixel walking speed
walk_sub_x      = 0;
walk_sub_y      = 0;

// Multiplier for accel, decel factors
fact_ratio      = 1;

// Acceleration, deceleration, etc.
fact_accel      = 0.50 * fact_ratio;
fact_decel      = 0.75 * fact_ratio;
fact_dash       = 0.05 * fact_ratio;

// Direction the player is facing
facing_dir      = 0;

// Gun offset position
player_gun_x    = 3;
player_gun_y    = -8;

// Gun instance handler
player_gun      = instance_create_depth(
    x + player_gun_x, 
    y + player_gun_y, 
    0, 
    obj_plasmaGun
);

// Statuses
firing          = false;
dashing         = false;
dashing_time    = 0;
dashing_spd     = 0;

depth = -y;

// It's LEAKING, dude
alarm[1] = room_speed / 2;
