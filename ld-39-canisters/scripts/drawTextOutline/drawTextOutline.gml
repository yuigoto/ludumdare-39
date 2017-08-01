/// @description  drawTextOutline(string, x, y, color, outline)
/// @function  drawTextOutline
/// @param string
/// @param  x
/// @param  y
/// @param  color
/// @param  outline

var str = argument[0];
var _x  = argument[1];
var _y  = argument[2];
var clr = argument[3];
var out = argument[4];

draw_set_colour(out);

for (xx = -1; xx < 2; xx++) {
    for (yy = -1; yy < 2; yy++) {
        draw_text(_x + xx, _y + yy, string_hash_to_newline(str));
    }
}

draw_set_colour(clr);

draw_text(_x, _y, string_hash_to_newline(str));

