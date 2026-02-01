extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var panelbotones_principales: Panel = $PanelbotonesPrincipales
@onready var panelbotones_principales_2: Panel = $PanelbotonesPrincipales2
@onready var blackout: AnimationPlayer = $blackout
@onready var btn_triggers: Button = $PanelbotonesPrincipales/btnTriggers

@onready var fundido_negro: ColorRect = $fundidoNegro
@onready var telon: Sprite2D = $Telon
@onready var telon_2: Sprite2D = $Telon2
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var btnJugar: Button = $PanelbotonesPrincipales/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var eq = AudioServer.get_bus_effect(1, 0)
	
	AudioServer.set_bus_mute(2,true)
	AudioServer.set_bus_effect_enabled(1, 0, false)
	animation_player.autoplay
	Global.puntos = 0
	audio_stream_player_2d.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !blackout.is_playing():
		panelbotones_principales.z_index =5
		panelbotones_principales_2.z_index =5
		btn_triggers.z_index = 5
		fundido_negro.visible = false
		telon.visible = false
		telon_2.visible = false
		
		
func _on_btn_salir_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_btn_volver_pressed() -> void:
	panelbotones_principales.visible =true
	panelbotones_principales_2.visible= false
	pass # Replace with function body.


func _on_texture_button_pressed() -> void:
	

	pass # Replace with function body.


func _on_button_pressed() -> void:

	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.


func _on_btn_controles_pressed() -> void:
	
	get_tree().change_scene_to_file("res://scenes/tutorialBaile.tscn")
	pass # Replace with function body.


func _on_btn_triggers_pressed() -> void:
	panelbotones_principales.visible = false
	panelbotones_principales_2.visible= true
	pass # Replace with function body.
