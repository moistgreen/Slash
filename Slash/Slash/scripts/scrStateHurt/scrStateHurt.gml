function stateHurt() {

	// Defend
	if (key_control_held) {
		image_index = 0;
		sprite_index = sprPlayerDefend;
		state = stateDefend;
		exit;
	}
	
	// Rolling
	if (key_shift) {
		image_index = 0;
		sprite_index = sprPlayerRoll;
		hSpeed = rollSpeed*image_xscale;
		state = stateRoll;
		exit;
	}
	
	// Goes back to idle after animation is over
	if (image_index >= image_number -1) {
		image_index = 0;
		sprite_index = sprPlayerIdle;
		state = stateIdle;
		exit;
	}

}