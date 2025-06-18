extends Node

var levels: Array = [
	"res://levels/level1.tscn"
]
var current_level

func _ready():
	current_level = load(levels[0]).instantiate()
	add_child(current_level)
