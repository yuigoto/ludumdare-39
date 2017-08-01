/// @description DescriptionGoesHere

if (global.CAMERA != noone) {
    global.CAMERA.camera_shake = 16;
}

instance_create_depth(x, y, depth + 1, obj_explosion);
with (other) {
    player_health -= 3;
}
global.GAME_ENEMY -= 1;

instance_destroy();
var snds = (irandom(1)) ? snd_explosion01 : snd_explosion02;
audio_play_sound(snds, 0, false);