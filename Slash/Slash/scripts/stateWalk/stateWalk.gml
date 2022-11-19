function stateWalk(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			image_index = 0;
			sprite_index = sprPlayerWalk;
			break;
		
		case TrueStateEvent.onStep:
			
			#region STATE SWITCHING
			takeDamage()
			// Defend
			if (key_control_held) _layer.stateSwitch(State.defend);
			
			// IDLE
			if (hSpeed == 0) _layer.stateSwitch(State.idle);
				
			// JUMP
			if (key_space_pressed) _layer.stateSwitch(State.jump);
			
			// ROLL
			if (key_shift) _layer.stateSwitch(State.roll);
			
			// Attack
			if (mouse_left) _layer.stateSwitch(State.attackA);
			
			// Special
			if (mouse_right) _layer.stateSwitch(State.special);
			#endregion
				
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