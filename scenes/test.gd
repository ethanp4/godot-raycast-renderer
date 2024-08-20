@tool
extends Node2D

var image : Image = Image.new()
@export var tex : ImageTexture
func _ready() -> void:
	#image.load_from_file("/home/ethan/dev/godot/raycast-3d/scenes/line.bmp")
	image = image.create(100,100,false,Image.FORMAT_RGB8)
	#print(image.get_size())
	#$".".draw_line(Vector2(100,100), Vector2(200,200), Color(100,100,0), -1, false)
	image.set_pixelv(Vector2i(4, 4), Color(255,255,255))
	tex = ImageTexture.create_from_image(image)
	pass
	
func _draw() -> void:
	#$".".draw_line(Vector2(100,100), Vector2(200,200), Color(100,100,0), 5, false)
	pass
	
	
#func draw_line(width, height):
	#var res = image.get_size()
	#var start = res.y / height / 2
	#print(start)
	
	
	
