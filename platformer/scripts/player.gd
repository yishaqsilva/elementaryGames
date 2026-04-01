extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

var grav = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")

	if direction > 0:
		sprite.flip_h = false;
	elif direction < 0:
		sprite.flip_h = true;
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if not is_on_floor():
		sprite.play("roll")
	elif velocity.x != 0:
		sprite.play("run")
	else:
		sprite.play("idle")

	move_and_slide()
