extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

<<<<<<< HEAD
<<<<<<< Updated upstream
const XACCELERATION = 10
=======
const ACCELX = 20.0
const TERMINALVX = 300
>>>>>>> Stashed changes
=======
const XACCELERATION = 1
>>>>>>> dcb13a4f49a597941815740b3f6cb9c5d22cfc31
const JUMP_VELOCITY = -600
const JUMP_PAD = -1800
const XTERMINAL_SPEED = 300

<<<<<<< HEAD
<<<<<<< Updated upstream
var XSPEED
=======
var XSPEED = 0
>>>>>>> dcb13a4f49a597941815740b3f6cb9c5d22cfc31

=======
>>>>>>> Stashed changes
func _physics_process(delta: float) -> void:
		# Animation
	if velocity.x > 1 or velocity.x < -1:
		animated_sprite_2d.animation = "walk"
	else:
		animated_sprite_2d.animation = "idle"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jump"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
<<<<<<< Updated upstream
		if XSPEED < XTERMINAL_SPEED:
			XSPEED += XACCELERATION
		velocity.x = direction * XSPEED
	else:
		XSPEED = 0
		velocity.x = move_toward(velocity.x, 0, XSPEED)
=======
		if is_on_floor():
			velocity.x = move_toward(velocity.x, TERMINALVX*direction, ACCELX)
		else:
			velocity.x = move_toward(velocity.x, TERMINALVX*direction, ACCELX-10)
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELX)
>>>>>>> Stashed changes

	move_and_slide()
	
	if direction == 1:
		animated_sprite_2d.flip_h = false
	elif direction == -1:
		animated_sprite_2d.flip_h = true
