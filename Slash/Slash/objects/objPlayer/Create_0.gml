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

// Attacking
attacks = 0;
attackDamage = 1;
onAttack2 = false;
onAttack3 = false;
onAttackAir = false;
count = 0;

// Health
hitPointsMax = 10;
hitPoints = hitPointsMax;

// Booleans
againstWall = false;
onGround = false;
jumping = false;
canJump = false;
finishedAttackSequence = false;

// Arrays
hitList = [];
damageInbox = [];

// Initialize

state = stateIdle;




