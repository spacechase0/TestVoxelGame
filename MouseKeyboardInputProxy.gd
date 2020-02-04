extends "res://InputProxy.gd"

export var CAM_SENSITIVITY : float = 0.1

# Implement the parent stuff
func is_move_forward_pressed() -> bool:
	return Input.is_action_pressed("MOVE_FORWARD")

func is_move_backward_pressed() -> bool:
	return Input.is_action_pressed("MOVE_BACKWARD")

func is_move_left_pressed() -> bool:
	return Input.is_action_pressed("MOVE_LEFT")

func is_move_right_pressed() -> bool:
	return Input.is_action_pressed("MOVE_RIGHT")

func is_move_jump_pressed() -> bool:
	return Input.is_action_pressed("MOVE_JUMP")

# New stuff
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(evt : InputEvent) -> void:
	if evt is InputEventMouseMotion:
		var mouseEvt : InputEventMouseMotion = evt as InputEventMouseMotion
		if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
			return
		
		lastCameraInput.x = mouseEvt.relative.y * CAM_SENSITIVITY * -1
		lastCameraInput.y = mouseEvt.relative.x * CAM_SENSITIVITY * -1
