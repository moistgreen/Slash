function stateJumpA() {
	
	#region MOVEMENT
	canJump = false
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
		sprite_index = sprPlayerJumpLand;
		if (image_index >= image_number - 1) {
			sprite_index = sprPlayerIdle;
			state = stateIdle;
			exit;
		}
	}
	y += vSpeed;
		
	#endregion
		
	#region STATES
	// Attacking
	if (mouse_left and attacks < airAttacksMax) {
		image_index = 0;
		state = stateAttack;
	}
	
	#endregion
	
	#region ANIMATION
	
	// Animation handling
	if (dir != 0)
		image_xscale = dir;
	
	if (vSpeed < 6 and vSpeed > -2) {
		//image_index = 0;
		sprite_index = sprPlayerJumpApex;
	}
	else if (vSpeed < 0) {
		//image_index = 0;
		sprite_index = sprPlayerJumpUp
	}
	else if (y > startY) {
		//image_index = 0;
		sprite_index = sprPlayerJumpDown
		state = stateFalling;
		exit;
	}
	
	#endregion
		
}