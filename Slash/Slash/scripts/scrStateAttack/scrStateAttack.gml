function stateAttack() {
	sprite_index = sprPlayerAttack1;
	
	if (image_index >= image_number-1) {
		sprite_index = sprPlayerIdle;
		state = stateIdle;
	}
}