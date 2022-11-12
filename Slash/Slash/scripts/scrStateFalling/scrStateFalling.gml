function stateFalling() {

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
		sprite_index = sprPlayerIdle;
		state = stateIdle;
	}
		
	y += vSpeed;
	
	#endregion
	
	#region STATES
	
	// Walking
	//if (hSpeed == 0) {
	//	sprite_index = sprPlayerIdle
	//	state = stateIdle;
	//}
	
	// Attacking
	if (mouse_left) {
		//image_index = 0;
		//state = stateAttack;
	}
	
	#endregion
	
	#region ANIMATION
	
	// Changes sprite direction
	if (dir != 0)
		image_xscale = dir;
	
	#endregion
}