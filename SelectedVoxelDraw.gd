tool
extends ImmediateGeometry

func _process(delta) -> void:
	clear()
	
	begin(Mesh.PRIMITIVE_LINES)
	
	add_vertex(transform.origin + Vector3(-0.05, -0.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05, -0.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05, -0.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05, -0.05,  1.05))
	add_vertex(transform.origin + Vector3( 1.05, -0.05,  1.05))
	add_vertex(transform.origin + Vector3(-0.05, -0.05,  1.05))
	add_vertex(transform.origin + Vector3(-0.05, -0.05,  1.05))
	add_vertex(transform.origin + Vector3(-0.05, -0.05, -0.05))
	
	add_vertex(transform.origin + Vector3(-0.05,  1.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05,  1.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05,  1.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05,  1.05,  1.05))
	add_vertex(transform.origin + Vector3( 1.05,  1.05,  1.05))
	add_vertex(transform.origin + Vector3(-0.05,  1.05,  1.05))
	add_vertex(transform.origin + Vector3(-0.05,  1.05,  1.05))
	add_vertex(transform.origin + Vector3(-0.05,  1.05, -0.05))
	
	add_vertex(transform.origin + Vector3(-0.05, -0.05, -0.05))
	add_vertex(transform.origin + Vector3(-0.05,  1.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05, -0.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05,  1.05, -0.05))
	add_vertex(transform.origin + Vector3( 1.05, -0.05,  1.05))
	add_vertex(transform.origin + Vector3( 1.05,  1.05,  1.05))
	add_vertex(transform.origin + Vector3(-0.05, -0.05,  1.05))
	add_vertex(transform.origin + Vector3(-0.05,  1.05,  1.05))
	
	end()
