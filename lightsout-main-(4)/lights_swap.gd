extends Node2D

@onready var swap_area: Area2D = $LightSwitchArea


func _on_light_switch_area_body_entered(body):
	if body.name == "Player" or body.name == "Bomb":
		get_tree().call_group("light_areas", "invert_light_values")
