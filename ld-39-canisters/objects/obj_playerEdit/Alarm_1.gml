/// @description Handles leaking
if (player_ammo > 0) {
    instance_create_depth(
        x, 
        y + 12, 
        depth, 
        obj_plasmaLeak  
    );

    player_ammo--;

    alarm[1] = room_speed;
}
