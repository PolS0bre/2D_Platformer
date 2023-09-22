extends Area2D

var bob_height: float = 5.0
var bob_speed: float = 5.0
@onready var start_y: float = global_position.y
var time: float = 0.0
@export var points_value: int = 25

func _process(delta):
	time += delta
	var d = (sin(time * bob_speed) + 1) / 2 # Ona transversal de 0 a 1
	global_position.y = start_y + (d * bob_height)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(points_value)
		queue_free()
