function stateWalk() {

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
		vSpeed = jumpStrength
		image_index = 1;
		sprite_index = sprPlayerJump
		state = stateJump;
	}
	y += vSpeed;
	
	#endregion
	
	#region STATES
	
	// Walking
	if (hSpeed == 0) {
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
		state = stateAttack;
	}
	
	#endregion
	
	#region ANIMATION
	
	// Changes sprite direction
	if (dir != 0)
		image_xscale = dir;
	
	#endregion
}