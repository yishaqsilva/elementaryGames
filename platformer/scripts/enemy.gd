extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $Killzone/RayCastRight
@onready var ray_cast_left: RayCast2D = $Killzone/RayCastLeft
	
func _process(delta: float):
	if ray_cast_left.is_colliding():
		animated_sprite_2d.flip_h = true
	elif ray_cast_right.is_colliding():
		animated_sprite_2d.flip_h = false
