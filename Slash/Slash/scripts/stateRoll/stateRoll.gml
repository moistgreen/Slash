function stateRoll(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			image_index = 0;
			sprite_index = sprPlayerRoll;
			image_xscale = faceDir;
			hSpeed = rollSpeed*faceDir;
			break;
		
		case TrueStateEvent.onStep:
			#region MOVEMENT
		
			// Horizontal collision
			againstWall = false;
			if (tile_meeting(x + hSpeed, y, LAYER_COLLISION)) {	
				while(!tile_meeting(x+sign(hSpeed), y, LAYER_COLLISION))
					x += sign(hSpeed);	
				hSpeed = 0;
				againstWall = true;
				_layer.stateSwitch(State.idle);
			}
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
			}
			y += vSpeed;
			#endregion
			
			if (image_index >= image_number - 1)
				_layer.stateSwitch(State.idle);
			
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			break;
	}
}