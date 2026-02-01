extends ScrollContainer
var finished_sentence = false
@onready var final1="final1"
@onready var final2="final2"
@onready var final3="final3"
@onready var final4="final4"
@onready var pun=17

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finale_t()
	#pun=Global.puntos
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
