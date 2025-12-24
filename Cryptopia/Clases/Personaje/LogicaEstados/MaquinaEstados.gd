class_name MaquinaEstados extends Node

@export var estadoInicial : Estado

var padre : Personaje
var interfazMovimiento : APIMovimiento
var estadoActual : Estado

func init(p : Personaje,i : APIMovimiento) -> void:
	padre = p
	interfazMovimiento = i
	for child : Estado in get_children():
		child.init(p,i)
	estadoActual = estadoInicial
	estadoActual.enter()
	
func process_frame(delta: float) -> void:
	var nuevoEstado = estadoActual.process_frame(delta)
	if nuevoEstado:
		changeState(nuevoEstado)

func process_physics(delta:float) -> void:
	var nuevoEstado = estadoActual.process_physics(delta)
	if nuevoEstado:
		changeState(nuevoEstado)

func process_input(event: InputEvent) -> void:
	var nuevoEstado = estadoActual.process_input(event)
	if nuevoEstado:
		changeState(nuevoEstado)

func changeState(s : Estado) -> void:
	estadoActual.exit()
	estadoActual = s
	estadoActual.enter()
