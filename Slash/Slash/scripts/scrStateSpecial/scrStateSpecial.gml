function stateSpecial() {
	
	#region TAKING DAMAGE
	
	// Death
	totalDamage = handleDamage();
	if(totalDamage >= hitPoints) {
		with (instance_create_depth(x, y, -99, objDamagePopUp))
			damage = other.totalDamage;
			image_index = 0;
		sprite_index = sprPlayerDeath;
		state = stateDeath;
		exit;
	}
	 
	// Hurt
	else if (totalDamage > 0) {
		with (instance_create_depth(x, y, -99, objDamagePopUp))
			damage = other.totalDamage;
		hitPoints -= totalDamage;
		image_index = 0;
		sprite_index = sprPlayerHurt;
		state = stateHurt;
		exit;
	}
	
	#endregion
	
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