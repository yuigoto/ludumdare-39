/// @description DescriptionGoesHere

/*
// Store the target ID
target = instance_place(x, y, obj_floor);

// Does it collide with the floor?
if (instance_exists(target)) {
    // Check all corners for the existence of floors
    var up = place_meeting(x, y - 32, obj_floor);
    var dn = place_meeting(x, y + 32, obj_floor);
    var lt = place_meeting(x - 32, y, obj_floor);
    var rt = place_meeting(x + 32, y, obj_floor);
    
    // Place wall tiles
    if (!up) instance_create_depth(x, y - 32, 0, obj_wall);
    if (!dn) instance_create_depth(x, y + 32, 0, obj_wall);
    if (!lt) instance_create_depth(x - 32, y, 0, obj_wall);
    if (!rt) instance_create_depth(x + 32, y, 0, obj_wall);
}

if (x < start_xpos) x = start_xpos;

if (x == final_xpos) {
    y += 32;
    x = 0;
} else {
    x += 32;
}

if (y > final_ypos) {
    room_speed = 60;
    
    global.PLAYER = instance_create_depth(
        global.GEN_PLAYERX, 
        global.GEN_PLAYERY, 
        0, 
        obj_playerEdit 
    );
    
    global.CAMERA.camera_follow = global.PLAYER;
    
    instance_destroy();
}
*/

while (y <= final_ypos + 32) {
    // Store the target ID
    target = instance_place(x, y, obj_floor);

    // Does it collide with the floor?
    if (instance_exists(target)) {
        // Check all corners for the existence of floors
        var up = place_meeting(x, y - 32, obj_floor);
        var dn = place_meeting(x, y + 32, obj_floor);
        var lt = place_meeting(x - 32, y, obj_floor);
        var rt = place_meeting(x + 32, y, obj_floor);
    
        // Place wall tiles
        if (!up) instance_create_depth(x, y - 32, (y - 32) * -1, obj_wall);
        if (!dn) instance_create_depth(x, y + 32, (y + 32) * -1, obj_wall);
        if (!lt) instance_create_depth(x - 32, y, (y * -1), obj_wall);
        if (!rt) instance_create_depth(x + 32, y, (y * -1), obj_wall);
        
        var off_x  = (x - arena_xoffset) div CELL_W;
        var off_y  = (y - arena_yoffset) div CELL_H;
        var off_lt = (x - 32 - arena_xoffset) div CELL_W;
        var off_rt = (x + 32 - arena_xoffset) div CELL_W;
        var off_up = (y - 32 - arena_yoffset) div CELL_H;
        var off_dn = (y + 32 - arena_yoffset) div CELL_H;
        
        if (!up) mp_grid_add_cell(global.GEN_PATHGRID, off_x, off_up);
        if (!dn) mp_grid_add_cell(global.GEN_PATHGRID, off_x, off_dn);
        if (!lt) mp_grid_add_cell(global.GEN_PATHGRID, off_lt, off_y);
        if (!rt) mp_grid_add_cell(global.GEN_PATHGRID, off_rt, off_y);
        
        // Place an enemy
        var odds = 5;
        var en_x = x + CELL_W / 2;
        var en_y = y + CELL_H / 2;
            
        if (point_distance(en_x, en_y, global.GEN_PLAYERX, global.GEN_PLAYERY) > 256 && irandom(odds) == odds) {
            global.GAME_ENEMY += 1;
            instance_create_depth(en_x, en_y, 0, obj_entityEnemyEdit);
        }
    }

    if (x < start_xpos) x = start_xpos;

    if (x == final_xpos) {
        y += 32;
        x = 0;
    } else {
        x += 32;
    }

    if (y > final_ypos) {
        global.PLAYER = instance_create_depth(
            global.GEN_PLAYERX + CELL_W / 2, 
            global.GEN_PLAYERY + CELL_H / 2, 
            0, 
            obj_playerEdit 
        );
        global.CAMERA.x = room_width / 2;
        global.CAMERA.y = 0;
        
        global.CAMERA.camera_follow = global.PLAYER;
        
        if (global.CROSSHAIR == noone) {
            global.CROSSHAIR = instance_create_depth(0, 0, 0, obj_crosshair);
        }
    
        instance_destroy();
        
        break;
    }
}
