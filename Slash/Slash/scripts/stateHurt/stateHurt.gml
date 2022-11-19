function stateHurt(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			sprite_index = sprPlayerHurt;
			image_index = 0;
			break;
		
		case TrueStateEvent.onStep:
		
			// Defend
			if (key_control_held and image_index >= image_number -1) _layer.stateSwitch(State.defend);
		
			// Goes back to idle after animation is over
			if (image_index >= image_number -1) _layer.stateSwitch(State.idle)
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			break;
	}
}