extends Node2D

@onready var swap_area: Area2D = $LightSwitchArea
@onready var lights = $"../Light"


func _on_light_switch_area_body_entered(body):
	if body.name == "Player": #add bomb later
		lights.invert_light_values("Lights1", "Lights2")
