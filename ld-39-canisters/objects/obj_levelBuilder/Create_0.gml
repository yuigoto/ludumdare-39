/// @description DescriptionGoesHere

// Creates camera object
if (global.CAMERA == noone) {
    global.CAMERA = instance_create_depth(0, 0, 0, obj_camera);
}

global.GAME_ENEMY = 0;

placer = instance_create_depth(0, 0, 0, obj_placerFloor);

// global.CAMERA.camera_follow = placer;

instance_destroy();
