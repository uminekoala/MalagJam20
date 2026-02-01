extends ScrollContainer

var is_first_scene = false
var finished_sentence = false
var is_final = false
var is_finish = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("response", on_response)
	Global.connect("first_response",on_first_response)
	Global.connect("purge_dialogue_labels", on_purge_dialogue_labels)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $VBoxContainer/MoonDialogueLabel.visible_ratio == 1 && is_first_scene && Input.is_action_just_pressed("accion"):
		Global.transition_to_dance.emit()
		is_first_scene = false
		is_final = false
	elif $VBoxContainer/MoonDialogueLabel.visible_ratio == 1 && finished_sentence && !is_first_scene && !is_final:
		finished_sentence = false
		DialogoController.launch_buttons_flag = true
	elif $VBoxContainer/MoonDialogueLabel.visible_ratio == 1 && is_final && Input.is_action_just_pressed("accion"):
		is_final = false
		Global.transition_to_dance.emit()
	elif $VBoxContainer/MoonDialogueLabel.visible_ratio == 1 && is_finish && Input.is_action_just_pressed("accion"):
		is_finish = false
		Global.finish.emit(Global.puntos)


func on_purge_dialogue_labels():
	$VBoxContainer/MoonDialogueLabel.text = ""


func on_first_response():
	is_first_scene = true
	finished_sentence = true
	$VBoxContainer/MoonNameLabel.visible_characters = -1
	$VBoxContainer/MoonDialogueLabel.text = "... Por supuesto."
	$VBoxContainer/MoonDialogueLabel/AnimationPlayer.play("texto")


func on_response(line, final, finish):
	is_final = final
	finished_sentence = true
	is_finish = finish
	$VBoxContainer/MoonNameLabel.visible_characters = -1
	$VBoxContainer/MoonDialogueLabel.text = line
	$VBoxContainer/MoonDialogueLabel/AnimationPlayer.play("texto")


func _on_timer_timeout() -> void:
	$VBoxContainer/MoonDialogueLabel.text = ""
