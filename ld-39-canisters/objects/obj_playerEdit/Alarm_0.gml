/// @description Handles shooting

// Create shot
firing = false;

player_ammo -= 1;

var gun_sign = (player_gun.direction >= 90 && player_gun.direction < 270) ? -1 : 1;

var gun_x = x + (player_gun_x * gun_sign) + lengthdir_x(player_gun.shot_length, player_gun.direction);
var gun_y = y + player_gun_y + lengthdir_y(player_gun.shot_length, player_gun.direction);

var plasma = instance_create_depth(
    gun_x, 
    gun_y, 
    0, 
    obj_plasmaShot
);
plasma.projectile_dir = player_gun.direction;

audio_play_sound(snd_shot, 0, false);
