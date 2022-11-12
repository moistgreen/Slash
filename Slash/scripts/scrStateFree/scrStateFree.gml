function stateFree() {
	
	// Updates key inputs
	key_right = keyboard_check(ord("D"));
	key_left = keyboard_check(ord("A"));
	key_space_pressed = keyboard_check_pressed(vk_space);
	key_space_held = keyboard_check(vk_space);
	dir = key_right - key_left;

	// Horizontal collision
	hSpeed = maxSpeed*dir;
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
	if (!jumping or vSpeed > 0) 
		vSpeed += grav;
	onGround = false;
	if (tile_meeting(x, y + vSpeed, LAYER_COLLISION)) {	
		while(!tile_meeting(x, y+sign(vSpeed), LAYER_COLLISION)) {
			y += sign(vSpeed);	
		}
		vSpeed = 0;
		onGround = true;
	}
	y += vSpeed;

	// Jumping
	if (key_space_pressed and onGround) {
		vSpeed -= jumpStrength
		
		jumping = true
		alarm[0] = jumpTime;
	}
	y += vSpeed;
}

/*
	// Horizontal collision
	hSpeed = maxSpeed*dir;
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
	if (!jumping or vSpeed > 0) vSpeed += grav;
	onGround = false;
	if (tile_meeting(x, y + vSpeed, LAYER_COLLISION)) {	
		while(!tile_meeting(x, y+sign(vSpeed), LAYER_COLLISION)) {
			y += sign(vSpeed);	
		}
		vSpeed = 0;
		onGround = true;
	}
	y += vSpeed;
*/