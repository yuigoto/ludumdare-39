/// @description Create the level layout, based on a DS Grid

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

// Define Tile Grid
grid_tile       = ds_grid_create(grid_width, grid_height);

// Define Path Grid
grid_path       = mp_grid_create(
    0 + arena_xoffset, 
    0 + arena_yoffset, 
    grid_width, 
    grid_height, 
    CELL_W, 
    CELL_H
);

// Fill the Grid with VOID cells
ds_grid_set_region(grid_tile, 0, 0, grid_width - 1, grid_height - 1, TYPE.VOID);

// Randomize seed
randomize();

// ----------------------------------------------------------------------

// Create the Controller in the Grid Center
var control_x       = grid_width div 2;
var control_y       = grid_height div 2;

// CREATE PLAYER INSTANCE
if (global.PLAYER == noone) {
    global.PLAYER = instance_create_depth(
        control_x * CELL_W + CELL_W / 2 + arena_xoffset, 
        control_y * CELL_H + CELL_H / 2 + arena_yoffset, 
        0, 
        obj_playerBase
    );
}

// Also creates a camera object
if (global.CAMERA == noone) {
    global.CAMERA = instance_create_depth(
        control_x * CELL_W + CELL_W / 2 + arena_xoffset, 
        control_y * CELL_H + CELL_H / 2 + arena_yoffset, 
        0, 
        obj_camera 
    );
}

instance_create_depth(0, 0, 0, obj_crosshair);

// Set camera to follow player
if (global.CAMERA != noone && global.PLAYER != noone) {
    global.CAMERA.camera_follow = global.PLAYER;
}

// Randomize the Controller's Direction
var control_dirs    = irandom(3);

// Define the odds for changing direction
var control_odds    = 1;

