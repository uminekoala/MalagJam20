extends Node

signal option_pressed(id)
signal response(line, is_final, is_finish)
signal send_text_buttons(line0,line1,line2)
signal first_response()
signal dialogue_feedback(value)
signal purge_dialogue_labels()
# primero transicion (mover la mascara), luego mecánicas
signal transition_to_dialogue()
signal transition_to_dance()
signal change_scene_to_dance()
signal change_scene_to_dialogue()
# ed
signal finish()
var puntos: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
