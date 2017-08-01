/// @description DescriptionGoesHere

if (
    actionStartPressed() 
    || mouse_check_button_pressed(mb_left) 
    || keyboard_check_pressed(vk_space)
) {
    audio_play_sound(snd_load, 0, false);
    room_goto_next();
}
