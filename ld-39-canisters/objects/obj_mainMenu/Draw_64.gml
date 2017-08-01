/// @description  Draw Menu Text

if (surface_exists(srfc)) {
    // Window width and height
    var win_w, win_h;
    win_w = window_get_width();
    win_h = window_get_height();
    
    // Set target for drawing
    surface_set_target(srfc);
    
    // Clear the surface
    draw_clear_alpha(c_white, 0);
    
    draw_set_font(fnt_ubuntuMono8);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    drawTextOutlineExt(
        "PLASMAGUN!", 
        room_width / 2, 
        room_height / 2 - string_height("PLASMAGUN!") * 2 - 64, 
        6, 
        6, 
        wave( -3, 3, .1, 0), 
        c_orange, 
        c_black
    );
    
    drawTextOutlineExt(
        "Press start, space or click\nwith your mouse to start", 
        room_width / 2, 
        room_height / 2 + 32, 
        2, 
        2, 
        wave( -3, 3, .1, 0), 
        c_white, 
        c_black
    );
    
    drawTextOutlineExt(
        "A GAME BY FABIO Y. GOTO", 
        room_width / 2, 
        room_height - 64, 
        1, 
        1, 
        wave( -3, 3, .1, 0), 
        c_orange, 
        c_black
    );
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    if (win_w != view_wport[0]) {
        var ratio = win_w / view_wport[0];
        draw_surface_ext(srfc, 0, 0, ratio, ratio, 0, c_white, 1);
    } else {
        draw_surface(srfc, view_xport[0], view_yport[0]);
    }
} else {
    // Get camera dimensions
    var cam_w, cam_h;
    cam_w = view_wport[0];
    cam_h = view_hport[0];
    
    // Create the surface
    srfc = surface_create(cam_w, cam_h);
    
    // Set target for drawing
    surface_set_target(srfc);
    
    // Clear surface with a color
    draw_clear_alpha(c_white, 0);
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    draw_surface(srfc, view_xport[0], view_yport[0]);
}
