function stateSpecial(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			sprite_index = sprPlayerAttackSpecial;
			image_index = 0;
			_dmg = 10;
			break;
		
		case TrueStateEvent.onStep:
		
			// ROLL
			if (key_shift) _layer.stateSwitch(State.roll);
		
			// Attacks
			attack(sprPlayerAttackSpecial, _dmg, 4, 1, 12, 13);
				
			// Returns to idle
			if (image_index >= image_number -1)
				_layer.stateSwitch(State.idle);
				
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			break;
	}
}