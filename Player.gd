extends "res://Living.gd"

const MouseKeyboardInputProxy = preload("res://MouseKeyboardInputProxy.gd")

var cursor : RayCast = null
var selVoxelDisplay : ImmediateGeometry = null
var lastHit : bool = false

func _ready() -> void:
	inputProxy = MouseKeyboardInputProxy.new()
	add_child(inputProxy)
	
	cursor = $Camera/Cursor as RayCast
	selVoxelDisplay = $SelectedVoxelDraw
	
	selVoxelDisplay.set_as_toplevel(true)

func _process(delta) -> void:
	if cursor.get_collider() is VoxelTerrain:
		var terrain := cursor.get_collider() as VoxelTerrain
		var pos := cursor.get_collision_point()
		var ipos := Vector3(int(pos.x), int(pos.y), int(pos.z))
		
		selVoxelDisplay.visible = true
		selVoxelDisplay.global_transform = Transform().translated(ipos / 2)
		
		if inputProxy.is_act_hit_pressed() and !lastHit:
			terrain.get_voxel_tool().set_voxel(ipos, 0)
	else:
		selVoxelDisplay.visible = false
	
	lastHit = inputProxy.is_act_hit_pressed()

func do_camera() -> void:
	if inputProxy == null:
		return
		
	var cam : Spatial = $Camera as Spatial
	
	var camMovement : Vector2 = inputProxy.get_camera_movement()
	cam.rotate_x(deg2rad(camMovement.x))
	rotate_y(deg2rad(camMovement.y))
	
	cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, +90)
