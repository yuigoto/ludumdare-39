/// @description 

__bootVars();

// Create Commander
global.CAMERA_GENERIC = instance_create_depth(704, 192, 0, obj_entityCommander);

// Camera
global.CAMERA = instance_create_depth(0, 0, 0, obj_camera);
global.CAMERA.camera_follow = global.CAMERA_GENERIC;

// Message handler
message_handler = noone;
