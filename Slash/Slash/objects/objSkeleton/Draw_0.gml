draw_self();

var _hpBarCellWidth = 4;
var _hpBarCellHeight = 8;

if (distance_to_object(objPlayer) < aggroRange)
	drawHealthBar(sprHealthBar, hitPoints, hitPointsMax, x, y-16, _hpBarCellWidth, _hpBarCellHeight, true);

draw_set_text_alignment(fa_center_middle)
//draw_text(x, y-64, "HP = " + string(hitPoints));
//draw_text(x, y -96, "State: " + string(state))



