/// get_path_to_player()
if (instance_exists(global.PLAYER)) {
    var tp_x = (global.PLAYER.x div CELL_W) * CELL_W + CELL_W / 2;
    var tp_y = (global.PLAYER.y div CELL_H) * CELL_H + CELL_H / 2;
    
    //if (mp_grid_path(obj_levelGenGrid.grid_path, path, x, y, tp_x, tp_y, true)) {
    if (mp_grid_path(global.GEN_PATHGRID, path, x, y, tp_x, tp_y, true)) {
        path_start(path, enemy_speed, path_action_stop, false);
    }
}
