function stateDefend() {
	
	#region TAKING DAMAGE
	
	totalDamage = handleDamage();
	totalDamage = round(totalDamage/2);
	
	// Death
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
	
	if (key_control_held) {
		image_index = 6;
	}
	else if (image_index >= image_number -1) {
		image_index = 0;
		sprite_index = sprPlayerIdle;
		state = stateIdle;
		exit;
	}
}