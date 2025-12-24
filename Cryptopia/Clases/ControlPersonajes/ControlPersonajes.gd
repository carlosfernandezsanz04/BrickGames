class_name ControlPersonajes extends Node

func _ready() -> void:
	for child : Personaje in get_children():
		child.init()
		
func _process(delta: float) -> void:
	for child : Personaje in get_children():
		child.process_frame(delta)
		
func _physics_process(delta: float) -> void:
	for child : Personaje in get_children():
		child.process_physics(delta)

func _input(event: InputEvent) -> void:
	for child : Personaje in get_children():
		child.process_input(event)
