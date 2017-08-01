/// @description 

if (global.CAMERA) {
    if (global.CAMERA.camera_follow == global.PLAYER) {
        if (!audio_is_playing(snd_nice_next)) {
            audio_play_sound(snd_nice_next, 0, false);
        }
        
        global.CAMERA.camera_follow = obj_entityCommander;
    } else {
        mp_grid_destroy(global.GEN_PATHGRID);
        
        with (global.PLAYER) {
            instance_destroy();
            global.PLAYER = noone;
        }
        
        with (obj_levelBuilder) {
            instance_destroy();
        }
        
        with (obj_entityEnemyEdit) {
            instance_destroy();
        }
        
        with (obj_wall) {
            instance_destroy();
        }
        
        with (obj_floor) {
            instance_destroy();
        }
        
        with (obj_plasmaCanister) {
            instance_destroy();
        }

        instance_create_depth(0, 0, 0, obj_levelBuilder);
    }
}
