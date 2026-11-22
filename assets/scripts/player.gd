extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const JUMP_VELOCITY = 600.0
const JUMP_PAD = -1800.0

const XTERMINAL_SPEED = 300.0
const XACCELERATION = 40.0

# Input buffer timer
var i_b_timer

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
	var jump_soon_bool = true

	if Input.is_action_just_pressed("jump"):
		i_b_timer = 50
	elif i_b_timer == null:
		i_b_timer = 0
		
	if i_b_timer > 0:
		jump_soon_bool = true
		i_b_timer -= 1
	else:
		jump_soon_bool =  false
		i_b_timer = 0
		
	if jump_soon_bool and is_on_floor():
		velocity.y = JUMP_VELOCITY
		i_b_timer = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		if is_on_floor():
			velocity.x = move_toward(velocity.x, XTERMINAL_SPEED*direction, XACCELERATION*2)
		else:
			velocity.x = move_toward(velocity.x, XTERMINAL_SPEED*direction, XACCELERATION/3)

	if is_on_floor():
		velocity.x = move_toward(velocity.x, 0, XACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, XACCELERATION*0.1)
	
	move_and_slide()
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
