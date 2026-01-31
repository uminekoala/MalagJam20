extends ScrollContainer
#este es el de la puntuacion
var finished_sentence = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("puntuacion", punt)
	punt()
	puntuacion()
func punt():
	print("puntuacion")
	$VBoxContainer/textpunt.text = "Tu puntuación es:"
	$VBoxContainer/textpunt/AnimationPlayerpunt.play("texto")
func puntuacion():
	pass
