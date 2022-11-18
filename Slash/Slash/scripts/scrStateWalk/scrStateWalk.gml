function stateWalkA() {

	takeDamage();

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
	
	#region STATES
	
	// Goes into jumping state
	if (key_space_pressed and canJump) {
		
		image_index = 0;
		sprite_index = sprPlayerJumpStart;
		
		if (image_index >= image_number - 1) {
			startY = y;
			vSpeed = jumpStrength;
			state = stateJump;
			exit;
		}
	}
	
	// Defend
	if (key_control_held) {
		sprite_index = sprPlayerDefend;
		state = stateDefend;
	}
	
	//Rolling
	else if (key_shift) {
		if (dir != 0)
			hSpeed = rollSpeed*dir;
		image_index = 0;
		sprite_index = sprPlayerRoll;
		state = stateRoll;
	}
	
	// Walking
	else if (hSpeed == 0) {
		sprite_index = sprPlayerIdle
		state = stateIdle;
	}
	
	// Falling
	else if (!onGround) {
		sprite_index =	sprPlayerJumpDown;
		state = stateFalling;
	}
	
	// Attacking
	else if (mouse_left) {
		image_index = 0;
		sprite_index = sprPlayerAttack1;
		state = stateAttack;
	}
	
	#endregion
	
	#region ANIMATION
	
	// Changes sprite direction
	if (dir != 0)
		image_xscale = dir;
	
	#endregion
}