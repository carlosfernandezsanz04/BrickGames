class_name Estado extends Node

@export var nombre : String

var padre : Personaje
var interfazMovimiento : APIMovimiento

func init(p : Personaje, i : APIMovimiento) -> void:
	padre = p
	interfazMovimiento = i

func enter() -> void:
	pass

func process_frame(delta : float) -> Estado:
	return null

func process_physics(delta : float) -> Estado:
	return null

func process_input(event : InputEvent) -> Estado:
	return null
	
func exit() -> void:
	pass
