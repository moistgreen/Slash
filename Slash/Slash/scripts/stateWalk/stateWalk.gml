function stateWalk(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			image_index = 0;
			sprite_index = sprPlayerWalk;
			break;
		
		case TrueStateEvent.onStep:
			
			// IDLE
			if (hSpeed == 0) behavior.stateSwitch(State.idle);
				
			// JUMP
			if (key_space_pressed) behavior.stateSwitch(State.jump);
			
			// ROLL
			if (key_shift) behavior.stateSwitch(State.roll);
				
			#region MOVEMENT
			// Horizontal collision
			if (dir != 0)
				faceDir = dir;
			image_xscale = faceDir;
			hSpeed = moveSpeed*dir;
			againstWall = false;
			if (tile_meeting(x + hSpeed, y, LAYER_COLLISION)) {	
				while(!tile_meeting(x+sign(hSpeed), y, LAYER_COLLISION)) {
					x += sign(hSpeed);	
				}
				hSpeed = 0;
				againstWall = true;
			}
			if (!onGround)
				hSpeed /= airSpeedModifier;
			x += hSpeed;

			// Vertical collision
			vSpeed += grav;
			onGround = false;
			if (tile_meeting(x, y + vSpeed, LAYER_COLLISION)) {	
				while(!tile_meeting(x, y+sign(vSpeed), LAYER_COLLISION)) {
					y += sign(vSpeed);	
				}
				vSpeed = 0;
				jumping = false;
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