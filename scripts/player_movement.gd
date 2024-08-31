extends CharacterBody2D

var walk_speed = 300.0
var run_speed = 600.0
var speed 

var mouse_sens : float = 0.001

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.is_pressed():
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseMotion:
		var rel = event.relative.x
		$".".rotation -= rel * mouse_sens
		pass

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("left", "right", "backward", "forward").rotated($".".rotation)
	if Input.is_action_pressed("sprint"):
		speed = run_speed
	else:
		speed = walk_speed
	if input_dir:
		velocity.x = speed * input_dir.x
		velocity.y = speed * input_dir.y
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
