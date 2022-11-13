// Constants
grav = 0.4;
moveSpeed = 8;
jumpStrength = -12;
airSpeedModifier = 2;
airAttacksMax = 1;

// Movement
vSpeed = 0;
hSpeed = 0;
dir = 0;

// Booleans
againstWall = false;
onGround = false;
jumping = false;
canJump = false;
finishedAttackSequence = false;

// Initialize
state = stateIdle;
attacks = 0;

