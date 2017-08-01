if (global.PLAYER != noone) {
    if (global.CAMERA) {
        if (global.CAMERA.camera_follow == global.PLAYER) {
            global.CAMERA.camera_follow = obj_entityCommander;
            
            // Delete grid
            mp_grid_destroy(global.GEN_PATHGRID);
            
            // Delete crosshair
            with (obj_crosshair) {
                instance_destroy();
            }
            
            // Delete player
            with (global.PLAYER) {
                instance_destroy();
                global.PLAYER = noone;
            }
            
            // Delete level builder
            with (obj_levelBuilder) {
                instance_destroy();
            }
            
            // Delete entities
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
        }
    }
}