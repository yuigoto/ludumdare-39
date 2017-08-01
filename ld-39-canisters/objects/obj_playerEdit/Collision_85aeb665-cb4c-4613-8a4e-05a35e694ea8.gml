/// @description Reload Ammo!

// Get the canister
if (player_ammo < player_max_ammo) {
    if (player_ammo <= 0) {
        alarm[1] = room_speed / 2;
    }
    
    player_ammo += 4;
    if (player_ammo > player_max_ammo) player_ammo = player_max_ammo;
} else {
    instance_create_depth(
        x, 
        y + 2, 
        depth - 1, 
        obj_plasmaOver  
    );
}

audio_play_sound(snd_load, 0, false);

instance_destroy(other);