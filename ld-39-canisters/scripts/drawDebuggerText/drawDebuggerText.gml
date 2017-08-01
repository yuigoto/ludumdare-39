/// @description Draws the debugger UI, works only with it!
/// @function drawDebuggerText

// USE THIS SCRIPT ONLY WITH THE `__debugger` OBJECT
// ON A DRAW EVENT!

// Alignment for UI
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Set font
draw_set_font(fnt_ubuntuMono8);

// Draw controls
drawTextOutline(
    "Home: Restart | End: Quit | PgUp: Next Room | PgDn: Prev Room | F10: Fullscreen", 
    4, 
    4, 
    c_white, 
    c_black
);

// Room name
drawTextOutline(
    "Current Room: " + room_get_name(room), 
    4, 
    16, 
    c_orange, 
    c_black
);

// FPS
drawTextOutline(
    "FPS: " + string(fps) + " | CPU FPS: " + string(fps_real), 
    4, 
    28, 
    c_yellow, 
    c_black
);
