/// @description Init Gun Features

// Gun shooting offset
shot_x      = 10;
shot_y      = -1;

// Offset angle
shot_angle  = point_direction(x, y, x + shot_x, y + shot_y);
shot_length = point_distance(x, y, x + shot_x, y + shot_y);
