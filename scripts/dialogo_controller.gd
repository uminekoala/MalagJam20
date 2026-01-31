extends Node

# 1 Extraer texto
# 2 Recibir señal de botones (id 0, 1, 2...)
# 3 Lanzar señal de respuesta dependiendo de la señal del boton 
# 4 lanzar señal de texto de los siguientes tres botones

var all_dialogue = {}
var dialogue_state = 0
# 0,1,2,3,4... se refleja en el .cfg con las secciones

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_dialogues()
	Global.connect("option_pressed", on_option_pressed)
	Global.connect("change_scene_to_dialogue", on_change_scene_to_dialogue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func end_dialogue_phase():
	Global.end_dialogue.emit()

func on_change_scene_to_dialogue():
	var option1 = all_dialogue[dialogue_state][0]
	var option2 = all_dialogue[dialogue_state][1]
	var option3 = all_dialogue[dialogue_state][2]

	Global.send_text_buttons.emit(option1, option2, option3)

# ... i wrote very refactorable code 
# oh my god granpa can we not talk about refactorable code today?
func on_option_pressed(option_id):
	print("ENTRAMOS!!!")
	var respuesta
	var valor
	var final = all_dialogue[dialogue_state][9]

	if (final):
		end_dialogue_phase()
		return

	match option_id:
		0: 
			respuesta = all_dialogue[dialogue_state][6]
			valor = all_dialogue[dialogue_state][3]
		1: 
			valor = all_dialogue[dialogue_state][4]
			respuesta = all_dialogue[dialogue_state][7]
		2: 
			valor = all_dialogue[dialogue_state][5]
			respuesta = all_dialogue[dialogue_state][8]

	
	var option1 = all_dialogue[dialogue_state][0]
	var option2 = all_dialogue[dialogue_state][1]
	var option3 = all_dialogue[dialogue_state][2]

	Global.dialogue_feedback.emit(valor)
	Global.response.emit(respuesta)
	Global.send_text_buttons.emit(option1, option2, option3)
	dialogue_state += 1


func load_dialogues():
	var config = ConfigFile.new()
	var err = config.load("res://DIALOGO/dialogos.cfg")

	if err != OK:
		print("errior")
		return
	
	var i = 0
	for section in config.get_sections():
		#dialogo1, dialogo2, etc
		var option1 = config.get_value(section,"option1")
		var option2 = config.get_value(section,"option2")
		var option3 = config.get_value(section,"option3")
		var valor1 = config.get_value(section,"valor1")
		var valor2 = config.get_value(section,"valor2")
		var valor3 = config.get_value(section,"valor3")
		var respuesta1 = config.get_value(section,"respuesta1")
		var respuesta2 = config.get_value(section,"respuesta2")
		var respuesta3 = config.get_value(section,"respuesta3")
		var final = config.get_value(section,"final")
		print("uno")

		all_dialogue[i] = [option1,option2,option3,valor1,valor2,valor3,respuesta1,respuesta2,respuesta3,final]
		i += 1
