function stateDefend(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			sprite_index = sprPlayerDefend;
			image_index = 0;
			
			break;
		
		case TrueStateEvent.onStep:
		
			#region TAKING DAMAGE
	
			totalDamage = handleDamage();
			totalDamage = round(totalDamage/2);
	
			// Death
			if(totalDamage >= hitPoints) {
				with (instance_create_depth(x, y, -99, objDamagePopUp))
					damage = other.totalDamage;
				_layer.stateSwitch(State.death);
				exit;
			}
	 
			// Hurt
			else if (totalDamage > 0) {
				with (instance_create_depth(x, y, -99, objDamagePopUp))
					damage = other.totalDamage;
				hitPoints -= totalDamage;
				exit;
			}
	
			#endregion
	
			// Keeps us in defend animation
			if (key_control_held) 
				image_index = 6;
			else if 
				(image_index >= image_number -1) _layer.stateSwitch(State.idle);
			
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			break;
	}
}