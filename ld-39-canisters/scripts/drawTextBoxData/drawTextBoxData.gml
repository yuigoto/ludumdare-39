/// @description Draws text for the text box object
/// @function drawTextBoxData
/// @param text 
/// @param background 

var text    = argument[0];
var back    = argument[1];

var text_color  = c_yellow;
var h_margin    = 16;
var v_margin    = 16;
var line_height = 24;

var x_1 = 0;
var y_1 = view_hport[0] - sprite_get_height(back);

draw_sprite(back, image_index, x_1, y_1);
draw_set_colour(text_color);
draw_text_ext(x_1 + h_margin, y_1 + v_margin, text, line_height, -1);
