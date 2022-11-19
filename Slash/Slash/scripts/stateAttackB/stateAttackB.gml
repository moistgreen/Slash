function stateAttackB(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			combo = false;
			sprite_index = sprPlayerAttack2;
			image_index = 0;
			_dmg = 2
			break;
		
		case TrueStateEvent.onStep:
		
			// ROLL
			if (key_shift) _layer.stateSwitch(State.roll);
		
			// Attacks
			attack(sprPlayerAttack2, _dmg, 2, 1, 6, 7);
			attack(sprPlayerAttack2, _dmg, 2, 2, 10, 11);
			attack(sprPlayerAttack2, _dmg, 2, 3, 12, 13);
			attack(sprPlayerAttack2, _dmg, 2, 4, 14, 15);
			
			// DEBUG COMBO TIMING
			if	(!instance_exists(objComboHint) and image_index >= 18 and image_index <= 22)
				instance_create_depth(x, y-32, -99, objComboHint);
				
			// Continues combo
			if	(mouse_left and image_index >= 18)
				combo = true;
			
			// Returns to idle
			else if (!combo and image_index >= image_number -1)
				_layer.stateSwitch(State.idle);
				
			// Switches to next attack
			if (combo and image_index >= 23)
				_layer.stateSwitch(State.attackC);
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			combo = false;
			break;
	}
}