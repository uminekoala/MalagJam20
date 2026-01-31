extends Node
#var btn1 = Button.new()
#var btn2 = Button.new()
#var btn3 = Button.new() # or create a button scene instead

@onready var btn1=$"Button1"
@onready var btn2=$"Button2"
@onready var btn3=$"Button3"
func _ready():
	Global.connect("send_text_buttons",textc)
func _process(delta: float) -> void:
	pass
func _on_button_1_pressed() -> void:
	btn2.disabled=true
	btn2.visible=false
	btn3.disabled=true
	btn3.visible=false
	Global.option_pressed.emit(0)
func _on_button_2_pressed() -> void:
	btn1.disabled=true
	btn1.visible=false
	btn3.disabled=true
	btn3.visible=false
	Global.option_pressed.emit(1)
func _on_button_3_pressed() -> void:
	btn1.disabled=true
	btn1.visible=false
	btn2.disabled=true
	btn2.visible=false
	Global.option_pressed.emit(2)
func textc():
	pass
	#btn1.text=text
	#btn2.text=text
	#btn3.text=text
	 #funcion de meter textos que de 050 e ir sustituyendo en lso botoness
