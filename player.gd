extends CharacterBody2D

@onready var lights = $"../Light"

@export var speed: float = 200.0
var lives: int = 3

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
	lives -= points
	if lives > 0:
		print("Lives: ", lives)
	else:
		print("You have been caught!")

func detect_player(body):
	if body.name == "Player":
		body.add_score(1)
