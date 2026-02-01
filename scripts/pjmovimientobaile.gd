extends CharacterBody2D

@onready var bailando = get_node("res://scenes/minijuego_baile.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var col_arriba: CollisionShape2D = $"../ColArriba"
@onready var p_jbaile: CharacterBody2D = %PJbaile
@onready var pisada: AudioStreamPlayer2D = $AudioStreamPlayer2D2
@onready var pisoton: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var error: AnimationPlayer = $Error
signal noTeMuevas
var moverse:bool = false

func _physics_process(delta: float) -> void:
	if DialogoController.puedes_moverte_don_jugador:
		if p_jbaile.visible == true:
			if Input.is_action_just_pressed("tilemapArriba"):
				if global_position.y > 300 && moverse:
					position.y -= 224
					moverse = false
					pisada.play()
				else:
					error.play("Error")
					emit_signal("noTeMuevas")
			if Input.is_action_just_pressed("tilemapAbajo"):
				if global_position.y < 580 && moverse:
					position.y += 224
					moverse = false
					pisada.play()
				else:
					error.play("Error")
					emit_signal("noTeMuevas")
			if Input.is_action_just_pressed("tilemapDerecha"):
				if global_position.x < 580 && moverse:
					position.x += 224
					moverse = false
					pisada.play()
				else:
					error.play("Error")
					emit_signal("noTeMuevas")
			if Input.is_action_just_pressed("tilemapIzquierda"):
				if global_position.x > 280 && moverse:
					position.x -= 224
					moverse = false
					pisada.play()
				else:
					error.play("Error")
					emit_signal("noTeMuevas")
			if Input.is_action_just_pressed("espacio"):
				pisoton.play()
				$Timer.start()
	
	

	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_paso_animation_finished(anim_name: StringName) -> void:
	moverse = true
	$AnimatedSprite2D.visible = false
	$AnimatedSprite2D2.visible = false
	$AnimatedSprite2D3.visible = false
	$AnimatedSprite2D4.visible = false
	$Paso.play()


func _on_timer_timeout() -> void:
	$AnimatedSprite2D.visible = false
	$AnimatedSprite2D2.visible = false
	$AnimatedSprite2D3.visible = false
	$AnimatedSprite2D4.visible = false
	$AnimationPlayer.stop()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
