extends CharacterBody2D

@export var speed: float = 200.0
var score: int = 0

func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		 Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	velocity = input_vector * speed
	move_and_slide()
	# Clamp to screen bounds
	var screen_size = get_viewport_rect().size
	position.x = clamp(position.x, 0, screen_size.x-40)
	position.y = clamp(position.y, 0, screen_size.y-40)

func add_score(points: int):
	score += points
	print("Score:", score)

func _on_light_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.has_method("add_score"):
		body.add_score(1)  # or any value you like
