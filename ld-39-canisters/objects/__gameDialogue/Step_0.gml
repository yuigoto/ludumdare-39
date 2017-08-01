/// @description DescriptionGoesHere

if (messages_box == noone) {
    messages_init = true;
    messages_box = instance_create_depth(x, y, 0, obj_textboxDraw);
    messages_box.text = messages[messages_curr];
}

if (messages_last != true) {
    
    if (messages_box != noone && messages_box.has_finished) {
        instance_destroy(messages_box);
        messages_curr++;
        if (messages_curr == 2) {
            audio_play_sound(snd_uhh, 0, false);
        }
    
        if (messages_curr < messages_size) {
            messages_box = instance_create_depth(x, y, 0, obj_textboxDraw);
            messages_box.text = messages[messages_curr];
        } else {
            messages_last = true;
        }
    }
}
