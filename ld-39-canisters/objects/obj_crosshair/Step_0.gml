/// @description Update position

depth = -9999;
x = mouse_x;
y = mouse_y;

if (abs(gamepad_axis_value(0,gp_axisrh)) > .3 || abs(gamepad_axis_value(0,gp_axisrv)) > .3) {
    if (global.PLAYER != noone) {
        x = global.PLAYER.x;
        y = global.PLAYER.y;
    }
    var dirs = point_direction(x, y, x + gamepad_axis_value(0, gp_axisrh), y + gamepad_axis_value(0, gp_axisrv));
    var leng = point_distance(x, y, x + gamepad_axis_value(0, gp_axisrh), y + gamepad_axis_value(0, gp_axisrv)) * 128;
    x += lengthdir_x(leng,dirs);
    y += lengthdir_y(leng,dirs);
}
