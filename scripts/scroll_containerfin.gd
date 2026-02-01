extends ScrollContainer
var finished_sentence = false
@onready var final1="El verdadero arte reside en mentir y que te crean. Tú y yo podemos reescribir la historia."
@onready var final2="El verdadero arte reside en mentir y que te crean. Tus palabras me seducen, pero tu máscara es cristalina."
@onready var final3="El verdadero arte reside en mentir y que te crean. Por desgracia, has bailado a mi son."
@onready var final4="Una persona como tú no merece llevar la luna. Una patética excusa de artista."
@onready var pun

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finale_t()
	pun=Global.puntos
func finale_t():
	
	if pun>=20:
		$finale.text = final1
	elif 20>pun && pun>15:
		print(" final??")
		$finale.text = final2
	elif 15>pun && pun>12:
		$finale.text = final3
	elif pun<10:
		$finale.text = final4
	$finale/AnimationPlayerfin.play("texto")
