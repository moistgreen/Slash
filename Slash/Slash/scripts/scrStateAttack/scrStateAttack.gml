function stateAttackOLD() {
	
	#region TAKING DAMAGE
	
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
	
	#endregion
	
	// Ground attacks
	if (onGround) {
		
		// So we know that our attack sequence finished
		if (image_index >= image_number-1)
			finishedAttack = true;	
			
		// Attack 1
		if (sprite_index == sprPlayerAttack1)
			attack(sprPlayerAttack1, 4, 1, 1, 5, 7);
		
		#region ATTACK 2
		// Switch to attack 2
		if (mouse_left and sprite_index == sprPlayerAttack1 and image_index >= 5 and image_index <= 7) {
			image_index = 0;
			sprite_index = sprPlayerAttack2;
			onAttack2 = true;
			hitList = [];
		}
		else if (mouse_left) {
			missed = true;
		}
		
		// Repeats attack 2 for full animation
		if (onAttack2) {
			
			// 4 Piece wombo combo
		attack(sprPlayerAttack2, 3, 2, 1, 3, 4);
		
		attack(sprPlayerAttack2, 3, 2, 2, 5, 6);
				
		attack(sprPlayerAttack2, 3, 2, 3, 7, 8);

		attack(sprPlayerAttack2, 3, 2, 4, 9, 10);
			
			//
			if (finishedAttack or (mouse_left and image_index >= 11 and image_index <= 15))
				onAttack2 = false;
		}
		#endregion
	
		#region	ATTACK 3
		// Switch to attack 3
		if (mouse_left and sprite_index == sprPlayerAttack2 and image_index >= 11 and image_index <= 15) {
			image_index = 0;
			sprite_index = sprPlayerAttack3;	
			onAttack3 = true;
			hitList = [];
		}
		else if (mouse_left) {
			missed = true;
		}
		
		// Repeats attack 3 for full animation
		if (onAttack3) {
			attack(sprPlayerAttack3, 5, 3, 1, 4, 5);
			if (finishedAttack)
				onAttack3 = false;
		}
		#endregion
	
		// End attack
		if (finishedAttack) {
			sprite_index = sprPlayerIdle;
			finishedAttack = false;
			state = stateIdle;
			hitList = [];
			exit;
		}
		
		// Rolling
		if (key_shift) {
			hitList = [];
			onAttack2 = false;
			onAttack3 = false;
			image_index = 0;
			sprite_index = sprPlayerRoll;
			hSpeed = rollSpeed*image_xscale;
			state = stateRoll;
			exit;
		}
	}
	
	#region AIR ATTACKS
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
	#endregion
}	
