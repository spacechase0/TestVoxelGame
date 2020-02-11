extends "res://Living.gd"

const MouseKeyboardInputProxy = preload("res://MouseKeyboardInputProxy.gd")

var cursor : RayCast = null
var lastHit : bool = false

func _ready() -> void:
	inputProxy = MouseKeyboardInputProxy.new()
	add_child(inputProxy)
	
	cursor = $Camera/Cursor as RayCast

func _process(delta) -> void:
	if inputProxy.is_act_hit_pressed() and !lastHit:
		if cursor.get_collider() is VoxelTerrain:
			var terrain := cursor.get_collider() as VoxelTerrain
			var pos := cursor.get_collision_point()
			terrain.get_voxel_tool().set_voxel(Vector3(int(pos.x), int(pos.y), int(pos.z)), 0)
			print(cursor.get_collider())
			print(cursor.get_collision_point())
	lastHit = inputProxy.is_act_hit_pressed()

func do_camera() -> void:
	if inputProxy == null:
		return
		
	var cam : Spatial = $Camera as Spatial
	
	var camMovement : Vector2 = inputProxy.get_camera_movement()
	cam.rotate_x(deg2rad(camMovement.x))
	rotate_y(deg2rad(camMovement.y))
	
	cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, +90)
