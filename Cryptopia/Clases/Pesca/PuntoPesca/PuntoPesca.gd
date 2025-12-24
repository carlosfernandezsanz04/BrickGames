class_name PuntoPesca extends StaticBody3D

@export var peces : Array[PezResource]
var pez : bool = false
#Nodos para visibilizar el terreno en pruebas (La estructura puede cambiar en un futuro)
var collisionshape : CollisionShape3D = null
var meshinstance : MeshInstance3D = null
var mat : StandardMaterial3D = null

#Ready se usa para crear el arbol de nodos en ejecucion
func _ready() -> void:
	collisionshape = CollisionShape3D.new()
	collisionshape.shape = BoxShape3D.new()
	add_child(collisionshape)
	meshinstance = MeshInstance3D.new()
	meshinstance.mesh = BoxMesh.new()
	mat = StandardMaterial3D.new()
	mat.albedo_color = Color(0.083, 0.124, 0.439, 1.0)
	meshinstance.set_surface_override_material(0,mat)
	collisionshape.add_child(meshinstance)

func pescar() -> void:
	if peces.is_empty():
		print("No hay peces todavia")
	else:
		var i = randi_range(0,peces.size()-1)
		var pez = peces.get(i)
		peces.remove_at(i)
		print("Pescado un ",pez.nombre," de ",pez.peso," kilos")
		if peces.is_empty():
			print("Todos los peces pescados")
			mat.albedo_color = Color(0.083, 0.124, 0.439, 1.0)
		
func aniadirpez(p : PezResource) -> void:
	if peces.is_empty():
		peces.append(p)
		mat.albedo_color = Color(0.319, 0.449, 0.658, 1.0)
	else:
		peces.append(p)
	print("Aniadido un ",p.nombre," de ",p.peso," kilos")
