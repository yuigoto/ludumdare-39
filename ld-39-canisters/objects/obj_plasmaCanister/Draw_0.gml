/// @description Draw the sprite

// Drawing
draw_sprite(spr_plasmaCanisterBase, 0, x, y);

// Drawing the item
draw_sprite(spr_plasmaCanister, round(frame), x, y - 10 + wave(-2,2,.1,0));

frame += .25;
//if (frame == spr_plasmaCanister.image_number) frame = 0;
