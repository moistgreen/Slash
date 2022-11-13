function handleDamage(_show = true){
	var _totalDmg = 0;
	for (var _i = 0; _i < array_length(damageInbox); _i++) {
		var _dmg = damageInbox[_i];
		hitPoints -= _dmg;
		if (_show) {
			with (instance_create_depth(x, y, -99, objDamagePopUp)) {
				damage = _dmg;	
			}
		}
		_totalDmg += _dmg;
	}
	damageInbox = []
	return _totalDmg;
}