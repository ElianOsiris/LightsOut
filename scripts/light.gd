extends Area2D

@onready var player = self.get_parent().get_parent().get_child(0)

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

func _on_body_entered(body):
	if body.name == "Player":
		for child in self.get_children():
			if child is ColorRect:
				if child.color.r > 0.6 and child.color.g > 0.6:
					player.detect_player(body)
