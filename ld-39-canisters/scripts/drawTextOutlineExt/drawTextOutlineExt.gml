/// @description  drawTextOutline(string, x, y, color, outline)
/// @function  drawTextOutline
/// @param string
/// @param x
/// @param y
/// @param x_scale
/// @param y_scale
/// @param rotation
/// @param color
/// @param outline

var str = argument[0];
var _x  = argument[1];
var _y  = argument[2];
var x_scale = argument[3];
var y_scale = argument[4];
var angle   = argument[5];
var clr = argument[6];
var out = argument[7];

draw_set_colour(out);

for (xx = -1; xx < 2; xx++) {
    for (yy = -1; yy < 2; yy++) {
        draw_text_ext_transformed(
            _x + xx, 
            _y + yy, 
            str, 
            string_height(str), 
            320, 
            x_scale, 
            y_scale, 
            angle
        );
    }
}

draw_set_colour(clr);

draw_text_ext_transformed(
    _x, 
    _y, 
    str, 
    string_height(str), 
    320, 
    x_scale, 
    y_scale, 
    angle
);
