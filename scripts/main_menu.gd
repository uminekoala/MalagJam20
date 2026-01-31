extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var panelbotones_principales: Panel = $PanelbotonesPrincipales
@onready var panelbotones_principales_2: Panel = $PanelbotonesPrincipales2
@onready var blackout: AnimationPlayer = $blackout
@onready var texture_button: TextureButton = $TextureButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.autoplay
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !blackout.is_playing():
		print("MAMAHUEOOO")
		panelbotones_principales.z_index =5
		panelbotones_principales_2.z_index =5
		texture_button.z_index = 5



func _on_btn_salir_pressed() -> void:
	print("MAMAHUEOOO")
	get_tree().quit()
	pass # Replace with function body.


func _on_btn_volver_pressed() -> void:
	panelbotones_principales.visible =true
	panelbotones_principales_2.visible= false
	pass # Replace with function body.


func _on_texture_button_pressed() -> void:
	
	panelbotones_principales.visible = false
	panelbotones_principales_2.visible= true
	pass # Replace with function body.


func _on_button_pressed() -> void:

	print("MAMAHUEOOO")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.


	pass # Replace with function body.
