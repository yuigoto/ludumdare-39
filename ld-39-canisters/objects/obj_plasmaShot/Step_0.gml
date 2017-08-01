/// @description Move projectile

x += lengthdir_x(projectile_spd, projectile_dir);
y += lengthdir_y(projectile_spd, projectile_dir);
image_angle += 4 * projectile_sig;
depth = -y;

if (x < -16 || x > room_width + 16 || y < -16 || y > room_height + 16) instance_destroy();

projectile_spd = approach(projectile_spd, 0, projectile_dec);

if (projectile_spd < .2) {
    instance_destroy();
}

//if (grid_place_meeting(x, y)) {
if (place_meeting(x, y, obj_wall)) {
    instance_destroy();
}
