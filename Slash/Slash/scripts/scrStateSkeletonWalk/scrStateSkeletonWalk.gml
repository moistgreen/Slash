function stateSkeletonWalk() {
	
	#region STATES
	
	// Countdown for next attack
	if (cooldown > 0)
		cooldown--;
	
	// Attacks if player is in range
	if (distance_to_object(objPlayer) <= attackRange and cooldown <= 0) {
		image_index = 0;
		sprite_index = sprSkeletonAttack;
		state = stateSkeletonAttack;
		exit;
	}

	#endregion
	
	#region TAKING DAMAGE

	// Death
	totalDamage = handleDamage();
	if(totalDamage >= hitPoints) {
		with (instance_create_depth(x, y, -99, objDamagePopUp))
			damage = other.totalDamage;
		hitPoints -= totalDamage;
		image_index = 0;
		sprite_index = sprSkeletonDeath
		state = stateSkeletonDeath;
		exit;
	}
	 
	// Hurt
	else if (totalDamage > 0) {
		with (instance_create_depth(x, y, -99, objDamagePopUp))
			damage = other.totalDamage;
		hitPoints -= totalDamage;
		image_index = 0;
		sprite_index = sprSkeletonHurt;
		state = stateSkeletonHurt;
		exit;

	}

	#endregion
	
	#region MOVEMENT
	
	// Faces toward the player
	if (x - objPlayer.x < 0)
		image_xscale = 1;
	
	else if (x - objPlayer.x > 0)
		image_xscale = -1;
	
	// Moves toward player if within aggro distance
	if (distance_to_object(objPlayer) > attackRange and distance_to_object(objPlayer) < aggroRange) {
		hSpeed = moveSpeed * image_xscale;
		sprite_index = sprSkeletonWalk;
	}
	
	// Changes to idle state if not moving
	if (hSpeed == 0 or againstWall) {
		sprite_index = sprSkeletonIdle;
		state = stateSkeletonIdle;
		exit;
	}
	
	#endregion
	
	#region COLLISION
	
	// Horizontal collision
	againstWall = false;
	if (tile_meeting(x + hSpeed, y, LAYER_COLLISION)) {	
		while(!tile_meeting(x+sign(hSpeed), y, LAYER_COLLISION)) {
			x += sign(hSpeed);	
		}
		hSpeed = 0;
		againstWall = true;
		
		// Jumps
		vSpeed = -7;
		exit;
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
	
}