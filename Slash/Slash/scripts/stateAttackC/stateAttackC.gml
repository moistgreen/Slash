function stateAttackC(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			sprite_index = sprPlayerAttack3;
			image_index = 0;
			_dmg = 5;
			break;
		
		case TrueStateEvent.onStep:
		
			// ROLL
			if (key_shift) _layer.stateSwitch(State.roll);
			
			attack(sprPlayerAttack3, _dmg, 3, 1, 4, 5);
			
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