extends StaticBody2D

@onready var poly_2d = $Polygon2D
@onready var collide_poly_2d = $CollisionPolygon2D
@onready var occluder_2d = $LightOccluder2D

func _ready():
	# Copy the polygon shape
	var polygon = poly_2d.polygon

	# Apply to collision shape
	collide_poly_2d.polygon = polygon
	collide_poly_2d.position = Vector2.ZERO

	# Create occluder polygon resource
	var occluder = OccluderPolygon2D.new()
	occluder.polygon = polygon
	occluder_2d.occluder = occluder
	occluder_2d.position = Vector2.ZERO
