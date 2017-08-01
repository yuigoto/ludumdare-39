/// @description DescriptionGoesHere

if (global.GAME_OVER == true) {
    if (audio_is_playing(music_item)) {
        audio_stop_sound(music_item);
    }
    
    if (message_handler == noone) {
        message_handler = instance_create_depth(x, y, 0, __gameDialogueOver);   
    }
    
    audio_play_sound(snd_thank, 0, false);

    if (message_handler.messages_last == true) {
        var a_button = action1Pressed();
        var b_button = action2Pressed();
        if (a_button == true) room_restart();
        if (b_button == true) room_goto(rm_titleScreen);
    }
} else {
    // End Game
    if (global.GAME_END == true) {
        if (audio_is_playing(music_item)) {
            audio_stop_sound(music_item);
        }
        
        if (message_handler == noone) {
            message_handler = instance_create_depth(x, y, 0, __gameDialogueEnd);
        }
    
        if (message_handler.messages_last == true) {
            var a_button = action1Pressed();
            var b_button = action2Pressed();
    
            if (a_button == true) room_restart();
            if (b_button == true) room_goto(rm_titleScreen);
        }
    }

    // Game
    if (global.GAME_MID == true  && global.GAME_BUILD == false && global.PLAYER == noone) {
        global.GAME_BUILD = true;
        instance_create_depth(0, 0, 0, obj_levelBuilder);
    }

    if (global.GAME_MID == true && global.GAME_BUILD == true) {
        // Is player dead?
        if (global.PLAYER != noone && global.PLAYER.player_health <= 0 
            || global.PLAYER != noone && global.PLAYER.player_ammo <= 0) {
            global.GAME_MID = false;
        
            // End game
            __endGame();
            
            audio_play_sound(snd_toobad, 0, false);
        
            global.GAME_END = true;
        }
    
        if (global.GAME_ENEMY == 0 && global.GAME_PASS == false && global.PLAYER != noone) {
            __nextLevel();
        
            global.GAME_PASS = true;
            global.GAME_ENEMY = -1;
        
            // Next Level
            global.GAME_CURR += 1;
            if (global.GAME_CURR == 100) {
                global.GAME_OVER = true;
            } else {
                message_handler = instance_create_depth(x, y, 0, __gameDialogueLevel);
        
                // 
                audio_play_sound(snd_goodjob, 0, false);
            }
        }
    
        if (global.GAME_ENEMY == -1 && global.GAME_PASS == true && message_handler != noone) {
            if (message_handler.messages_last == false) {
                if (action1Pressed() == true) {
                    message_handler.messages_last = true;
                    global.GAME_PASS = false;
                    instance_destroy(message_handler);
                    with(obj_textboxDraw) {
                        instance_destroy();
                    }
                    message_handler = noone;
                    instance_create_depth(0, 0, 0, obj_levelBuilder);
                }
            }
        }
    }

    if (global.GAME_INI == false) {
        if (audio_is_playing(music_item)) {
            audio_stop_sound(music_item);
        }
        audio_play_sound(music_item, false, false);
        global.GAME_INI = true;
        message_handler = instance_create_depth(x, y, 0, __gameDialogue);

        audio_play_sound(snd_hello, 0, false);
    } else if (global.GAME_INI && message_handler != noone && message_handler.messages_last == true) {
        instance_destroy(message_handler);
        message_handler = noone;
        global.GAME_MID = true;
    }
}
