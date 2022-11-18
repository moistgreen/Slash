function stateSpecialA() {
	
	takeDamage();
	
	// Rolling
	if (key_shift) {
		image_index = 0;
		sprite_index = sprPlayerRoll;
		hSpeed = rollSpeed*image_xscale;
		state = stateRoll;
		exit;
	}
	
	attack(sprPlayerAttackSpecial, 10, 4, 1, 12, 13);
	
	// End attack
	if (image_index >= image_number-1) {
		sprite_index = sprPlayerIdle;
		finishedAttackSequence = false;
		state = stateIdle;
		hitList = [];
		exit;
	}
}