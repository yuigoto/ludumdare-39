/// @description DescriptionGoesHere
/// Move towards player

//var has_ob = collision_line(x, y, global.PLAYER.x, global.PLAYER.y, obj_collision, false, true);
var has_ob = mp_linear_path(obj_levelGenGrid.grid_path, global.PLAYER.x, global.PLAYER.y, enemy_speed, false);

// Checks if player is within range and no walls between
if (point_distance(x, y, global.PLAYER.x, global.PLAYER.y) < 128 && !has_ob) {
    get_path_to_player();
    go_to_timer = 6;
    idle = false;

    alarm[0] = room_speed / 4;
} else {
    if (go_to_timer == 0) {
        path_end();
        idle = true;
        idle_face = choose(0, 90, 180, 270);
    }
    
    if (go_to_timer > 0) go_to_timer -= 1;

    alarm[0] = room_speed / 4;
}

