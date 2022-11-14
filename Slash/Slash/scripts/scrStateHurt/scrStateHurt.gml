function stateHurt() {
	if (image_index >= image_number -1) {
		image_index = 0;
		sprite_index = sprPlayerIdle;
		state = stateIdle;
		exit;
	}
}