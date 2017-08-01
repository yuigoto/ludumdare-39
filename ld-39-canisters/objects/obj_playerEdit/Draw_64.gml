/// @description DescriptionGoesHere
if (surface_exists(player_srfc)) {
    // Window width and height
    var win_w, win_h;
    win_w = window_get_width();
    win_h = window_get_height();
    
    // Set target for drawing
    surface_set_target(player_srfc);
    
    // Clear the surface
    draw_clear_alpha(c_white, 0);
    
    draw_set_halign(fa_center);
    
    draw_set_font(fnt_munro16);
    drawTextOutlineExt(
        "LEVEL " + string(global.GAME_CURR), 
        view_wport / 2, 
        32, 
        2, 
        2, 
        0 + wave(-4, 4, .1, 0), 
        c_orange, 
        c_black
    );
    
    draw_set_font(fnt_ubuntuMono8);
    drawTextOutlineExt(
        "HEALTH: " + string(player_health) + "/100", 
        view_wport / 2, 
        view_hport - 96, 
        1.5, 
        1.5, 
        0 + wave(-4, 4, .1, 0), 
        c_yellow, 
        c_black
    );

    drawTextOutlineExt(
        "PLASMA TANK: " + string(player_ammo) + "/" + string(player_max_ammo), 
        view_wport / 2, 
        view_hport - 64, 
        1.5, 
        1.5, 
        0 + wave(-4, 4, .1, 0), 
        c_white, 
        c_black
    );
    
    drawTextOutlineExt(
        "BOTS: " + string(global.GAME_ENEMY),  
        view_wport / 2, 
        view_hport - 32, 
        1.5, 
        1.5, 
        0 + wave(-4, 4, .1, 0), 
        c_aqua, 
        c_black
    );
    draw_set_halign(fa_left);
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    if (win_w != view_wport[0]) {
        var ratio = win_w / view_wport[0];
        draw_surface_ext(player_srfc, 0, 0, ratio, ratio, 0, c_white, 1);
    } else {
        draw_surface(player_srfc, view_xport[0], view_yport[0]);
    }
} else {
    // Get camera dimensions
    var cam_w, cam_h;
    cam_w = view_wport[0];
    cam_h = view_hport[0];
    
    // Create the surface
    player_srfc = surface_create(cam_w, cam_h);
    
    // Set target for drawing
    surface_set_target(player_srfc);
    
    // Clear surface with a color
    draw_clear_alpha(c_white, 0);
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    draw_surface(player_srfc, view_xport[0], view_yport[0]);
}