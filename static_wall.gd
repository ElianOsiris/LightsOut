extends StaticBody2D

@onready var poly_2d = $Polygon2D
@onready var collide_poly_2d = $CollisionPolygon2D
@onready var occluder_poly_2d = $LightOccluder2D

func _ready():
	collide_poly_2d.polygon = poly_2d.polygon
	occluder_poly_2d.occluder.polygon = poly_2d.polygon
