function stateIdle() {

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

	#region MOVEMENT
	
	// Horizontal collision
	hSpeed = moveSpeed*dir;
	againstWall = false;
	if (tile_meeting(x + hSpeed, y, LAYER_COLLISION)) {	
		while(!tile_meeting(x+sign(hSpeed), y, LAYER_COLLISION)) {
			x += sign(hSpeed);	
		}
		hSpeed = 0;
		againstWall = true;
	}
	if (!onGround)
		hSpeed /= airSpeedModifier;
	x += hSpeed;

	// Vertical collision
	vSpeed += grav;
	onGround = false;
	if (tile_meeting(x, y + vSpeed, LAYER_COLLISION)) {	
		while(!tile_meeting(x, y+sign(vSpeed), LAYER_COLLISION)) {
			y += sign(vSpeed);	
		}
		vSpeed = 0;
		jumping = false;
		onGround = true;
	}

	
	y += vSpeed;
	
	#endregion
	
	#region ANIMATION
	
	//sprite_index = sprPlayerIdle;
	
	#endregion
	
	#region STATES
	
	// Checks if jumping is possible
	if (!tile_meeting(x, y+vSpeed, LAYER_COLLISION) and onGround)
		canJump = true;
	else
		canJump = false;
		
	// Goes into jumping state
	if (key_space_pressed and canJump) {
		
		image_index = 0;
		sprite_index = sprPlayerJumpStart;
		if (image_index >= image_number - 1) {
			vSpeed = jumpStrength;
			state = stateJump;
			exit;
		}
	}
	
	// Rolling
	if (key_shift) {
		image_index = 0;
		sprite_index = sprPlayerRoll;
		hSpeed = rollSpeed*image_xscale;
		state = stateRoll;
		exit;
	}
	
	// Defend
	if (key_control_held) {
		sprite_index = sprPlayerDefend;
		state = stateDefend;
		exit;
	}
	
	// Walking
	if (hSpeed != 0) {
		sprite_index = sprPlayerWalk;
		state = stateWalk;
		exit;
	}
	
	// Falling
	if (!onGround) {
		sprite_index =	sprPlayerJumpDown;
		state = stateFalling;
		exit;
	}
	
	// Attacking
	if (mouse_left) {
		image_index = 0;
		sprite_index = sprPlayerAttack1;
		state = stateAttack;
		exit;
	}
	
	// Special
	if (mouse_right) {
		image_index = 0;
		sprite_index = sprPlayerAttackSpecial;
		state = stateSpecial;
		exit;
	}
	
	#endregion
}