function handleDamage(){
	var _totalDmg = 0;
	for (var _i = 0; _i < array_length(damageInbox); _i++) {
		var _dmg = damageInbox[_i];
		_totalDmg += _dmg;
	}
	damageInbox = []
	return _totalDmg;
}
