extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const JUMP_VELOCITY = -600.0
const JUMP_PAD = -1800.0

const XTERMINAL_SPEED = 300.0
const XACCELERATION = 20.0


func _physics_process(delta: float) -> void:
		# Animation
	if velocity.x != 0 and velocity.y == 0:
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
	var direction = Input.get_axis("left", "right")
	if direction and is_on_floor():
		if is_on_floor():
			velocity.x = move_toward(velocity.x, XTERMINAL_SPEED*direction, XACCELERATION)
		else:
			velocity.x = move_toward(velocity.x, XTERMINAL_SPEED*direction, XACCELERATION/3)
	else:
		if is_on_floor():
			# velocity.x = move_toward(velocity.x, 0, XACCELERATION*2)
			velocity.x = move_toward(velocity.x, 0, XACCELERATION*2)

	move_and_slide()
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
