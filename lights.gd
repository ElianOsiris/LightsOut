@icon("res://pixil-frame-3 (1).png")
extends Node2D

@onready var light_colors: Array

@export var all_lights: Array

func _ready():
	all_lights = get_children(false)
	find_color_rects()
	print(light_colors)

func invert_light_values(group1, group2):
	for rect in light_colors:
		var current_color = rect.color
		
		rect.color = Color(absf(current_color.r - 1), 
		absf(current_color.g - 1), 
		absf(current_color.b - 1))

func find_color_rects():
	for light in all_lights:
		var children = light.get_children()
		for child in children:
			if child is ColorRect:
				light_colors.append(child)
