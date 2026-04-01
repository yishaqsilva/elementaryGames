extends AnimatedSprite2D

@onready var player: CharacterBody2D = $".."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.x_dir < 0:
		flip_h = true
	elif player.x_dir > 0:
		flip_h = false
		
	if player.is_attacking():
		play("attack1")
	elif player.is_guarding():
		play("guard")	
	elif player.x_dir == 0 && player.y_dir == 0:
		play("idle")
	else:
		play("run")
