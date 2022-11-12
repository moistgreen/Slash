function stateJump() {

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
	x += hSpeed/airSpeedModifier;
	
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
	
	// Animation handling
	if (vSpeed < 0 )
		sprite_index = sprPlayerJumpUp
	else if (vSpeed > 0) {
		state = stateFalling;
		sprite_index = sprPlayerJumpDown
	}
}