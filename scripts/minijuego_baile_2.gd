extends Node2D
var posicion: int = 0
var dondeAndaras: Vector2
var funcionar: bool = false
var casillasPrimeraFase: int = 10
var playlist: Array = ["res://ASSETS/MUSICA/FASE 1.mp3","res://ASSETS/MUSICA/FASE 2.mp3","res://ASSETS/MUSICA/FASE 3.mp3","res://ASSETS/MUSICA/FASE 4.mp3"]
var fase: int = 0
@onready var feedback: Label = $PJbaile/Label
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var enArea: bool = false
#var vectorPrueba: Vector2 = Vector2(2,1)
var posibilidades: Array
var arraySobrante: Array
var j: int
var angle = deg_to_rad(0)
#var radius = vectorPrueba.distance_to(Vector2(vectorPrueba.x,vectorPrueba.y+2))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("change_scene_to_dance", _on_global_change_scene_to_dance)

var seno
var coseno
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("empezamos : " + str(vectorPrueba))
	#print("radio: " + str(radius))
	#for i in range(0, 8):
		##print("angle : " + str(45*i))
		#coseno = round((cos(deg_to_rad(45*i)) * radius))
		#seno = round((sin(deg_to_rad(45*i)) * radius))
		#calculos(vectorPrueba)
			
	#print("terminamos : ")
	$Label2.text = str(Global.puntos)
	$Label.text = str($CasillaBaile/AnimationPlayer/Timer.time_left).pad_decimals(2)
	if Input.is_action_just_pressed("espacio"):
		print(str(funcionar) + ", " + str(enArea))
		if funcionar && enArea:
			print(" mi amor por ti")
			print("SUPER NICE COCK")
			if $CasillaBaile/AnimationPlayer/Timer.time_left < 1.0:
				Global.puntos += 2
				$PJbaile/AnimatedSprite2D.visible = true
				$PJbaile/AnimatedSprite2D2.visible = true
				$PJbaile/AnimatedSprite2D3.visible = true
				$PJbaile/AnimatedSprite2D4.visible = true
				$PJbaile/AnimatedSprite2D/AnimatedSprite2D5.visible = true
				$PJbaile/AnimatedSprite2D2/AnimatedSprite2D6.visible = true
				$PJbaile/AnimatedSprite2D3/AnimatedSprite2D7.visible = true
				$PJbaile/AnimatedSprite2D4/AnimatedSprite2D8.visible = true
				$PJbaile/AnimationPlayer.play("MOVE_GREAT")
				$Correcto2.play()
			elif $CasillaBaile/AnimationPlayer/Timer.time_left < 2.0 && $CasillaBaile/AnimationPlayer/Timer.time_left > 1.0:
				Global.puntos += 1
				$PJbaile/AnimatedSprite2D.visible = true
				$PJbaile/AnimatedSprite2D2.visible = true
				$PJbaile/AnimatedSprite2D3.visible = true
				$PJbaile/AnimatedSprite2D4.visible = true
				$PJbaile/AnimatedSprite2D/AnimatedSprite2D5.visible = false
				$PJbaile/AnimatedSprite2D2/AnimatedSprite2D6.visible = false
				$PJbaile/AnimatedSprite2D3/AnimatedSprite2D7.visible = false
				$PJbaile/AnimatedSprite2D4/AnimatedSprite2D8.visible = false
				$PJbaile/AnimationPlayer.play("MOVE")
				print("only little GIGA NICE COCK")
				$Correcto.play()
			$CasillaBaile/AnimationPlayer/Timer.stop()
		else:
			print("jauja")
			$CasillaBaile/AnimationPlayer/Timer.stop()
			
		%CasillaBaile.visible = false
		$CasillaBaile/Area2D/CollisionShape2D.disabled = true
		

