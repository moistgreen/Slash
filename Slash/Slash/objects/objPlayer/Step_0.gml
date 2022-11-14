// Updates key inputs
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_space_pressed = keyboard_check_pressed(vk_space);
key_space_held = keyboard_check(vk_space);
key_shift = keyboard_check_pressed(vk_shift);
key_control_held = keyboard_check(vk_control);
mouse_left = mouse_check_button_pressed(mb_left);
mouse_right = mouse_check_button_pressed(mb_right);
dir = key_right - key_left;

// Run current state
state()

if (keyboard_check_pressed(ord("H"))) {
	toggleInstructions = !toggleInstructions;	
}

if (onGround)
	attacks = 0;