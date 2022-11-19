function stateAttackA(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			combo = false;
			sprite_index = sprPlayerAttack1;
			image_index = 0;
			_dmg = 4
			
			break;
		
		case TrueStateEvent.onStep:
		
			// ROLL
			if (key_shift) _layer.stateSwitch(State.roll);
		
			// Attacks
			attack(sprPlayerAttack1, _dmg, 1, 1, 4, 5);
			
			// DEBUG COMBO TIMING
			if	(!instance_exists(objComboHint) and image_index >= 4 and image_index <= 5) {
				instance_create_depth(x, y-32, -99, objComboHint);
				x += 4*faceDir;
			}
				
			// Continues combo
			if	(mouse_left and image_index >= 4 and image_index <= 5) {
				combo = true;
				
			}
			// Returns to idle
			else if (!combo and image_index >= image_number -1)
				_layer.stateSwitch(State.idle);
				
			// Switches to next attack
			if (combo and image_index >= 8)
				_layer.stateSwitch(State.attackB);
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			combo = false;
			
			break;
	}
}