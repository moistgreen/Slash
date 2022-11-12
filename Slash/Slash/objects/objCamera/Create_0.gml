//Normal
view_width = 1920 / 3; // = 640
view_height = 1080 / 3; // = 360

window_scale = 3;

window_set_size(view_width * window_scale, view_height * window_scale)
alarm[0] = 1;

surface_resize(application_surface,view_width*window_scale,view_height*window_scale);