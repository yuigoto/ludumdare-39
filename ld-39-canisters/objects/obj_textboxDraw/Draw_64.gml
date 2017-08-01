/// @description DescriptionGoesHere

/// @description  Draw Debug UI Stuff
if (surface_exists(srfc)) {
    // Window width and height
    var win_w, win_h;
    win_w = window_get_width();
    win_h = window_get_height();
    
    // Set target for drawing
    surface_set_target(srfc);
    
    // Clear the surface
    draw_clear_alpha(c_white, 0);

    // 
    drawTextBoxData(text_write, tbox_background);

    if (line_number >= line_count_max + 1 || text_position == string_length(text)) {
        draw_sprite(tbox_continue, image_index, sprite_x, sprite_y);
    }
    
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