	// Death
	totalDamage = checkDamage();
	if(totalDamage >= hitPoints) {
		if (!instance_exists(objDamagePopUp)) {
			with (instance_create_depth(x, y, -99, objDamagePopUp)) {
				damage = other.totalDamage;
			}
		}
		hitPoints -= totalDamage;
		sprite_index = sprDemonBossDeath;
		
		if (image_index >= image_number - 1)
			instance_destroy();
		exit;
	}
	 
	// Hurt
	else if (totalDamage > 0) {
		with (instance_create_depth(x, y, -99, objDamagePopUp)) {
			damage = other.totalDamage;
		}
		hitPoints -= totalDamage;
		image_index = 0;
		sprite_index = sprDemonBossHurt;
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
	
// Attacking
if (cooldown > 0)
	cooldown--;

if (image_index >= image_number - 1) {
	//image_index = 0;
	sprite_index = sprDemonBossIdle;
	attacking = false;
	hitList = [];
}

if (distance_to_object(objPlayer) <= 60 and cooldown <= 0 or attacking) {
	
	attacking = true;
	
	cooldown = irandom_range(30, 160);
	sprite_index = sprDemonBossAttack;
	
	//if (image_index >= image_number - 1) {
	//	attacking = false;
	//}

	var _atkSprCheck = sprDemonBossAttack1Mask1;
	var _atkDmg = 4;
	
	//
	if (image_index >= 9 and image_index <= 10) {
		if (!instance_exists(objHitCheck)) {
			instance_create_depth(x, y, 99, objHitCheck);
			
		}
				
		with(objHitCheck) {
			x = other.x;
			y = other.y;
			image_blend = c_purple;
			image_xscale = other.image_xscale;
			sprite_index = _atkSprCheck;
			var _idArr = instance_place_array(x, y, objPlayer)
				
			// Making sure we only hit someone once per attack
			for (var _i = 0; _i < array_length(_idArr); _i++) {
				var _tar = _idArr[_i]
				if (array_find_index(other.hitList, _tar) == -1) {
					with (_tar) {
						addDamage(_atkDmg);
						
					}
					array_push(other.hitList, _tar);
					
				}
			}
		}
	}
	instance_destroy(objHitCheck);
}
else
	sprite_index = sprDemonBossIdle;

	
#region ANIMATION
	
// Changes sprite direction

if (sprite_index != sprDemonBossAttack) {
	if (x - objPlayer.x < 0) {
		
		image_xscale = -1;
		
		if (distance_to_object(objPlayer) > 60) {
			x += moveSpeed
			sprite_index = sprDemonBossWalk;
		}
	}
	else if (x - objPlayer.x > 0) {
		image_xscale = 1;
		
		
		if (distance_to_object(objPlayer) > 60) {
			x -= moveSpeed;	
			sprite_index = sprDemonBossWalk;
		}
	}
}
	
#endregion



