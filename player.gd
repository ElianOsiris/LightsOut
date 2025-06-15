extends CharacterBody2D

@onready var lights: Node2D = $"../Light"
@onready var player_area: Area2D = $PlayerGrabArea

@export var speed: float = 200.0
var lives: int = 3
var is_carry: bool = false
var carry_item: Node2D

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
	
	if Input.is_mouse_button_pressed(1):
		for area in player_area.get_overlapping_areas():
			var parent = area.get_parent()
			if parent.name == "Bomb":
				if not is_carry:
					carry_item = area
					is_carry = true
				parent.position = Vector2(position.x, position.y)
	else:
		if is_carry:
			drop_bomb()

func add_score(points: int):
	lives -= points
	if lives > 0:
		print("Lives: ", lives)
	else:
		print("You have been caught!")

func drop_bomb():
	if is_instance_valid(carry_item):
		for area in player_area.get_overlapping_areas():
			if area.get_parent() is BombCheckpoint:
				var bomb_checkpoint: BombCheckpoint = area.get_parent()
				if not bomb_checkpoint.already_used:
					bomb_checkpoint.handle_bomb(carry_item)


func detect_player(body):
	if body.name == "Player":
		body.add_score(1)
