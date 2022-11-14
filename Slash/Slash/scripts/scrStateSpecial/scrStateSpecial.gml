function stateSpecial() {
	
	// Death
	totalDamage = checkDamage();
	if(totalDamage >= hitPoints) {
		with (instance_create_depth(x, y, -99, objDamagePopUp)) {
			damage = other.totalDamage;
		}
		sprite_index = sprPlayerDeath;
		state = stateDeath;
		exit;
	}
	 
	// Hurt
	else if (totalDamage > 0) {
		with (instance_create_depth(x, y, -99, objDamagePopUp)) {
			damage = other.totalDamage;
		}
		hitPoints -= totalDamage;
		image_index = 0;
		sprite_index = sprPlayerHurt;
		state = stateHurt;
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