// Fill the grid in 1000 steps
repeat (1000) {
    // Place floor at the center (using accessor)
    grid_tile[# control_x, control_y] = TYPE.TILE;
    
    // Randomize direction
    if (irandom(control_odds) == control_odds) {
        control_dirs = irandom(3);
    }
    
    // Move the Controller 1 step
    var move_x = lengthdir_x(1, control_dirs * 90);
    var move_y = lengthdir_y(1, control_dirs * 90);
    
    // Update Controller Position
    control_x += move_x;
    control_y += move_y;
    
    // Making Sure we DON'T move outside the grid
    control_x = clamp(control_x, 1, grid_width - 2);
    control_y = clamp(control_y, 1, grid_height - 2);
}

// Defining Walls
for (var _y = 1; _y < grid_height; _y++) {
    for (var _x = 1; _x < grid_width; _x++) {
        if (grid_tile[# _x, _y] == TYPE.TILE) {
            for (var yy = -1; yy <= 1; yy++) {
                for (var xx = -1; xx <= 1; xx++) {
                    if (grid_tile[# _x + xx, _y + yy] != TYPE.TILE) {
                        grid_tile[# _x + xx, _y + yy] = TYPE.WALL;
                    }
                }
            }
        } else {
            mp_grid_add_cell(grid_path, _x, _y);
        }
    }
}

// Clearing a Bit
for (var _y = 1; _y < grid_height - 1; _y++) {
    for (var _x = 1; _x < grid_width - 1; _x++) {
        if (
            grid_tile[# _x, _y] == TYPE.WALL 
            && grid_tile[# _x + 1, _y] == TYPE.TILE
            && grid_tile[# _x - 1, _y] == TYPE.TILE
            && grid_tile[# _x, _y + 1] == TYPE.TILE
            && grid_tile[# _x, _y - 1] == TYPE.TILE
        ) {
            grid_tile[# _x, _y] = TYPE.TILE;
        }
    }
}

// ----------------------------------------------------------------------

// Tile Layer Information
var layer_index = layer_get_id("Arena_Floor");
var layer_tiles = layer_tilemap_get_id(layer_index);

tilemap_set_at_pixel(layer_tiles, 11, 32, 32);

// Draw the Tiles
for (var t_y = 0; t_y < grid_height; t_y++) {
    for (var t_x = 0; t_x < grid_width; t_x++) {
        // If the tile is a floor
        if (grid_tile[# t_x, t_y] == TYPE.TILE) {
            // Draw Floor Tile
            tilemap_set_at_pixel(
                layer_tiles, 
                1, 
                t_x * CELL_W + arena_xoffset, 
                t_y * CELL_H + arena_yoffset, 
            );
            
            // Add enemies
            var en_odds = 30;
            var en_x = t_x * CELL_W + CELL_W / 2 + arena_xoffset;
            var en_y = t_y * CELL_H + CELL_H / 2 + arena_yoffset;
            
            if (point_distance(en_x, en_y, global.PLAYER.x, global.PLAYER.y) > 60 && irandom(en_odds) == en_odds) {
                instance_create_depth(en_x, en_y, global.PLAYER.depth, obj_entityEnemy);
            }
        } else {
            // Put Collision Tile
            instance_create_depth(
                t_x * CELL_W + arena_xoffset, 
                t_y * CELL_H + arena_yoffset, 
                0, 
                obj_collision
            );
        }
    }
}

// ----------------------------------------------------------------------

// Auto Tiling

// Define Auto Tile Sizes
var atile_w = CELL_W / 2;
var atile_h = CELL_H / 2;

// Redefine Layer Index and Tileset Index
var layer_front = layer_get_id("Arena_Walls_Front");
var layer_back  = layer_get_id("Arena_Walls_Back");
var layer_tiles_front = layer_tilemap_get_id(layer_front);
var layer_tiles_back  = layer_tilemap_get_id(layer_back);

// Add tiles
for (var yy = 0; yy < grid_height * 2; yy++) {
    for (var xx = 0; xx < grid_width * 2; xx++) {
        if (grid_tile[# xx div 2, yy div 2] == TYPE.TILE) {
            // Get the tile's X/Y position
            var tile_x = (xx * atile_w) + arena_xoffset;
            var tile_y = (yy * atile_h) + arena_yoffset;
            
            var t = grid_tile[# xx div 2, (yy - 1) div 2] != TYPE.TILE;
            var r = grid_tile[# (xx + 1) div 2, yy div 2] != TYPE.TILE;
            var b = grid_tile[# xx div 2, (yy + 1) div 2] != TYPE.TILE;
            var l = grid_tile[# (xx - 1) div 2, yy div 2] != TYPE.TILE;
            
            var tl = grid_tile[# (xx - 1) div 2, (yy - 1) div 2] != TYPE.TILE;
            var tr = grid_tile[# (xx + 1) div 2, (yy - 1) div 2] != TYPE.TILE;
            var bl = grid_tile[# (xx - 1) div 2, (yy + 1) div 2] != TYPE.TILE;
            var br = grid_tile[# (xx + 1) div 2, (yy + 1) div 2] != TYPE.TILE;
            
            if (r) {
                if (b) {
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        11, 
                        tile_x + atile_w, 
                        tile_y
                    );
                } else if (t) {
                    if (tr) {
                        tilemap_set_at_pixel(
                            layer_tiles_back, 
                            5, 
                            tile_x + atile_w, 
                            tile_y - atile_h
                        );
                    } else {
                        tilemap_set_at_pixel(
                            layer_tiles_back, 
                            4, 
                            tile_x, 
                            tile_y - atile_h
                        );
                    }
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        7, 
                        tile_x + atile_w, 
                        tile_y
                    );
                } else {
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        7, 
                        tile_x + atile_w, 
                        tile_y
                    );
                }
            }
            
            if (l) {
                if (b) {
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        10, 
                        tile_x - atile_w, 
                        tile_y
                    );
                } else if (t) {
                    if (tl) {
                        tilemap_set_at_pixel(
                            layer_tiles_back, 
                            4, 
                            tile_x - atile_w, 
                            tile_y - atile_h
                        );
                    } else {
                        tilemap_set_at_pixel(
                            layer_tiles_back, 
                            5, 
                            tile_x, 
                            tile_y - atile_h
                        );
                    }
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        9, 
                        tile_x - atile_w, 
                        tile_y
                    );
                } else {
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        9, 
                        tile_x - atile_w, 
                        tile_y
                    );
                }
            }
            
            if (t) {
                if (!tr) {
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        15, 
                        tile_x, 
                        tile_y - atile_h
                    );
                } else if (!tl) {
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        13, 
                        tile_x, 
                        tile_y - atile_h
                    );
                } else {
                    tilemap_set_at_pixel(
                        layer_tiles_back, 
                        14, 
                        tile_x, 
                        tile_y - atile_h
                    );
                }
            }
            
            if (b) {
                if (!br) {
                    tilemap_set_at_pixel(
                        layer_tiles_front, 
                        3, 
                        tile_x, 
                        tile_y
                    );
                } else if (!bl) {
                    tilemap_set_at_pixel(
                        layer_tiles_front, 
                        1, 
                        tile_x, 
                        tile_y
                    );
                } else {
                    tilemap_set_at_pixel(
                        layer_tiles_front, 
                        2, 
                        tile_x, 
                        tile_y
                    );
                }
            }
        }
    }
}
