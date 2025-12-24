class_name CultivoRes extends Resource

#Maximo de fases de crecimiento del cultivo y su nombre
@export var maxfases : int
@export var nombre : String
@export var colorCultivado : Color
@export var colorRecogida : Color

#Variable que guarda referencia al terreno asignado
var terreno : TierraCultivable

#Variable para llevar cuenta de la fase actual del cultivo
var faseactual : int

#funcion llamada por el terreno cuando se le ordena cultivar
func plantar(t : TierraCultivable) -> void:
	terreno = t
	t.mat.albedo_color = colorCultivado
	faseactual = 1
	comenzarCrecimiento()

#Funcion para controlar el comienzo del crecimiento de la planta, quizas se usa para mostrar alguna animacion 
func comenzarCrecimiento() -> void:
	pass

#Funcion llamada desde el terreno cuando se le ordena recolectar el cultivo
func recoger() -> void:
	print("Cultivo recogido")

#Funcion para aumentar en 1 la fase del cultivo, quizas llamada por el terreno cultivado cada X tiempo
func forzarCrecimientoFase() -> void:
	if faseactual < maxfases:
		faseactual += 1
	if faseactual == maxfases:
		terreno.mat.albedo_color = colorRecogida
		print("Cultivo listo para recoger")
	else:
		print("Fase de crecimiento actual: ",faseactual, ". Quedan ",maxfases-faseactual, " fases para poder recogerlo ")
