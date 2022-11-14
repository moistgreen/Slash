function stateSkeletonDeath() {
	hitPoints = 0;
	hSpeed = 0;
	if (image_index >= image_number - 1) {
		image_speed = 0;
		if (instance_number(objEnemy) > MAX_ENEMIES)
			instance_destroy();
	}
}