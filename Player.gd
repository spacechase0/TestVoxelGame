extends "res://Living.gd"

const MouseKeyboardInputProxy = preload("res://MouseKeyboardInputProxy.gd")

func _ready() -> void:
	inputProxy = MouseKeyboardInputProxy.new()
	add_child(inputProxy)

func do_camera() -> void:
	if inputProxy == null:
		return
		
	var cam : Spatial = $Camera as Spatial
	
	var camMovement : Vector2 = inputProxy.get_camera_movement()
	cam.rotate_x(deg2rad(camMovement.x))
	rotate_y(deg2rad(camMovement.y))
	
	cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, +90)
