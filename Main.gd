extends Spatial

const MyVoxelStream = preload("res://MyVoxelStream.gd")

var terrain : VoxelTerrain = null

func _ready() -> void:
	terrain = ($Terrain as VoxelTerrain)
	terrain.stream = MyVoxelStream.new()
