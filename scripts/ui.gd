extends Control
@onready var fps: RichTextLabel = $fps
func _process(delta: float) -> void:
	fps.text = str(Engine.get_frames_per_second())
