extends Node2D

var no_rays : float = 100.
var fov : float = 200.
var target_pos : Vector2i = Vector2(0,1000)
var rays : Array[RayCast2D]
var resolution : Vector2i = Vector2i(1152,648)

func create_rays() -> void:
	var angle_increment = fov / no_rays
	for x in range(no_rays):
		#print("created ray %d" % x)
		var ray = RayCast2D.new()
		ray.name = "Ray%d" % x
		ray.target_position = target_pos
		#print(angle_increment * x)
		#ray.rotation = deg_to_rad(angle_increment * x)
		ray.position.x += (angle_increment * x) - fov/2
		rays.append(ray)
		add_child(ray)
		
func _ready() -> void:
	create_rays()
