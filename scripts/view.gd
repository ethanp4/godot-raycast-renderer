extends Node2D

@onready var rays: Node2D = $"../Player/Rays"

func _draw() -> void:
	var line_width = rays.resolution.x / rays.no_rays
	for x in range(rays.no_rays):
		var color = Color(0,0,0)
		var line_x = lerpf(0, rays.resolution.x, (x*line_width)/rays.resolution.x)
		var ray :RayCast2D = rays.rays[x]
		var dist = 0
		var height = 0
		if ray.is_colliding():
			color = ray.get_collider().get_meta("Color")
			dist = rays.global_position.distance_to(ray.get_collision_point())
			
			#the problem area
			var t = dist / rays.target_pos.y
			t = sqrt(dist / 2000)
			#print(ray.get_collider())
			
			height = lerpf(rays.resolution.y, 0, t)
			height = clamp(height, 10, rays.resolution.y)
			#var A = rays.resolution.y
			#var B = 0
			#var y = t
			#height = A+(B-A)*y
			#height = A+(B-A)*log(y+0.11)-619
			if x == rays.no_rays / 2:
				$"../Control/RichTextLabel".text = "stats for ray %d:\n%s -> height: %s" % [x, t, height]
				color = Color(0,255,0)
		var line_y = (rays.resolution.y - height)/2
		
		#$"../Control/RichTextLabel".text = "height: %s, line_y: %s" % [height, line_y]
		#var line_y = rays.resolution.y / 2
		if color != null: # if color is null then just dont draw a line
			draw_line(Vector2(line_x, line_y), Vector2(line_x, line_y+height), color, line_width, false)
		
func _process(delta: float) -> void:
	$".".queue_redraw()
