extends Node2D
signal bailar
var posicion: int = 0
var casillasPrimeraFase: Array = [
	Vector2(2,0),
	Vector2(0,0),
	Vector2(1,1),
	Vector2(2,2),
	Vector2(1,0),
	Vector2(1,2),
	Vector2(0,1),
	Vector2(2,1),
	Vector2(0,2),
	Vector2(1,0)
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label2.text = str(Global.puntos)
	$Label.text = str($CasillaBaile/AnimationPlayer/Timer.time_left).pad_decimals(2)
	if Input.is_action_just_pressed("espacio"):
		if %PJbaile.global_position == (%CasillaBaile.global_position +Vector2(128,128)):
			print("SUPER NICE COCK")
			if $CasillaBaile/AnimationPlayer/Timer.time_left < 0.5:
				print("OMEGA GIGA NICE COCK")
				Global.puntos += 2
			elif $CasillaBaile/AnimationPlayer/Timer.time_left < 1.5 && $CasillaBaile/AnimationPlayer/Timer.time_left > 0.5:
				Global.puntos += 1
				print("only little GIGA NICE COCK")
		else:
			print("SAD COCK")
		print(%PJbaile.global_position)
		print(%CasillaBaile.global_position +Vector2(128,128))

		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if posicion < casillasPrimeraFase.size():
		%CasillaBaile.global_position = Vector2(casillasPrimeraFase[posicion].x*256, (casillasPrimeraFase[posicion].y*256)+156)
		posicion += 1
		$CasillaBaile/AnimationPlayer.play("fade_in")
	print("funciona")


func _on_animation_player_animation_started(anim_name: StringName) -> void:
		$CasillaBaile/AnimationPlayer/Timer.start()
