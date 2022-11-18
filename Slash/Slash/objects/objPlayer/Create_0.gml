// Updates key inputs
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_space_pressed = keyboard_check_pressed(vk_space);
key_space_held = keyboard_check(vk_space);
key_shift = keyboard_check_pressed(vk_shift);
key_control_held = keyboard_check(vk_control);
mouse_left = mouse_check_button_pressed(mb_left);
mouse_right = mouse_check_button_pressed(mb_right);
dir = key_right - key_left;

// Constants
grav = 0.4;
moveSpeed = 8;
jumpStrength = -9;
airSpeedModifier = 2;
airAttacksMax = 1;

// Movement
rollSpeed = 12;
vSpeed = 0;
hSpeed = 0;
hSpeedMax = 8;
accel = 0.05;
dir = 1;
faceDir = 1;
startY = y;

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
toggleInstructions = false;

// Add states
behavior = use_truestate();

behavior.addState(State.idle, stateIdle, "Idle");
behavior.addState(State.walk, stateWalk, "Walk");
behavior.addState(State.jump, stateJump, "Jump");
behavior.addState(State.roll, stateRoll, "Roll");



