function stateIdle(_event, _layer) {
	
	switch(_event) {
		
		case TrueStateEvent.onEnter:
			image_index = 0;
			sprite_index = sprPlayerIdle;
			break;
		
		case TrueStateEvent.onStep:
			
			// WALK
			if (key_left or key_right) behavior.stateSwitch(State.walk);
				
			// JUMP
			if (key_space_pressed) behavior.stateSwitch(State.jump);
			
			// ROLL
			if (key_shift) behavior.stateSwitch(State.roll);
				
			#region MOVEMENT
			// Horizontal collision
			againstWall = false;
			if (tile_meeting(x + hSpeed, y, LAYER_COLLISION)) {	
				while(!tile_meeting(x+sign(hSpeed), y, LAYER_COLLISION)) {
					x += sign(hSpeed);	
				}
				hSpeed = 0;
				againstWall = true;
			}

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