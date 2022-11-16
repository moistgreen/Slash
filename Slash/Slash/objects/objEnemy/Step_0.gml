	// Death
	totalDamage = handleDamage();
	if (totalDamage >= hitPoints) {
		if (!instance_exists(objDamagePopUp)) {
			with (instance_create_depth(x, y, -99, objDamagePopUp))
				damage = other.totalDamage;
		}
		hitPoints -= totalDamage;
		image_index = 0;
		// sprite_index = 
		if (image_index >= image_number - 1)
			instance_destroy();
		exit;
	}
	 
	// Hurt
	else if (totalDamage > 0) {
		with (instance_create_depth(x, y, -99, objDamagePopUp))
			damage = other.totalDamage;
		hitPoints -= totalDamage;
		image_index = 0;
		// sprite_index =
		exit;
	}