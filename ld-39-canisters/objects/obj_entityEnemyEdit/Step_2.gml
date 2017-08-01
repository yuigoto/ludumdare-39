/// @description DescriptionGoesHere

if (is_dashing) {
    var dash_dir = point_direction(x, y, global.PLAYER.x, global.PLAYER.y);
    x += lengthdir_x(is_dashing_speed, dash_dir);
    y += lengthdir_y(is_dashing_speed, dash_dir);
    
    is_dashing_speed = approach(is_dashing_speed, 0, is_dashing_decel);
    
    if (is_dashing_speed <= 0) {
        is_dashing = false;
        is_dashing_timer = 0;
    } else {
        if (is_dashing_timer == 0) {
            is_dashing_timer = 2;
            instance_create_depth(x, y, depth + 1, obj_dashDust);
        } else {
            is_dashing_timer --;
        }
    }
}

if (place_meeting(x - 1, y, obj_wall)) x += 1;
if (place_meeting(x + 1, y, obj_wall)) x -= 1;
if (place_meeting(x, y - 1, obj_wall)) y += 1;
if (place_meeting(x, y + 1, obj_wall)) y -= 1;
