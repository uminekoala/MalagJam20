extends ScrollContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("response", on_response)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_response(line):
	$VBoxContainer/MoonNameLabel.visible_characters = -1
	$VBoxContainer/MoonDialogueLabel.text = line
	$VBoxContainer/MoonDialogueLabel/AnimationPlayer.play("texto")
