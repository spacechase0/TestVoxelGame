extends VoxelStream

var voxel_channel:int	= 0
var amplitude:float = 10.0
var period:Vector2 = Vector2(1/5.0, 1/5.0)

	
func emerge_block(out_buffer:VoxelBuffer, origin:Vector3, lod:int):
	if lod != 0: 
		return

	var size = out_buffer.get_size()
	for rz in range(0, size.z):
		for rx in range(0, size.x):
			var x:float = origin.x + rx
			var z:float = origin.z + rz

			var h:int = amplitude * (cos(x * period.x) + sin(z * period.y)) # Y is correct
			var rh:int = h - origin.y
			if rh > size.y:
				rh = size.y

			for ry in range(0, rh):
				out_buffer.set_voxel(2 if ry == rh else 1, rx, ry, rz, voxel_channel);
