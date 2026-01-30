extends Node
#var btn1 = Button.new()
#var btn2 = Button.new()
#var btn3 = Button.new() # or create a button scene instead

@onready var btn1=$"Button1"
@onready var btn2=$"Button2"
@onready var btn3=$"Button3"
func _ready():
	pass
func _on_button_1_pressed() -> void:
	btn2.disabled=true
	btn2.visible=false
	btn3.disabled=true
	btn3.visible=false
func _on_button_2_pressed() -> void:
	btn1.disabled=true
	btn1.visible=false
	btn3.disabled=true
	btn3.visible=false
func _on_button_3_pressed() -> void:
	btn1.disabled=true
	btn1.visible=false
	btn2.disabled=true
	btn2.visible=false