func calculos(vectorCalc: Vector2) -> void:
	var vectorCalcInterno = vectorCalc - Vector2(vectorCalc +Vector2(coseno, seno)).direction_to(vectorCalc)
	if vectorCalc.distance_to(vectorCalc +Vector2(coseno, seno)) <= 2:
		if vectorCalc.distance_to(vectorCalc +Vector2(coseno, seno)) == 2:
			if vectorCalcInterno.x <=2 && vectorCalcInterno.x  >=0 && vectorCalcInterno.y <=2 && vectorCalcInterno.y >=0:
				posibilidades.append(vectorCalc - Vector2(vectorCalc +Vector2(coseno, seno)).direction_to(vectorCalc))
		if vectorCalc.x + coseno <=2 && vectorCalc.x + coseno >=0 && vectorCalc.y + seno <=2 && vectorCalc.y + seno >=0:
			print("Vector en rango : " + str(vectorCalc + Vector2(coseno, seno)))
			posibilidades.append(Vector2(vectorCalc + Vector2(coseno, seno)))
		
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("OH NO??")
	%Escenario.tile_set
	if posicion < casillasPrimeraFase:
		print("la global" + str(%PJbaile.global_position))
		print("la local " + str(%PJbaile.position))
		dondeAndaras = tuMovimiento(%PJbaile.global_position)
		print("a veer : " + str(dondeAndaras))
		%CasillaBaile.global_position = Vector2((dondeAndaras.x * %PJbaile.twoStep) + %Escenario.tile_set.tile_size.x*7, (dondeAndaras.y * %PJbaile.twoStep) + %Escenario.tile_set.tile_size.x*6)
		print("a veer transformao: " + str(%CasillaBaile.global_position))
		posicion += 1
		$CasillaBaile/AnimationPlayer.play("fade_in")
		%CasillaBaile.visible = true
		
		#if %CasillaBaile.visible == false:
		#	print("helo")
		#	%CasillaBaileAnimationPlayer.play.visible = true
	else:
		Global.emit_signal("transition_to_dialogue")
		posicion = 0
	print("funciona")


func _on_animation_player_animation_started(anim_name: StringName) -> void:
		$CasillaBaile/AnimationPlayer/Timer.start()
		$CasillaBaile/Area2D/CollisionShape2D.disabled = false
		
func tuMovimiento(movimiento: Vector2):
	movimiento = Vector2((movimiento.x) / %PJbaile.twoStep, (movimiento.y) / %PJbaile.twoStep) - Vector2(1,1)
	print("este es el mov: " + str(movimiento))
	var radius = movimiento.distance_to(Vector2(movimiento.x,movimiento.y+2))
	for i in range(0, 8):
		coseno = round((cos(deg_to_rad(45*i)) * radius))
		seno = round((sin(deg_to_rad(45*i)) * radius))
		calculos(movimiento)
	print(str(posibilidades))
	movimiento = posibilidades.pick_random()
	print("ESTE ES EL NUEVO MOV: " + str(movimiento))
	posibilidades.clear()
	return movimiento

func _on_global_transition_to_dialogue() -> void:
	audio_stream_player_2d.volume_db = -15
	$CasillaBaile/AnimationPlayer.stop("fade_in")
	$CasillaBaile/AnimationPlayer.active = false
	funcionar = false

func _on_global_change_scene_to_dance():
	print(AudioServer.get_bus_index("Musica"))
	audio_stream_player_2d.volume_db = 0
	funcionar = true
	$AudioStreamPlayer2D.stream = load(playlist[fase])
	fase += 1
	$AudioStreamPlayer2D.play()
	$CasillaBaile/AnimatedSprite2D.visible = true
	$CasillaBaile/AnimationPlayer.active = true
	$CasillaBaile/AnimationPlayer.play("fade_in")
	print(" JEJEJEJE JEJEJEJE JEJEJEJE")
	return funcionar


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("holaaa estas dentro")
	enArea = true
	


func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("te piraste del area")
	enArea = false
