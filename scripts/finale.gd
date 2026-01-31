extends ScrollContainer
#este es el de la puntuacion
var finished_sentence = false
# Called when the node enters the scene tree for the first time.
var point=0
func _ready() -> void:
	Global.connect("finish", puntobt)
	punt()
	puntuacion()
func punt():
	print("puntuacion")
	$VBoxContainer/textpunt.text = "Tu puntuación es:"
	$VBoxContainer/textpunt/AnimationPlayerpunt.play("texto")
func puntobt():
	pass
func puntuacion():
	$VBoxContainer/punt.text = "holo"
	$VBoxContainer/punt/AnimationPlayerpuntu.play("texto")
