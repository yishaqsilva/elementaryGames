extends CharacterBody2D

@export_category("Values")
const SPEED = 300.0

@export_category("Values")
const ACTION_TIME: float = 1.0

var x_dir: int
var y_dir: int

var status: int = 0
var attacking: int = 0x01
var guarding: int = 0x02

func add_status(action):
	status |= action
	
func remove_status(action):
	status &= ~action
	
func is_attacking() -> bool:
	return status & attacking != 0
	
func is_guarding() -> bool:
	return status & guarding != 0

func add_status_temp(action):
	status |= action
	await get_tree().create_timer(ACTION_TIME).timeout
	status &= ~action

func _unhandled_input(event: InputEvent) -> void:
   
	if Input.is_action_pressed("player.attack"):
		add_status_temp(attacking)
	elif Input.is_action_just_pressed("player.guard"):
		add_status_temp(guarding)

func _physics_process(delta: float) -> void:
	x_dir = Input.get_axis("player.move.left", "player.move.right")
	y_dir = Input.get_axis("player.move.up", "player.move.down")
	
	if status == 0:
		set_velocity(Vector2(x_dir, y_dir).normalized() * SPEED)
	else:
		set_velocity(Vector2.ZERO)
		
	move_and_slide()
