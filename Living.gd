extends KinematicBody

const InputProxy = preload("res://InputProxy.gd")

export var ACCEL = 5
export var DEACCEL = 10
export var MAX_SPEED : float = 10
export var GRAVITY : float = 20
export var JUMP : float = 7.5

var inputProxy : InputProxy = null

var velocity : Vector3 = Vector3()

func _physics_process(delta : float) -> void:
	do_camera()
	
	var forward : Vector3 = get_transform().basis.z.normalized()
	forward = Plane(Vector3(0, 1, 0), 0).project(forward)
	var right : Vector3 = get_transform().basis.x.normalized()
	var movement : Vector3 = Vector3()
	
	if inputProxy != null:
		if inputProxy.is_move_forward_pressed():
			movement -= forward
		if inputProxy.is_move_backward_pressed():
			movement += forward
		if inputProxy.is_move_left_pressed():
			movement -= right
		if inputProxy.is_move_right_pressed():
			movement += right
	
	movement = movement.normalized()
	
	velocity.y -= GRAVITY * delta
	
	if is_on_floor() && inputProxy != null && inputProxy.is_move_jump_pressed():
		velocity.y = JUMP
	
	var hvel : Vector3 = velocity
	hvel.y = 0
	var target = movement * MAX_SPEED
	
	var accel : float = 0
	if movement.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL
	
	hvel = hvel.linear_interpolate(target, accel * delta)
	velocity = Vector3(hvel.x, velocity.y, hvel.z)
	
	velocity = move_and_slide_with_snap( velocity, Vector3( 0, 0.01, 0 ), Vector3( 0, 1, 0 ) )
	
func do_camera() -> void:
	if inputProxy == null:
		return
	
	var camMovement : Vector2 = inputProxy.get_camera_movement()
	rotate_y(deg2rad(camMovement.x))
