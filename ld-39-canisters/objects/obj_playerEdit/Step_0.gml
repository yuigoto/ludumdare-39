/// @description Check control input

// Movement triggers
var move_h, move_v, act_shoot, act_dash;

// H/V movement
move_h = movementRight() - movementLeft();
move_v = movementDown() - movementUp();

// Shoot/dash
act_dash    = (action6Pressed() && !dashing) || (mouse_check_button_pressed(mb_right) && !dashing);
act_shoot   = action8() || mouse_check_button(mb_left);

// Check dash
dashing_spd = (act_dash && player_ammo > 4) ? 1 : approach(dashing_spd, 0, fact_dash);
dashing = (dashing_spd > 0) ? true : false;

// Dashing time
if (dashing) {
    if (dashing_time > 0) {
        dashing_time--;
    } else {
        dashing_time = 2;
        
        // Create cloud here
        instance_create_depth(x, y, 0, obj_dashDust);
        
        if (act_dash && player_ammo > 0) {
            player_ammo -= 4;
            instance_create_depth(
                x, 
                y + 2, 
                depth - 1, 
                obj_plasmaOver  
            );
        }
    }
} else {
    dashing_time = 0;
}

// Check movement initial speed
if (move_h != 0) {
    if (sign(walk_spd_x) != sign(move_h)) {
        walk_spd_x = approach(walk_spd_x, 0, fact_decel);
    }
    walk_spd_x = approach(
        walk_spd_x, 
        sign(move_h) * walk_spd_max, 
        fact_accel
    );
} else {
    walk_spd_x = approach(walk_spd_x, 0, fact_decel);
}

if (move_v != 0) {
    if (sign(walk_spd_y) != sign(move_v)) {
        walk_spd_y = approach(walk_spd_y, 0, fact_decel);
    }
    walk_spd_y = approach(
        walk_spd_y, 
        sign(move_v) * walk_spd_max, 
        fact_accel
    );
} else {
    walk_spd_y = approach(walk_spd_y, 0, fact_decel);
}

walk_spd_x += sign(walk_spd_x) * dashing_spd;
walk_spd_y += sign(walk_spd_y) * dashing_spd;

// Shooting
if (act_shoot && !dashing) {
    if (!firing) {
        // Is firing
        firing = true;
        
        // If player has ammo
        if (player_ammo > 0) {
            // Shoot
			alarm[0] = 5;
        } else {
            // Don't shoot
            firing = false;
        }
    }
}

// Adjust camera
var cam_width   = camera_get_view_width(view_camera[0]);
var cam_height  = camera_get_view_height(view_camera[0]);

if (cam_width != view_wport[0]) {
    cam_width = lerp(cam_width, view_wport[0] div 2, .2);
}

if (cam_height != view_hport[0]) {
    cam_height = lerp(cam_height, view_hport[0] div 2, .2);
}

camera_set_view_size(view_camera[0], cam_width, cam_height);
