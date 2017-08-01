/// @description Follows the character it's been assigned to

if (camera_follow) {
    // Define the target position to follow
    var to_x, to_y, cam_x, cam_y;

    // Set camera to move towards the mouse
    move_towards_point(mouse_x, mouse_y, 0);    
    
    gamepad_set_axis_deadzone(0, .2);
    if (abs(gamepad_axis_value(0,gp_axisrh)) > .3 || abs(gamepad_axis_value(0,gp_axisrv)) > .3) {
        var dirs = point_direction(x, y, x + gamepad_axis_value(0, gp_axisrh), y + gamepad_axis_value(0, gp_axisrv));
        direction = dirs;
    }

    // Set target points
    to_x = camera_follow.x + lengthdir_x(min(32, distance_to_point(mouse_x, mouse_y)), direction);
    to_y = camera_follow.y + lengthdir_y(min(32, distance_to_point(mouse_x, mouse_y)), direction);

    // Move with some easing
    x += (to_x - x) / 15;
    y += (to_y - y) / 15;
    
    cam_x = -(camera_get_view_width(view_camera[0])/2) + x;
    cam_y = -(camera_get_view_height(view_camera[0])/2) + y;
    cam_x = clamp(cam_x, 0, room_width-camera_get_view_width(view_camera[0]));
    cam_y = clamp(cam_y, 0, room_height-camera_get_view_height(view_camera[0]));
    
    if (camera_shake > 0) {
        cam_x += random_range(-camera_shake, camera_shake);
        cam_y += random_range(-camera_shake, camera_shake);
        camera_shake *= .9;
        if(camera_shake < .3) camera_shake = 0;
    }
    
    camera_set_view_pos(
        view_camera[0], 
        cam_x, 
        cam_y
    );
}
