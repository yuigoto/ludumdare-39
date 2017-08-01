/// @description  Handles navigation through rooms

var nv_restart  = keyboard_check_pressed(vk_home);
var nv_quit     = keyboard_check_pressed(vk_end) || keyboard_check_pressed(vk_escape);
var nv_move     = keyboard_check_pressed(vk_pageup) - keyboard_check_pressed(vk_pagedown);
var nv_fscreen  = keyboard_check_pressed(vk_f10);

if (nv_quit) game_end();
if (nv_restart) game_restart();

if (nv_move != 0) {
    var room_move;
    if (nv_move > 0) {
        room_move = room_next(room);
        
        if (room_move == __init) {
            if (room_next(__init) == -1) {
                room_move = room_first;
            } else {
                room_move = room_next(__init);
            }
        } else if (room_move == -1) {
            if (room_first == __init) {
                room_move = room_next(__init);
            } else {
                room_move = room_first;
            }
        }
    } else if (nv_move < 0) {
        room_move = room_previous(room);
        
        if (room_move == __init) {
            if (room_previous(__init) == -1) {
                room_move = room_last;
            } else {
                room_move = room_previous(__init);
            }
        } else if (room_move == -1) {
            if (room_last == __init) {
                room_move = room_previous(__init);
            } else {
                room_move = room_last;
            }
        }
    }
    
    room_goto(room_move);
}

if (nv_fscreen) {
    window_set_fullscreen(!window_get_fullscreen());
}


