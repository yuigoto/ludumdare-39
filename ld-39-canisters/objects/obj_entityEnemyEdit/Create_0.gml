/// @description DescriptionGoesHere

/// Init Enemy

// Depth
depth = -y;
idle = true;
idle_face = choose(0, 90, 180, 270);

go_to_timer = 0;

// Path
path = path_add();

enemy_speed = 2;

is_dashing          = 0;
is_dashing_speed    = 0;
is_dashing_decel    = .25;
is_dashing_timer    = 0;

alarm[0] = room_speed / 2;
