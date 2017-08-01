/// @description DescriptionGoesHere

if (global.PLAYER != noone && global.PLAYER.player_ammo <= 0 && !global.GAME_END) {
    global.GAME_END = true;

    if (global.CAMERA) {
        if (global.CAMERA.camera_follow == global.PLAYER) {
            global.CAMERA.camera_follow = obj_entityCommander;
        } else {
            mp_grid_destroy(global.GEN_PATHGRID);
            
            with (obj_crosshair) {
                instance_destroy();
            }
        
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
}
