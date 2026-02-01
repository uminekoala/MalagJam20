extends Control
var finished_sentence = false
@onready var final1="El verdadero arte reside en mentir y que te crean. Tú y yo podemos reescribir la historia."
@onready var final2="El verdadero arte reside en mentir y que te crean. Tus palabras me seducen, pero tu máscara es cristalina."
@onready var final3="El verdadero arte reside en mentir y que te crean. Por desgracia, has bailado a mi son."
@onready var final4="Una persona como tú no merece llevar la luna. Una patética excusa de artista."
@onready var pun =Global.puntos


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finale_t()
	#pun=Global.puntos
	#print("pun:")
	#print(pun)
	#punt()
	#puntuacion()
	$AudioStreamPlayer.play()
#func punt():
#	print("puntuacion")
#	$ScrollContainerpunt/VBoxContainer/textpunt.text = "Tu puntuación es:"
#	$ScrollContainerpunt/VBoxContainer/textpunt/AnimationPlayerpunt.play("texto")
#func puntuacion():
#	$ScrollContainerpunt/VBoxContainer/punt.text = str(pun)
#	$ScrollContainerpunt/VBoxContainer/punt/AnimationPlayerpuntu.play("texto")
func finale_t():
	print("finale")
	if pun>=60:
		$ScrollContainer/finale.text = final1
		$Luna.texture = load("res://ASSETS/LUNA_FASE_4.png")
		print("final1")
	elif 60>pun && pun>=35:
		print(" final??")
		$ScrollContainer/finale.text = final2
		$Luna.texture = load("res://ASSETS/LUNA_FASE_3.png")
	elif 35>pun && pun>=20:
		$ScrollContainer/finale.text = final3
		$Luna.texture = load("res://ASSETS/LUNA_FASE_2.png")
	elif pun<20:
		$ScrollContainer/finale.text = final4
		$Luna.texture = load("res://ASSETS/LUNA_FASE_1.png")
	$ScrollContainer/finale/AnimationPlayerfin.play("texto")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
