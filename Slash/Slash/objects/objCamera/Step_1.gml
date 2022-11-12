camera_set_view_size(VIEW, view_width, view_height);

if (instance_exists(objPlayer))
{
	var _x = clamp(objPlayer.x - view_width/2, 0, room_width - view_width);
	var _y = clamp(objPlayer.y - view_height/2, 0, room_height - view_height);
	camera_set_view_pos(VIEW, _x, _y)
	
	var _cur_x = camera_get_view_x(VIEW);
	var _cur_y = camera_get_view_y(VIEW) - 55;
	
	var _spd = .01;
	camera_set_view_pos(VIEW, lerp(_cur_x,_x,_spd), lerp(_cur_y,_y,_spd));
}