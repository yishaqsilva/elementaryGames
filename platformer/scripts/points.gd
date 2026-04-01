extends Node

var score = 0
@onready var label: Label = $Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func incremement_score() -> void:
	score +=1	
	label.text = str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
