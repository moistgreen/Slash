function attack(_atkSpr, _atkDmg, _atkNum, _atkStage, _frame1, _frame2, _obj = "Player") {

	
	var _atkSprCheck = asset_get_index("spr" + string(_obj) + "Attack" + string(_atkNum) + "Mask" + string(_atkStage))
	
	//
	if (image_index >= _frame1 and image_index <= _frame2) {
		sprite_index = _atkSpr;
		if (!instance_exists(objHitCheck)) {
			instance_create_depth(x, y, 99, objHitCheck);
		}
				
		with(objHitCheck) {
			x = other.x;
			y = other.y;
			image_blend = c_purple;
			image_xscale = other.image_xscale;
			sprite_index = _atkSprCheck;
			if (_obj == "Player")
				var _idArr = instance_place_array(x, y, objEnemy);
			else
				var _idArr = instance_place_array(x, y, objPlayer);
				
			// Making sure we only hit someone once per attack
			for (var _i = 0; _i < array_length(_idArr); _i++) {
				var _tar = _idArr[_i]
				if (array_find_index(other.hitList, _tar) == -1) {
					with (_tar) {
						//show_message(_atkSprCheck)
						addDamage(_atkDmg);
						x += _atkDmg*other.image_xscale;

					}
					array_push(other.hitList, _tar);
				}
			}
		}
	}
	
	if (image_index > _frame2 and image_index < _frame2 +1)
		hitList = [];
}