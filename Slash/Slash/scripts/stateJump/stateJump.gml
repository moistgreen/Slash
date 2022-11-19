function stateJump(_event, _layer) {
	
	switch(_event) {
		
		case TrueStateEvent.onEnter:
			sprite_index = sprPlayerJumpStart;
			vSpeed = jumpStrength;
			startY = y;
			break;
		
		case TrueStateEvent.onStep:	
				
			if (mouse_left)
				_layer.stateSwitch(State.attackAir);
				
			// Change sprite
			if (_layer.timer >= 2 and _layer.timer < 3)
				sprite_index = sprPlayerJumpUp
			else if (vSpeed < 0)
				sprite_index = sprPlayerJumpUp;
			else if (vSpeed > 0)
				sprite_index = sprPlayerJumpDown;
				
			#region MOVEMENT
			// Horizontal collision
			if (dir != 0)
				image_xscale = dir;
			hSpeed = moveSpeed*dir;
			againstWall = false;
			if (tile_meeting(x + hSpeed, y, LAYER_COLLISION)) {	
				while(!tile_meeting(x+sign(hSpeed), y, LAYER_COLLISION))
					x += sign(hSpeed);	
				hSpeed = 0;
				againstWall = true;
			}
			hSpeed /= airSpeedModifier;
			x += hSpeed;

			// Vertical collision
			vSpeed += grav;
			onGround = false;
			if (tile_meeting(x, y + vSpeed, LAYER_COLLISION)) {	
				while(!tile_meeting(x, y+sign(vSpeed), LAYER_COLLISION))
					y += sign(vSpeed);	
				vSpeed = 0;
				jumping = false;
				onGround = true;
				_layer.stateSwitchPrevious();
				exit;
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