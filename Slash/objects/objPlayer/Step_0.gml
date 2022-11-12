
if (keyboard_check_pressed(vk_control)) {
	if (state == stateFree)
		state = stateFroze
		
	else if (state == stateFroze)
		state = stateFree
}

xx = tilemap_get_cell_x_at_pixel(tilemap, mouse_x, mouse_y)
yy = tilemap_get_cell_y_at_pixel(tilemap, mouse_x, mouse_y)

state()
