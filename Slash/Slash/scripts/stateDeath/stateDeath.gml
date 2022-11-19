function stateDeath(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			sprite_index = sprPlayerDeath;
			image_index = 0;
			break;
		
		case TrueStateEvent.onStep:
		
			// Goes back to idle after animation is over
			if (image_index >= image_number -1) image_speed = 0;
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			break;
	}
}