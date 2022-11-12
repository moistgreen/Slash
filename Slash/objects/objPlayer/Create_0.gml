// Constants

tilemap = layer_tilemap_get_id("Collision")

grav = 0.2;
maxSpeed = 8;
jumpStrength = 4;
jumpTime = 12;
airSpeedModifier = 2;

// Movement
vSpeed = 0;
hSpeed = 0;
dir = 0;

// Booleans
againstWall = false;
onGround = false;
jumping = false;

// Initialize
state = stateFree