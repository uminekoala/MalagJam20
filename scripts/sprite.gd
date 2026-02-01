extends Control
@onready var pun=Global.puntos
@onready var sprite=$Luna
func _ready():
	if pun>=20:
		sprite.texture=load("res://ASSETS/LUNA_FASE_4.png")
	elif 20>pun && pun>15:
		sprite.texture=load("res://ASSETS/LUNA_FASE_3.png")
	elif 15>pun&& pun>12:
		sprite.texture=load("res://ASSETS/LUNA_FASE_2.png")
	elif pun<10:
		sprite.texture=load("res://ASSETS/LUNA_FASE_1.png")
