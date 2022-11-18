// Constants
grav = 0.4;
moveSpeed = 8;
jumpStrength = -12;
airSpeedModifier = 2;
airAttacksMax = 1;

// Movement
rollSpeed = 12;
vSpeed = 0;
hSpeed = 0;
dir = 1;

// Attacking
attacks = 0;
attackDamage = 1;
onAttack2 = false;
onAttack3 = false;
onAttackAir = false;

// Health
hitPointsMax = 12;
hitPoints = hitPointsMax;

// Booleans
againstWall = false;
onGround = false;
jumping = false;
canJump = false;
finishedAttack = false;

// Arrays
hitList = [];
damageInbox = [];

// Initialize
toggleInstructions = true;

state = stateIdle;




