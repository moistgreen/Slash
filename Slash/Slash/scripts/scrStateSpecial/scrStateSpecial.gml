function stateSpecial() {
	// End attack
	if (image_index >= image_number-1) {
		sprite_index = sprPlayerIdle;
		finishedAttackSequence = false;
		state = stateIdle;
		exit;
	}
}