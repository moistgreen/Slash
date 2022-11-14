function checkDamage() {
	var _totalDamage = handleDamage();
	
	if (hitPoints <= 0) {
		return true;	
	}
	else
		return _totalDamage;
}