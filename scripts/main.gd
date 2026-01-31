extends Node

var tween_movement_luna
var tween_visible

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("transition_to_dialogue", on_transition_to_dialogue)
	Global.connect("transition_to_dance", on_transition_to_dance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_transition_to_dialogue():
	#apagar todo lo que sea de danzadura
	# Animar sprite para que se mueva a la izquierda
	move_luna(false)
	# llamar al dialogo
	if (tween_visible):
		tween_visible.kill()
	tween_visible = get_tree().create_tween()
	# escena de los botones
	tween_visible.connect("finished",send_change_scene_to_dance_signal)

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
	tween_visible.tween_property($MinijuegoBaile, "visible", true, 1.0)
	tween_visible.connect("finished",send_change_scene_to_dialogue_signal)

func send_change_scene_to_dialogue_signal():
	Global.change_scene_to_dialogue.emit()


func send_change_scene_to_dance_signal():
	Global.change_scene_to_dance.emit()

func move_luna(is_right):
	if (tween_movement_luna):
		tween_movement_luna.kill()
	tween_movement_luna = get_tree().create_tween()
	var pos
	
	if is_right:
		pos = $LunaPositionRight.position
	else:
		pos = $LunaPositionLeft.position
 
	
	tween_movement_luna.tween_property($Luna, "position", pos, 1.0)


func _on_button_pressed() -> void:
	Global.first_response.emit()
	$FirstButton.disabled = true
