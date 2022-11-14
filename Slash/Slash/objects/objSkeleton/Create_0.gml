event_inherited();

// Movemenet
grav = 0.4;
moveSpeed = 2;
hSpeed = 0;
vSpeed = 0;
onGround = false;
airSpeedModifier = 2;
againstWall = false;

// Combat
hitPointsMax = 20;
hitPoints = hitPointsMax;
cooldownMax = 140;
cooldownMin = 100;
cooldown = cooldownMax;
aggroRange = 300;
attackRange = 10;
attackDamage = 2;
hitList = [];

// Set default state
state = stateSkeletonIdle;