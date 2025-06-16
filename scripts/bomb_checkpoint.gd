extends Node

class_name BombCheckpoint

@onready var already_used: bool = false

func handle_bomb(bomb: Node2D):
	print("Yeah it work !")
	if not already_used:
		already_used = true
		bomb.queue_free()
