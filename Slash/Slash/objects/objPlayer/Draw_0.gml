draw_self();
draw_set_text_alignment(fa_center_middle)
draw_text(x, y-64, "onGround = " + string(onGround));
draw_text(x, y-96, "Count " + string(count));
draw_text(x, y-128, "State = " + string(state));
draw_text(x, y-160, "vSpeed = " + string(vSpeed));
draw_text(x, y-192, "hitList " + string(hitList));

//draw_text(mouse_x, mouse_y-32, "X = " + string(xx));
//draw_text(mouse_x, mouse_y-64, "y = " + string(yy));
//draw_sprite(sprCursorTest, 0, mouse_x, mouse_y)
