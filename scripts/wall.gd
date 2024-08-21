extends StaticBody2D

@export var colors : Array[Color] = [Color.FUCHSIA, Color.ALICE_BLUE, Color.AQUAMARINE, Color.CRIMSON, Color.CORAL, Color.BLACK, Color.BISQUE]

func _ready() -> void:
	$".".set_meta("Color", colors.pick_random())
