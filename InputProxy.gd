extends Node

var lastCameraInput : Vector2 = Vector2()

func is_move_forward_pressed() -> bool:
	return false

func is_move_backward_pressed() -> bool:
	return false

func is_move_left_pressed() -> bool:
	return false

func is_move_right_pressed() -> bool:
	return false

func is_move_jump_pressed() -> bool:
	return false
	
func is_act_hit_pressed() -> bool:
	return false

func is_act_interact_pressed() -> bool:
	return false

func get_camera_movement() -> Vector2:
	var ret = lastCameraInput
	lastCameraInput = Vector2()
	return ret
