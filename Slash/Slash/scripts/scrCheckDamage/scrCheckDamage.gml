function checkDamage() {
	var _totalDamage = handleDamage();
	
	if (hitPoints <= 0) {
		instance_destroy();	
	}
}