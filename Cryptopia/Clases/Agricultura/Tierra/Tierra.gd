class_name TierraCultivable extends StaticBody3D

#Recurso que define que cultivo esta actualmente en la tierra
@export var cultivo : CultivoRes = null
#Variable para controlar si un recurso es cultivable o no
var arado : bool = false
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
	mat.albedo_color = Color(0.447, 0.286, 0.179, 1.0)
	meshinstance.set_surface_override_material(0,mat)
	
	collisionshape.add_child(meshinstance)
	
	
#Funcion que se llama para arar el terreno y asi poder cultivar
func arar() -> void:
	if cultivo:
		print("Ya hay un cultivo, esperar a recogerlo para arar de nuevo")
	elif arado:
		print("La tierra ya está arada")
	else:
		arado = true
		mat.albedo_color = Color(0.358, 0.251, 0.094, 1.0)
		print("Tierrra arada correctamente")
	

#Una vez arado el terreno se llama a cultivar para asignarle un recurso cultivo y llamar a su funcion plantar
func cultivar(c : CultivoRes) -> void:
	if arado:
		if not cultivo:
			print("Se ha cultivado: ", c.nombre)
			cultivo = c.duplicate()
			cultivo.plantar(self)
		else:
			print("Ya se ha cultivado: ", cultivo.nombre)
	else:
		print("La tierra todavía no está arada")
#Una vez el cultivo llega a su fase final, al llamar a recolectar, llamamos la funcion recoger del cultivo, 
#Se reasigna arado a false para indicar que el terreno no es cultivable hasta el proximo arado
#Se pone cultivo a null para indicar que no hay ningun cultivo
func recolectar() -> void:
	if cultivo.faseactual == cultivo.maxfases:
		cultivo.recoger()
		cultivo = null
		print("Cultivo actual: ", cultivo)
		arado = false
		mat.albedo_color = Color(0.447, 0.286, 0.179, 1.0)
	else:
		print("El cultivo no esta listo para su recogida")
