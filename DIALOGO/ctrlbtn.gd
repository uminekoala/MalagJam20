extends Node
#var btn1 = Button.new()
#var btn2 = Button.new()
#var btn3 = Button.new() # or create a button scene instead

@onready var btn1=$"Button1"
@onready var btn2=$"Button2"
@onready var btn3=$"Button3"
@onready var animation_player_1=$Button1/AnimationPlayer1
@onready var animation_player_2=$Button2/AnimationPlayer2
@onready var animation_player_3=$Button3/AnimationPlayer3
@onready var tween1=get_tree().create_tween()
@onready var tween2=get_tree().create_tween()
@onready var tween3=get_tree().create_tween()
var pos1=Vector2.ZERO
var pos_x1=0
var pos_y1=0
var pos2=Vector2.ZERO
var pos_x2=0
var pos_y2=0
var pos3=Vector2.ZERO
var pos_x3=0
var pos_y3=0
var anpos1=Vector2.ZERO
var anpos2=Vector2.ZERO
var anpos3=Vector2.ZERO

func _ready():
	Global.connect("send_text_buttons",textc)
	#logt()
func _process(delta: float) -> void:
	pass
func _on_button_1_pressed() -> void:
	btn2.disabled=true
	btn2.visible=false
	btn3.disabled=true
	btn3.visible=false
	Global.option_pressed.emit(0)
	anpos1=btn1.position
	animation_player_1.stop()
	btn1.position=anpos1
func _on_button_2_pressed() -> void:
	btn1.disabled=true
	btn1.visible=false
	btn3.disabled=true
	btn3.visible=false
	Global.option_pressed.emit(1)
	anpos2=btn2.position
	animation_player_2.stop()
	btn2.position=anpos2
func _on_button_3_pressed() -> void:
	btn1.disabled=true
	btn1.visible=false
	btn2.disabled=true
	btn2.visible=false
	Global.option_pressed.emit(2)
	anpos3=btn3.position
	animation_player_3.stop()
	btn3.position=anpos3
func textc(line1, line2, line3):
	btn1.text=line1
	btn2.text=line2
	btn3.text=line3
	btn1.visible = true
	btn2.visible = true
	btn3.visible = true
	btn1.disabled=false
	btn2.disabled=false
	btn3.disabled=false
	if (!$Button1/AnimationPlayer1.is_playing()):
		$Button1/AnimationPlayer1.play()
	if (!$Button2/AnimationPlayer2.is_playing()):
		$Button2/AnimationPlayer2.play()
	if (!$Button3/AnimationPlayer3.is_playing()):
		$Button3/AnimationPlayer3.play()

#func logt():	
#	pos_x1=randf_range(0,700)
#	pos_y1=randf_range(0,500)
#	pos1=Vector2(pos_x1, pos_y1)
#	pos_x2=randf_range(0,700)
#	pos_y2=randf_range(0,500)
#	pos2=Vector2(pos_x2, pos_y2)	
#	pos_x3=randf_range(0,700)
#	pos_y3=randf_range(0,500)
#	pos3=Vector2(pos_x3, pos_y3)
#	if tween1:
#		tween1.kill()
#	var tween1=get_tree().create_tween()
#	tween1.connect("finished", logt)
#	tween1.tween_property($Button1, "position", pos1, 1.0)
#		
#	if tween2:
#		tween2.kill()
#	var tween2=get_tree().create_tween()
#	tween2.connect("finished", logt)
#	tween2.tween_property($Button2, "position", pos2, 1.0)
#	
#	if tween3:
#		tween3.kill()
#	var tween3=get_tree().create_tween()
#	tween3.connect("finished", logt)
#	tween3.tween_property($Button3, "position", pos3, 1.0)
#
