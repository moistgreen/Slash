function stateAttackA() {
	
	takeDamage();
	
	// Ground attacks
	if (onGround) {
		
		// Rolling
		if (key_shift) {
			hitList = [];
			image_index = 0;
			sprite_index = sprPlayerRoll;
			hSpeed = rollSpeed*image_xscale;
			state = stateRoll;
			exit;
		}
		
		// Indicates end of current attack animation
		if (image_index >= image_number - 1)
			finishedAttack = true;
		
		// Attacks
		switch (sprite_index) {
			
			// Attack 1
			case sprPlayerAttack1:
				
				if (finishedAttack) {
					finishedAttack = false;
					hitList = [];
			
					// Switch state
					image_index = 0;
					sprite_index = sprPlayerIdle;
					state = stateIdle;
					exit;
				}
				else
					attack(sprPlayerAttack1, 4, 1, 1, 5, 7);
				break;
				
			case sprPlayerAttack2:
			
				break;
				
			default:
				finishedAttack = false;
				hitList = [];
			
				// Switch state
				image_index = 0;
				sprite_index = sprPlayerIdle;
				state = stateIdle;
				exit;
		}
	}
	
	#region AIR ATTACKS
	
	// Air attack
	else if (!onGround) {
		
		//
		if (attacks < airAttacksMax) {
			sprite_index = sprPlayerAttackAir;
			vSpeed = 0;
			onAttackAir = true;
			hitList = [];
		}
		
		//
		if (onAttackAir) {
			attack(sprPlayerAttackAir, 2, 5, 1, 4, 5)
			
			if (image_index >= image_number -1) {
				onAttackAir = false;
			}
		}
		attacks++;
		
		// Changes state once animation is finsished
		if (image_index >= image_number-1) {
			sprite_index = sprPlayerJumpDown;
			state = stateFalling;
			hitList = [];
			exit;
		}
	}
	
	#endregion
	
	
}	
