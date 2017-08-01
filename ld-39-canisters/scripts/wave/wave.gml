/// @description  wave(from, to, duration, offset)
/// @function  approach
/// @param from
/// @param to
/// @param duration
/// @param offset

var from, to, duration, offset;

from        = argument[0];
to          = argument[1];
duration    = argument[2];
offset      = argument[3];

var fl = (to - from) * 0.5;

//show_debug_message(current_time * 0.0001);
return from + fl + sin((((current_time * 0.0001) + duration * offset) / duration) * (pi*2)) * fl;
