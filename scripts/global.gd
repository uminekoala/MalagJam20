extends Node

signal option_pressed(id)
signal response(line)
signal send_text_buttons(line0,line1,line2)
signal end_dialogue()
signal first_response()
signal change_scene_to_dialogue()
signal change_scene_to_dance()
var puntos: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
