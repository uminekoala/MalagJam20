extends Node2D
var posicion: int = 0
var dondeAndaras: Vector2
var funcionar: bool = false
var casillasPrimeraFase: int = 10
var playlist: Array = ["res://ASSETS/MUSICA/FASE 1.mp3","res://ASSETS/MUSICA/FASE 2.mp3","res://ASSETS/MUSICA/FASE 3.mp3","res://ASSETS/MUSICA/FASE 4.mp3"]
var fase: int = 0
@onready var feedback: Label = $PJbaile/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("change_scene_to_dance", _on_global_change_scene_to_dance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if !funcionar:
	#	Global.connect("change_scene_to_dance", _on_global_change_scene_to_dance())
	if funcionar:
		$Label2.text = str(Global.puntos)
		$Label.text = str($CasillaBaile/AnimationPlayer/Timer.time_left).pad_decimals(2)
		if Input.is_action_just_pressed("espacio"):
			if %PJbaile.global_position == (%CasillaBaile.global_position +Vector2(128,128)):
				print("SUPER NICE COCK")
				if $CasillaBaile/AnimationPlayer/Timer.time_left < 0.5:
					%CasillaBaile.visible = false
					feedback.text = "OMEGA GIGA NICE COCK"
					Global.puntos += 2
				elif $CasillaBaile/AnimationPlayer/Timer.time_left < 1.5 && $CasillaBaile/AnimationPlayer/Timer.time_left > 0.5:
					%CasillaBaile.visible = false
					Global.puntos += 1
					feedback.text = "Only little GIGA NICE COCK"
					print("only little GIGA NICE COCK")
			else:
				%CasillaBaile.visible = false
				feedback.text = "SAD COCK"
				
			print(%PJbaile.global_position)
			print(%CasillaBaile.global_position +Vector2(128,128))

		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if posicion < casillasPrimeraFase:
		print("no deberia existir")
		print(%PJbaile.global_position)
		dondeAndaras = tuMovimiento(%PJbaile.global_position)
		%CasillaBaile.global_position = Vector2(dondeAndaras.x * 256, (dondeAndaras.y * 256)+ 156)
		posicion += 1
		$CasillaBaile/AnimationPlayer.play("fade_in")
		%CasillaBaile.visible = true
		#if %CasillaBaile.visible == false:
		#	print("helo")
		#	%CasillaBaileAnimationPlayer.play.visible = true
	else:
		Global.emit_signal("transition_to_dialogue")
	print("funciona")


func _on_animation_player_animation_started(anim_name: StringName) -> void:
		$CasillaBaile/AnimationPlayer/Timer.start()
		
func tuMovimiento(movimiento: Vector2):
	movimiento = Vector2((movimiento.x-128) / 256, (movimiento.y - 284) / 256)
	print(movimiento)
	if movimiento == Vector2(2,2):
		movimiento = [Vector2(1,2),Vector2(2,1),Vector2(2,0),Vector2(1,1),Vector2(0,2)].pick_random()
		return movimiento
	if movimiento == Vector2(2,1):
		movimiento = [Vector2(2,0),Vector2(2,2),Vector2(1,0),Vector2(0,1),Vector2(1,2)].pick_random()
		return movimiento
	if movimiento == Vector2(2,0):
		movimiento = [Vector2(1,0),Vector2(2,1),Vector2(0,0),Vector2(1,1),Vector2(2,2)].pick_random()
		return movimiento
	if movimiento == Vector2(1,2):
		movimiento = [Vector2(2,2),Vector2(0,2),Vector2(1,0),Vector2(2,1),Vector2(0,1)].pick_random()
		return movimiento
	if movimiento == Vector2(1,1):
		movimiento = [Vector2(2,1),Vector2(1,0),Vector2(0,0),Vector2(2,0),Vector2(0,2),Vector2(2,2)].pick_random()
		return movimiento
	if movimiento == Vector2(1,0):
		movimiento = [Vector2(2,0),Vector2(0,0),Vector2(0,1),Vector2(1,2),Vector2(2,1)].pick_random()
		return movimiento
	if movimiento == Vector2(0,2):
		movimiento = [Vector2(1,2),Vector2(0,1),Vector2(0,0),Vector2(1,1),Vector2(2,2)].pick_random()
		return movimiento
	if movimiento == Vector2(0,1):
		movimiento = [Vector2(0,2),Vector2(0,0),Vector2(2,1),Vector2(1,2),Vector2(1,0)].pick_random()
		return movimiento
	if movimiento == Vector2(0,0):
		movimiento = [Vector2(0,1),Vector2(1,0),Vector2(2,0),Vector2(1,1),Vector2(0,2)].pick_random()
		return movimiento

func _on_global_transition_to_dialogue() -> void:
	$CasillaBaile/AnimationPlayer.stop("fade_in")
	$CasillaBaile/AnimationPlayer.active = false
	funcionar = false

func _on_global_change_scene_to_dance():
	print(" JEJEJEJE JEJEJEJE JEJEJEJE")

	funcionar = true
	$AudioStreamPlayer2D.stream = load(playlist[fase])
	fase += 1
	$AudioStreamPlayer2D.play()
	%CasillaBaile.visible = true
	$CasillaBaile/AnimationPlayer.active = true
	$CasillaBaile/AnimationPlayer.play("fade_in")
	print(" JEJEJEJE JEJEJEJE JEJEJEJE")
	return funcionar
