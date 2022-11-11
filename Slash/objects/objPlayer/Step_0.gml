// Updates key inputs
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
dir = key_right - key_left;

// Horizontal collision
hSpeed = spd*dir;
againstWall = false;
if (tile_meeting(x + hSpeed, y, LAYER_COLLISION)) {	
	while(!tile_meeting(x+sign(hSpeed), y, LAYER_COLLISION)) {
		x += sign(hSpeed);	
	}
	hSpeed = 0;
	againstWall = true;
}
x += hSpeed;

// Vertical collision
vSpeed += grav;
onGround = false;
if (tile_meeting(x, y + vSpeed, LAYER_COLLISION)) {	
	while(!tile_meeting(x, y+sign(vSpeed), LAYER_COLLISION)) {
		y += sign(vSpeed);	
	}
	vSpeed = 0;
	onGround = true;
}
y += vSpeed;
