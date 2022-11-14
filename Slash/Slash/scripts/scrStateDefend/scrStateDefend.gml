function stateDefend() {
	
	// Death
	totalDamage = checkDamage();
	totalDamage = round(totalDamage/2);
	
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
		exit;
	}
	
	if (key_control_held) {
		image_index = 6;
	}
	else if (image_index >= image_number -1) {
		sprite_index = sprPlayerIdle;
		state = stateIdle;
		exit;
	}
}