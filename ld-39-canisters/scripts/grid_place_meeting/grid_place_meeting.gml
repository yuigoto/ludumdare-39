/// @description Checks for collisions with the grid
/// @function grid_place_meeting
/// @param x 
/// @param y

var _x = argument[0];
var _y = argument[1];

// Remember position
var x_p = x;
var y_p = y;

// Update position for boundind box calculations
x = _x - obj_levelGenGrid.arena_xoffset;
y = _y - obj_levelGenGrid.arena_yoffset;

var x_meeting = (obj_levelGenGrid.grid_tile[# bbox_right div CELL_W, bbox_top div CELL_H] != TYPE.TILE) || 
                (obj_levelGenGrid.grid_tile[# bbox_left div CELL_W, bbox_top div CELL_H] != TYPE.TILE);
                
var y_meeting = (obj_levelGenGrid.grid_tile[# bbox_right div CELL_W, bbox_bottom div CELL_H] != TYPE.TILE) || 
                (obj_levelGenGrid.grid_tile[# bbox_left div CELL_W, bbox_bottom div CELL_H] != TYPE.TILE);
                
var center_meeting = obj_levelGenGrid.grid_tile[# (_x - obj_levelGenGrid.arena_xoffset) div CELL_W, (_y - obj_levelGenGrid.arena_yoffset) div CELL_H] != TYPE.TILE;
                
// Move back player
x = x_p;
y = y_p;

// Return
return x_meeting || y_meeting || center_meeting;
