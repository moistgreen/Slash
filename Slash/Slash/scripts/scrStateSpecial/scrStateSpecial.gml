function stateSpecial() {
	
	attack(sprPlayerAttackSpecial, 10, 4, 1, 12, 13);
	
	// End attack
	if (image_index >= image_number-1) {
		sprite_index = sprPlayerIdle;
		finishedAttackSequence = false;
		state = stateIdle;
		exit;
	}
}