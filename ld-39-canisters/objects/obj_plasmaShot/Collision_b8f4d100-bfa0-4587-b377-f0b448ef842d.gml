/// @description DescriptionGoesHere

instance_create_depth(x, y, 0, obj_plasmaCanister);
    
if (global.CAMERA != noone) {
    global.CAMERA.camera_shake = 8;
}
global.GAME_ENEMY -= 1;

with (other) {
    instance_create_depth(x, y, depth + 1, obj_explosion);
    instance_destroy();
    var snds = (irandom(1)) ? snd_explosion01 : snd_explosion02;
    audio_play_sound(snds, 0, false);
}

instance_destroy();
