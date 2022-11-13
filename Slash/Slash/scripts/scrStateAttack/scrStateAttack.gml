function stateAttack() {
	
	if (onGround) {
		if (image_index >= image_number-1) {
			finishedAttackSequence = true;
			
		}
			
		if (instance_exists(objHitCheck)) {
			instance_destroy(objHitCheck)
		}
		if (sprite_index == sprPlayerAttack1 and image_index >= 3 and image_index <= 5 and !instance_exists(objHitCheck)) {
			with(instance_create_depth(x, y, -99, objHitCheck)) {
				image_xscale = other.image_xscale;
				sprite_index = sprHitCheckAttack1;
				damage = 1;
				knockback = 20;
				var _idArr = instance_place_array(x, y, objEnemy)
				
				for (var _i = 0; _i < array_length(_idArr); _i++) {
					var _tar = _idArr[_i]
					if (array_find_index(other.hitList, _tar) == -1) {
						show_message("Hit " + string(_tar))
						array_push(other.hitList, _tar);
					}
				}
			}
		}
			// Combos
		// Switch to attack 2
		if (sprite_index == sprPlayerAttack1 and image_index >= 5 and image_index <= 7)
			instance_create_depth(x, y - 16, -99, objComboHint)
			
		if (mouse_left and sprite_index == sprPlayerAttack1 and image_index >= 5 and image_index <= 7) {
			image_index = 0;
			sprite_index = sprPlayerAttack2;
			hitList = [];
		}
	
		// Switch to attack 3
		if (sprite_index == sprPlayerAttack2 and image_index >= 9 and image_index <= 11)
			instance_create_depth(x, y - 16, -99, objComboHint)
			
		if (mouse_left and sprite_index == sprPlayerAttack2 and image_index >= 9 and image_index <= 11) {
			image_index = 0;
			sprite_index = sprPlayerAttack3;	
			hitList = [];
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
		}
		attacks++;
		if (image_index >= image_number-1) {
			sprite_index = sprPlayerJumpDown;
			state = stateFalling;
			exit;
		}
	}
}	