/// @description DescriptionGoesHere

// How many floors should be placed
global.GEN_PLACED   = 0;
global.GEN_WALKED   = 0;

// Arena Dimensions + Offset
arena_width     = room_width;
arena_height    = room_width;
arena_xoffset   = 0;
arena_yoffset   = 320;

if (arena_xoffset > CELL_W) arena_xoffset -= CELL_W;
if (arena_yoffset > CELL_H) arena_yoffset -= CELL_H;

// Grid Dimensions
grid_width      = arena_width div CELL_W;
grid_height     = arena_height div CELL_H;

// Randomize seed
randomize();

// Set placer direction
facing_dir = irandom(3);

// Set starting place
x = (grid_width div 2) * CELL_W + arena_xoffset;
y = (grid_height div 2) * CELL_H + arena_yoffset;

// Define player starting position
global.GEN_PLAYERX  = x;
global.GEN_PLAYERY  = y;

// Create path grid
global.GEN_PATHGRID = mp_grid_create(
    0 + arena_xoffset, 
    0 + arena_yoffset, 
    grid_width, 
    grid_height, 
    CELL_W, 
    CELL_H
    
);

// Store top left corner of the map
x_left = 0 + arena_xoffset;
y_upper = 0 + arena_yoffset;
x_right = 0;
y_lower = 0;

repeat(max(global.GEN_TILES, global.GEN_STEPS)) {
    if (!place_meeting(x, y, obj_floor)) {
        instance_create_depth(x, y, 0, obj_floor);
        
        /*
        var layer_index = layer_get_id("Arena_Floor");
        var layer_tiles = layer_tilemap_get_id(layer_index);
        
        tilemap_set_at_pixel(layer_tiles, 1, x, y);
        */
    }

    // Increment placed tiles
    global.GEN_PLACED++;

    // Choose a random direction
    facing_dir = choose(0, 1, 2, 3, facing_dir, facing_dir, facing_dir, facing_dir);

    switch (facing_dir) {
        case 0:
            x += 32;
            break;
        case 1:
            y -= 32;
            break;
        case 2:
            x -= 32;
            break;
        case 3:
            y += 32;
            break;
    }

    var offset_x = (arena_xoffset > 0) ? 64 + arena_xoffset : 32;
    var offset_y = (arena_yoffset > 0) ? 64 + arena_yoffset : 32;

    // Is placer still inside the boundaries?
    if (x < offset_x) x = offset_x;
    if (x > room_width - 64) x = room_width - 64;
    if (y < offset_y) y = offset_y;
    if (y > room_height - 64) y = room_height - 64;

    // Save the corners
    if (x < x_left) x_left = x;
    if (x > x_right) x_right = x;
    if (y < y_upper) y_upper = y;
    if (y > y_lower) y_lower = y;

    if (
        global.GEN_PLACED == global.GEN_TILES 
        || global.GEN_WALKED == global.GEN_STEPS
    ) {
        x_left = 0 + arena_xoffset;
        y_upper = 0 + arena_yoffset;
        x_right = room_width - CELL_W;
        y_lower = room_height - CELL_H;
        
        // Create a wall placer
        wall_placer = instance_create_depth(x_left, y_upper, 0, obj_placerWalls);
        wall_placer.final_xpos = x_right;
        wall_placer.final_ypos = y_lower;
    
        // Destroy this object
        instance_destroy();
        
        break;
    }
}
