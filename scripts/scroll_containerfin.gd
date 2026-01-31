extends ScrollContainer
var finished_sentence = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("final",finale_t)

func finale_t(line):
	$VBoxContainer/finale.visible_characters = -1
	$VBoxContainer/finale.text = line
	$VBoxContainer/finale/AnimationPlayerfin.play("texto")
