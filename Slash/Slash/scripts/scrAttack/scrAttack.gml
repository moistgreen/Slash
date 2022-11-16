function attack(_atkSpr, _atkDmg, _atkNum, _atkStage, _frame1, _frame2, _obj = "Player") {

	// Only runs if we're within our damage frames
	if (image_index >= _frame1 and image_index <= _frame2) {
		
		// Gets sprite attack mask from browser
		var _atkSprCheck = asset_get_index("spr" + string(_obj) + "Attack" + string(_atkNum) + "Mask" + string(_atkStage))
		sprite_index = _atkSpr;
		
		// Creates hit check object if one doesn't exist
		if (!instance_exists(objHitCheck))
			instance_create_depth(x, y, 99, objHitCheck);
		
		// Go into hit check object
		with(objHitCheck) {
			
			// Sets up hit check object
			x = other.x;
			y = other.y;
			image_xscale = other.image_xscale;
			sprite_index = _atkSprCheck;
			
			// Sets collision based on attacker
			if (_obj == "Player")
				var _idArr = instance_place_array(x, y, objEnemy);
			else
				var _idArr = instance_place_array(x, y, objPlayer);
				
			// Making sure we only hit someone once per attack
			for (var _i = 0; _i < array_length(_idArr); _i++) {
				var _tar = _idArr[_i]
				if (array_find_index(other.hitList, _tar) == -1) {
					with (_tar)
						addDamage(_atkDmg); // Add damage to target
					array_push(other.hitList, _tar); // Add target to hit list
				}
			}
		}
	}
	
	// Clears hit list after damage frame is over
	if (image_index > _frame2 and image_index < _frame2 +1)
		hitList = [];
}