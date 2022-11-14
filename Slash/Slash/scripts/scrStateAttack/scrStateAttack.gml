function stateAttack() {
	
	// Death
	totalDamage = handleDamage();
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
	
	// Ground attacks
	if (onGround) {
		
		// So we know that our attack sequence finished
		if (image_index >= image_number-1) {
			finishedAttackSequence = true;	
		}
			
		// Destroys hit check object after use
		if (instance_exists(objHitCheck)) {
			//instance_destroy(objHitCheck)
		}
		
		// Attack 1
		if (sprite_index == sprPlayerAttack1)
			attack(sprPlayerAttack1, 4, 1, 1, 5, 7);
		
		// Attack 2 combo hint
		if (sprite_index == sprPlayerAttack1 and image_index >= 5 and image_index <= 7)
			instance_create_depth(x, y - 16, -99, objComboHint)
		
		// Switch to attack 2
		if (mouse_left and sprite_index == sprPlayerAttack1 and image_index >= 5 and image_index <= 7) {
			image_index = 0;
			sprite_index = sprPlayerAttack2;
			onAttack2 = true;
			hitList = [];
		}
		
		// Repeats attack 2 for full animation
		if (onAttack2) {
			
			
		//
		attack(sprPlayerAttack2, 1, 2, 1, 3, 4);
		if (image_index > 4 and image_index < 5)
			hitList = [];
		
		attack(sprPlayerAttack2, 2, 2, 2, 5, 6);
				
		attack(sprPlayerAttack2, 2, 2, 3, 6, 7);

		attack(sprPlayerAttack2, 2, 2, 4, 7, 8);
			
			if (image_index >= image_number -1 or mouse_left and sprite_index == sprPlayerAttack2 and image_index >= 9 and image_index <= 11) {
				onAttack2 = false;
			}
		}
	
		// Attack 3 combo hint
		if (sprite_index == sprPlayerAttack2 and image_index >= 10 and image_index <= 12)
			instance_create_depth(x, y - 16, -99, objComboHint)
		
		// Switch to attack 3
		if (mouse_left and sprite_index == sprPlayerAttack2 and image_index >= 9 and image_index <= 11) {
			image_index = 0;
			sprite_index = sprPlayerAttack3;	
			hitList = [];
			onAttack3 = true;
		}
		
		if (onAttack3) {
			attack(sprPlayerAttack3, 4, 3, 1, 4, 5);
			
			if (image_index >= image_number -1) {
				onAttack3 = false;
			}
		}
	
		// End attack
		if (finishedAttackSequence) {
			sprite_index = sprPlayerIdle;
			finishedAttackSequence = false;
			state = stateIdle;
			hitList = [];
			exit;
		}
	}
	
	// Air attack
	else if (!onGround) {
		if (attacks < airAttacksMax) {
			sprite_index = sprPlayerAttackAir;
			vSpeed = 0;
			onAttackAir = true;
			hitList = [];
		}
		
		if (onAttackAir) {
			attack(sprPlayerAttackAir, 2, 5, 1, 4, 5)
			
			if (image_index >= image_number -1) {
				onAttackAir = false;
			}
		}
		attacks++;
		if (image_index >= image_number-1) {
			sprite_index = sprPlayerJumpDown;
			state = stateFalling;
			hitList = [];
			exit;
		}
	}
}	
