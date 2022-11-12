// Updates key inputs
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_space_pressed = keyboard_check_pressed(vk_space);
key_space_held = keyboard_check(vk_space);
mouse_left = mouse_check_button_pressed(mb_left);
dir = key_right - key_left;

// Run current state
state()
