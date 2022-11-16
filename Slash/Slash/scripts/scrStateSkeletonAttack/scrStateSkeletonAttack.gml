function stateSkeletonAttack() {
	
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
	
	#region ATTACKING

	// Goes into idle state when attack is finished
	if (image_index >= image_number - 1) {
		hitList = [];
		image_index = 0;
		sprite_index = sprSkeletonIdle;
		state = stateSkeletonIdle;
		exit;
	}
	
	// 1st Attack
	attack(sprSkeletonAttack, attackDamage, 1, 1, 4, 5, "Skeleton");
	
	// Resets hit list between swings
	if (image_index >= 5 and image_index <= 6)
		hitList = [];
	
	// 2nd Attack
	attack(sprSkeletonAttack, attackDamage, 1, 2, 8, 9, "Skeleton");

	cooldown = irandom_range(cooldownMin, cooldownMax);
		
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
	}

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
