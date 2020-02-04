extends Spatial

const MyVoxelStream = preload("res://MyVoxelStream.gd")

var terrain : VoxelTerrain = VoxelTerrain.new()

func _ready() -> void:
	terrain.name = "Terrain"
	terrain.voxel_library = VoxelLibrary.new()
	terrain.stream = MyVoxelStream.new()
	terrain.view_distance = 128
	terrain.viewer_path = "/root/Spatial/Player"
	add_child(terrain)
