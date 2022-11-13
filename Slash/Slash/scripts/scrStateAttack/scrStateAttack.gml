function stateAttack() {
	
	if (onGround) {
			// Combos
		// Attack 2
		if (sprite_index == sprPlayerAttack1 and image_index >= 5 and image_index <= 7) {
			instance_create_depth(x, y - 16, objComboHint)
		}
		if (mouse_left and sprite_index == sprPlayerAttack1 and image_index >= 5 and image_index <= 7) {
			image_index = 0;
			sprite_index = sprPlayerAttack2;
		}
	
		// Attack 3
		if (sprite_index == sprPlayerAttack2 and image_index >= 9 and image_index <= 11)
			instance_create_depth(x, y-16, objComboHint)
		if (mouse_left and sprite_index == sprPlayerAttack2 and image_index >= 9 and image_index <= 11) {
			if (image_index >= image_number)
				finishedAttackSequence = true;
			image_index = 0;
			sprite_index = sprPlayerAttack3;	
		}
	
		// End attack
		if (image_index >= image_number or finishedAttackSequence) {
			sprite_index = sprPlayerIdle;
			finishedAttackSequence = false;
			state = stateIdle;
			exit;
		}
	}
	else if (!onGround) {
		if (attacks < airAttacksMax) {
			sprite_index = sprPlayerAttackAir;
			vSpeed = 0;
		}
		attacks++;
		if (image_index >= image_number-1) {
			sprite_index = sprPlayerJumpDown;
			state = stateFalling;
			exit;
		}
	}
}	