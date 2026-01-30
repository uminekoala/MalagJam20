extends Node
var btn1 = Button.new()
var btn2 = Button.new()
var btn3 = Button.new() # or create a button scene instead
btn1.pressed.connect()

func crtbtn()
	
	add_child(btn1)
	add_child(btn2)
	add_child(btn3)

func _on_timer_timeout() -> void:
	
