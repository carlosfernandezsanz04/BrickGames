class_name APIMovimiento extends Node

@export var gravedad : float
@export var velocidad : float
@export var vSalto : float

 
func piesquietos(p : Personaje) -> void:
	p.velocity.x = 0
	p.velocity.z = 0
	p.move_and_slide()

func move(p : Personaje,dir : Vector2) -> void:
	var ndir : Vector3 = Vector3(dir.normalized().x * velocidad,p.velocity.y,dir.normalized().y * velocidad)
	p.velocity = ndir
	p.move_and_slide()

func fall(p : Personaje) -> void:
	p.velocity.y = -gravedad
	p.move_and_slide()
	
func jump(p : Personaje) -> void:
	p.velocity.y = -vSalto
	p.move_and_slide()
