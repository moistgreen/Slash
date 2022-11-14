function drawNineSlice(_spriteBorder = sprHealthbarNineSlice, _spriteBar = sprHealthBar, _hpCur, _hpMax, _x, _y, _w, _h) {
	var _margin = 8;
	
	// Draws Border
	draw_sprite_stretched(_spriteBorder, 0, _x, _y, (_hpMax*_w) + _margin*2, _h + _margin*2);
	
	// Draws Health
	draw_sprite_stretched(_spriteBar, 0, _x + _margin, _y + _margin, _hpCur*_w, _h);

}
