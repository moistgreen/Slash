// Instructions
draw_set_text_alignment(fa_left_top)
var _topMargin = 128;
var _leftMargin = 32;
if (toggleInstructions) {
	draw_text(_leftMargin, _topMargin, "PRESS H: TOGGLES THIS MENU")
	draw_text(_leftMargin, _topMargin+32, "SHIFT: ROLL")
	draw_text(_leftMargin, _topMargin+64, "CTRL: BLOCKS")
	draw_text(_leftMargin, _topMargin+96, "RIGHT CLICK: SPECIAL MOVE")
	draw_text(_leftMargin, _topMargin+128, "PRESS R: RESTART")
}

// Health bar
drawNineSlice(,, hitPoints, hitPointsMax, 32, camera_get_view_height(VIEW)*2-64, 32, 32)

