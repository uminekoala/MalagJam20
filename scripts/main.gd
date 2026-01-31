extends Node

var tween_movement_luna
var tween_visible
var timer
var botones

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("transition_to_dialogue", on_transition_to_dialogue)
	Global.connect("transition_to_dance", on_transition_to_dance)
	Global.connect("dialogue_feedback", on_dialogue_feedback)
	$pulso.play("pulso")
	Global.connect("finish", on_finish_game)


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

func on_finish_game():
	pass

func check_change_fase_skin():
	var points = Global.puntos
	if (points > 5):
		$Luna.texture = load("res://ASSETS/LUNA_FASE_2.png")
		$LunaTrailRed.texture = load("res://ASSETS/LUNA_FASE_2.png")
		$LunaTrailPurple.texture = load("res://ASSETS/LUNA_FASE_2.png")
		$LunaTrailBlue.texture = load("res://ASSETS/LUNA_FASE_2.png")
	elif (points > 10):
		$Luna.texture = load("res://ASSETS/LUNA_FASE_3.png")
		$LunaTrailRed.texture = load("res://ASSETS/LUNA_FASE_3.png")
		$LunaTrailPurple.texture = load("res://ASSETS/LUNA_FASE_3.png")
		$LunaTrailBlue.texture = load("res://ASSETS/LUNA_FASE_3.png")


func on_transition_to_dialogue():
	#apagar todo lo que sea de danzadura
	# Animar sprite para que se mueva a la izquierda
	Global.purge_dialogue_labels.emit()
	$MinijuegoBaile.visible = false
	$dialogo_labels.visible = true
	move_luna(false)
	# llamar al dialogo
	# escena de los botones
	botones = preload("res://DIALOGO/ctrlbtn.tscn").instantiate()
	$LunaPositionRight.add_child(botones)

	

func on_transition_to_dance():
	# apagar todo lo que sea de dialogos
	if ($FirstButton):
		$FirstButton.queue_free()

	Global.purge_dialogue_labels.emit()

	if (botones):
		botones.queue_free()
	# Animar sprite para que se mueva a la derecha
	move_luna(true)
	check_change_fase_skin()
	# llamar a la danzadura
	if (tween_visible):
		tween_visible.kill()
	tween_visible = get_tree().create_tween()
	tween_visible.tween_property($MinijuegoBaile, "visible", true, 1.5)



func send_change_scene_to_dialogue_signal():
	print("CAMBIAR ESCENA DIALOGO")
	AudioServer.set_bus_effect_enabled(1, 0, true)
	Global.change_scene_to_dialogue.emit()


func send_change_scene_to_dance_signal():
	print("CAMBIAR ESCENA BAILE")
	AudioServer.set_bus_effect_enabled(1, 0, false)
	Global.change_scene_to_dance.emit()

func move_luna(is_right):
	if (is_right):
		$TrailTimer.start()
		$TrailAnimator.play("trail")
	else:
		$TrailLeftTimer.start()
		$TrailAnimatorLeft.play("trail_left")
		

func _on_button_pressed() -> void:
	Global.first_response.emit()
	$FirstButton.disabled = true

func _on_trail_timer_timeout() -> void:
	print("AFWFAWFWA")
	send_change_scene_to_dance_signal()


func _on_trail_left_timer_timeout() -> void:
	send_change_scene_to_dialogue_signal()
