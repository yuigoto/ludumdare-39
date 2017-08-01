/// @description DescriptionGoesHere

// Last position to check
final_xpos = 0;
final_ypos = 0;

global.CAMERA.camera_follow = id;

// Store the starting position
start_xpos = x - 32;
start_ypos = y - 32;

// Arena Dimensions + Offset
arena_width     = room_width;
arena_height    = room_width;
arena_xoffset   = 0;
arena_yoffset   = 320;
if (arena_xoffset > CELL_W) arena_xoffset -= CELL_W;
if (arena_yoffset > CELL_H) arena_yoffset -= CELL_H;