extends Node2D

var player;
var speed = 0.05;
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if player != null:
		position += ((player.position - position) * speed)
		sprite.play("run")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	player = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	player = null
