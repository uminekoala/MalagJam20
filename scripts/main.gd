extends Node

var tween_movement_luna

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("change_scene_to_dialogue", on_to_dialogue)
	Global.connect("change_scene_to_dance", on_to_dance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_to_dialogue():
	#apagar todo lo que sea de danzadura
	# Animar sprite para que se mueva a la izquierda
	move_luna(false)
	# llamar al dialogo
	

func on_to_dance():
	# apagar todo lo que sea de dialogos
	if ($FirstButton):
		$FirstButton.queue_free()
	
	$dialogo_labels.visible = false
	# Animar sprite para que se mueva a la derecha
	move_luna(true)
	# llamar a la danzadura


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
