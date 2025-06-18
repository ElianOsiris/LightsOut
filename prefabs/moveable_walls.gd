extends Node2D

@export var locations: Array[Vector2] = []
@export var loop: bool = true
@export var speed: float = 2

var index: int = 1
var target_pos: Vector2

func _ready():
	if locations.size() > 1:
		position = locations[0]
		index = 1
		target_pos = locations[index]
	else:
		loop = false
		index = locations.size()

func _process_physics(delta: float):
	if index == locations.size():
		if loop:
			index = 0
		else:
			return
	
	position = position.lerp(target_pos, clamp(speed * delta, 0.0, 1.0))
	if position.distance_to(target_pos) <= 0.5:
		position = locations[index]
		index += 1
		if index < locations.size():
			target_pos = locations[index]
