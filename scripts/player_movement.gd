extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = 4.5

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
	if input_dir:
		velocity.x = SPEED * input_dir.x
		velocity.y = SPEED * input_dir.y
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
