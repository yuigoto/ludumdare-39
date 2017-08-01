/// @description DescriptionGoesHere

/// Update depth

depth = -y;

if (!is_dashing) {
    if (idle == true) {
        var new_x = 0;
        if (idle_face == 180) new_x = -(enemy_speed / 4);
        if (idle_face == 0) new_x = (enemy_speed / 4);
        var new_y = 0;
        if (idle_face == 270) new_y = (enemy_speed / 4);
        if (idle_face == 90) new_y = -(enemy_speed / 4);
    
        /*
        if (!grid_place_meeting(x + new_x, y + new_y)) {
            x += new_x;
            y += new_y;
        } else {
            idle_face = choose(0, 90, 180, 270);
        }
        */
    
        if (!place_meeting(x + new_x, y + new_y, obj_wall)) {
            x += new_x;
            y += new_y;
        } else {
            idle_face = choose(0, 90, 180, 270);
        }
    }
}
