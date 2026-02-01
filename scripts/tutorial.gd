extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MinijuegoBaile.funcionar = true
	$MinijuegoBaile/CasillaBaile/AnimatedSprite2D.visible = true
	$MinijuegoBaile/CasillaBaile/AnimationPlayer.active = true
	$MinijuegoBaile/CasillaBaile/AnimationPlayer.play("fade_in")
	DialogoController.puedes_moverte_don_jugador = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass





func _on_button_2_pressed() -> void:
	$MinijuegoBaile.funcionar = false
	$MinijuegoBaile/CasillaBaile/AnimatedSprite2D.visible = false
	$MinijuegoBaile/CasillaBaile/AnimationPlayer.active = false
	DialogoController.puedes_moverte_don_jugador = false
	$MinijuegoBaile/CasillaBaile/AnimationPlayer.stop()
	get_tree().change_scene_to_file("res://scenes/tutorial_dialogo.tscn")
	pass # Replace with function body.
