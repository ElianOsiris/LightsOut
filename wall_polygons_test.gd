extends StaticBody2D

@onready var poly_2d = $Polygon2D
@onready var collide_poly_2d = $CollisionPolygon2D

func _ready():
	collide_poly_2d.polygon = poly_2d.polygon
	
