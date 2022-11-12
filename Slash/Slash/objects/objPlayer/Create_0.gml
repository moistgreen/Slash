// Constants

tilemap = layer_tilemap_get_id("Collision")

grav = 0.4;
moveSpeed = 8;
jumpStrength = -12;
airSpeedModifier = 2;

// Movement
vSpeed = 0;
hSpeed = 0;
dir = 0;

// Booleans
againstWall = false;
onGround = false;
jumping = false;
canJump = false;

// Initialize
state = stateIdle;

