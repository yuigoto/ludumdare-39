/// @description  Draw Debug UI Stuff
/*
if (surface_exists(dbgr)) {
    // Window width and height
    var win_w, win_h;
    win_w = window_get_width();
    win_h = window_get_height();
    
    // Set target for drawing
    surface_set_target(dbgr);
    
    // Clear the surface
    draw_clear_alpha(c_white, 0);
    
    // Draw all your text here
    drawDebuggerText();
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    if (win_w != view_wport[0]) {
        var ratio = win_w / view_wport[0];
        draw_surface_ext(dbgr, 0, 0, ratio, ratio, 0, c_white, 1);
    } else {
        draw_surface(dbgr, view_xport[0], view_yport[0]);
    }
} else {
    // Get camera dimensions
    var cam_w, cam_h;
    cam_w = view_wport[0];
    cam_h = view_hport[0];
    
    // Create the surface
    dbgr = surface_create(cam_w, cam_h);
    
    // Set target for drawing
    surface_set_target(dbgr);
    
    // Clear surface with a color
    draw_clear_alpha(c_white, 0);
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    draw_surface(dbgr, view_xport[0], view_yport[0]);
}
*/

//draw_text(32, 64, fps_real);