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
//x += hSpeed;

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
	
	//
	cooldown--;
	if (distance_to_object(objPlayer) < 60 and cooldown <= 0) {
		
		sprite_index = sprFrostGiantAttack;
		
		
		if (image_index >= image_number - 1) {
			image_index = 0;
			sprite_index = sprFrostGiantIdle;
			cooldown = 360;
		}
	}
	
	
#region ANIMATION
	
// Changes sprite direction
if (dir != 0)
	image_xscale = dir;
	
#endregion

