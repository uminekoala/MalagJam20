extends ScrollContainer

var is_first_scene = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("response", on_response)
	Global.connect("first_response",on_first_response)
	Global.connect("purge_dialogue_labels", on_purge_dialogue_labels)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $VBoxContainer/MoonDialogueLabel.visible_characters == -1 && is_first_scene:
		Global.transition_to_dance.emit()
		is_first_scene = false
		
	pass

func on_purge_dialogue_labels():
	$VBoxContainer/MoonDialogueLabel.text = ""
	$VBoxContainer/MoonNameLabel.text = ""


func on_first_response():
	is_first_scene = true
	$VBoxContainer/MoonNameLabel.visible_characters = -1
	$VBoxContainer/MoonDialogueLabel.text = "¿Aún no ha salido Épicamente el niñó?  HAZ TU MAGIA ANDRÉA + TRANSICIóN + BAILE + SHADERS!!!!!"
	$VBoxContainer/MoonDialogueLabel/AnimationPlayer.play("texto")

func on_response(line):
	$VBoxContainer/MoonNameLabel.visible_characters = -1
	$VBoxContainer/MoonDialogueLabel.text = line
	$VBoxContainer/MoonDialogueLabel/AnimationPlayer.play("texto")
