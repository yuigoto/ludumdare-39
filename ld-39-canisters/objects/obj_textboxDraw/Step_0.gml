/// @description DescriptionGoesHere

// Set font
draw_set_font(fnt_munro16);

// Current word
var word    = "";

// Holds the next empty character, used to check new words
var char_empty  = " ";

// Current word width in pixels
var word_width  = 0;

// Look for words
repeat (char_speed) {
    if (text_write != text && line_number <= line_count_max) {
        if (text_position >= string_length(text)) {
            text_position = string_length(text);
            break;
        }
        
        // Find next word
        word = "";
        
        // Look next empty char
        if (char_empty == " ") {
            // Loop through current word
            for (var i = text_position; i < string_length(text); i++) {
                // Find the space, end of current word
                if (string_char_at(text, i + 1) == " ") {
                    break;
                } else {
                    word += string_char_at(text, i + 1);
                }
            }
        }
        
        // Length of current word
        word_width = string_width(word);
        
        if (word_width + string_width(line_text) > line_length_max) {
            // Insert line break
            text_write += "\n";
            line_number++;
            line_text = "";
            
            // Reached max num lines? Exit
            if (line_number >= line_count_max + 1) break;
        }
        
        // Set next empty character
        empty_char = string_char_at(text, text_position + 1);
        
        // Save text
        text_write += string_char_at(text, text_position + 1);
        line_text += string_char_at(text, text_position + 1);
        text_position++;
    }
}

// Advance
if (
    line_number >= line_count_max + 1 && action1Pressed()
    || line_number >= line_count_max + 1 && mouse_check_button_pressed(mb_left)
) {
    text = string_copy(text, string_length(text_write) - 2, string_length(text));
    text_write = "";
    line_number = 1;
    text_position = 0;
}

// Fast render
if (action1()) {
    char_speed = char_speed_max;
}

// Set rendered text as done
if (
    text_position == string_length(text) && action1Pressed() 
    ||text_position == string_length(text) && mouse_check_button_pressed(mb_left)
) {
    has_finished = true;
}
