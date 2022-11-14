function stateRoll() {
	
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

	#region MOVEMENT
	// Horizontal collision
	
	againstWall = false;
	if (tile_meeting(x + hSpeed, y, LAYER_COLLISION)) {	
		while(!tile_meeting(x+sign(hSpeed), y, LAYER_COLLISION)) {
			x += sign(hSpeed);	
		}
		hSpeed = 0;
		againstWall = true;
	}
	
	if (againstWall) {
		hSpeed = 0;
		sprite_index = sprPlayerIdle;
		state = stateIdle;
		exit;
	}
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
	
	// Idle once animation stops
	if (image_index >= image_number -1) {
		sprite_index = sprPlayerIdle;
		state = stateIdle;
		exit;
	}
	
	#endregion
	
	#region ANIMATION


	#endregion
}