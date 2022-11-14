function drawHealthBar(_sprite, _hpCur, hpMax, _x, _y, _w, _h, _center = false) {
	for (var _i = 0; _i < _hpCur; _i++) {
		
		if (_center)
			draw_sprite(_sprite, 0, _x+(_w*_i)-(_hpCur*_w)/2, _y)	
		else
			draw_sprite(_sprite, 0, _x+(_w*_i), _y)
	}
}
