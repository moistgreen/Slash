function stateIdle(_event, _layer) {
	
	switch(_event) {
		
		case TrueStateEvent.onEnter:
			image_index = 0;
			sprite_index = sprPlayerIdle;
			break;
		
		case TrueStateEvent.onStep:
			
			#region STATE SWITCHING
			takeDamage()
			// Defend
			if (key_control_held) _layer.stateSwitch(State.defend);
			
			// WALK
			if ((key_left or key_right) and !againstWall) _layer.stateSwitch(State.walk);
				
			// JUMP
			if (key_space_pressed) _layer.stateSwitch(State.jump);
			
			// ROLL
			if (key_shift and canRoll) _layer.stateSwitch(State.roll);
			
			// Attack
			if (mouse_left) _layer.stateSwitch(State.attackA);
			
			// Special
			if (mouse_right) _layer.stateSwitch(State.special);
			#endregion
			
			#region MOVEMENT
			// Horizontal collision
			againstWall = false;
			if (tile_meeting(x + dir, y, LAYER_COLLISION))
				againstWall = true;
			canRoll = true;
			if (tile_meeting(x + faceDir, y, LAYER_COLLISION))
				canRoll = false;

			// Vertical collision
			vSpeed += grav;
			onGround = false;
			if (tile_meeting(x, y + vSpeed, LAYER_COLLISION)) {	
				while(!tile_meeting(x, y+sign(vSpeed), LAYER_COLLISION)) {
					y += sign(vSpeed);	
				}
				vSpeed = 0;
				onGround = true;
			}
			y += vSpeed;
			#endregion
			
			
			
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			break;
	}
	
}