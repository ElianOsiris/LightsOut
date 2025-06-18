extends Node2D

@onready var point_lights: Array
var current_energy

func _ready():
	GlobalReferences.lights = self
	Utils.find_node_in_children(self.get_children(), point_lights, "PointLight2D", true)
	add_to_group("light_areas")


func invert_light_values():
	for light in point_lights:
		current_energy = light.energy
		light.energy = Utils.invert_number(current_energy, 1, 3, true)
		print("updating file")
