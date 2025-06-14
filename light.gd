extends Area2D

@export var points: int = 0
@export var one_time: bool = true
var already_used = false

func _on_score_zone_body_entered(body: Node2D):
	if  one_time and already_used:
		return
	if body.name == "Player" and body.has_method("add_score"):
		body.add_score(points)
		print("Player entered the light!")
		if one_time:
			already_used = true
