/// @description DescriptionGoesHere
/// Move towards player

var has_ob = collision_line(x, y, global.PLAYER.x, global.PLAYER.y, obj_wall, false, true);

// Checks if player is within range and no walls between
if (!is_dashing) {
    if (point_distance(x, y, global.PLAYER.x, global.PLAYER.y) < 128 && !has_ob) {
        if (irandom(10) == 10) {
            is_dashing = true;
            is_dashing_speed = 4;
            if (path_exists(path)) {
                path_end();
            }
        } else {
            get_path_to_player();
            go_to_timer = 6;
            idle = false;
        }
    } else {
        if (go_to_timer == 0) {
            path_end();
            idle = true;
            idle_face = choose(0, 90, 180, 270);
        }
    
        if (go_to_timer > 0) go_to_timer -= 1;
    }
}

alarm[0] = room_speed / 4;
