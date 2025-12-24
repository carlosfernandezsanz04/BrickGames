class_name Jugador extends Personaje

@export var maquinaEstados : MaquinaEstados
@export var interfazMovimiento : APIMovimiento

func init() -> void:
	maquinaEstados.init(self,interfazMovimiento)

func process_frame(delta : float) -> void:
	maquinaEstados.process_frame(delta)

func process_physics(delta : float) -> void:
	maquinaEstados.process_physics(delta)
	
func process_input(event : InputEvent) -> void:
	maquinaEstados.process_input(event)
