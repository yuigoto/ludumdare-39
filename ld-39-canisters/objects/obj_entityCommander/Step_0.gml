/// @description DescriptionGoesHere

if (global.CAMERA_GENERIC == id) {
    // Adjust camera
    var cam_width   = camera_get_view_width(view_camera[0]);
    var cam_height  = camera_get_view_height(view_camera[0]);

    if (cam_width != view_wport[0]) {
        cam_width = lerp(cam_width, view_wport[0] div 2, .12);
    }

    if (cam_height != view_hport[0]) {
        cam_height = lerp(cam_height, view_hport[0] div 2, .12);
    }

    camera_set_view_size(view_camera[0], cam_width, cam_height);
}