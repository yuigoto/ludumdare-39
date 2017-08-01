/// @description DescriptionGoesHere

// Has finished?
has_finished    = false;

// Continue button
tbox_continue   = spr_buttonPlus;

// Background
tbox_background = spr_textbox;

// Button speed
image_speed     = 0.4;

// Button position
sprite_x        = view_wport[0] - round(1 * sprite_get_width(tbox_continue));
sprite_y        = view_hport[0] - round(1 * sprite_get_height(tbox_continue));

// Character drawing speed
char_speed      = 1;
char_speed_max  = 1000;

// Line length
line_length_max = 576;
line_count_max  = 3;
line_number     = 1;
line_text       = "";

// Text parameters
text            = "Blah Blah Blah";
text_write      = "";
text_position   = 0;

// Surface
srfc            = noone;