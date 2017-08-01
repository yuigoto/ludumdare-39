/// @description DescriptionGoesHere

if (global.PLAYER != noone) {
    with (global.PLAYER) {
        instance_destroy();
        global.PLAYER = noone;
    }
}

if (global.CAMERA != noone) {
    with (global.CAMERA) {
        instance_destroy();
        global.CAMERA = noone;
    }
}

with (obj_entityEnemy) {
    instance_destroy();
}
