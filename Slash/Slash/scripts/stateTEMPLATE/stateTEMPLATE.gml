function stateTEMPLATE(_event, _layer) {

	switch(_event) {
		
		case TrueStateEvent.onEnter:
			break;
		
		case TrueStateEvent.onStep:
			break;
			
		case TrueStateEvent.onDraw:
			draw_self();
			break;
			
		case TrueStateEvent.onExit:
			break;
	}
}