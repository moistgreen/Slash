function stateIdle() {

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

	// Checks if jumping is possible
	if (!tile_meeting(x, y+vSpeed, LAYER_COLLISION) and onGround)
		canJump = true;
	else
		canJump = false;
		
	// Goes into jumping state
	if (key_space_pressed and canJump) {
		vSpeed = jumpStrength;
		sprite_index = sprPlayerJumpStart;
		state = stateJump;
	}
	y += vSpeed;
	
	#endregion
	
	
	
	#region ANIMATION
	
	//sprite_index = sprPlayerIdle;
	
	#endregion
	
	#region STATES
	
	// Walking
	if (hSpeed != 0) {
		sprite_index = sprPlayerWalk;
		state = stateWalk;
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
}