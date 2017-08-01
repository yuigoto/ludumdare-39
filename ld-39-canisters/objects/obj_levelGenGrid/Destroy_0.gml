/// @description DescriptionGoesHere

ds_grid_destroy(grid_tile);
mp_grid_destroy(grid_path);

// Tile Layer Information
var layer_index = layer_get_id("Arena_Floor");
var layer_tiles = layer_tilemap_get_id(layer_index);

// Delete the tiles
for (var t_y = 0; t_y < grid_height - 1; t_y++) {
    for (var t_x = 0; t_x < grid_width - 1; t_x++) {
        // Draw Floor Tile
        tilemap_set_at_pixel(
            layer_tiles, 
            0, 
            t_x * CELL_W + arena_xoffset, 
            t_y * CELL_H + arena_yoffset, 
        );
    }
}

// Define Auto Tile Sizes
var atile_w = CELL_W / 2;
var atile_h = CELL_H / 2;

// Redefine Layer Index and Tileset Index
var layer_front = layer_get_id("Arena_Walls_Front");
var layer_back  = layer_get_id("Arena_Walls_Back");
var layer_tiles_front = layer_tilemap_get_id(layer_front);
var layer_tiles_back  = layer_tilemap_get_id(layer_back);

// Add tiles
for (var yy = 0; yy < grid_height * 2 - 1; yy++) {
    for (var xx = 0; xx < grid_width * 2 - 1; xx++) {
        tilemap_set_at_pixel(
            layer_tiles_front, 
            0, 
            xx * atile_w + arena_xoffset, 
            yy * atile_h + arena_yoffset, 
        );
        
        tilemap_set_at_pixel(
            layer_tiles_back, 
            0, 
            xx * atile_w + arena_xoffset, 
            yy * atile_h + arena_yoffset, 
        );
    }
}
