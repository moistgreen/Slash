function stateAttackAir(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			sprite_index = sprPlayerAttackAir;
			image_index = 0;
			_dmg = 4;
			break;
		
		case TrueStateEvent.onStep:
		
			// Attacks
			attack(sprPlayerAttackAir, _dmg, 5, 1, 3, 4);
				
			// Returns to idle
			if (image_index >= image_number -1)
				_layer.stateSwitch(State.jump);
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			break;
	}
}