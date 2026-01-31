extends Node

var tween_movement_luna
var tween_visible

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("transition_to_dialogue", on_transition_to_dialogue)
	Global.connect("transition_to_dance", on_transition_to_dialogue)
	Global.connect("dialogue_feedback", on_dialogue_feedback)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_dialogue_feedback(value):
	var feedback
	if value == 0:
		feedback = preload("res://scenes/dialogo_bad.tscn").instantiate()
	elif value == 2:
		feedback = preload("res://scenes/dialogo_good.tscn").instantiate()
	
	$LunaPositionLeft.add_child(feedback)


func on_transition_to_dialogue():
	#apagar todo lo que sea de danzadura
	# Animar sprite para que se mueva a la izquierda
	move_luna(false)
	# llamar al dialogo
	var botones = preload("res://DIALOGO/ctrlbtn.tscn").instantiate()
	$LunaPositionRight.add_child(botones)

	# escena de los botones

func on_transition_to_dance():
	# apagar todo lo que sea de dialogos
	if ($FirstButton):
		$FirstButton.queue_free()
	
	$dialogo_labels.visible = false
	# Animar sprite para que se mueva a la derecha
	move_luna(true)
	# llamar a la danzadura
	if (tween_visible):
		tween_visible.kill()
	tween_visible = get_tree().create_tween()
	tween_visible.tween_property($MinijuegoBaile, "visible", true, 1.5)

func send_change_scene_to_dialogue_signal():
	Global.change_scene_to_dialogue.emit()


func send_change_scene_to_dance_signal():
	Global.change_scene_to_dance.emit()

func move_luna(is_right):
	if (is_right):
		$TrailAnimator.play("trail")
		$TrailAnimator.animation_finished.connect(send_change_scene_to_dance_signal)
	else:
		$TrailAnimator.play("trail_left")
		$TrailAnimator.animation_finished.connect(send_change_scene_to_dialogue_signal)
	


func _on_button_pressed() -> void:
	Global.first_response.emit()
	$FirstButton.disabled = true
